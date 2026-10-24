# Meta & Hero Combos — Sinergias e Draft

> **Público-alvo**: desenvolvedores que desejam melhorar a lógica de `hero_selection.lua` ou criar scripts de interação entre heróis aliados (ex: usar uma habilidade quando um aliado iniciar um combo).
>
> **Escopo**: catalogar sinergias baseadas no meta recente (incluindo The International) para guiar a escolha de heróis e a priorização de alvos.

---

## 1. O Conceito de "Wombo Combo"

Em Dota 2, certos heróis têm habilidades que se sobrepõem perfeitamente para criar combos devastadores (frequentemente chamados de "Wombo Combos"). A IA atual do OpenHyperAI avalia habilidades isoladamente. O objetivo futuro é fazer com que os bots reconheçam quando um aliado tem uma habilidade de setup e ajam em conjunto.

## 2. Combos Clássicos de Teamfight (Tier S)

Estes combos são capazes de vencer uma partida inteira em uma única luta.

### 2.1 Faceless Void + Invoker / Dark Willow
* **Setup**: Faceless Void usa *Chronosphere* (Cronosfera), prendendo vários inimigos.
* **Follow-up**: Invoker usa *Sun Strike* (ou *Cataclysm* com Aghanim's) ou Dark Willow usa *Bedlam* / *Cursed Crown*.
* **Por que funciona**: Os inimigos não podem se mover nem usar BKB durante a Cronosfera, garantindo o dano mágico massivo.

### 2.2 Magnus + Sven / Phantom Assassin
* **Setup**: Magnus usa *Reverse Polarity* (RP) para puxar todos os inimigos para perto dele.
* **Follow-up**: Sven usa *Storm Hammer* e *God's Strength* com ataques em área (Cleave) ou PA usa *Coup de Grace*.
* **Por que funciona**: O RP agrupa os inimigos, maximizando o dano físico em área do Sven.

### 2.3 Naga Siren + Enigma / Tidehunter
* **Setup**: Naga usa *Song of the Siren* (Ultimate) para dormir todos os inimigos.
* **Follow-up**: Enigma posiciona o *Black Hole* ou Tidehunter usa *Ravage* enquanto os inimigos estão dormindo. A Naga cancela a música (ou a música acaba) no momento exato em que o Enigma/Tide usa a habilidade.
* **Por que funciona**: Garante que o controle de área (AoE disable) atinja o time inteiro sem chance de reação.

### 2.4 Snapfire + Disruptor / Pugna
* **Setup**: Disruptor usa *Static Storm* (com Aghanim's) ou Pugna usa *Decrepify* em um alvo.
* **Follow-up**: Snapfire usa *Mortimer Kisses* (Ultimate) sobre a área.
* **Por que funciona**: A chuva de fogo da Snapfire é lenta. O silêncio/morte (Disruptor) ou a redução de resistência mágica (Pugna) prendem os inimigos na área de dano.

---

## 3. Sinergias de Rota (Laning Phase)

Combos focados em dominar a fase de rotas (early game).

### 3.1 Bane + Mirana
* **Setup**: Bane usa *Nightmare* (Pesadelo) no inimigo.
* **Follow-up**: Mirana usa *Sacred Arrow* (Flecha) no alvo parado.
* **Por que funciona**: O pesadelo deixa o inimigo completamente parado, garantindo o stun máximo da flecha da Mirana.

### 3.2 Juggernaut + Crystal Maiden
* **Setup**: Crystal Maiden usa *Frostbite* (Congelamento) ou *Crystal Nova* para desacelerar.
* **Follow-up**: Juggernaut usa *Blade Fury* (giro) e anda em cima do inimigo.
* **Por que funciona**: O slow da CM garante que o inimigo não consiga fugir do dano contínuo do giro do Juggernaut.

### 3.3 Undying + qualquer herói agressivo (ex: Slark, Ursa)
* **Setup**: Undying usa *Decay* (Roubo de Força) repetidamente e coloca o *Tombstone* (Lápide).
* **Follow-up**: O carry (Ursa/Slark) avança sabendo que os zumbis da lápide vão atrapalhar a fuga inimiga e o Undying roubou a vida deles.
* **Por que funciona**: Undying é um dos melhores heróis de "trade" na rota, criando espaço para o carry farmar e matar.

## 4. Combos de Mobilidade e Pick-off

### 4.1 Io (Wisp) + Gyrocopter / Ursa
* **Setup**: Io usa *Tether* (Conexão) no carry e *Relocate* (Teletransporte).
* **Follow-up**: O carry se teleporta junto e consegue um abate isolado (Pick-off) em segundos.
* **Por que funciona**: Elimina a fraqueza de mobilidade do Gyro e permite que o Ursa chegue em alvos sem usar Blink.

### 4.2 Storm Spirit / Ember Spirit + Batrider
* **Setup**: Batrider usa *Flaming Lasso* (Laço) para puxar um alvo para longe da torre/time dele.
* **Follow-up**: Storm Spirit (com *Ball Lightning*) ou Ember Spirit chegam instantaneamente para finalizar o alvo.
* **Por que funciona**: Transforma um herói isolado em um alvo fácil longe de qualquer salvação.

---

## 5. Como a IA deve usar estas informações

Atualmente, a engine do OpenHyperAI seleciona habilidades isoladamente. As próximas evoluções devem incluir:

1. **Draft (hero_selection.lua)**: Se o time pegar um Faceless Void, a engine deve dar peso extra para Invoker ou Dark Willow no draft.
2. **Coordenação de Habilidades (ability_item_usage)**: Se um aliado (humano ou bot) usar uma habilidade de setup (ex: Cronosfera), o bot deve automaticamente priorizar o uso de habilidades de dano em área dentro daquela zona (ex: Sun Strike).
3. **Escolha de Alvos**: Se um aliado usar Bane's Nightmare, o bot deve mirar o alvo dormindo para garantir a finalização.

---

## 6. Considerações Finais

* **Não é uma regra absoluta**: Combos de TI funcionam porque os jogadores têm comunicação e timing perfeitos. Em partidas com bots ou pub, a execução pode falhar. Use esse documento como uma diretriz de sinergia, não como uma fórmula mágica.
* **O Meta muda**: A cada patch da Valve (como o 7.41a), os heróis e itens são ajustados. Sempre confirme se os heróis listados ainda estão no meta atual antes de priorizar os pesos no código.
* **Interação com a Base**: O combo de Snapfire e Disruptor funciona porque o silêncio de área do Disruptor impede que o inimigo use BKB ou ande para fora do ultimate da Snapfire. Isso é crucial contra times que dependem de itens ativos.