# Push Behavior — Avanço, Finishing Strike e Trade-offs

> **Público-alvo**: qualquer pessoa que edite `aba_push.ts` ou `mode_push_generic.lua`.
>
> **Escopo**: define como o bot decide empurrar torres, quando ele deve recuar para defender a base e como a escolha da rota é feita.

---

## 0. Sumário executivo

O comportamento de push (`mode_push_generic.lua`) é acionado quando o time tem vantagem numérica, vantagem de networth, ou quando as torres inimigas estão expostas. O motor de push do OpenHyperAI também gerencia o "Finishing Strike" (quando o T3 ou rax inimigo já caiu).

**Problemas históricos**:
* **Push interrompido do nada**: Os bots abandonavam o ataque a uma rax para defender um T2 que estava sendo tocado por um único herói inimigo. A correção exigiu a criação da regra de "Finishing Strike" (ver §1) e a integração com `GetDesignatedResponders` (ver `03-defense.md`).

---

## 1. A Regra do "Finishing Strike"

Quando o time já derrubou o T3 ou o Rax de qualquer rota inimiga (`enemyT3OrRaxDown = true`), o bot entra em modo de Finishing Strike.

* **Prioridade Absoluta**: O desejo de push sobe para 0.99 e não sofre decaimento por sanidade.
* **Bloqueio de Defesa**: A regra que manda os bots recuarem para defender T2/T3 aliados é **desativada**. O rax destruído é uma vantagem estrutural permanente; trocar isso para defender uma torre com backdoor protection é uma jogada perdedora.
* **Exceção**: O único motivo para abandonar o Finishing Strike é se o Ancient aliado estiver com menos de 30% de HP e sendo atacado por vários inimigos.

## 2. Quando Abandonar o Push

O push só é abandonado sob duas condições:

1. **Somos o Responente Designado**: A função `GetDesignatedResponders` (em `aba_defend.ts`) nos elegeu para voltar e defender a base. Todos os outros bots continuam o push (ver `03-defense.md`).
2. **A Base está Caindo**: O Ancient aliado está sob ataque de 4+ heróis e com HP crítico.

## 3. Escolha da Rota (`WhichLaneToPush`)

A engine pontua as rotas para decidir para onde ir. Menor pontuação = melhor rota.

* **Torres Abertas**: Rotas onde o T1 ou T2 já caiu são priorizadas, pois permitem avançar mais rápido para o T3.
* **Presença de Aliados**: Rotas com mais aliados (creeps e heróis) recebem pontuação menor (é mais seguro empurrar juntos).
* **Rax Destruído**: Rotas onde o rax já caiu recebem uma penalidade (multiplicador 2.0) para evitar que os bots fiquem presos em uma rota sem valor estratégico.
* **Bônus de Mid**: Mid ganha um bônus de 20% no early/mid game, já que fica mais perto de ambos os lados e dá acesso à jungle inimiga.

## 4. Gestão de Recursos durante o Push

Os bots recuam temporariamente (sem trocar de modo) se:
* Estiverem com HP < 50% e sem creeps aliados para absorver o dano da torre.
* A torre inimiga estiver mirando neles (Kiting).

---

## 5. Knobs de Tuning

| Constante | Local | Valor atual | Efeito |
|---|---|---|---|
| `enemyT3OrRaxDown` | `aba_push.ts` | `boolean` | Ativa o Finishing Strike |
| `nMaxDesire` (finish) | `aba_push.ts` | 0.99 | Desejo quando em Finishing Strike |
| `StartToPushTime` | `aba_push.ts` | 10 min | Tempo mínimo para considerar pushes agressivos |
| `forceGroupPushLevel` | `aba_push.ts` | 1 a 3 | Tolerância a desvantagem numérica durante o push |

---

## 6. Protocolo de Teste

### 6.A — Finishing Strike (Prioridade Máxima)
**Setup**: T3 inimigo caiu, rax exposto. 2 inimigos tocam o T2 aliado.
**Esperado**: Nenhum bot abandona o ataque à rax.

### 6.B — Push com Ameaça
**Setup**: Time empurrando o T2 inimigo. 1 herói inimigo tenta dividir push no T1 aliado.
**Esperado**: O time inteiro continua o push (o T1 tem backdoor protection).

### 6.C — Finishing Strike (Base Caindo)
**Setup**: T3 inimigo caiu, time no rax. 4 inimigos atacam o Ancient aliado (< 30% HP).
**Esperado**: O time inteiro (todos os 5) recua imediatamente para defender o Ancient.