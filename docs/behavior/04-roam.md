# Roam Behavior — Ganks, Emboscadas e Suporte

> **Público-alvo**: qualquer pessoa que edite `mode_roam_generic.lua` ou `mode_team_roam_generic.lua`.
>
> **Escopo**: define como os bots decidem sair de suas rotas para buscar abates (ganks), responder a invasões ou ajudar aliados em perigo.

---

## 0. Sumário executivo

O sistema de Roam é dividido em dois modos principais:
1. **Solo Roam (`mode_roam_generic.lua`)**: Geralmente usado por suportes ou mids no early/mid game para pressionar outras rotas e criar vantagem espacial.
2. **Team Roam (`mode_team_roam_generic.lua`)**: Usado para movimentação em grupo, resposta rápida a invasões (守家特判) ou para salvar aliados em perigo.

**Problemas históricos**:
* **Emboscadas perdidas**: Um commit anterior introduziu proteções para não roubar a jungle de jogadores humanos. O efeito colateral foi a redução das emboscadas na jungle inimiga. Ajustes recentes buscaram reativar a agressividade contra alvos isolados.
* **Cooldown excessivo**: O tempo de espera para tentar ajudar um aliado novamente (após falhar) era muito alto (90s), o que sufocava o roam ofensivo. Foi reduzido para 30s.

---

## 1. Quando o Bot decide Roamar?

O bot avalia o mapa a cada frame. O desejo de Roam aumenta quando:

* **Alvo Isolado**: Há um herói inimigo com HP < 50% longe dos aliados dele e no alcance do bot.
* **Invasão de Território**: 2 ou mais heróis inimigos invadem a nossa jungle (aciona o Team Roam para defesa).
* **Aliado em Perigo**: Um aliado está sendo caçado e o bot tem HP/mana para intervir.
* **Ping Humano**: Um jogador humano deu ping em uma rota pedindo ajuda.

## 2. Considerações Táticas (Anti-Feed)

Roam é uma faca de dois gumes. Para evitar que os bots se alimentem (feed) indo sozinhos para o meio de 3 inimigos:

* **Vantagem Numérica**: O bot só inicia um gank solo se a área do alvo tiver menos inimigos do que a soma do bot + aliados locais.
* **Limite de Distância**: O bot ignora alvos que estão muito longe da rota designada dele, a menos que seja uma emergência de defesa.
* **Fuga Segura**: Se o alvo tiver uma rota de fuga clara (ex: perto da torre dele) e o bot não tiver controle (stun/slow), o desejo de roam cai.

## 3. O Sistema de Ajuda (Help Ally)

A função `ConsiderHelpAlly()` é o coração do salvamento de aliados.

* **Timeout**: Quando um bot tenta salvar alguém, ele tem 40 segundos para chegar e resolver a situação. Se o tempo acabar, ele desiste e entra em cooldown.
* **Cooldown**: Após desistir (timeout), ele fica 30s sem tentar salvar o mesmo aliado. Se ele conseguir salvar (ou o aliado morrer), o cooldown é de 15s.

## 4. Integração com Aba_Defend

O `mode_team_roam_generic.lua` também atua como a primeira linha de defesa da base (守家特判).
Se a ameaça atingir o nível 3 (Ancient/High Ground) e o time não tiver vantagem esmagadora, o Team Roam pode retornar um desejo altíssimo (0.95+) para forçar os bots a voltarem.

---

## 5. Knobs de Tuning

| Constante | Local | Valor atual | Efeito |
|---|---|---|---|
| `helpAllyCooldown` (success) | `mode_team_roam_generic.lua` | 15s | Tempo sem tentar ajudar após sucesso/morte do alvo |
| `helpAllyCooldown` (timeout) | `mode_team_roam_generic.lua` | 30s | Tempo sem tentar ajudar após falha (não chegar a tempo) |
| `helpAllyMaxTime` | `mode_team_roam_generic.lua` | 40s | Tempo máximo perseguindo o alvo para ajudar |
| `nEnemiesNearBase` | `mode_team_roam_generic.lua` | 2 | Gatilho mínimo para retorno em massa à base |

---

## 6. Protocolo de Teste

### 6.A — Emboscada Solo (Solo Roam)
**Setup**: Bot no meio (mid), inimigo na rota superior com 30% de HP, longe da torre dele.
**Esperado**: O bot deve se deslocar para cima e tentar o abate.

### 6.B — Invasão de Jungle (Team Roam)
**Setup**: 2 heróis inimigos entram na jungle do time.
**Esperado**: Os suportes devem se mover para a área para contestar, sem abandonar os carries se a base não estiver ameaçada.

### 6.C — Salvamento (Help Ally)
**Setup**: Um aliado (humano) está sendo perseguido na lane. O bot está na rota vizinha.
**Esperado**: O bot deve se mover em direção ao aliado. Se o aliado morrer no caminho, o bot deve parar e voltar à sua função (cooldown ativado).