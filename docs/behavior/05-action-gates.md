# Action Gates — Por que os bots congelam e como destravá-los

> **Público-alvo**: qualquer pessoa que edite `jmz_func.lua`, `utils.lua` ou que esteja depurando bots que ficam parados sem agir (freeze).
>
> **Escopo**: define o que são "Action Gates", por que eles causam o congelamento (first blood) e como a válvula de escape `MustReactNow` resolve isso.

---

## 0. Sumário executivo

Um "Action Gate" (Portão de Ação) é uma verificação no início do `Think()` dos modos que impede o bot de emitir novos comandos se ele já estiver "fazendo algo".

O problema é que o motor do Dota 2 considera que o bot está "fazendo algo" mesmo quando uma ação antiga fica presa na fila (como andar para cima de um creep que já morreu, ou a animação de um Teleporte). Se o bot não pode emitir um novo comando, ele fica parado, tomando dano, até o jogo limpar a fila sozinho. Isso causa os famigerados "first bloods" entregues na rota.

**A solução**: Criamos o `MustReactNow` como um bypass de emergência para forçar os gates a abrirem quando o bot está em perigo real.

---

## 1. As Funções de Gate (Os Freios)

Existem três funções principais que agem como freios. Se qualquer uma delas disser "não", o `Think()` do bot aborta.

### 1.1 `J.CanNotUseAction(bot)`
A checagem primária. Ela retorna `true` (bloqueando o bot) se:
* O bot estiver morto.
* Estiver invulnerável (ex: Phase Shift, Shadow Realm) — a menos que seja para atacar.
* Estiver conjurando magia (`IsCastingAbility`), usando item (`IsUsingAbility`) ou canalizando (`IsChanneling`).
* Tiver ações pendentes na fila (`HasQueuedAction`).

### 1.2 `J.HasQueuedAction(bot)`
Verifica se `bot:NumQueuedActions() > 0`. Esta é a causa mais comum de freeze. Se o pathfinding do bot falhar ao andar para cima de um alvo (porque o alvo morreu), a ação de `MoveToUnit` pode ficar presa na fila por vários frames, bloqueando a defesa e o recuo.

### 1.3 `IsBotThinkingMeaningfulAction(bot, thinkLess, type)`
Uma camada de IA que verifica o que o bot está fazendo visualmente (como `ACTIVITY_RUN`). O motor considera que "correr" é uma ação significativa. Isso evita que o bot fique re-emitindo comandos de andar a cada frame (o que economiza CPU), mas causava problemas quando o bot precisava cancelar uma rota para se defender.

---

## 2. A Solução: `J.MustReactNow(bot)`

Para evitar que os bots fiquem congelados em situações críticas, o motor agora verifica a função `MustReactNow` **antes** de aplicar os gates.

Se `MustReactNow` retornar `true`, as funções `CanNotUseAction` e `IsBotThinkingMeaningfulAction` ignoram suas regras e permitem que o `Think()` execute.

### 2.1 Quando o bypass é acionado?
O `MustReactNow` só destrava o bot se houver uma emergência real:
* **Dano Recente**: O bot tomou dano de herói nos últimos 1.5 segundos.
* **HP Crítico**: O bot está com HP abaixo de 30% e tem inimigos a menos de 900 de distância.
* **DoTs Mortais**: O bot está sob efeito de Macropyre (Jakiro), Viper Strike ou Venomous Gale.
* **Grace Period Pós-TP**: Nos primeiros 0.5s após um teleporte chegar ao destino, o bot ignora a fila residual para começar a se mover imediatamente.

---

## 3. Como a Emergência se Conecta ao Modo

Quando o `MustReactNow` destrava o bot, o modo `Defend` ou `Retreat` consegue executar seu `Think()`.
O `Think()` emite um `Action_MoveToLocation` ou `Action_AttackUnit`. Por padrão, as ações de `Action_` (sem sufixo Queue ou Push) limpam a fila antiga automaticamente.

Com isso, o bot se move imediatamente, sem precisar que o desenvolvedor adicione `Action_ClearActions()` manualmente em cada arquivo de modo.

---

## 4. Protocolo de Teste

### 4.A — Freeze na Rota
**Setup**: Bot tentando atacar um creep que morre no exato momento. Jogador humano ataca o bot em seguida.
**Esperado**: O bot deve esquecer o creep morto imediatamente e dar meia-volta ou revidar em menos de 0.2 segundos.

### 4.B — Freeze Pós-TP
**Setup**: Bot teleporta para defender uma torre.
**Esperado**: Ao chegar no local, ele deve sair andando na direção dos inimigos imediatamente, sem pausa de 1 a 2 segundos.

### 4.C — Prevenção de Cancelamento
**Setup**: Bot usando Black Hole (canalização).
**Esperado**: O `MustReactNow` não deve interromper a canalização. (A função `MustReactNow` tem uma trava de segurança interna: se `IsChanneling()` for verdadeiro, ela retorna `false`).