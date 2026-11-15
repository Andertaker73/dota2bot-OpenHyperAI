// typescript/bots/FunLib/responder_policy.ts
//
// Módulo neutro: política de resposta a ameaças na base.
// Extraído de aba_defend.ts para desacoplar aba_push.ts de aba_defend.ts.

import * as jmz from "bots/FunLib/jmz_func";
import { Tower, Unit } from "bots/ts_libs/dota";

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
    const team = GetTeam();
    const ancient = GetAncient(team);

    if (ancient !== null) {
        // Verifica heróis próximos ao Ancient (comportamento original)
        if (jmz.Utils.CountEnemyHeroesNear(ancient.GetLocation(), 2600) >= 1) {
            return BaseThreatLevel.Ancient;
        }

        // OHA FIX: Verifica se há creeps atacando o Ancient
        if (ancient.GetHealth() < ancient.GetMaxHealth()) {
            const enemiesNearAncient = jmz.GetEnemiesNearLoc(ancient.GetLocation(), 800);
            let creepCount = 0;
            for (const unit of enemiesNearAncient) {
                if (unit.IsCreep() || unit.IsAncientCreep() || unit.HasModifier("modifier_dominated")) {
                    creepCount++;
                }
            }
            if (creepCount >= 3) {
                // Log de diagnóstico para vermos no console do Dota 2
                print("[OHA DEBUG] Ancient sob ataque de creeps! Contagem: " + creepCount);
                return BaseThreatLevel.Ancient;
            }
        }
    }

    if (jmz.Utils.CountEnemyHeroesOnHighGround(team) >= 1) {
        return BaseThreatLevel.Ancient;
    }

    // Verifica T3 (mantido do original)
    const t3s = [GetTower(team, Tower.Top3), GetTower(team, Tower.Mid3), GetTower(team, Tower.Bot3)];
    for (const t3 of t3s) {
        if (t3 && jmz.IsValidBuilding(t3)) {
            if (jmz.Utils.CountEnemyHeroesNear(t3.GetLocation(), 1800) >= 1) {
                return BaseThreatLevel.Inner;
            }
        }
    }

    return BaseThreatLevel.None;
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
    if (ancient && IsValidUnit(ancient)) {
        if (jmz.Utils.CountEnemyHeroesNear(ancient.GetLocation(), 2600) >= 1) return true;
    }
    if (jmz.Utils.CountEnemyHeroesOnHighGround(team) >= 1) return true;
    return false;
}

function IsValidUnit(unit: Unit | null | undefined): unit is Unit {
    if (!unit) return false;
    if (!jmz.IsValid(unit)) return false;
    if (!unit.IsAlive()) return false;
    return true;
}