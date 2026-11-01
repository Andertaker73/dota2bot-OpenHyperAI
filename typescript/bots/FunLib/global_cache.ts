/**
 * Global Performance Cache System
 * Provides shared caching across all bot modules to reduce redundant API calls
 */

import { Barracks, Lane, Team, Tower, Unit, UnitType, Vector } from "bots/ts_libs/dota";
import * as jmz from "bots/FunLib/jmz_func";

export interface GlobalGameState {
    lastUpdate: number;
    currentTime: number;
    gameMode: number;
    team: Team;
    enemyTeam: Team;
    ourAncient: Unit | null;
    enemyAncient: Unit | null;
    aliveAllyCount: number;
    aliveEnemyCount: number;
    aliveAllyCoreCount: number;
    aliveEnemyCoreCount: number;
    teamNetworth: number;
    enemyNetworth: number;
    averageLevel: number;
    hasAegis: boolean;
    isEarlyGame: boolean;
    isMidGame: boolean;
    isLateGame: boolean;
    isLaningPhase: boolean;
    teamFountain: Vector;
    teamFountainTpPoint: Vector;
}

export interface GlobalUnitState {
    lastUpdate: number;
    enemyBuildings: Unit[];
    alliedHeroes: Unit[];
    enemyHeroes: Unit[];
    alliedCreeps: Unit[];
    enemyCreeps: Unit[];
    teamMembers: Unit[];
    enemies: Unit[];
}

export interface GlobalLocationState {
    lastUpdate: number;
    laneFronts: Record<Lane, Vector>;
    enemyLaneFronts: Record<Lane, Vector>;
    teamFountain: Vector;
    enemyFountain: Vector;
    roshanLocation: Vector;
    tormentorLocation: Vector;
    tormentorWaitingLocation: Vector;
    highGroundEdgeWaitPoints: Record<Lane, Vector>;
}

interface GlobalCacheEntry {
    lastUpdate: number;
    data: any;
}

// Global cache storage
const globalCache: Record<string, GlobalCacheEntry> = {};
const GLOBAL_CACHE_TTL = 0.5; // 500ms TTL for global cache

// Specific cache objects
let globalGameStateCache: GlobalGameState | null = null;
let globalUnitStateCache: GlobalUnitState | null = null;
let globalLocationStateCache: GlobalLocationState | null = null;

/**
 * Get or update global game state cache
 */
export function getGlobalGameState(): GlobalGameState {
    const now = DotaTime();
    if (globalGameStateCache && now - globalGameStateCache.lastUpdate < GLOBAL_CACHE_TTL) {
        return globalGameStateCache;
    }

    const team = GetTeam();
    const enemyTeam = GetOpposingTeam();
    const currentTime = DotaTime();
    const gameMode = GetGameMode();

    // Adjust time for turbo mode
    const adjustedTime = gameMode === 23 ? currentTime * 2 : currentTime;

    const [teamNetworth, enemyNetworth] = jmz.GetInventoryNetworth();
    globalGameStateCache = {
        lastUpdate: now,
        currentTime: adjustedTime,
        gameMode,
        team,
        enemyTeam,
        ourAncient: GetAncient(team),
        enemyAncient: GetAncient(enemyTeam),
        aliveAllyCount: jmz.GetNumOfAliveHeroes(false),
        aliveEnemyCount: jmz.GetNumOfAliveHeroes(true),
        aliveAllyCoreCount: jmz.GetAliveCoreCount(false),
        aliveEnemyCoreCount: jmz.GetAliveCoreCount(true),
        teamNetworth: teamNetworth,
        enemyNetworth: enemyNetworth,
        averageLevel: jmz.GetAverageLevel(false),
        hasAegis: jmz.DoesTeamHaveAegis(),
        isEarlyGame: jmz.IsEarlyGame(),
        isMidGame: jmz.IsMidGame(),
        isLateGame: jmz.IsLateGame(),
        isLaningPhase: jmz.IsInLaningPhase(),
        teamFountain: jmz.GetTeamFountain(),
        teamFountainTpPoint: jmz.Utils.GetTeamFountainTpPoint(),
    };

    return globalGameStateCache;
}

/**
 * Get or update global unit state cache
 */
export function getGlobalUnitState(): GlobalUnitState {
    const now = DotaTime();
    if (globalUnitStateCache && now - globalUnitStateCache.lastUpdate < GLOBAL_CACHE_TTL) {
        return globalUnitStateCache;
    }

    const teamMembers: Unit[] = [];
    for (let i = 1; i <= GetTeamPlayers(GetTeam()).length; i++) {
        const member = GetTeamMember(i);
        if (member !== null) {
            teamMembers.push(member);
        }
    }

    globalUnitStateCache = {
        lastUpdate: now,
        enemyBuildings: GetUnitList(UnitType.EnemyBuildings),
        alliedHeroes: GetUnitList(UnitType.AlliedHeroes),
        enemyHeroes: GetUnitList(UnitType.Enemies).filter(u => jmz.IsValidHero(u)),
        alliedCreeps: GetUnitList(UnitType.AlliedCreeps),
        enemyCreeps: GetUnitList(UnitType.Enemies).filter(u => u.IsCreep() || u.IsAncientCreep()),
        teamMembers,
        enemies: GetUnitList(UnitType.Enemies),
    };

    return globalUnitStateCache;
}

// Helper for high ground edge wait point (used in location state)
export function GetHighGroundEdgeWaitPoint(team: Team, lane: Lane): Vector {
    const t3 = lane === Lane.Top ? GetTower(team, Tower.Top3) : lane === Lane.Mid ? GetTower(team, Tower.Mid3) : GetTower(team, Tower.Bot3);
    const raxM = lane === Lane.Top ? GetBarracks(team, Barracks.TopMelee) : lane === Lane.Mid ? GetBarracks(team, Barracks.MidMelee) : GetBarracks(team, Barracks.BotMelee);
    const raxR = lane === Lane.Top ? GetBarracks(team, Barracks.TopRanged) : lane === Lane.Mid ? GetBarracks(team, Barracks.MidRanged) : GetBarracks(team, Barracks.BotRanged);
    const anc = GetAncient(team);

    const anchorBuilding = (jmz.IsValidBuilding(t3) ? t3 : jmz.IsValidBuilding(raxM) ? raxM : jmz.IsValidBuilding(raxR) ? raxR : undefined) as Unit | undefined;

    if (anchorBuilding && jmz.IsValidBuilding(anc)) {
        const t = anchorBuilding.GetLocation();
        const a = (anc as Unit).GetLocation();
        const dir = Vector(a.x - t.x, a.y - t.y, 0);
        const len = math.max(1, math.sqrt(dir.x * dir.x + dir.y * dir.y));
        return Vector(t.x + (dir.x / len) * 250, t.y + (dir.y / len) * 250, 0);
    }

    return jmz.AdjustLocationWithOffsetTowardsFountain(GetLaneFrontLocation(team, lane, 0), 600);
}

/**
 * Get or update global location state cache
 */
export function getGlobalLocationState(): GlobalLocationState {
    const now = DotaTime();
    if (globalLocationStateCache && now - globalLocationStateCache.lastUpdate < GLOBAL_CACHE_TTL) {
        return globalLocationStateCache;
    }

    const team = GetTeam();
    const enemyTeam = GetOpposingTeam();

    globalLocationStateCache = {
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
        teamFountain: jmz.GetTeamFountain(),
        enemyFountain: jmz.GetTeamFountain(), // Note: GetEnemyFountain doesn't exist
        roshanLocation: jmz.GetCurrentRoshanLocation(),
        tormentorLocation: jmz.GetTormentorLocation(team),
        tormentorWaitingLocation: jmz.GetTormentorWaitingLocation(team),
        highGroundEdgeWaitPoints: {
            [Lane.Top]: GetHighGroundEdgeWaitPoint(team, Lane.Top),
            [Lane.Mid]: GetHighGroundEdgeWaitPoint(team, Lane.Mid),
            [Lane.Bot]: GetHighGroundEdgeWaitPoint(team, Lane.Bot),
        },
    };

    return globalLocationStateCache;
}

/**
 * Generic cache function for arbitrary data
 */
export function getCachedData<T>(key: string, ttl: number, fetchFn: () => T): T {
    const now = DotaTime();
    const cached = globalCache[key];

    if (cached && now - cached.lastUpdate < ttl) {
        return cached.data as T;
    }

    const data = fetchFn();
    globalCache[key] = {
        lastUpdate: now,
        data: data,
    };

    return data;
}

/**
 * Clear old cache entries to prevent memory leaks
 */
export function cleanupGlobalCache(): void {
    const now = DotaTime();
    const maxAge = 10; // 10 seconds max age

    Object.keys(globalCache).forEach(key => {
        if (now - globalCache[key].lastUpdate > maxAge) {
            delete globalCache[key];
        }
    });
}

/**
 * Clear all caches (useful for testing or when game state changes significantly)
 */
export function clearAllCaches(): void {
    Object.keys(globalCache).forEach(key => {
        delete globalCache[key];
    });
    globalGameStateCache = null;
    globalUnitStateCache = null;
    globalLocationStateCache = null;
}

/**
 * Get cached allies near location
 */
export function getCachedAlliesNearLoc(location: Vector, radius: number): Unit[] {
    const key = `allies_${Math.floor(location.x)}_${Math.floor(location.y)}_${radius}_${Math.floor(DotaTime() * 2)}`;
    return getCachedData(key, 0.5, () => {
        return jmz.GetAlliesNearLoc(location, radius);
    });
}

/**
 * Get cached enemies near location
 */
export function getCachedEnemiesNearLoc(location: Vector, radius: number): Unit[] {
    const key = `enemies_${Math.floor(location.x)}_${Math.floor(location.y)}_${radius}_${Math.floor(DotaTime() * 2)}`;
    return getCachedData(key, 0.5, () => {
        return jmz.GetEnemiesNearLoc(location, radius);
    });
}

// Auto-cleanup every 30 seconds
let lastCleanupTime = 0;
export function autoCleanupCache(): void {
    const now = DotaTime();
    if (now - lastCleanupTime > 30) {
        cleanupGlobalCache();
        lastCleanupTime = now;
    }
}