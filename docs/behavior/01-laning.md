# Laning Behavior — Prioridades, Last Hit e Sobrevivência

> **Público-alvo**: qualquer pessoa que edite `mode_laning_generic.lua` ou `jmz_func.lua`.
>
> **Escopo**: define a ordem de prioridade de ações na rota (deny, last hit, harass) e como o bot deve reagir a ameaças (evitar first blood e freezes).
>
> **Fonte de verdade**: quando o código e este documento divergem, o documento está certo — o código tem bug.

---

## 0. Sumário executivo

O comportamento na rota é regido por uma **ordem de prioridade estrita**. O bot avalia essas ações a cada frame, e a primeira que for válida assume o controle. Se nenhuma for válida, o bot se posiciona.

1. **Deny** (negar creep aliado) — se houver creep aliado em kill range.
2. **Last Hit** (matar creep inimigo) — se houver creep inimigo no dano exato.
3. **Harass** (atacar herói inimigo) — se houver vantagem tática (HP, números, humano).
4. **Farm Neutro** — se estiver ocioso perto de um acampamento.
5. **Posicionamento** — andar para frente/trás da wave.

**Problemas históricos**:
* **Freeze (First Blood)**: Os bots ficavam travados (sem emitir ações) por causa de filas residuais de comandos antigos (ex: andar para um local que sumiu). A correção é o bypass via `MustReactNow` (ver `05-action-gates.md`).
* **Last Hit ruim**: O cálculo de dano não considerava projéteis ou a força exata do ataque, resultando em perda de ouro em lanes compartilhadas e solo.

---

## 1. Mecânica de Last Hit e Deny

Para que o bot não perca ouro, o cálculo de dano (`GetBestLastHitCreep` e `GetBestDenyCreep`) precisa ser conservador e preciso.

### 1.1 Cálculo de Dano do Bot
O dano base não é suficiente. O bot deve calcular:
* `bot:GetAttackDamage()` (dano base + itens).
* Bônus do **Quelling Blade** (`item_quelling_blade`): +8 para melee, +4 para ranged.
* O dano **não** é instantâneo. O tempo de wind-up (`bot:GetAttackPoint()`) precisa ser considerado. Se o creep vai morrer para o próximo ataque do aliado em 0.1s, o bot não deve tentar atacar.

### 1.2 Condição de Last Hit
* **Regra**: O bot só deve emitir `Action_AttackUnit(creep, true)` se o HP atual do creep for menor ou igual ao dano do ataque do bot.
* **Antecipação**: O bot deve começar a andar em direção ao creep se o HP dele estiver entre 1x e 1.5x o dano do bot, para estar no alcance quando o HP chegar no ponto de kill.
* **Lane Compartilhada**: Se houver um humano aliado na mesma rota (mesmo `botAssignedLane`), o bot **cede** o last hit para o humano (já implementado no código, mas deve ser mantido).

### 1.3 Condição de Deny
* **Regra**: O bot só ataca o próprio creep se o HP for menor que o dano do bot.
* **Prioridade Absoluta**: O deny sempre vence o last hit inimigo se ambos estiverem disponíveis no mesmo frame.

---

## 2. Harass e Agressividade

O bot não deve ser passivo, mas também não deve correr atrás de heróis ignorando a wave.

* **Alvo Válido**: O inimigo deve estar no alcance de ataque (`botAttackRange`).
* **Vantagem Numérica**: O bot só deve trocar hit se a quantidade de aliados na área (raio 700) for maior ou igual à de inimigos.
* **Bônus Humano**: O bot deve priorizar jogadores humanos no alvo de harass (`+1.5` no score) para evitar que humanos farmem livres.
* **Limite de Perseguição**: O bot só se move em direção ao inimigo se estiver a `botAttackRange + 200` de distância. Perseguições longas resultam em morte e perda de XP.

## 3. Prevenção de Freeze (Ficar Parado)

O bot nunca deve ficar com a animação parada (`idle`) por mais de 1.5 segundos durante a laning phase sem tomar uma ação.

### 3.1 Causas de Freeze
* **Ação Residual**: O bot tentou andar para cima de um creep que morreu. A ação `Action_MoveToUnit` ficou presa na fila, e `CanNotUseAction` bloqueou novos comandos.
* **Casting**: O bot está tentando usar uma habilidade, mas a condição não é mais válida.

### 3.2 Regra de Recuperação (`MustReactNow`)
O `MustReactNow` (em `jmz_func.lua`) atua como uma válvula de escape. Se o bot tomar dano de herói, estiver com HP baixo ou preso (sem se mover), a fila residual é ignorada e o `Think()` do modo Laning executa normalmente, emitindo um novo comando (seja de fuga, ataque ou deny).

---

## 4. Knobs de Tuning

| Constante | Local | Valor atual | Efeito |
|---|---|---|---|
| `botAttackRange` | Dinâmico | — | Alcance para dar last hit/harass |
| `quelling_blade_bonus` | `GetBestLastHitCreep` | +8 / +4 | Dano extra do Quelling Blade |
| `harass_pursuit_limit` | `GetBestHarassTarget` | +200 | Distância máxima para sair da wave e atacar |

---

## 5. Protocolo de Teste

### 5.A — Last Hit Solo
**Setup**: Bot sozinho na rota, sem inimigos por perto.
**Esperado**: O bot deve conseguir pegar o ouro de quase todos os creeps (mínimo 4 de 5).

### 5.B — Last Hit Compartilhado
**Setup**: Humano e bot na mesma rota.
**Esperado**: O bot deve recuar e ceder o last hit para o humano na maioria das vezes.

### 5.C — Harass
**Setup**: Inimigo isolado, bot com HP cheio e creep wave equilibrada.
**Esperado**: O bot deve dar 1-2 ataques no inimigo e voltar para a wave, sem perseguir para a torre.

### 5.D — Prevenção de Freeze
**Setup**: Jogador humano ataca o bot na rota.
**Esperado**: O bot deve reagir no mesmo frame (atacar de volta, recuar ou usar habilidade), nunca ficar parado por > 1.5s.