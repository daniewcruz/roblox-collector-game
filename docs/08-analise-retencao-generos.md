# Análise Profunda: Estrutura de Retenção por Conceito de Gênero

> Objetivo desta análise (definido pelo usuário): não escolher pelo menor tempo de desenvolvimento, mas encontrar **o menor jogo que conseguimos construir sozinhos, mas que tenha uma estrutura de retenção suficientemente forte para crescer em um produto de longo prazo.**
>
> Esta análise substitui a comparação anterior baseada apenas em tempo (`03-conceitos-ranking.md`, seção "Validação Fase 1") como critério principal de decisão — tempo de desenvolvimento volta a ser **um** critério entre vários, com peso menor.

## Framework usado: as camadas de loop

Jogos com boa retenção não têm um loop, têm **camadas de loop aninhadas**, cada uma operando em uma escala de tempo diferente. O loop central (minuto a minuto) prende a atenção na sessão atual; o loop meta (dias/semanas) é o que faz o jogador *voltar*. [GDevelop](https://gdevelop.io/blog/casual-game-loops), [gamedesignskills.com](https://gamedesignskills.com/game-design/core-loops-in-gameplay/)

- **Core Loop**: o que o jogador faz a cada minuto — precisa ter Desafio → Ação → Recompensa.
- **Progression Loop**: como o jogador cresce dentro de uma sessão/período curto (upgrades, XP, desbloqueios).
- **Meta Loop**: o que sustenta o jogo por semanas/meses (metas de longo prazo, temporadas, prestígio).
- **Return Loop**: o gatilho específico que faz o jogador abrir o jogo de novo amanhã.
- **Social Loop**: por que interagir com outros jogadores importa.
- **Collection Loop**: o que existe para descobrir/completar.
- **Update Loop**: como novo conteúdo entra sem reconstruir o jogo.
- **Monetization Loop**: como cobrar sem quebrar os loops acima.

Aplicamos esse framework a 4 estruturas candidatas.

---

## Estrutura 1 — Tycoon simples (puro)

```
JOGADOR ENTRA → recebe terreno/base vazia
   ↓
AÇÃO PRINCIPAL → compra 1ª geradora de renda (clique/toque)
   ↓
RECOMPENSA → moeda acumula passivamente
   ↓
PROGRESSÃO → compra próxima geradora/upgrade
   ↓
NOVO OBJETIVO → geradora mais cara / mais eficiente
   ↓
NOVA MECÂNICA → (fraco, ver abaixo)
   ↓
NOVA ÁREA/CONTEÚDO → expandir o terreno fisicamente
   ↓
META DE LONGO PRAZO → completar o tycoon / prestígio (se implementado)
   ↓
RETORNO → coletar renda acumulada offline
```

- **Core Loop**: comprar → esperar → coletar → comprar. Fraco por natureza: a "ação" do jogador é mínima (esperar não é uma ação interessante). [Risco identificado pelo próprio usuário confirmado pela pesquisa.]
- **Progression Loop**: linear e previsível — cada compra é estritamente melhor que a anterior, pouca decisão real.
- **Meta Loop**: historicamente fraco em tycoons "clássicos" — mas a pesquisa aponta a fronteira de design de 2026: **construção persistente entre sessões, visitável/compartilhável**, com retenção preliminarmente mais forte que tycoons de sessão-reseta. [RoWatcher](https://rowatcher.com/news/tycoon-games-the-genre-that-built-roblox-and-still-hasn-t-peaked)
- **Return Loop**: coleta de renda offline acumulada — gatilho de retorno funcional mas raso (não é curiosidade/descoberta, é só "ir buscar dinheiro parado").
- **Social Loop**: fraco por padrão — visitar tycoon de amigos é um acréscimo, não parte do design clássico.
- **Collection Loop**: fraco — tycoon puro não tem coleção natural.
- **Update Loop**: **forte estruturalmente** — adicionar uma geradora/upgrade nova ao catálogo é uma alteração de dados, não de sistema. Fácil de sustentar sozinho.
- **Monetization Loop**: direto (comprar geradoras com Robux, "skip espera") — mas esse é justamente o padrão de "pay-to-skip" que o usuário quer evitar se vira a mecânica central.
- **Risco de grind identificado**: "comprar máquina → esperar dinheiro → comprar máquina → esperar dinheiro" até o jogador perder interesse — exatamente o risco que o usuário citou, e a pesquisa confirma que é o padrão dominante nos milhares de tycoons genéricos que saturam a busca. [RoWatcher](https://rowatcher.com/news/tycoon-games-the-genre-that-built-roblox-and-still-hasn-t-peaked)
- **Tempo estimado (MVP real, não protótipo)**: 2-4 semanas cobre a versão rasa acima. Adicionar persistência entre sessões + elemento social/visitável (a diferenciação real) soma tempo — estimativa honesta: **6-10 semanas** para um tycoon com meta loop de verdade, não só o esqueleto.

---

## Estrutura 2 — Simulador de coleta/progressão (puro)

```
JOGADOR ENTRA → tutorial rápido, 1ª ação em segundos
   ↓
AÇÃO PRINCIPAL → coletar/chocar/pescar (ação repetível, ativa)
   ↓
RECOMPENSA → item/pet/recurso com raridade visível
   ↓
PROGRESSÃO → vender/evoluir/fundir → número sobe
   ↓
NOVO OBJETIVO → próxima raridade / próximo bioma
   ↓
NOVA MECÂNICA → fusão, mutação, encantamento (se existir)
   ↓
NOVA ÁREA/CONTEÚDO → novo mapa/bioma desbloqueado por progresso
   ↓
META DE LONGO PRAZO → rebirth/prestígio, completar coleção (Bestiary-like)
   ↓
RETORNO → recompensa diária + progresso pendente perto do próximo marco
```

- **Core Loop**: coletar → recompensa imediata → mostrar raridade. Mais forte que tycoon porque a ação do jogador é ativa e repetida, não passiva.
- **Progression Loop**: números crescentes + raridades — psicologicamente potente ("números maiores", já documentado em `01-pesquisa-mercado.md`).
- **Meta Loop**: **rebirth/prestígio é o mecanismo comprovado** para dar retenção de longo prazo a simuladores — reseta progresso em troca de multiplicador permanente, cria uma segunda camada de objetivo ("estou grindando para o próximo rebirth", não só "para o próximo item"). [TechBloat](https://www.techbloat.com/how-to-add-rebirths-to-your-roblox-game.html)
- **Return Loop**: recompensas diárias + "estou quase lá" (perto de completar uma coleção ou atingir o próximo rebirth) — gatilho de curiosidade/domínio, não manipulação.
- **Social Loop**: mostrar raridade/coleção para outros jogadores é nativo ao gênero (o "flex" social já documentado em `01-pesquisa-mercado.md`).
- **Collection Loop**: **forte por padrão** — é a espinha dorsal do gênero (pets, itens, raridades).
- **Update Loop**: forte — novo bioma + novo lote de itens colecionáveis é conteúdo aditivo, não requer redesenhar sistemas.
- **Monetization Loop**: risco real de pay-to-win se multiplicadores pagos dominarem a progressão (crítica documentada contra Pet Simulator 99 em `02-concorrentes.md`) — mitigável com balanceamento cuidadoso, não é uma falha estrutural do gênero.
- **Risco de grind identificado**: coletar→vender→upgrade→coletar→vender→upgrade sem variedade real de *ação* — mitigado por variar o que muda a cada ciclo (novo bioma = nova aparência/contexto, não só número maior).
- **Tempo estimado (MVP real)**: um simulador raso (1 bioma, sem rebirth, sem coleção) é rápido (~3-5 semanas), mas **não tem meta loop nem update loop testados** — não é o "MVP real" que gera retenção. Com rebirth básico + 1 sistema de coleção (mesmo que pequeno) + 2 biomas: estimativa honesta **8-12 semanas**.

---

## Estrutura 3 — Híbrido Tycoon + Simulador (ex: "Tycoon Simulator" de NikoSquared)

```
JOGADOR ENTRA → recebe base + primeira ferramenta de coleta
   ↓
AÇÃO PRINCIPAL → coleta ativa (ação de simulador)
   ↓
RECOMPENSA → moeda + recursos coletados
   ↓
PROGRESSÃO → reinveste em geradores automáticos (tycoon) E upgrades pessoais (simulador)
   ↓
NOVO OBJETIVO → geradores mais eficientes + ferramentas melhores
   ↓
NOVA MECÂNICA → automação desbloqueia coleta passiva, liberando o jogador para focar em outra coisa
   ↓
NOVA ÁREA/CONTEÚDO → expandir base física + novos biomas de coleta
   ↓
META DE LONGO PRAZO → prestígio combinado (reseta base E progressão pessoal por multiplicador)
   ↓
RETORNO → coleta offline (tycoon) + progresso de coleção pendente (simulador)
```

- Existe precedente real: **Tycoon Simulator** (NikoSquared) combina os dois gêneros. [Charlie INTEL / busca](https://tycoon-simulator-roblox.fandom.com/wiki/Tycoon_simulator_ROBLOX_Wiki)
- **Vantagem estrutural**: a ação ativa do simulador resolve o maior ponto fraco do tycoon puro (passividade excessiva); a automação do tycoon resolve o maior risco do simulador puro (grind repetitivo sem alívio) — cada gênero cobre a fraqueza do outro.
- **Monetization Loop**: duas superfícies de monetização (upgrades de automação + upgrades de coleta pessoal) sem que nenhuma precise ser agressiva sozinha.
- **Risco**: mais superfícies = mais complexidade de balanceamento entre as duas economias (moeda do tycoon vs. progressão do simulador) — não é trivial mas é gerenciável em escopo pequeno.
- **Tempo estimado (MVP real)**: mais alto que qualquer um dos dois puros — dois sistemas de progressão para balancear. Estimativa: **10-14 semanas** para um MVP que já demonstre os dois loops funcionando juntos de forma coerente.

---

## Estrutura 4 — Híbrido Coleta + Exploração + Progressão leve (modelo "Fisch")

Este não estava no ranking original — surgiu da pesquisa como o **case de maior sucesso de retenção real da Roblox em 2024-2026**, e vale como 4ª opção pedida pelo usuário.

```
JOGADOR ENTRA → pega vara/ferramenta básica em segundos
   ↓
AÇÃO PRINCIPAL → pescar/coletar (minijogo curto de habilidade, não só clique)
   ↓
RECOMPENSA → item com raridade + variação visual (mutação)
   ↓
PROGRESSÃO → vende/registra no Bestiary → compra ferramenta melhor
   ↓
NOVO OBJETIVO → completar entradas do Bestiary / raridades específicas
   ↓
NOVA MECÂNICA → ferramenta melhor abre acesso a nova área
   ↓
NOVA ÁREA/CONTEÚDO → nova zona de exploração com itens exclusivos
   ↓
META DE LONGO PRAZO → completar Bestiary (coleção) + progressão de ferramenta até tier máximo
   ↓
RETORNO → "falta pouco para completar essa página do Bestiary" / novo evento sazonal
```

- **Fisch** (WoozyNate): pescar → vender → upgrade de vara → viajar para nova área. Sustentado por **+400.000 variações de peixe, 17 tiers de raridade, um Bestiary completável, sistema de mutação que torna cada captura visualmente única**. Superou Blox Fruits em CCU no fim de 2024 e acumula **4.37 bilhões de visitas com 89% de aprovação**. [Gamerant](https://gamerant.com/roblox-fisch-game-fishing-gameplay-rods-explained/), [maxpowergaming.co](https://www.maxpowergaming.co/post/fish-it-how-a-simplified-copycat-became-one-of-roblox-s-biggest-hits)
- **Origem do design**: o próprio criador disse que fez Fisch porque estava "cansado do ciclo repetitivo e desgastante de jogos de pesca/simulador genéricos" — ou seja, o "problema do grind" que o usuário quer evitar já foi identificado e resolvido publicamente por este criador. [maxpowergaming.co](https://www.maxpowergaming.co/post/fish-it-how-a-simplified-copycat-became-one-of-roblox-s-biggest-hits)
- **Por que resolve o problema de grind**: a variação (mutações, raridades, 400K+ combinações) faz cada repetição da mesma ação produzir um resultado *visualmente e estatisticamente diferente* — o cérebro não classifica isso como "a mesma coisa de novo" do mesmo jeito que "clique → número sobe" sem variação visual.
- **Collection Loop**: o mais forte dos 4 candidatos — o Bestiary é literalmente uma lista de metas de longo prazo sempre visível.
- **Update Loop**: forte — nova área = novo lote de peixes/raridades, reaproveitando o mesmo sistema (adição de dados, como no simulador puro).
- **Monetization Loop**: varas melhores/cosméticos, sem que dinheiro seja obrigatório para "ver" a variação (a sorte/raridade natural já gera o gancho) — modelo menos propenso a acusação de pay-to-win que simuladores puros de multiplicador.
- **Complexidade para solo iniciante**: **mais alta** que os anteriores — o sistema de mutação/raridade com centenas de milhares de combinações, minigame de captura com timing/habilidade, e Bestiary são, individualmente, sistemas de engenharia não triviais para um iniciante total.
- **Tempo estimado (MVP real)**: a versão completa (Fisch) foi construída por um estúdio pequeno mas não solo-em-10h/semana. Uma versão **drasticamente simplificada** do mesmo padrão (poucas dezenas de variações em vez de 400K, Bestiary pequeno, 1-2 áreas) é viável para nosso perfil, mas ainda assim: estimativa **10-16 semanas** para captar a essência do que faz Fisch funcionar (variedade + coleção + progressão de ferramenta), sem tentar replicar a escala completa.

---

## O problema do grind — como jogos de sucesso resolvem (síntese da pesquisa)

A pesquisa geral de design de jogos mobile/casual confirma o raciocínio do usuário: retenção sustentável vem de **variedade dentro do loop**, não de fricção artificial. [Segwise](https://segwise.ai/blog/boost-mobile-game-retention-strategies), [gamigion.com](https://www.gamigion.com/mobile-game-retention-cheatsheet/)

Mecanismos concretos identificados, aplicáveis a qualquer uma das 4 estruturas:

| Mecanismo | O que resolve | Onde se aplica melhor |
|---|---|---|
| **Rebirth/Prestígio** | Grind sem propósito de longo prazo | Simulador, Híbrido 3 |
| **Raridade + mutação/variação visual** | Repetição parecer "a mesma coisa" | Simulador, Híbrido 4 (Fisch) |
| **Coleção completável (Bestiary-like)** | Falta de meta de longo prazo clara | Todos, mas nativo em Simulador/Híbrido 4 |
| **Novas áreas desbloqueadas por progresso** | Ambiente ficar repetitivo visualmente | Todos |
| **Automação parcial** | Cansaço da ação repetitiva manual | Tycoon, Híbrido 3 |
| **Eventos temporários/sazonais** | Fadiga de longo prazo mesmo com sistemas bons | Todos — mas exige cadência de conteúdo sustentável (ver `Update Loop` de cada um) |
| **Construção persistente/visitável** | Meta loop fraco de tycoon puro | Tycoon |

Regra prática confirmada pela documentação oficial da Roblox Creator Hub: qualquer sistema adicionado via LiveOps deve **se conectar ao core loop já existente**, não ser um apêndice isolado — e conteúdo deve ser produzido de forma sustentável (não queimar a capacidade do time/solo dev). [Roblox Creator Hub — LiveOps Essentials](https://create.roblox.com/docs/production/game-design/liveops-essentials)

## Design modular — como expandir sem reconstruir

Para todos os 4 candidatos, a prática recomendada é: **grid modular de construção** (peças reutilizáveis que se encaixam) e **sistemas orientados a dados** (nova área/item = nova entrada numa tabela, não novo código). Isso é o que permite ao Update Loop de cada estrutura ser sustentável por um solo dev. [Roblox Creator Hub — Building Architecture](https://create.roblox.com/docs/resources/beyond-the-dark/building-architecture)

---

## Score de retenção ponderado

### Pesos propostos e justificativa

| Critério | Peso | Justificativa |
|---|---:|---|
| Retenção inicial (5-15min, 1ª sessão) | 15% | Se o jogador não passa da 1ª sessão, nada mais importa — mas é o critério mais fácil de corrigir depois via onboarding, por isso não é o maior peso. |
| Retenção D1/D7 potencial (estrutural) | 20% | Maior peso — é o que diferencia estruturalmente os 4 candidatos (meta loop forte vs. fraco) e o que mais afeta promoção orgânica via Discovery (`01-pesquisa-mercado.md`). |
| Progressão | 15% | Sensação de crescimento é o motor psicológico central citado em toda a pesquisa de gênero. |
| Conteúdo de longo prazo / anti-grind | 15% | Peso alto porque é exatamente o critério que o usuário identificou como decisivo e que os dados de mercado confirmam ser onde tycoons puros falham. |
| Variedade (resolve o "grind") | 10% | Mecanismo concreto (mutação, raridade, biomas) que sustenta os itens acima sem recorrer a fricção artificial. |
| Expansibilidade (Update Loop) | 10% | Determina se o solo dev consegue manter o jogo vivo depois do lançamento sem reconstruir tudo. |
| Social | 5% | Importante mas não decisivo nesta fase — nenhum dos 4 candidatos depende de multiplayer competitivo/complexo. |
| Monetização | 5% | Todos os 4 monetizam de forma parecida (`03-conceitos-ranking.md`); pouca diferenciação real neste critério. |
| Facilidade para solo iniciante | 5% | Peso reduzido deliberadamente — o usuário pediu para não decidir pelo caminho mais fácil; ainda entra, mas não domina o resultado. |

### Tabela de pontuação (1-5 por critério, ponderado)

| Critério (peso) | Tycoon puro | Simulador puro | Híbrido Tycoon+Sim | Híbrido Fisch-like |
|---|---|---|---|---|
| Retenção inicial (15%) | 3 | 4 | 4 | 4 |
| Retenção D1/D7 estrutural (20%) | 2 | 4 | 4 | 5 |
| Progressão (15%) | 3 | 5 | 4 | 5 |
| Conteúdo longo prazo/anti-grind (15%) | 2 | 4 | 4 | 5 |
| Variedade (10%) | 2 | 3 | 3 | 5 |
| Expansibilidade (10%) | 4 | 4 | 3 | 4 |
| Social (5%) | 2 | 3 | 3 | 3 |
| Monetização (5%) | 3 | 3 | 4 | 4 |
| Facilidade solo iniciante (5%) | 5 | 3 | 2 | 2 |
| **TOTAL ponderado (/5)** | **2.55** | **3.90** | **3.65** | **4.55** |

### Leitura do score

1. **Híbrido Fisch-like (Coleta + Exploração + Progressão leve) vence com folga** — é o único candidato que resolve estruturalmente o problema do grind (variedade real via mutação/raridade) em vez de mascará-lo, e tem precedente de mercado comprovado (maior jogo de CCU da Roblox por um período, 89% aprovação).
2. **Simulador puro** fica em 2º — ainda forte, mas sem a camada de variedade/exploração que o Fisch-like tem.
3. **Híbrido Tycoon+Simulador** fica em 3º — bom equilíbrio, mas a complexidade de balancear duas economias reduz a facilidade de execução sem ganhar retenção suficiente para compensar.
4. **Tycoon puro** fica último **neste critério de retenção** — apesar de ser o mais rápido de construir e ter boa "facilidade solo iniciante", é estruturalmente o mais fraco nos critérios que o usuário definiu como prioritários (retenção D1/D7, conteúdo de longo prazo, variedade).

### Importante: isto não é a decisão final

Esta tabela responde "qual estrutura tem melhor potencial de retenção", não "qual devemos escolher automaticamente". O Híbrido Fisch-like também é o **mais complexo tecnicamente** dos 4 (sistema de raridade/mutação, minigame de captura, Bestiary) — isso não está escondido na tabela (ver linha "Facilidade solo iniciante": nota 2, a mais baixa da tabela), mas está deliberadamente sub-ponderado (5%) porque o usuário pediu para não decidir pelo caminho mais fácil.

**Uma versão simplificada do Híbrido Fisch-like** (poucas variações em vez de 400K, 1 área em vez de várias, Bestiary pequeno) é o caminho recomendado para não recair no erro de escolher pela retenção teórica ignorando o que é realmente possível construir sozinho — ver seção de temas abaixo e a pergunta final ao usuário.

---

## Temas/nichos com potencial de retenção (sem escolher ainda)

Buscando temas que já carregam naturalmente descoberta, progressão, coleção, evolução, personalização — características que reforçam qualquer uma das estruturas acima, mas especialmente o Híbrido Fisch-like e o Simulador puro:

- **Criaturas/monstros para capturar e evoluir** (tipo Pokémon-adjacent, sem violar IP) — descoberta + coleção + evolução são nativos ao tema.
- **Exploração de oceano/espaço profundo** — cada "camada" nova (mais fundo no oceano, mais longe no espaço) é uma área nova natural, com criaturas/recursos exclusivos por camada — mapeia diretamente no padrão Fisch (nova ferramenta → nova área → novos itens).
- **Culinária/fazenda com ingredientes raros** — coleta + combinação (crafting) + personalização (decorar/mostrar resultado) — forte gancho social de "mostrar o que criei".
- **Mineração/geologia com cristais/gemas raras** — coleção natural por raridade visual (cor, brilho), progressão de ferramenta (picareta melhor = acesso a camadas mais profundas), mapeia bem no padrão Fisch.
- **Criação/customização de pets ou criaturas fictícias** — combina coleção com personalização (visual único por jogador), forte gancho social/viral (mostrar pet único).

Todos os temas acima foram escolhidos por mapear diretamente nos mecanismos de retenção identificados nesta análise (raridade, variação visual, progressão por ferramenta/acesso, coleção completável) — não por serem "divertidos" isoladamente. A escolha final de tema específico fica para depois da decisão de estrutura, com pesquisa dedicada de saturação de cada nicho.

## Perguntas que ainda restam para o usuário

1. Confirma o **Híbrido Fisch-like simplificado** como estrutura vencedora do score de retenção, mesmo sendo o mais complexo tecnicamente dos 4? Ou prefere o Simulador puro (2º lugar, bem mais simples de construir) como equilíbrio mais seguro?
2. Entre os temas listados acima, algum já chama atenção, ou seguimos para pesquisa de saturação de todos antes de recomendar um?
3. Confirma que "MVP real" pode significar um Fisch-like **drasticamente simplificado** (dezenas de variações, não centenas de milhares; 1 área, não várias) nas primeiras fases, expandindo depois — em vez de tentar replicar a escala do Fisch original?
