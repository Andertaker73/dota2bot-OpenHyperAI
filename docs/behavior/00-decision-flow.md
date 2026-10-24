# Decision Flow & Mode Selection

> **Público-alvo**: qualquer pessoa que edite `bot_generic.lua`, arquivos `mode_*.lua` ou `jmz_func.lua`.
>
> **Escopo**: explica como o motor do Dota 2 escolhe qual ação o bot deve tomar a cada frame, baseando-se na arquitetura de "Desejo".

---

## 0. Sumário executivo

Os bots do OpenHyperAI usam uma arquitetura de **Máquina de Estados com Prioridade (Desejo)**. A cada frame, o motor avalia o desejo de todos os modos simultaneamente. O modo que retornar o maior valor (de 0.0 a 1.0) vence e tem sua função `Think()` executada.

---

## 1. O Ciclo de Vida do Frame

O fluxo de decisão ocorre na seguinte ordem, frame a frame:

1. **Cálculo de Desejo (GetDesire)**: Todos os modos (`laning`, `push`, `defend`, `farm`, `retreat`, etc.) rodam sua função `GetDesire()`. Eles retornam um número de 0.0 a 1.0.
2. **Eleição do Modo**: O motor seleciona o modo com o maior número. Empates são resolvidos pela ordem de carregamento do motor.
3. **Execução (Think)**: O `Think()` do modo vencedor é chamado.
4. **Gates de Ação**: Antes de emitir um comando de movimento ou ataque, o `Think()` frequentemente passa por verificações como `J.CanNotUseAction(bot)`. Se o bot estiver em uma animação ou tiver ações na fila, ele não faz nada (a menos que seja uma emergência).

---

## 2. Tabela de Desejos Padrão

Estes são os valores base que cada modo tenta retornar nas situações normais. Eles são dinâmicos e mudam conforme o estado do jogo.

| Modo | Valor Base | Quando assume o controle |
|---|---|---|
| **Retreat** | 1.0 (absoluto) | HP crítico, sob ataque de múltiplos heróis, ou encurralado. |
| **Defend** | 0.90 - 1.0 | Base, T3 ou Ancient sob ameaça direta de heróis inimigos. |
| **Push** | 0.92 - 0.99 | Time com vantagem, torres inimigas expostas ou finishing strike. |
| **Laning** | 0.44 - 0.90 | Fase inicial (até ~10 min) ou farmando na rota designada. |
| **Farm** | 0.35 - 0.50 | Meio de jogo, jungle ou rotas vazias. |
| **Roam** | 0.0 - 0.65 | Procurando abates (ganks) ou respondendo a invasões. |

---

## 3. Interações Críticas entre Modos

* **Defend vs Push**: Se o time está destruindo o T3 inimigo (`Push` = 0.99) e um T3 aliado está caindo (`Defend` = 0.97), a prioridade é continuar o push, a menos que um respondedor específico seja acionado (ver `03-defense.md`).
* **Laning vs Retreat**: Na fase de rotas, se o bot levar dano, o desejo de `Retreat` deve superar imediatamente o `Laning` para evitar o *first blood*.
* **Roam vs Laning**: Se um aliado estiver em perigo iminente, o `team_roam` pode assumir o controle para prestar socorro, mesmo durante a fase de rotas.

---

## 4. Interação com Action Gates

Um modo só consegue fazer o bot agir se o `Think()` dele conseguir emitir um comando. As funções `CanNotUseAction`, `HasQueuedAction` e `IsBotThinkingMeaningfulAction` atuam como "freios". Se um bot parecer congelado (não se move nem ataca), verifique `05-action-gates.md`.