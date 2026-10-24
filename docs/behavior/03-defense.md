# Defense Behavior — Modelo, Política e Implementação

> **Público-alvo**: qualquer pessoa que edite `aba_defend.ts`, `aba_push.ts`,
> `mode_team_roam_generic.lua` ou `mode_defend_*.lua`.
>
> **Escopo**: define *quando* um bot deve defender, *quantos* devem responder,
> *quais* devem responder e *o que os outros devem fazer* durante o cerco.
>
> **Fonte de verdade**: quando o código e este documento divergem, o documento
> está certo — o código tem bug.

---

## 0. Sumário executivo

O comportamento defensivo é regido por **3 perguntas em ordem**:

1. **Detecção**: há ameaça real à base? (modelo de ameaça, §3)
2. **Seleção**: quantos e quais bots respondem? (política de respondedores, §4)
3. **Trade**: o trade-off vale a pena? (regras de trade, §5)

Os problemas históricos vêm de **pular a etapa 2** — o código atual detecta a
ameaça (etapa 1) e imediatamente assume "todos defendem", sem designar um
número limitado de respondedores.

---

## 1. Histórico e motivação

| Sintoma | Causa raiz | Correção | Status |
|---|---|---|---|
| Bots abandonam push com 4 kills para defender 1 split-pusher | `GetBaseThreatLevel` dispara com 1 inimigo + `GetPushDesire` retorna `ExtraLow` global | Modelo de respondedores (§4) | **Pendente** |
| Todos os 5 teleportam para defender 1-2 heróis | `ShouldDefend` retorna `true` para todos em estrutura interna | Política de respondedores (§4) | **Pendente** |
| Ancient cai livre enquanto bots estão em outra lane | Reversão anterior aplicou kill-advantage gating na detecção (§3) | Detecção sempre sensível (§3.1) | **Corrigido** |
| Bots ficam parados após TP de defesa | `CanNotUseAction` bloqueava `Think()` por fila residual | `MustReactNow` + grace period pós-TP | **Corrigido** |

---
## 2. Arquitetura atual

### 2.1 Arquivos envolvidos

| Arquivo | Papel |
|---|---|
| `bots/FunLib/aba_defend.ts` (compila para `.lua`) | Engine de defesa. `GetDefendDesire`, `DefendThink`, `ShouldDefend`, `GetBaseThreatLevel`, `IsEnemyThreatNearOurBase`. |
| `bots/mode_team_roam_generic.lua` | Detecção de invasão + "守家特判" (守家 = defesa da base). Dispara resposta em massa via desire `0.95–1.0`. |
| `bots/FunLib/aba_push.ts` (compila para `.lua`) | Desejo de push. Consulta `IsEnemyThreatNearOurBase()` para cancelar push. **Acoplamento crítico**. |
| `bots/mode_defend_tower_*.lua` | Modos ativos quando `DefendDesire > PushDesire`. |
| `bots/FunLib/jmz_func.lua` | `CanNotUseAction`, `HasQueuedAction`, `MustReactNow` — gates que controlam se o `Think()` executa. |

### 2.2 Fluxo de decisão por frame

O motor do Dota 2 avalia o desejo (`GetDesire`) de todos os modos a cada frame. O modo que retornar o maior valor assume o controle e executa seu `Think()`.

* **mode_laning.GetDesire()** → 0.44 (early game) / 0.9 (se houver last hit)
* **mode_farm.GetDesire()** → 0.35 a 0.5 (farm cap)
* **mode_push.GetDesire()** → 0.92 a 0.99 (normal)
  * *Se* `IsEnemyThreatNearOurBase()` for verdadeiro → cai para `ExtraLow` (0.02).
* **mode_team_roam.GetDesire()** → 0.0 a 0.65 (roam padrão)
  * *Se* `nEnemiesNearBase >= 2` → sobe para 0.95.
* **mode_defend.GetDesire()** → 0.0 a 1.0 (via `GetDefendDesireHelper`)
  * *Se* `baseThreatActiveNow` → floor sobe para 0.90/0.97.
* **mode_retreat.GetDesire()** → bloqueado por HP baixo/dano.

Após eleger o modo vencedor, a engine chama o `Think()` do modo. No entanto, o `Think()` passará pelos seguintes gates de ação:
1. `CanNotUseAction(bot)`
2. `IsBotThinkingMeaningfulAction`
3. *(Ambos são bypassados se `MustReactNow` for verdadeiro)*

**Ponto crítico**: `GetPushDesire` retorna `ExtraLow` para **todos** os bots quando `IsEnemyThreatNearOurBase() == true`. Isso é o que força o time inteiro a abandonar o push. Precisa ser substituído por "reduz apenas para o bot designado" (§4.4).

### 2.3 Funções-chave

**Defesa (`aba_defend.ts`):**
* `GetBaseThreatLevel(): number` — 0..3 (detecção pura, §3.1)
* `IsEnemyThreatNearOurBase(): boolean` — wrapper binário de §3.1
* `ShouldDefend(bot, hBuilding, radius): boolean` — por-bot; consulta §4 (atual: permissivo)
* `GetDefendDesire(bot, lane): number` — desire; consulta §4 (atual: floor global)
* `DefendThink(bot, lane): void` — ações (movimento, ataque)
* `GetFurthestBuildingOnLane(lane): [Unit, mult, tier]`
* `GetHumanLanePressureLane(): Lane | null`

**Push (`aba_push.ts`):**
* `GetPushDesire(bot, lane): number` — consulta §5 (atual: global)
* `GetPushDesireHelper(bot, lane): number`

**Roam (`mode_team_roam_generic.lua`):**
* `GetDesireHelper()` — §3.2 (守家特判)

**Ações (`jmz_func.lua`):**
* `CanNotUseAction(bot): boolean`
* `HasQueuedAction(bot): boolean`
* `MustReactNow(bot): boolean` — §7.1 (bypass gate)

---

## 3. Modelo de ameaça

### 3.1 Níveis de ameaça (detecção)

**Detecção é global e sensível**. Os níveis são calculados por `GetBaseThreatLevel()` e não dependem de kill advantage, HP do bot ou número de aliados disponíveis. Essas variáveis entram na **política de resposta** (§4), não na detecção.

| Nível | Condição de disparo | Local no código |
|---|---|---|
| **0** — sem ameaça | Nenhuma das condições abaixo | — |
| **1** — pressão externa | ≥ 1 herói inimigo (visto ou last-seen) em 1600 de qualquer T2 aliado | `GetBaseThreatLevel()` |
| **2** — base interna | ≥ 1 herói inimigo em 1800 de qualquer T3 ou rax aliado | `GetBaseThreatLevel()` |
| **3** — Ancient / HG | ≥ 1 herói inimigo em 2600 do Ancient OU ≥ 1 herói no nosso high ground | `GetBaseThreatLevel()` |

> **Regra inviolável**: um único herói inimigo no Ancient **sempre** dispara o nível 3, independentemente de kill advantage. A limitação de quantos bots vão responder vem depois (§4). Isso evita a regressão em que o Ancient caiu livre porque o time tinha 4 kills de vantagem e "ninguém viu" a ameaça.

### 3.2 Sticky threat window (histerese)

Para evitar que os bots fiquem oscilando de modo (ex: `Defend → Push → Defend` em questão de segundos por causa de fog of war), a ameaça fica "ativa" por um período mínimo:

* **`BASE_THREAT_HOLD`**: 8 segundos (definido em `aba_defend.ts`).
* **Extensão**: sobe para 12 segundos se houver aliados usando TP para a lane ameaçada.
* **Renovação**: o timer reinicia a cada frame em que a ameaça persiste.

### 3.3 Lane ameaçada

A função `GetThreatenedLane()` escolhe qual rota é a mais crítica para a defesa. Ela pontua cada lane da seguinte forma:

* **+ 10 pontos**: para cada herói inimigo recente num raio de 1800 do ponto âncora da lane.
* **+ 999 pontos**: se houver ameaça direta no High Ground, Ancient ou Rax daquela lane.
* **+ Equivalência de creeps**: pressão de creeps (com teto de 0.9).
* **Bônus de 20%**: para a lane do meio (Mid), *se não houver* ameaça de High Ground nas outras rotas.

A lane vencedora fica "sticky" (travada) por 1.8 segundos (`_threatLaneSticky`) para evitar que o bot mude de destino no meio do caminho.

---

## 4. Política de respondedores ⚠️ **O fix principal**

### 4.1 Princípio

> **Detecção é global. Resposta é limitada.**
>
> Todo bot sabe que há ameaça. Apenas alguns respondem. O resto continua
> sua tarefa (push, farm, jungle) até que a situação piore.

### 4.2 Tabela canônica de respondedores

| Nível | Kill advantage | Quem responde | Quem continua |
|---|---|---|---|
| **0** | — | ninguém | todos |
| **1** (T2) | qualquer | ninguém (push continua) | todos |
| **2** (T3/rax) | < 3 | **1 bot**: o mais próximo de (pos 2–5) ao prédio ameaçado com TP disponível | 4 restantes |
| **2** (T3/rax) | ≥ 3 | **1 bot**: o mesmo critério | 4 restantes |
| **3** (Ancient/HG) | qualquer | **≥ 1 bot**: o mais próximo de (pos 2–5) com TP | 4 restantes |
| **3** (Ancient < 30% HP) | qualquer | **todos os disponíveis** (exceção) | ninguém |

### 4.3 Critério de seleção (quem é "o mais próximo")

Para escolher o respondedor, aplique em ordem:

1. **Candidatos elegíveis**: pos 2–5 (pos 1 fica no push por padrão, exceto se for o **único** com TP ou o único vivo além do designado).
2. **Prioridade de posição** (para desempate):
   - Nível 2 (T3/rax): pos 3 > pos 2 > pos 4 > pos 5 (offlane primeiro, suportes ficam no team fight).
   - Nível 3 (Ancient): pos 4 > pos 5 > pos 3 > pos 2 (suportes primeiro, cores continuam push se a base não estiver caindo).
3. **Prioridade de distância**: mais próximo do prédio ameaçado.
4. **Prioridade de TP**: se dois candidatos estão a distâncias similares, o que tem TP disponível vence.

Se **nenhum** candidato tem TP disponível e o prédio está a > 4000 de todos, o respondedor é o mais próximo **mesmo sem TP** (correr é melhor que não vir).

### 4.4 Implementação da política
A política requer **3 mudanças coordenadas** descritas abaixo.

/**
 * Retorna o conjunto de PlayerIDs que devem responder a esta ameaça.
 * Fonte de verdade para ShouldDefend() e para o gate de push.
 *
 * IMPORTANTE: esta função deve ser barata — é chamada por bot a cada tick
 * via GetDefendDesire. Cachear por 0.3s (igual a DEFEND_CACHE_TTL).
 */
export function GetDesignatedResponders(
    threatLevel: number,
    threatBuilding: Unit | null,
): number[] {
    if (threatLevel <= 1) return [];       // T2: ninguém responde
    if (threatBuilding === null) return []; // sem alvo, sem resposta

    const aliveAllies = jmz.GetNumOfAliveHeroes(false);
    const aliveEnemies = jmz.GetNumOfAliveHeroes(true);
    const killAdv = aliveAllies - aliveEnemies;
    const loc = threatBuilding.GetLocation();

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

#### 4.4.2 `aba_defend.ts` — `ShouldDefend()` consulta a lista

**Regra**: retorna `true` se e somente se o `PlayerID` do bot estiver em `GetDesignatedResponders(level, hBuilding)`. Remover a lógica antiga de "base interna → todos podem vir".

#### 4.4.3 `aba_push.ts` — `GetPushDesire()` consulta a lista

**Regra**: `IsEnemyThreatNearOurBase()` sozinho **não** deve cancelar push. A redução de push deve ser por-bot. Se o bot estiver na lista de respondedores, ele para o push e volta. Se **não** estiver, ele continua atacando a torre inimiga.

Isso é o que permite 4 bots continuarem no T3 enquanto 1 volta pro Ancient.

### 4.5 O que os não-respondedores fazem

Os bots que **não** estão na lista de respondedores:

* **Push (nível 2)**: continuam no modo `Push`. `GetPushDesire` **não** é rebaixado.
* **Farm (nível 1)**: continuam farmando. `GetPushDesire` já não era rebaixado nesse nível.
* **Laning (qualquer nível)**: continuam no lane — a prioridade é não perder XP/ouro em early game.
* **Ancient crítico (nível 3 + HP < 30%)**: todos respondem, não há "não respondedores".

---

## 5. Regras de trade-off

### 5.1 Quando vale trocar push por defesa

| Situação | Vale trocar? | Racional |
|---|---|---|
| Push T3 inimigo + Ancient atacado por 1 | **NÃO** (só 1 responde) | T3 → rax → Ancient é progresso irreversível; 1 bot salva a base. |
| Push T3 inimigo + Ancient atacado por 4+ | **SIM** (todos respondem) | 4+ no Ancient é perda iminente. |
| Push T3 + rax atacado por 1-2 | **NÃO** (só 1 responde) | Rax tem backdoor protection, sobrevive. |
| Push T2 inimigo + Ancient atacado por 1 | **SIM** (trade justo) | T2 não é progresso decisivo, Ancient é. |
| Farm jungle + T3 atacado por 3 | **SIM** (responder + 2 support) | Farm é substituível, T3 não. |

### 5.2 Regra do "finishing strike" (push de rax/Ancient)

Se o time já derrubou T3 inimigo e tem rax exposto, `finishingStrike = true` em `aba_push.ts`. Nesse estado:

* **Nenhum** bot abandona o push para defender T2/T3 por 1-2 inimigos.
* Apenas Ancient com HP < 30% reverte a decisão.
* Justificativa: rax destruído é vantagem estrutural permanente. Trocar isso por defender uma torre que tem backdoor protection é trade ruim em qualquer bracket.

### 5.3 Regra do "power play" (vantagem numérica)

Se o time tem vantagem numérica ≥ 3 (3+ kills de vantagem), reduzir a sensibilidade da defesa a ameaças de nível 2 (T3/rax). Detecção continua sensível (§3.1), mas **apenas 1 respondedor** mesmo para T3. Nível 3 (Ancient) **nunca** relaxa: sempre ≥ 1 bot responde.

---

## 6. Regras anti-pânico

Lista de comportamentos que **nunca** devem ocorrer. Se algum acontecer, é bug e o teste deve capturar:

1. ❌ **Nunca 5 bots abandonam push para defender 1-2 heróis** (exceto Ancient < 30% HP).
2. ❌ **Nunca nenhum bot responde ao Ancient** (nível 3 sempre tem ≥ 1 respondedor).
3. ❌ **Nunca o mesmo bot é designado como respondedor em 2 lanes simultâneas** (seleção por prédio, não por lane).
4. ❌ **Nunca o modo ativo troca 3 vezes em 2 segundos** (histerese `BASE_THREAT_HOLD` e `_threatLaneSticky` cobrem isso).
5. ❌ **Nunca todos os respondedores estão a > 5000 do prédio ameaçado e sem TP** (seleção escolhe pelo menos 1 com TP).

---

## 7. Interação com gates de ação

### 7.1 `MustReactNow` e defesa

`MustReactNow` (em `jmz_func.lua`) bypassa `CanNotUseAction` e `IsBotThinkingMeaningfulAction` quando:

* O bot tomou dano de herói nos últimos 1.5s;
* HP < 30% com inimigo em 900 de distância;
* Está em Macropyre / Viper Poison / Venomous Gale;
* Tem `_tpGraceUntil` ativo (500ms após TP).

**Durante a defesa**, isso garante que o bot designado responde imediatamente ao chegar no prédio, sem pausa de "estou processando ação".

### 7.2 Grace period pós-TP

Após `modifier_teleporting` desaparecer, a fila de ações ainda contém a ordem de TP por alguns frames. `HasQueuedAction` retorna `false` durante 500ms para permitir que `DefendThink` emita ações imediatamente.

**Sem essa janela**, o bot chega no prédio e fica parado 1-2s.

---

## 8. Knobs de tuning

Todos os limiares que afetam a defesa, com sua localização e efeito:

| Constante | Local | Valor atual | Efeito |
|---|---|---|---|
| `BASE_THREAT_RADIUS` | `aba_defend.ts` §Tunables | 2600 | Raio de detecção de ameaça ao Ancient |
| `BASE_THREAT_HOLD` | `aba_defend.ts` §Tunables | 8.0s | Janela sticky de ameaça |
| `_threatLaneSticky.until` | `aba_defend.ts` `GetThreatenedLane` | +1.8s | Anti-oscilação de lane |
| `DEFEND_CACHE_TTL` | `aba_defend.ts` | 0.5s | TTL de cache de estado |
| `MAX_DESIRE_CAP` | `aba_defend.ts` | 0.98 | Cap de desire sem panic |
| `PING_DELTA` | `aba_defend.ts` | 5.0s | Janela de ping humano |
| `CACHE_LASTSEEN_WINDOW` | `aba_defend.ts` | 5.0s | Janela de last-seen |
| `requiredEnemies` (T3/rax, HG, Ancient) | `GetBaseThreatLevel` | 1 | **Nunca aumentar** — quebra Ancient |
| `panicFloor` (Ancient) | `GetDefendDesireHelper` | 0.97 | Piso de desire em Ancient |
| `panicFloor` (T3/rax) | `GetDefendDesireHelper` | 0.90 | Piso de desire em T3 |
| `isAncientOrT4` threshold | `ShouldDefend` | 2000 | Distância para "Ancient/T4" |
| `nEnemiesNearBase` (守家) | `mode_team_roam_generic.lua` | 2 | Detecção de invasão |
| `nEnemiesDeep` (守家) | `mode_team_roam_generic.lua` | 3 | Invasão profunda (base interna) |
| `helpAllyCooldown` (sucesso) | `mode_team_roam_generic.lua` | 15s | Cooldown pós-sucesso |
| `helpAllyCooldown` (timeout) | `mode_team_roam_generic.lua` | 30s | Cooldown pós-timeout |
| `_tpGraceUntil` janela | `jmz_func.lua` `HasQueuedAction` | 0.5s | Grace pós-TP |

### 8.1 Como ajustar com segurança

**Nunca** mude `requiredEnemies` (a constante `>= 1` em `GetBaseThreatLevel`) sem revisar §3.1 e o histórico. Essa constante já causou uma regressão grave (Ancient caiu livre).

Para ajustar "quantos respondem":
- **Não** mexa em `panicFloor` — o piso é sobre "com que força o bot designado defende", não sobre "quantos defendem".
- **Mude** `GetDesignatedResponders` (§4.4.1) — é a função correta.
- Se `GetDesignatedResponders` retornar mais que 1 para nível 2, o bug está lá.

---

## 9. Regressões conhecidas

### 9.1 Ancient cai livre com kill advantage ≥ 3

- **Causa histórica**: `GetBaseThreatLevel` recebeu gating por kill advantage (retornava `0` com ≥ 3 kills de vantagem mesmo com 1 inimigo no Ancient).
- **Correção**: detecção sempre sensível (§3.1). Gating por kill advantage migrou para `ShouldDefend` e `GetDesignatedResponders`.
- **Teste de regressão**: §10, cenário B.

### 9.2 Todos os bots teleportam para defender 1-2 heróis

- **Causa histórica**: `ShouldDefend` retornava `true` para todos em estruturas internas (≤ 3500 do Ancient), `GetPushDesire` rebaixava todos para `ExtraLow`.
- **Correção**: `GetDesignatedResponders` (§4.4.1) retorna lista limitada; `ShouldDefend` consulta a lista; `GetPushDesire` consulta a lista.
- **Status**: **pendente de implementação**.
- **Teste de regressão**: §10, cenário C.

### 9.3 Bots ficam parados após TP de defesa

- **Causa histórica**: `CanNotUseAction` bloqueava `Think()` por fila residual de TP.
- **Correção**: `MustReactNow` + grace period `_tpGraceUntil` (0.5s) em `HasQueuedAction`.
- **Teste de regressão**: §10, cenário D.

### 9.4 Bots abandonam push de rax para defender T2

- **Causa histórica**: bloco `NonTier1Towers` em `aba_push.ts` retornava `ExtraLow` sempre que T2+ era tocado.
- **Correção**: gate `enemyT3OrRaxDown` desabilita o bloco durante finishing strike.
- **Teste de regressão**: §10, cenário E.

---

## 10. Protocolo de teste

Cenários canônicos para validar qualquer mudança em defesa. Cada um corresponde a uma regressão documentada em §9.

### 10.A — Nível 1 (T2) não dispara defesa em massa

**Setup**: late game, time atacando T3 inimigo. **1** inimigo toca nosso T2 em outra lane.
**Esperado**: nenhum bot abandona push. Push continua.

### 10.B — Ancient salvo (crítico)

**Setup**: 4 inimigos mortos, push no T3 deles. **1** inimigo no nosso Ancient.
**Esperado**:
- **≥ 1 bot** retorna e defende o Ancient.
- Ancient **não** cai livre.

### 10.C — Trade inteligente (4 bots continuam)

**Setup**: mesmo do B.
**Esperado**:
- **1 bot** retorna (o designado).
- **3-4 bots** continuam no push do T3.
- Se todos os 5 voltarem → regressão de §9.2.
- Se nenhum voltar → regressão de §9.1.

### 10.D — Pós-TP sem pausa

**Setup**: bot TP para defender T3.
**Esperado**: ao chegar no prédio, o bot **anda ou ataca** na mesma tick (ou na seguinte), sem pausa de 1-2s.

### 10.E — Finishing strike mantém push

**Setup**: T3 inimigo destruído, rax exposto, push em andamento. 1-2 inimigos tentam T2 nosso.
**Esperado**: nenhum bot abandona o push da rax.

### 10.F — Ancient crítico (todos respondem)

**Setup**: Ancient nosso com HP < 30%, 4+ inimigos atacando.
**Esperado**: todos os 5 bots respondem (exceção da tabela §4.2).

---

## 11. Changelog

| Data | Autor | Mudança |
|---|---|---|
| 2026-10-18 | Andertaker73 | Criação do documento. Modelo de ameaça §3, política de respondedores §4. |

---

## Apêndice A — Perguntas frequentes

**"Se eu quiser que 2 bots defendam T3, o que mudo?"**
→ `GetDesignatedResponders()` em `aba_defend.ts`. Aumente o `result` para incluir `cands[1]` sempre que nível 2. **Não** mexa em `panicFloor` nem em `requiredEnemies`.

**"Por que nível 1 (T2) não tem respondedor?"**
→ T2 tem backdoor protection e o trade "abandonar push por T2" é ruim. Se você quer defesa em T2, precisa de uma nova regra explícita aqui em §5.1.

**"Como testo uma mudança sem jogar 40 minutos?"**
→ Use `-test` no lobby. Os bots se enfrentam, você observa. Para acelerar, `dota_bot_populate` e `dota_bot_debug_orders` no console.

**"O que faço se o Ancient ainda cair livre?"**
→ Rode `grep -n "requiredEnemies" aba_defend.ts` e confirme que não há gating por kill advantage em `GetBaseThreatLevel` (§3.1). Se houver, é a regressão §9.1.