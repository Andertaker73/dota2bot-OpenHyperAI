// let TS accept these Lua globals
declare function GetScriptDirectory(): string;

import * as jmz from "bots/FunLib/jmz_func";
// Avoid static resolution; mirror Lua's pcall(require(...))
let [okLoc, Localization] = pcall(require, GetScriptDirectory() + "/FunLib/localization");
if (!okLoc) Localization = { Get: (_: string) => "Defend here!" };

// eslint-disable-next-line @typescript-eslint/no-var-requires
import Customize = require("bots/Customize/general");

import { Barracks, BotActionDesire, BotMode, BotModeDesire, Lane, Team, Tower, Unit, UnitType, Vector } from "bots/ts_libs/dota";
import { add } from "bots/ts_libs/utils/native-operators";
import { GetLocationToLocationDistance } from "./utils";

Customize.ThinkLess = Customize.Enable ? Customize.ThinkLess : 1;

// == Tunables ==
const PING_DELTA = 5.0;
const SEARCH_RANGE_DEFAULT = 1600;
// const CLOSE_RANGE = 1200;
const MAX_DESIRE_CAP = 0.98;

// Base threat (Ancient defense)
const BASE_THREAT_RADIUS = 2600;
const BASE_LEASH_OUTBOUND = 1200;
const BASE_THREAT_HOLD = 8.0; // 自定义：4→8 秒，给队友 TP/走路到场时间（防"人来不齐就散"）

// Perf: cache intervals (seconds)
const CACHE_ENEMY_AROUND_LOC_HZ = 0.35; // cache for weighted enemy scans around a location
const CACHE_LASTSEEN_WINDOW = 5.0; // seconds for hero last-seen proximity checks

// == State ==
const nTeam = GetTeam();
// Per-bot state stored on bot object to avoid cross-bot data races.
// Access via (bot as any)._defend.X — initialized in GetDefendDesireHelper.
interface DefendBotState {
    defendLoc: Vector;
    weAreStronger: boolean;
    nInRangeAlly: Unit[];
    nInRangeEnemy: Unit[];
    distanceToLane: Record<Lane, number>;
}
function getDefendState(bot: Unit): DefendBotState {
    if (!(bot as any)._defend) {
        (bot as any)._defend = {
            defendLoc: GetLaneFrontLocation(nTeam, Lane.Mid, 0),
            weAreStronger: false,
            nInRangeAlly: [],
            nInRangeEnemy: [],
            distanceToLane: { [Lane.Top]: 0, [Lane.Mid]: 0, [Lane.Bot]: 0 },
        };
    }
    return (bot as any)._defend;
}
let _threatLaneSticky: { lane: Lane; until: number } = { lane: Lane.Mid, until: -1 };

// sticky base-threat window
let baseThreatUntil = -1;

// Travel Boots defender coordination
let fTraveBootsDefendTime = 0;

// == Perf caches ==
type EnemyAroundLocCache = { t: number; count: number };
const _cacheEnemyAroundLoc: Record<string, EnemyAroundLocCache> = {};

/** Performance cache - avoid redundant calculations between GetDefendDesire (300ms) and Think (every frame) */
type CachedDefendGameState = {
    lastUpdate: number;
    currentTime: number;
    gameMode: number;
    team: Team;
    enemyTeam: Team;
    ourAncient: Unit | null;
    enemyAncient: Unit | null;
    aliveAllyCount: number;
    aliveEnemyCount: number;
    isLaningPhase: boolean;
    isEarlyGame: boolean;
    isMidGame: boolean;
    isLateGame: boolean;
    teamFountain: Vector;
    teamFountainTpPoint: Vector;
};

type CachedDefendLocationState = {
    lastUpdate: number;
    laneFronts: Record<Lane, Vector>;
    enemyLaneFronts: Record<Lane, Vector>;
    highGroundEdgeWaitPoints: Record<Lane, Vector>;
};

type CachedDefendUnitState = {
    lastUpdate: number;
    enemyBuildings: Unit[];
    alliedHeroes: Unit[];
    enemyHeroes: Unit[];
    alliedCreeps: Unit[];
    enemyCreeps: Unit[];
    teamMembers: Unit[];
    enemies: Unit[];
};

const DEFEND_CACHE_TTL = 0.5; // 500ms cache TTL - increased for better performance
// Frame rate limiter removed — caused stale action replay and shared state bugs
let defendGameStateCache: CachedDefendGameState | null = null;
let defendLocationStateCache: CachedDefendLocationState | null = null;
let defendUnitStateCache: CachedDefendUnitState | null = null;

/** Update defend game state cache if needed */
function updateDefendGameStateCache(): CachedDefendGameState {
    const now = DotaTime();
    if (defendGameStateCache && now - defendGameStateCache.lastUpdate < DEFEND_CACHE_TTL) {
        return defendGameStateCache;
    }

    const team = GetTeam();
    const enemyTeam = GetOpposingTeam();
    const currentTime = DotaTime();
    const gameMode = GetGameMode();

    // Adjust time for turbo mode
    const adjustedTime = gameMode === 23 ? currentTime * 1.65 : currentTime;

    defendGameStateCache = {
        lastUpdate: now,
        currentTime: adjustedTime,
        gameMode,
        team,
        enemyTeam,
        ourAncient: GetAncient(team),
        enemyAncient: GetAncient(enemyTeam),
        aliveAllyCount: jmz.GetNumOfAliveHeroes(false),
        aliveEnemyCount: jmz.GetNumOfAliveHeroes(true),
        isLaningPhase: jmz.IsInLaningPhase(),
        isEarlyGame: jmz.IsEarlyGame(),
        isMidGame: jmz.IsMidGame(),
        isLateGame: jmz.IsLateGame(),
        teamFountain: jmz.GetTeamFountain(),
        teamFountainTpPoint: jmz.Utils.GetTeamFountainTpPoint(),
    };

    return defendGameStateCache;
}

/** Update defend location state cache if needed */
function updateDefendLocationStateCache(): CachedDefendLocationState {
    const now = DotaTime();
    if (defendLocationStateCache && now - defendLocationStateCache.lastUpdate < DEFEND_CACHE_TTL) {
        return defendLocationStateCache;
    }

    const team = GetTeam();
    const enemyTeam = GetOpposingTeam();

    defendLocationStateCache = {
        lastUpdate: now,
        laneFronts: {
            [Lane.Top]: GetLaneFrontLocation(team, Lane.Top, 0),
            [Lane.Mid]: GetLaneFrontLocation(team, Lane.Mid, 0),
            [Lane.Bot]: GetLaneFrontLocation(team, Lane.Bot, 0),
        },
        enemyLaneFronts: {
            [Lane.Top]: GetLaneFrontLocation(enemyTeam, Lane.Top, 0),
            [Lane.Mid]: GetLaneFrontLocation(enemyTeam, Lane.Mid, 0),
            [Lane.Bot]: GetLaneFrontLocation(enemyTeam, Lane.Bot, 0),
        },
        highGroundEdgeWaitPoints: {
            [Lane.Top]: GetHighGroundEdgeWaitPoint(team, Lane.Top),
            [Lane.Mid]: GetHighGroundEdgeWaitPoint(team, Lane.Mid),
            [Lane.Bot]: GetHighGroundEdgeWaitPoint(team, Lane.Bot),
        },
    };

    return defendLocationStateCache;
}

/** Update defend unit state cache if needed */
function updateDefendUnitStateCache(): CachedDefendUnitState {
    const now = DotaTime();
    if (defendUnitStateCache && now - defendUnitStateCache.lastUpdate < DEFEND_CACHE_TTL) {
        return defendUnitStateCache;
    }

    const teamMembers: Unit[] = [];
    for (let i = 1; i <= GetTeamPlayers(GetTeam()).length; i++) {
        const member = GetTeamMember(i);
        if (member !== null) {
            teamMembers.push(member);
        }
    }

    defendUnitStateCache = {
        lastUpdate: now,
        enemyBuildings: GetUnitList(UnitType.EnemyBuildings),
        alliedHeroes: GetUnitList(UnitType.AlliedHeroes),
        enemyHeroes: GetUnitList(UnitType.Enemies).filter(u => jmz.IsValidHero(u)),
        alliedCreeps: GetUnitList(UnitType.AlliedCreeps),
        enemyCreeps: GetUnitList(UnitType.Enemies).filter(u => u.IsCreep() || u.IsAncientCreep()),
        teamMembers,
        enemies: GetUnitList(UnitType.Enemies),
    };

    return defendUnitStateCache;
}

// small utils (keep GC low)
function _q(v: Vector | null | undefined): string {
    return v ? `${math.floor(v.x / 200) * 200}:${math.floor(v.y / 200) * 200}` : "0:0";
}
function _keyLoc(v: Vector, r?: number) {
    return `${_q(v)}|${tostring(math.floor(r || 0))}`;
}

function _recentHeroCountNear(loc: Vector, r: number, window = CACHE_LASTSEEN_WINDOW): number {
    const gameState = updateDefendGameStateCache();
    let cnt = 0;
    for (const id of GetTeamPlayers(gameState.enemyTeam)) {
        if (!IsHeroAlive(id)) continue;
        const info = GetHeroLastSeenInfo(id);
        // NOTE: TS index 0 → Lua index 1
        if (info && info[0] && info[0].time_since_seen <= window && GetLocationToLocationDistance(info[0].location, loc) <= r) {
            cnt += 1;
        }
    }
    return cnt;
}

// == Small helpers ==
function IsValidBuildingTarget(unit: Unit | null): unit is Unit {
    return unit !== null && unit.IsAlive() && unit.IsBuilding();
}
function IsBaseThreatActive(): boolean {
    return DotaTime() < (baseThreatUntil || -1);
}

/**
 * Severidade da ameaça à nossa base.
 *   0 = sem ameaça
 *   1 = inimigos pressionando T2 (pressão externa)
 *   2 = inimigos atacando T3 / rax (base interna)
 *   3 = inimigos no Ancient / high ground
 *
 * É a ÚNICA fonte de verdade para "vamos perder o jogo". Tudo em defesa
 * deve ceder a isso quando >= 2.
 */
export function GetBaseThreatLevel(): number {
    const team = nTeam;
    const ancient = GetAncient(team);

    // --- Nível 3: Ancient / high ground ---
    if (ancient) {
        if (jmz.Utils.CountEnemyHeroesNear(ancient.GetLocation(), 2600) >= 1) return 3;
    }
    if (jmz.Utils.CountEnemyHeroesOnHighGround(team) >= 1) return 3;

    // --- Nível 2: T3 e rax ---
    const innerStructures: Array<Unit | null> = [
        GetTower(team, Tower.Top3), GetTower(team, Tower.Mid3), GetTower(team, Tower.Bot3),
        GetBarracks(team, Barracks.TopMelee), GetBarracks(team, Barracks.TopRanged),
        GetBarracks(team, Barracks.MidMelee), GetBarracks(team, Barracks.MidRanged),
        GetBarracks(team, Barracks.BotMelee), GetBarracks(team, Barracks.BotRanged),
    ];
    for (const s of innerStructures) {
        if (!s || !IsValidBuildingTarget(s)) continue;
        if (jmz.Utils.CountEnemyHeroesNear(s.GetLocation(), 1800) >= 1) return 2;
        if (jmz.GetLastSeenEnemiesNearLoc(s.GetLocation(), 1800).length >= 1) return 2;
    }

    // --- Nível 1: T2 (pressão externa) ---
    const outerStructures: Array<Unit | null> = [
        GetTower(team, Tower.Top2), GetTower(team, Tower.Mid2), GetTower(team, Tower.Bot2),
    ];
    for (const s of outerStructures) {
        if (!s || !IsValidBuildingTarget(s)) continue;
        if (jmz.Utils.CountEnemyHeroesNear(s.GetLocation(), 1600) >= 1) return 1;
        if (jmz.GetLastSeenEnemiesNearLoc(s.GetLocation(), 1600).length >= 1) return 1;
    }

    return 0;
}

// If any enemy units (weighted) are around location; cached
function WeightedEnemiesAroundLocation(vLoc: Vector, nRadius: number): number {
    const now = DotaTime();
    const key = _keyLoc(vLoc, nRadius);
    const c = _cacheEnemyAroundLoc[key];
    if (c && now - c.t <= CACHE_ENEMY_AROUND_LOC_HZ) return c.count;

    const unitState = updateDefendUnitStateCache();
    let count = 0;
    for (const unit of unitState.enemies) {
        if (jmz.IsValid(unit) && GetUnitToLocationDistance(unit, vLoc) <= nRadius) {
            const name = unit.GetUnitName();
            if (jmz.IsValidHero(unit) && !jmz.IsSuspiciousIllusion(unit)) {
                count += jmz.IsCore(unit) ? 1 : 0.5;
            } else if (string.find(name, "upgraded_mega") !== null) {
                count += 0.6;
            } else if (string.find(name, "upgraded") !== null) {
                count += 0.4;
            } else if (string.find(name, "siege") !== null && string.find(name, "upgraded") === null) {
                count += 0.5;
            } else if (string.find(name, "warlock_golem") !== null || string.find(name, "lone_druid_bear") !== null) {
                count += 1;
            } else if (
                unit.IsCreep() ||
                unit.IsAncientCreep() ||
                unit.IsDominated() ||
                unit.HasModifier("modifier_chen_holy_persuasion") ||
                unit.HasModifier("modifier_dominated")
            ) {
                count += 0.2;
            }
        }
    }

    count = math.floor(count);
    _cacheEnemyAroundLoc[key] = { t: now, count };
    return count;
}

/**
 * Detecta qual lane um jogador humano do time está sinalizando como prioritária.
 * Retorna a Lane correspondente, ou null se não há sinal claro.
 *
 * Exportada porque também é usada em aba_push.ts.
 *
 * Fontes (por ordem de prioridade):
 *   1. Humano já está em modo de defesa de uma lane (DefendTowerTop/Mid/Bot)
 *   2. Humano deu um ping recente próximo a uma torre de lane
 */
export function GetHumanLanePressureLane(): Lane | null {
    const teamSize = GetTeamPlayers(nTeam).length;
    for (let i = 1; i <= teamSize; i++) {
        const member = GetTeamMember(i);
        if (!member || !jmz.IsValidHero(member)) continue;

        const pid = member.GetPlayerID();
        if (pid < 0 || IsPlayerBot(pid)) continue;
        if (!IsHeroAlive(pid)) continue;

        const mode = member.GetActiveMode();
        if (mode === BotMode.DefendTowerTop) return Lane.Top;
        if (mode === BotMode.DefendTowerMid) return Lane.Mid;
        if (mode === BotMode.DefendTowerBot) return Lane.Bot;
    }

    const [human, humanPing] = jmz.GetHumanPing();
    if (human && humanPing && DotaTime() > 0 && GameTime() < humanPing.time + 8.0) {
        const [isPinged, pingedLane] = jmz.IsPingCloseToValidTower(nTeam, humanPing, 1200, 8.0);
        if (isPinged) return pingedLane;
    }

    return null;
}

/**
 * Validação de unidade: existe, é uma unidade real e está viva.
 * `IsValidUnit` não existe como global do TSTL — wrapper local.
 */
function IsValidUnit(unit: Unit | null | undefined): unit is Unit {
    if (!unit) return false;
    if (!jmz.IsValid(unit)) return false;
    if (!unit.IsAlive()) return false;
    return true;
}

/**
 * True se há inimigos ameaçando diretamente nossa base:
 *   - qualquer herói inimigo a ≤ 2600 do Ancient, OU
 *   - qualquer herói inimigo no nosso high ground.
 *
 * Exportada porque também é usada em aba_push.ts.
 */
export function IsEnemyThreatNearOurBase(): boolean {
    const team = nTeam;
    const ancient = GetAncient(team);
    if (ancient && IsValidUnit(ancient)) {
        if (jmz.Utils.CountEnemyHeroesNear(ancient.GetLocation(), 2600) >= 1) return true;
    }
    if (jmz.Utils.CountEnemyHeroesOnHighGround(team) >= 1) return true;
    return false;
}

function GetThreatenedLane(): Lane {
    const lanes: Lane[] = [Lane.Top, Lane.Mid, Lane.Bot];
    let bestLane = lanes[0];
    let bestScore = -1;

    const ancient = GetAncient(nTeam);

    for (const ln of lanes) {
        const [bld, _urgent, tier] = GetFurthestBuildingOnLane(ln);
        const anchor = IsValidBuildingTarget(bld) && tier < 3 ? bld.GetLocation() : GetHighGroundEdgeWaitPoint(nTeam, ln);

        const enemyHeroCnt = _recentHeroCountNear(anchor, 1800);
        let score = enemyHeroCnt * 10;

        const hgEdge = GetHighGroundEdgeWaitPoint(nTeam, ln);
        const enemiesAtHGBuilding = jmz.GetLastSeenEnemiesNearLoc(hgEdge, 2000);
        const enemiesAtBase = ancient ? jmz.GetLastSeenEnemiesNearLoc(ancient.GetLocation(), 2600) : [];

        const barracksForLane =
            ln === Lane.Top ? [GetBarracks(nTeam, Barracks.TopMelee), GetBarracks(nTeam, Barracks.TopRanged)] :
            ln === Lane.Mid ? [GetBarracks(nTeam, Barracks.MidMelee), GetBarracks(nTeam, Barracks.MidRanged)] :
            [GetBarracks(nTeam, Barracks.BotMelee), GetBarracks(nTeam, Barracks.BotRanged)];
        const enemiesAtBarracks = barracksForLane.reduce(
            (acc, b) => acc + (b ? jmz.GetLastSeenEnemiesNearLoc(b.GetLocation(), 1800).length : 0), 0);

        // NOVO: contar heróis ao redor do T3 desta lane (cerco a T3 era invisível antes)
        const t3 = ln === Lane.Top ? GetTower(nTeam, Tower.Top3) : ln === Lane.Mid ? GetTower(nTeam, Tower.Mid3) : GetTower(nTeam, Tower.Bot3);
        const enemiesAtT3 = (t3 && IsValidBuildingTarget(t3)) ? jmz.GetLastSeenEnemiesNearLoc(t3.GetLocation(), 1800).length : 0;

        const threatCount = enemiesAtHGBuilding.length + enemiesAtBase.length + enemiesAtBarracks + enemiesAtT3;
        if (threatCount >= 1) {
            score = 999 + threatCount;
        }

        if (enemyHeroCnt === 0) {
            const creepEq = math.min(WeightedEnemiesAroundLocation(anchor, 1200) * 0.4, 0.9);
            score += creepEq;
        }

        if (ln === Lane.Mid && threatCount === 0) score *= 1.2;

        if (score > bestScore) {
            bestScore = score;
            bestLane = ln;
        }
    }

    if (DotaTime() <= _threatLaneSticky.until) {
        return _threatLaneSticky.lane;
    }
    _threatLaneSticky = { lane: bestLane, until: DotaTime() + 1.8 };
    return bestLane;
}

// Closest ally role among a list to given location
function GetClosestAllyPos(tPosList: number[], vLocation: Vector): number {
    let bestPos: number | null = null;
    let bestDist = math.huge;
    for (let i = 1; i <= 5; i++) {
        const m = GetTeamMember(i);
        if (jmz.IsValidHero(m)) {
            const p = jmz.GetPosition(m);
            for (let j = 1; j <= tPosList.length; j++) {
                if (p === tPosList[j]) {
                    const d = GetUnitToLocationDistance(m, vLocation);
                    if (d < bestDist) {
                        bestDist = d;
                        bestPos = p;
                    }
                }
            }
        }
    }
    return bestPos ?? tPosList[0];
}

// == Core building selection ==
// Returns: furthestBuilding, urgencyMultiplier, tier (1..4)
export function GetFurthestBuildingOnLane(lane: Lane): [Unit | any, number, number] {
    const cacheKey = `FurthestBuildingOnLane:${nTeam}:${lane ?? -1}`;
    const cachedVar = jmz.Utils.GetCachedVars(cacheKey, 1);
    if (cachedVar != null) {
        return cachedVar;
    }

    const res = GetFurthestBuildingOnLaneHelper(lane);
    jmz.Utils.SetCachedVars(cacheKey, res);
    return res;
}

// Returns: furthestBuilding, urgencyMultiplier, tier (1..4)
export function GetFurthestBuildingOnLaneHelper(lane: Lane): [Unit | any, number, number] {
    const team = nTeam;
    let b: Unit | null;

    function hpMul(u: Unit, lo: number, hi: number, mlo: number, mhi: number) {
        const nHealth = u.GetHealth() / u.GetMaxHealth();
        return RemapValClamped(nHealth, lo, hi, mlo, mhi);
    }

    if (lane === Lane.Top) {
        b = GetTower(team, Tower.Top1);
        if (IsValidBuildingTarget(b)) return [b, hpMul(b, 0.25, 1, 0.5, 1), 1];
        b = GetTower(team, Tower.Top2);
        if (IsValidBuildingTarget(b)) return [b, hpMul(b, 0.25, 1, 1.0, 2), 2];
        b = GetTower(team, Tower.Top3);
        if (IsValidBuildingTarget(b)) return [b, hpMul(b, 0.25, 1, 1.5, 2), 3];
        b = GetBarracks(team, Barracks.TopMelee);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetBarracks(team, Barracks.TopRanged);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetTower(team, Tower.Base1);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetTower(team, Tower.Base2);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetAncient(team);
        if (IsValidBuildingTarget(b)) return [b, 3.0, 4];
    } else if (lane === Lane.Mid) {
        b = GetTower(team, Tower.Mid1);
        if (IsValidBuildingTarget(b)) return [b, hpMul(b, 0.25, 1, 0.5, 1), 1];
        b = GetTower(team, Tower.Mid2);
        if (IsValidBuildingTarget(b)) return [b, hpMul(b, 0.25, 1, 1.0, 2), 2];
        b = GetTower(team, Tower.Mid3);
        if (IsValidBuildingTarget(b)) return [b, hpMul(b, 0.25, 1, 1.5, 2), 3];
        b = GetBarracks(team, Barracks.MidMelee);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetBarracks(team, Barracks.MidRanged);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetTower(team, Tower.Base1);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetTower(team, Tower.Base2);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetAncient(team);
        if (IsValidBuildingTarget(b)) return [b, 3.0, 4];
    } else {
        b = GetTower(team, Tower.Bot1);
        if (IsValidBuildingTarget(b)) return [b, hpMul(b, 0.25, 1, 0.5, 1), 1];
        b = GetTower(team, Tower.Bot2);
        if (IsValidBuildingTarget(b)) return [b, hpMul(b, 0.25, 1, 1.0, 2), 2];
        b = GetTower(team, Tower.Bot3);
        if (IsValidBuildingTarget(b)) return [b, hpMul(b, 0.25, 1, 1.5, 2), 3];
        b = GetBarracks(team, Barracks.BotMelee);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetBarracks(team, Barracks.BotRanged);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetTower(team, Tower.Base1);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetTower(team, Tower.Base2);
        if (IsValidBuildingTarget(b)) return [b, 2.5, 3];
        b = GetAncient(team);
        if (IsValidBuildingTarget(b)) return [b, 3.0, 4];
    }

    return [null as any, 1.0, 0];
}

// Travel Boots defender dedupe
function IsThereNoTeammateTravelBootsDefender(bot: Unit): boolean {
    const unitState = updateDefendUnitStateCache();
    for (const m of unitState.teamMembers) {
        if (bot !== m && jmz.IsValidHero(m) && (m as any).travel_boots_defender === true) {
            return false;
        }
    }
    return true;
}

// Compute a “high-ground edge” wait point a bit outside the T3 toward lane
function GetHighGroundEdgeWaitPoint(team: Team, lane: Lane): Vector {
    const t3 = lane === Lane.Top ? GetTower(team, Tower.Top3) : lane === Lane.Mid ? GetTower(team, Tower.Mid3) : GetTower(team, Tower.Bot3);

    // try lane rax if T3 is gone
    const raxM =
        lane === Lane.Top ? GetBarracks(team, Barracks.TopMelee) : lane === Lane.Mid ? GetBarracks(team, Barracks.MidMelee) : GetBarracks(team, Barracks.BotMelee);
    const raxR =
        lane === Lane.Top ? GetBarracks(team, Barracks.TopRanged) : lane === Lane.Mid ? GetBarracks(team, Barracks.MidRanged) : GetBarracks(team, Barracks.BotRanged);

    const anc = GetAncient(team);

    // choose a lane HG anchor: T3 > any rax > last-resort fallback
    const anchorBuilding = (jmz.IsValidBuilding(t3) ? t3 : jmz.IsValidBuilding(raxM) ? raxM : jmz.IsValidBuilding(raxR) ? raxR : undefined) as Unit | undefined;

    if (anchorBuilding && jmz.IsValidBuilding(anc)) {
        const t = anchorBuilding.GetLocation();
        const a = (anc as Unit).GetLocation();
        const dir = Vector(a.x - t.x, a.y - t.y, 0);
        const len = math.max(1, math.sqrt(dir.x * dir.x + dir.y * dir.y));
        return Vector(t.x + (dir.x / len) * 250, t.y + (dir.y / len) * 250, 0);
    }

    // safer fallback: deeper inside base so HG hero clumps get counted
    return jmz.AdjustLocationWithOffsetTowardsFountain(GetLaneFrontLocation(team, lane, 0), 600);
}

// Role-aware defend decision (cached)
export function ShouldDefend(bot: Unit, hBuilding: Unit | null, nRadius: number): boolean {
    if (!IsValidBuildingTarget(hBuilding)) return false;

    const gameState = updateDefendGameStateCache();
    let enemyHeroNearby = 0;
    for (const id of GetTeamPlayers(gameState.enemyTeam)) {
        if (IsHeroAlive(id)) {
            const info = GetHeroLastSeenInfo(id);
            if (info != null) {
                const d = info[0]; // TS 0-index
                if (d != null && d.time_since_seen <= CACHE_LASTSEEN_WINDOW && GetUnitToLocationDistance(hBuilding, d.location) <= 1600) {
                    enemyHeroNearby = enemyHeroNearby + 1;
                }
            }
        }
    }

    const unitState = updateDefendUnitStateCache();
    let creepWeights = 0;
    for (const unit of unitState.enemyCreeps) {
        if (jmz.IsValid(unit) && GetUnitToUnitDistance(hBuilding, unit) <= nRadius) {
            const name = unit.GetUnitName();
            if (string.find(name, "siege") !== null && string.find(name, "upgraded") === null) {
                creepWeights += 0.5;
            } else if (string.find(name, "upgraded_mega") !== null) {
                creepWeights += 0.6;
            } else if (string.find(name, "upgraded") !== null) {
                creepWeights += 0.4;
            } else if (string.find(name, "warlock_golem") !== null || string.find(name, "shadow_shaman_ward") !== null) {
                creepWeights += 1.0;
            } else if (string.find(name, "lone_druid_bear") !== null) {
                enemyHeroNearby = enemyHeroNearby + 1;
            } else if (
                unit.IsCreep() || unit.IsAncientCreep() || unit.IsDominated() ||
                unit.HasModifier("modifier_chen_holy_persuasion") ||
                unit.HasModifier("modifier_dominated")
            ) {
                creepWeights += 0.2;
            }
        }
    }

    const nNearby = enemyHeroNearby + math.floor(creepWeights);
    const pos = jmz.GetPosition(bot);

    // === NOVO: base interna aceita QUALQUER defensor ===
    // Se o alvo está em T3/rax/Ancient, todo mundo pode vir — a alternativa
    // é perder o jogo. Esse check intencionalmente ignora o role gating abaixo.
    const ancientForCheck = GetAncient(nTeam);
    const isInnerBaseBuilding = !!ancientForCheck &&
        GetLocationToLocationDistance(hBuilding.GetLocation(), ancientForCheck.GetLocation()) <= 3500;

    if (isInnerBaseBuilding && nNearby >= 1) {
        return true;
    }

    let result = false;
    if (nNearby === 1) {
        if (pos === 2 || pos === GetClosestAllyPos([4, 5], hBuilding.GetLocation())) result = true;
    } else if (nNearby === 2) {
        if (pos === 2 || pos === 3 || pos === GetClosestAllyPos([4, 5], hBuilding.GetLocation()) || (pos === 1 && GetUnitToUnitDistance(bot, hBuilding) <= 3200)) result = true;
    } else if (nNearby === 3) {
        if (pos === 2 || pos === 3 || pos === 4 || pos === 5 || (pos === 1 && GetUnitToUnitDistance(bot, hBuilding) <= 3200)) result = true;
    } else if (nNearby >= 4) {
        result = true;
    }

    // Escalação Travel Boots / Tinker
    if (!result) {
        if (DotaTime() - fTraveBootsDefendTime >= 20.0) {
            (bot as any).travel_boots_defender = false;
        }
        if (
            bot.GetUnitName() === "npc_dota_hero_tinker" &&
            bot.GetLevel() >= 6 &&
            jmz.CanCastAbility(bot.GetAbilityByName("tinker_keen_teleport")) &&
            IsThereNoTeammateTravelBootsDefender(bot)
        ) {
            (bot as any).travel_boots_defender = true;
            fTraveBootsDefendTime = DotaTime();
            result = true;
        } else {
            const boots = jmz.GetItem2(bot, "item_travel_boots") || jmz.GetItem2(bot, "item_travel_boots_2");
            if (jmz.CanCastAbility(boots) && IsThereNoTeammateTravelBootsDefender(bot)) {
                (bot as any).travel_boots_defender = true;
                fTraveBootsDefendTime = DotaTime();
                result = true;
            }
        }

        if (!result && pos === GetClosestAllyPos([2, 3], hBuilding.GetLocation())) {
            result = true;
        }
    }

    // Under-fire: NÃO bloquear quando estamos defendendo base interna.
    const underFire = bot.WasRecentlyDamagedByAnyHero(5);
    if (underFire && result && !isInnerBaseBuilding) {
        const closestPos = GetClosestAllyPos([2, 3, 4, 5], hBuilding.GetLocation());
        if (jmz.GetPosition(bot) !== closestPos) {
            return false;
        }
    }

    return result;
}

// Ping teammates to defend (rate-limited; role-aware)
function ConsiderPingedDefend(bot: Unit, lane: Lane, desire: number, building: Unit | null, tier: number, nEffAllies: number, nEnemies: number) {
    const gameState = updateDefendGameStateCache();
    if (gameState.isLaningPhase || gameState.aliveAllyCount === 0) return;
    if (!IsValidBuildingTarget(building)) return;

    const baseThreatLevel = GetBaseThreatLevel();
    const isBaseThreat = baseThreatLevel >= 2;

    // Em ameaça de base, pingar SEMPRE (mesmo tier baixo / desire baixo).
    if (!isBaseThreat) {
        if (tier < 2 || desire <= 0.5) return;
        if (!ShouldDefend(bot, building, 1600)) return;
    }

    (jmz.Utils as any)["GameStates"] = (jmz.Utils as any)["GameStates"] || {};
    (jmz.Utils as any)["GameStates"]["defendPings"] = (jmz.Utils as any)["GameStates"]["defendPings"] || { pingedTime: GameTime() };
    const defendPings = (jmz.Utils as any)["GameStates"]["defendPings"];

    // Em ameaça de base: relaxa "temos números" (mas não spamma se já estamos em maioria folgada).
    const haveNumbers = isBaseThreat ? nEffAllies >= nEnemies + 2 : nEffAllies >= nEnemies;
    if (nEffAllies >= 1 && haveNumbers) return;
    if (GameTime() - defendPings.pingedTime <= (isBaseThreat ? 3.0 : 6.0)) return;

    const saferLoc = add(jmz.AdjustLocationWithOffsetTowardsFountain(building.GetLocation(), 850), RandomVector(50));
    const retreaters = jmz.GetRetreatingAlliesNearLoc(saferLoc, 1600);
    if (retreaters.length === 0 || isBaseThreat) {
        bot.ActionImmediate_Chat(Localization.Get("say_come_def"), false);
        bot.ActionImmediate_Ping(saferLoc.x, saferLoc.y, false);
        defendPings.pingedTime = GameTime();
        defendPings.lane = lane;
    }
}

// --- Panic hint: lane-gated floor without early returns ---
type PanicHint = { active: boolean; floor: number; forceLoc?: Vector };

export function GetDefendDesire(bot: Unit, lane: Lane): BotModeDesire {
    // 0) quick invalid checks
    if (bot.IsInvulnerable() || !bot.IsHero() || !bot.IsAlive() || !bot.GetUnitName().includes("hero") || bot.IsIllusion()) {
        return BotModeDesire.None;
    }

    // (pre) compute dynamic TTL and include threatened lane in key when base/HG pressure is present
    // const baseThreatNow = IsBaseThreatActive();
    // const enemiesOnHGNow = jmz.Utils.CountEnemyHeroesOnHighGround(nTeam);
    // const threatenedLaneNow = baseThreatNow || enemiesOnHGNow >= 1 ? GetThreatenedLane() : lane;

    // const cacheTTL = baseThreatNow || enemiesOnHGNow >= 1 ? 0.2 : 0.6;
    // const cacheKey = `DefendDesire:${bot.GetPlayerID()}:${lane ?? -1}:${threatenedLaneNow}`;

    // const cachedVar = jmz.Utils.GetCachedVars(cacheKey, cacheTTL);
    // if (cachedVar != null) {
    //     (bot as any).defendDesire = cachedVar;
    //     return cachedVar;
    // }

    // 2) compute and publish
    const res = GetDefendDesireHelper(bot, lane);
    // jmz.Utils.SetCachedVars(cacheKey, res);
    (bot as any).defendDesire = res;
    return res;
}

export function GetDefendDesireHelper(bot: Unit, lane: Lane): BotModeDesire {
    if ((bot as any).laneToDefend == null) (bot as any).laneToDefend = lane;
    if ((bot as any).DefendLaneDesire == null) (bot as any).DefendLaneDesire = [0, 0, 0];

    const gameState = updateDefendGameStateCache();
    const locationState = updateDefendLocationStateCache();
    const unitState = updateDefendUnitStateCache();

    const team = gameState.team;
    const ancient = gameState.ourAncient;

    // NOVO: indicador unificado 0..3 (fonte de verdade)
    const baseThreatLevel = GetBaseThreatLevel();
    const baseThreatActiveNow = baseThreatLevel >= 2;
    const baseThreatSevere = baseThreatLevel >= 3;

    const ds = getDefendState(bot);
    ds.defendLoc = locationState.laneFronts[lane];
    const distanceToDefendLoc = GetUnitToLocationDistance(bot, ds.defendLoc);

    // ---- Level gating (relaxado sob ameaça de base) ----
    const botLevel = bot.GetLevel();
    if (!baseThreatActiveNow && bot.GetAssignedLane() !== lane && distanceToDefendLoc > 3000) {
        const posNow = jmz.GetPosition(bot);
        if (
            (posNow === 1 && botLevel < 6) ||
            (posNow === 2 && botLevel < 6) ||
            (posNow === 3 && botLevel < 5) ||
            (posNow === 4 && botLevel < 4) ||
            (posNow === 5 && botLevel < 4)
        ) {
            return BotModeDesire.None;
        }
    }
    if (botLevel < 3 && !baseThreatActiveNow) return BotModeDesire.None;

    // ---- Cap de luta próxima (só quando a base NÃO está ameaçada) ----
    if (!baseThreatActiveNow) {
        const closeEnemiesDefend = jmz.GetEnemiesNearLoc(bot.GetLocation(), 900);
        const closeAlliesDefend = jmz.GetAlliesNearLoc(bot.GetLocation(), 900);
        if (closeEnemiesDefend.length > 0 && closeAlliesDefend.length >= closeEnemiesDefend.length) {
            return math.min(0.3, BotModeDesire.Moderate) as BotModeDesire;
        }
    }

    // ---- Override "time está pushando" (SÓ quando a base está segura) ----
    if (!baseThreatActiveNow) {
        const forceGroupPushLevel = math.max(1, math.min(3, (Customize as any).Force_Group_Push_Level || 1));
        const pushGroupThreshold = 4 - forceGroupPushLevel;
        let teamIsPushing = false;
        for (let i = 1; i <= GetTeamPlayers(nTeam).length; i++) {
            const member = GetTeamMember(i);
            if (member && member !== bot && member.IsAlive()) {
                const mode = member.GetActiveMode();
                if (mode === BotMode.PushTowerTop || mode === BotMode.PushTowerMid || mode === BotMode.PushTowerBot) {
                    const alliesNear = jmz.GetAlliesNearLoc(member.GetLocation(), 1600);
                    if (alliesNear.length >= pushGroupThreshold) { teamIsPushing = true; break; }
                }
            }
        }
        if (teamIsPushing) return BotModeDesire.VeryLow;
    }

    const recentlyHit = bot.WasRecentlyDamagedByAnyHero(5) || bot.WasRecentlyDamagedByTower(5);

    // ---- Lane gating ----
    const humanPressureLane = GetHumanLanePressureLane();
    const threatenedLane = baseThreatActiveNow
        ? GetThreatenedLane()
        : (humanPressureLane !== null ? humanPressureLane : GetThreatenedLane());

    if (baseThreatActiveNow && lane !== threatenedLane) return BotModeDesire.VeryLow;

    // ---- Panic floor ----
    let panic: PanicHint = { active: false, floor: 0 };
    if (humanPressureLane !== null && lane === humanPressureLane) {
        panic = { active: true, floor: 0.9, forceLoc: GetLaneFrontLocation(nTeam, lane, -250) };
    }

    if (baseThreatActiveNow) {
        baseThreatUntil = DotaTime() + BASE_THREAT_HOLD;
        const panicFloor = baseThreatSevere ? 0.97 : 0.9;
        const forceLoc = ancient
            ? jmz.AdjustLocationWithOffsetTowardsFountain(ancient.GetLocation(), 300)
            : ds.defendLoc;
        panic = { active: true, floor: math.max(panic.floor, panicFloor), forceLoc };
        (bot as any).laneToDefend = lane;

        // Estende hold se aliados estão TPando pra lane ameaçada
        const enemyTeamIds = GetTeamPlayers(gameState.enemyTeam);
        const threatenedLaneLoc = threatenedLane === Lane.Top
            ? GetLaneFrontLocation(nTeam, Lane.Top, 0)
            : threatenedLane === Lane.Bot
                ? GetLaneFrontLocation(nTeam, Lane.Bot, 0)
                : GetLaneFrontLocation(nTeam, Lane.Mid, 0);
        const incoming = GetIncomingTeleports().filter(tp => {
            if (!tp) return false;
            const isEnemy = enemyTeamIds.some(id => id === tp.playerid);
            return !isEnemy && jmz.GetDistance(tp.location, threatenedLaneLoc) <= 3000;
        });
        if (incoming.length >= 1) baseThreatUntil = DotaTime() + BASE_THREAT_HOLD + 4;
    }

    // Sticky (creeps mantendo)
    if (ancient) {
        const heroesNearAncient = jmz.Utils.CountEnemyHeroesNear(ancient.GetLocation(), BASE_THREAT_RADIUS);
        if (heroesNearAncient >= 1) {
            baseThreatUntil = DotaTime() + BASE_THREAT_HOLD;
        } else if (IsBaseThreatActive()) {
            const creepWeight = WeightedEnemiesAroundLocation(ancient.GetLocation(), BASE_THREAT_RADIUS);
            if (creepWeight >= 2) baseThreatUntil = DotaTime() + 1.5;
        }
    }

    // ---- Anchor ----
    if (panic.active && panic.forceLoc) {
        ds.defendLoc = panic.forceLoc;
    } else if (IsBaseThreatActive() && ancient) {
        ds.defendLoc = jmz.AdjustLocationWithOffsetTowardsFountain(ancient.GetLocation(), 300);
    } else if (jmz.Utils.GetLocationToLocationDistance(gameState.teamFountainTpPoint, ds.defendLoc) < 3000) {
        const enemyLaneFront = locationState.enemyLaneFronts[lane];
        const eNear = jmz.GetLastSeenEnemiesNearLoc(enemyLaneFront, 1600);
        const aNear = jmz.GetAlliesNearLoc(enemyLaneFront, 1600);
        if (GetUnitToLocationDistance(bot, enemyLaneFront) > bot.GetAttackRange() && eNear.length <= aNear.length + 1) {
            ds.defendLoc = enemyLaneFront;
        }
    }

    ds.distanceToLane[lane] = GetUnitToLocationDistance(bot, ds.defendLoc);
    ds.nInRangeAlly = jmz.GetNearbyHeroes(bot, 1600, false, BotMode.None);
    ds.nInRangeEnemy = jmz.GetLastSeenEnemiesNearLoc(bot.GetLocation(), 1600);
    ds.weAreStronger = jmz.WeAreStronger(bot, 2500);

    // ---- Bail-outs (SÓ quando a base está segura) ----
    if (!baseThreatActiveNow) {
        const pos = jmz.GetPosition(bot);
        const bMyLane = bot.GetAssignedLane() === lane;
        const enemiesAtAncient = ancient ? jmz.Utils.CountEnemyHeroesNear(ancient.GetLocation(), 2200) : 0;

        if (ds.nInRangeEnemy.length > 0) return BotModeDesire.VeryLow;
        if (!bMyLane && pos === 1 && gameState.isLaningPhase) return BotModeDesire.VeryLow;
        if (jmz.IsDoingRoshan(bot) && jmz.GetAlliesNearLoc(jmz.GetCurrentRoshanLocation(), 2800).length >= 3) return BotModeDesire.VeryLow;
        if (
            jmz.IsDoingTormentor(bot) &&
            (jmz.GetAlliesNearLoc(jmz.GetTormentorLocation(team), 1600).length >= 2 ||
                jmz.GetAlliesNearLoc(jmz.GetTormentorWaitingLocation(team), 2500).length >= 2) &&
            enemiesAtAncient === 0
        ) {
            return BotModeDesire.VeryLow;
        }
    }

    // ---- Human ping floor ----
    let pingFloor = 0;
    const [human, humanPing] = jmz.GetHumanPing();
    if (human && humanPing && humanPing.normal_ping && DotaTime() > 0) {
        const [isPinged, pingedLane] = jmz.IsPingCloseToValidTower(gameState.team, humanPing, 800, 5.0);
        if (isPinged && lane === pingedLane && GameTime() < humanPing.time + PING_DELTA) {
            (bot as any).laneToDefend = lane;
            pingFloor = 0.95;
        }
    }

    const [furthestBuilding, urgentMul, buildingTier] = GetFurthestBuildingOnLane(lane);
    if (!IsValidBuildingTarget(furthestBuilding)) return BotModeDesire.None;

    const shouldDef = ShouldDefend(bot, furthestBuilding, 1600);
    const isBaseBuilding = buildingTier >= 3;
    const creepsNearBase = isBaseBuilding && unitState.enemyCreeps.some(u => jmz.IsValid(u) && GetUnitToUnitDistance(furthestBuilding, u) <= 1200);

    if (!shouldDef && !baseThreatActiveNow) {
        const dist = ds.distanceToLane[lane];
        const tp = jmz.Utils.GetItemFromFullInventory(bot, "item_tpscroll");
        const nearEnemiesAtBuilding = jmz.GetLastSeenEnemiesNearLoc(furthestBuilding.GetLocation(), 1200);
        const buildingUnderAttack = furthestBuilding.GetHealth() < furthestBuilding.GetMaxHealth();
        if (
            (!jmz.CanCastAbility(tp) && dist && dist > 4000 && nearEnemiesAtBuilding.length === 0 && !buildingUnderAttack) ||
            (nearEnemiesAtBuilding.length === 0 && (!isBaseBuilding || !creepsNearBase) && !buildingUnderAttack && jmz.GetAlliesNearLoc(furthestBuilding.GetLocation(), 1600).length >= 1)
        ) {
            return BotModeDesire.VeryLow;
        }
    }

    let nDefendDesire = GetDefendLaneDesire(lane);

    const hub = furthestBuilding.GetLocation();
    const lEnemies = jmz.GetLastSeenEnemiesNearLoc(hub, 2500);
    const nDefendAllies = jmz.GetAlliesNearLoc(hub, 2500);
    const nEffAllies = nDefendAllies.length + jmz.Utils.GetAllyIdsInTpToLocation(hub, 2500).length;
    const buildingDamaged = furthestBuilding.GetHealth() < furthestBuilding.GetMaxHealth();

    // Bail-outs por "inimigos ausentes" / "já temos gente" — só quando a base está segura.
    if (!baseThreatActiveNow) {
        if (lEnemies.length === 0 && (!isBaseBuilding || !creepsNearBase) && !buildingDamaged && (jmz.GetAlliesNearLoc(hub, 1600).length >= 2 || jmz.IsCore(bot))) {
            return BotModeDesire.VeryLow;
        }
        if (lEnemies.length === 1 && !buildingDamaged && (nEffAllies > lEnemies.length || (jmz.GetAlliesNearLoc(hub, 1600).length >= 2 && jmz.GetAverageLevel(false) >= jmz.GetAverageLevel(true)))) {
            return BotModeDesire.VeryLow;
        }
    }

    // Cap / floor
    const capBoost = (shouldDef || baseThreatActiveNow) ? 0.1 : 0.0;
    let maxDesire = (buildingTier >= 3 && nEffAllies >= lEnemies.length ? 1.0 : MAX_DESIRE_CAP) + capBoost;
    maxDesire = math.min(maxDesire, 1.0);
    const baseFloor = (shouldDef || baseThreatActiveNow) ? BotActionDesire.Low : BotActionDesire.VeryLow;

    nDefendDesire = RemapValClamped(jmz.GetHP(bot), 0.75, 0.2, RemapValClamped(nDefendDesire * urgentMul, 0, 1, baseFloor, maxDesire), BotActionDesire.Low);

    // Cautela se em desvantagem perto do destino (só fora de ameaça de base)
    {
        const dist = ds.distanceToLane[lane];
        if (!baseThreatActiveNow && dist && dist < 1600 && ds.nInRangeEnemy.length > ds.nInRangeAlly.length && !ds.weAreStronger) {
            nDefendDesire = RemapValClamped(nDefendDesire, 0, 1, BotActionDesire.VeryLow, BotActionDesire.High);
        }
    }

    // Não abandonar defesa por chase de low-HP
    const botTarget = jmz.GetProperTarget(bot);
    if (jmz.IsValidHero(botTarget) && jmz.GetHP(botTarget) < 0.6 && jmz.GetHP(bot) > jmz.GetHP(botTarget) && GetUnitToUnitDistance(bot, botTarget) < 1500) {
        nDefendDesire = nDefendDesire * 0.4;
    }

    // Sanidade TP/distância — pula decay quando a base está ameaçada
    if (!baseThreatActiveNow) {
        const tp = jmz.Utils.GetItemFromFullInventory(bot, "item_tpscroll");
        const dist = ds.distanceToLane[lane];
        if (!jmz.CanCastAbility(tp) && dist && dist > 4000) {
            const nearEnemies = jmz.GetLastSeenEnemiesNearLoc(furthestBuilding.GetLocation(), 1200);
            if (nearEnemies.length === 0 || bot.WasRecentlyDamagedByAnyHero(2)) nDefendDesire = nDefendDesire * 0.5;
            nDefendDesire = RemapValClamped(dist / 4000, 0, 2, nDefendDesire, BotActionDesire.VeryLow);
        }
    }

    // Não sacrificar corpo em T1/T2 condenado — nunca pula T3/rax/Ancient
    if (!baseThreatActiveNow && furthestBuilding !== ancient) {
        const hp = jmz.GetHP(furthestBuilding);
        if ((buildingTier === 1 && hp <= 0.15) || (buildingTier === 2 && hp <= 0.1)) {
            return BotModeDesire.None;
        }
    }

    // Pisos após TODOS os dampeners
    if (panic.active) nDefendDesire = math.max(nDefendDesire, panic.floor);
    if (pingFloor > 0) nDefendDesire = math.max(nDefendDesire, pingFloor);
    if (baseThreatActiveNow) nDefendDesire = math.max(nDefendDesire, baseThreatSevere ? 0.97 : 0.9);

    ConsiderPingedDefend(bot, lane, nDefendDesire, furthestBuilding, buildingTier, nEffAllies, lEnemies.length);

    if (recentlyHit && !baseThreatActiveNow) {
        nDefendDesire = nDefendDesire * 0.4;
        if (ds.nInRangeEnemy.length >= ds.nInRangeAlly.length && !ds.weAreStronger) {
            nDefendDesire = math.min(nDefendDesire, BotActionDesire.Low);
        }
    }

    if (nDefendDesire > 0.7) {
        (jmz.Utils as any).GameStates = (jmz.Utils as any).GameStates || {};
        (jmz.Utils as any).GameStates["recentDefendTime"] = DotaTime();
        (bot as any).laneToDefend = lane;
    }

    return nDefendDesire as BotModeDesire;
}

export function DefendThink(bot: Unit, lane: Lane) {
    const now = DotaTime();

    // OHA MOD 2026/08/30: CanNotUseAction()/IsBotThinkingMeaningfulAction() also treat a
    // stale order left by whatever mode was active a moment ago (e.g. still walking to a
    // farm camp, ACTIVITY_RUN counts as "meaningful") as busy — so when a ping/threat just
    // switched the bot into Defend, it kept executing the old order instead of defending.
    // Skip those two gates for the tick Defend just became active; still respect real
    // un-interruptible states (channel/stun/etc) via IsBotBusyChannelingOrStunned.
    const activeMode = bot.GetActiveMode();
    const isDefendMode = activeMode === BotMode.DefendTowerTop || activeMode === BotMode.DefendTowerMid || activeMode === BotMode.DefendTowerBot;
    const justEnteredDefend = isDefendMode && (bot as any)._lastActiveMode !== activeMode;
    (bot as any)._lastActiveMode = activeMode;

    if (justEnteredDefend) {
        if (jmz.IsBotBusyChannelingOrStunned(bot)) return;
    } else {
        if (jmz.CanNotUseAction(bot)) return;
        if (jmz.Utils.IsBotThinkingMeaningfulAction(bot, Customize.ThinkLess, "defend")) return;
    }
        // ---- EMERGÊNCIA: Ancient apanhando e estamos longe → TP/anda pra base AGORA ----
    {
        const anc = GetAncient(nTeam);
        if (anc && IsValidBuildingTarget(anc)) {
            const enemiesAtAncient = jmz.Utils.CountEnemyHeroesNear(anc.GetLocation(), 2400);
            const distToAncient = GetUnitToUnitDistance(bot, anc);
            if (enemiesAtAncient >= 1 && distToAncient > 1800) {
                const dest = add(jmz.AdjustLocationWithOffsetTowardsFountain(anc.GetLocation(), 300), jmz.RandomForwardVector(150));
                const tp = jmz.GetItem2(bot, "item_tpscroll");
                if (jmz.CanCastAbility(tp)) {
                    bot.Action_UseAbilityOnLocation(tp, dest);
                    return;
                }
                bot.Action_MoveToLocation(dest);
                return;
            }
        }
    }

    // a small don't-walk-through-fire guard - use cached enemies when possible
    const botLocation = bot.GetLocation();
    const pathCacheKey = `pathEnemies_${bot.GetPlayerID()}_${Math.floor(now * 2)}`; // 500ms cache
    let pathEnemies: Unit[];
    if (!(bot as any)[pathCacheKey]) {
        pathEnemies = jmz.GetLastSeenEnemiesNearLoc(botLocation, 1600);
        (bot as any)[pathCacheKey] = pathEnemies;
        // Clean old cache entries
        Object.keys(bot).forEach(key => {
            if (key.startsWith("pathEnemies_") && key !== pathCacheKey) {
                delete (bot as any)[key];
            }
        });
    } else {
        pathEnemies = (bot as any)[pathCacheKey];
    }

    const ds = getDefendState(bot);
    if (bot.WasRecentlyDamagedByAnyHero(5) && pathEnemies.length > ds.nInRangeEnemy.length) {
        // step back toward fountain a bit, then re-eval next tick
        const safe = jmz.AdjustLocationWithOffsetTowardsFountain(bot.GetLocation(), 700);
        bot.Action_MoveToLocation(add(safe, jmz.RandomForwardVector(120)));
        return;
    }

    // Base-defense leash: anchor near Ancient, don't drift out
    if (IsBaseThreatActive()) {
        const ancient = GetAncient(nTeam);
        const anchor = jmz.AdjustLocationWithOffsetTowardsFountain(ancient.GetLocation(), 200);

        const toAnc = GetUnitToUnitDistance(bot, ancient);
        if (toAnc > BASE_LEASH_OUTBOUND) {
            const moveLoc = add(anchor, jmz.RandomForwardVector(250));
            bot.Action_MoveToLocation(moveLoc);
            return;
        }

        const nSearchRange = 1400;
        const ancientLoc = ancient.GetLocation();
        // Use a simpler cache approach for Lua compatibility
        const enemiesCacheKey = `ancientEnemies_${Math.floor(now * 5)}`;
        let enemiesNear: Unit[];
        if (!(jmz.Utils as any)[enemiesCacheKey]) {
            enemiesNear = jmz.GetEnemiesNearLoc(ancientLoc, nSearchRange);
            (jmz.Utils as any)[enemiesCacheKey] = enemiesNear;
            // Clean old cache entries
            const utils = jmz.Utils as any;
            Object.keys(utils).forEach(key => {
                if (typeof key === "string" && key.startsWith("ancientEnemies_") && key !== enemiesCacheKey) {
                    delete utils[key];
                }
            });
        } else {
            enemiesNear = (jmz.Utils as any)[enemiesCacheKey];
        }

        if (jmz.IsValidHero(enemiesNear[0]) && jmz.IsInRange(bot, enemiesNear[0], nSearchRange)) {
            bot.Action_AttackUnit(enemiesNear[0], true);
            return;
        }

        const attackMoveLoc = add(anchor, jmz.RandomForwardVector(300));
        bot.Action_AttackMove(attackMoveLoc);
        return;
    }

    // Normal defend movement/targeting
    const attackRange = bot.GetAttackRange();
    const nSearchRange = (attackRange < 900 && 900) || math.min(attackRange, SEARCH_RANGE_DEFAULT);
    if (!ds.defendLoc) ds.defendLoc = GetLaneFrontLocation(nTeam, lane, 0);

    const [bld, _, buildingTier] = GetFurthestBuildingOnLane(lane);
    let hub = ds.defendLoc;
    if (IsValidBuildingTarget(bld)) hub = bld.GetLocation();
    if (!hub) hub = GetLaneFrontLocation(nTeam, lane, 0);

    // If we are defending tier ≥3 lane hold the edge of the high ground
    if (buildingTier >= 3) {
        const edgeInside = GetHighGroundEdgeWaitPoint(nTeam, lane);
        const enemyAtHG = jmz.Utils.CountEnemyHeroesOnHighGround(nTeam); // 0/1/2+
        const nearEdgeEnemies = jmz.GetLastSeenEnemiesNearLoc(edgeInside, 1200);
        const nearEdgeAllies = jmz.GetAlliesNearLoc(edgeInside, 1400);

        // Default: hold just inside HG. Only step out if we have clear numbers.
        if (enemyAtHG === 0 && nearEdgeEnemies.length > 0 && nearEdgeAllies.length >= nearEdgeEnemies.length + 1) {
            const attackMoveLoc = add(edgeInside, jmz.RandomForwardVector(120));
            bot.Action_AttackMove(attackMoveLoc);
        } else {
            // tuck slightly deeper if contested or alone
            const deeper = jmz.AdjustLocationWithOffsetTowardsFountain(edgeInside, 200);
            const attackMoveLoc = add(deeper, jmz.RandomForwardVector(120));
            bot.Action_AttackMove(attackMoveLoc);
        }
        return;
    }

    // Prefer nearest valid enemy hero within range (cheap local queries first)
    const enemiesAtHub = jmz.GetEnemiesNearLoc(hub, SEARCH_RANGE_DEFAULT);
    if (jmz.IsValidHero(enemiesAtHub[0]) && jmz.IsInRange(bot, enemiesAtHub[0], nSearchRange)) {
        bot.Action_AttackUnit(enemiesAtHub[0], true);
        return;
    }

    const nEnemyHeroes = bot.GetNearbyHeroes(SEARCH_RANGE_DEFAULT, true, BotMode.None);
    if (jmz.IsValidHero(nEnemyHeroes[0]) && jmz.IsInRange(bot, nEnemyHeroes[0], nSearchRange)) {
        bot.Action_AttackUnit(nEnemyHeroes[0], true);
        return;
    }

    // Otherwise, clear strongest creep (avoid full scans)
    const creeps = bot.GetNearbyCreeps(900, true);
    if (creeps && creeps.length > 0 && (!enemiesAtHub || enemiesAtHub.length === 0)) {
        let best: Unit | null = null;
        let bestDmg = -1;
        for (const c of creeps) {
            if (jmz.IsValid(c) && jmz.CanBeAttacked(c)) {
                const dmg = c.GetAttackDamage();
                if (dmg > bestDmg) {
                    best = c;
                    bestDmg = dmg;
                }
            }
        }
        if (best) {
            bot.Action_AttackUnit(best, true);
            return;
        }
    }

    // Move with small jitter; prefer assertive move if ShouldDefend says we're the responder
    if (bld && ShouldDefend(bot, bld, 1600)) {
        const attackMoveLoc = add(hub, jmz.RandomForwardVector(300));
        bot.Action_AttackMove(attackMoveLoc);
        return;
    }

    const dist = ds.distanceToLane[lane] || GetUnitToLocationDistance(bot, hub);
    if ((ds.weAreStronger || ds.nInRangeAlly.length >= ds.nInRangeEnemy.length) && dist < SEARCH_RANGE_DEFAULT) {
        const attackMoveLoc = add(hub, jmz.RandomForwardVector(300));
        bot.Action_AttackMove(attackMoveLoc);
    } else if (dist > SEARCH_RANGE_DEFAULT * 1.7) {
        const moveLoc = add(hub, jmz.RandomForwardVector(300));
        bot.Action_MoveToLocation(moveLoc);
    } else {
        const moveLoc = add(hub, jmz.RandomForwardVector(1000));
        bot.Action_MoveToLocation(moveLoc);
    }
}

export function OnEnd() {
    // no-op
}
