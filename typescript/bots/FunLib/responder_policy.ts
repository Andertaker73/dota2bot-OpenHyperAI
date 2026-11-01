// typescript/bots/FunLib/responder_policy.ts
//
// Módulo neutro: política de resposta a ameaças na base.
// Extraído de aba_defend.ts para desacoplar aba_push.ts de aba_defend.ts.
// NÃO importa aba_push nem aba_defend — deve permanecer folha na árvore de deps.

import * as jmz from "bots/FunLib/jmz_func";
import { Barracks, Tower, Unit } from "bots/ts_libs/dota";

// == State ==
const nTeam = GetTeam();

export enum BaseThreatLevel {
  None    = 0,
  Outer   = 1,
  Inner   = 2,
  Ancient = 3,
}

/** Nível agregado de ameaça à base da equipe. */
export function GetBaseThreatLevel(): BaseThreatLevel {
  const team = nTeam;
  const ancient = GetAncient(team);

  if (ancient !== null) {
      if (jmz.Utils.CountEnemyHeroesNear(ancient.GetLocation(), 2600) >= 1) return 3;
  }
  if (jmz.Utils.CountEnemyHeroesOnHighGround(team) >= 1) return 3;

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

/** Quantos bots devem recuar para defender, dado o nível de ameaça. */
export function GetDesignatedResponders(
  threatLevel: BaseThreatLevel,
  threatBuilding: Unit | null,
): number[] {
    if (threatLevel <= 1) return [];       // T2: ninguém responde

    const building = threatBuilding !== null ? threatBuilding : GetAncient(nTeam);
    if (building === null) return [];

    const loc = building.GetLocation();

    // Nível 3 com Ancient em perigo crítico: todos respondem.
    if (threatLevel >= 3) {
        const anc = GetAncient(nTeam);
        if (anc !== null && anc.GetHealth() / anc.GetMaxHealth() < 0.30) {
            const all: number[] = [];
            for (let i = 1; i <= 5; i++) {
                const m = GetTeamMember(i);
                if (m && m.IsAlive()) all.push(m.GetPlayerID());
            }
            return all;
        }
    }

    // Candidatos: pos 2–5.
    type Candidate = { pid: number; pos: number; dist: number; hasTp: boolean };
    const cands: Candidate[] = [];
    for (let i = 1; i <= 5; i++) {
        const m = GetTeamMember(i);
        if (!m || !m.IsAlive()) continue;
        const pos = jmz.GetPosition(m);
        if (pos === 1) continue; // pos1 só entra em último caso
        const tp = jmz.GetItem2(m, "item_tpscroll");
        cands.push({
            pid: m.GetPlayerID(),
            pos,
            dist: GetUnitToLocationDistance(m, loc),
            hasTp: jmz.CanCastAbility(tp),
        });
    }

    if (cands.length === 0) {
        // Último caso: permite pos1.
        const p1 = GetTeamMember(1);
        return (p1 && p1.IsAlive()) ? [p1.GetPlayerID()] : [];
    }

    // Ordem de prioridade por nível.
    const posOrder = threatLevel >= 3 ? [4, 5, 3, 2] : [3, 2, 4, 5];
    cands.sort((a, b) => {
        const pa = posOrder.indexOf(a.pos);
        const pb = posOrder.indexOf(b.pos);
        if (pa !== pb) return pa - pb;
        if (a.hasTp !== b.hasTp) return a.hasTp ? -1 : 1;
        return a.dist - b.dist;
    });

    // Kill advantage ≥ 3 em T3/rax: ainda só 1.
    // Nível 3 sem HP crítico: 1.
    // Se o mais próximo está a > 5000 e não tem TP, permitir um segundo.
    const result = [cands[0].pid];
    if (cands[0].dist > 5000 && !cands[0].hasTp && cands.length > 1) {
        result.push(cands[1].pid);
    }
    return result;
}

/** True se a localização ameaçada está próxima da base. */
export function IsEnemyThreatNearOurBase(
  _building: Unit | null,
  _radius: number,
): boolean {
    const team = nTeam;
    const ancient = GetAncient(team);
    // OHA MOD: sempre detecta Ancient/HG com 1+ inimigo. Gating por kill
    // advantage acontece em ShouldDefend, não aqui.
    if (ancient && IsValidUnit(ancient)) {
        if (jmz.Utils.CountEnemyHeroesNear(ancient.GetLocation(), 2600) >= 1) return true;
    }
    if (jmz.Utils.CountEnemyHeroesOnHighGround(team) >= 1) return true;
    return false;
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

// == Small helpers ==
function IsValidBuildingTarget(unit: Unit | null): unit is Unit {
    return unit !== null && unit.IsAlive() && unit.IsBuilding();
}
