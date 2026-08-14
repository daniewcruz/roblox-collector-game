# Game Design Document (GDD) — Fase 1 (revisado, v9 — CHECKPOINT 1 APROVADO, Core Gameplay + identidade visual em validação)

**Nome provisório**: *Mimo World* (placeholder — não decidido, trocar livremente)
**Gênero/estrutura**: Híbrido Coleta + Exploração (referência estrutural: Fisch — não cópia temática)
**Tema**: "Um pequeno mundo cheio de criaturas que você ainda não descobriu" — o Mimo é o **personagem/marca do jogo** (não só um pet colecionável), revelado a partir de casulos/sementes/bolhas mágicas encontradas explorando
**Referências de filosofia de design**: 5 franquias Nintendo estudadas por sistema — Pokémon (coleção/raridade/descoberta), Animal Crossing (personalização/decoração leve/social), Mario Odyssey (curiosidade/exploração), Kirby (fofura/legibilidade visual/personagem-marca), Pikmin (criaturas com comportamento/exploração em mundo pequeno) — ver seções 2, 2b, 2c. Modelo de viralização: cooperativo (Grow a Garden), não adversarial (Steal a Brainrot) — ver 2d. **Sem copiar personagens, nomes, assets ou propriedade intelectual — só estrutura/filosofia de design.**
**Plataforma primária**: Mobile-first (80% das sessões Roblox são mobile — D004)
**Status**: **Fase 1 aprovada (Checkpoint 1 ✅, D017-D019)** — avançando para Configuração Técnica (MCP Server + Rojo + Roblox Studio). Ainda sem código escrito.
**Histórico**: v1 mineração+cristal (D012); v2 mundo mágico (D013); v3 princípios Super Mario (D014); v4 síntese de 5 franquias Nintendo (D015); v5 estrutura viral, modelo cooperativo (D016); v6 eleva Mimo a personagem/marca do jogo, adiciona regra de design "momento compartilhável", reconfirma MVP enxuto e fecha o Checkpoint 1 (D017-D019); v7 adiciona salvaguardas éticas de monetização infantil (D020, seção 8) e etapa de teste visual de conceitos de criatura antes do protótipo (D021, seção 1d); v8 marca o Core Gameplay (interação minuto-a-minuto) como **hipótese ainda não validada** — a coleção/skins/retenção já estão bem definidas, mas falta provar que a ação central é divertida por si só, não só como veículo de recompensa (D022-D024, nova seção 4b); v9 amplia a identidade do Mimo além de "fofo" para 6 famílias visuais (Cute/Cool/Majestic/Mystic/Chaotic/Legendary), adiciona sistema de Aura (camada de status cosmética) e evolução visual por descoberta (D026-D028, nova seção 1e).

---

## 1. Pitch em uma frase

**Um pequeno mundo cheio de criaturas que você ainda não descobriu.** O jogador explora regiões encantadoras, encontra casulos/sementes mágicas escondidas, e ao abri-los descobre pequenas criaturas ("Mimos") com raridades e variações visuais únicas (dourada, cristal, neon, arco-íris...) — colecionando-as em um Bestiary, personalizando seu personagem/espaço pessoal com o que descobre, e desbloqueando novas regiões com ferramentas/habilidades melhores. (Reformulação de pitch pedida pelo usuário — D015, abandona de vez o enquadramento "jogo de mineração".)

## 1b. Mimo como personagem/marca do jogo (não apenas um pet colecionável)

Ajuste conceitual pedido pelo usuário: o Mimo não é só um item de coleção dentro do jogo — ele é **o personagem que representa o jogo**, na mesma lógica de como um mascote/protagonista carrega a identidade de uma franquia inteira. A diferença-alvo:

> Não é "jogo de coletar criaturas". É **"EU QUERO AQUELE BICHINHO."**

### Ajuste (D026): Mimo não significa "fofo" — significa desejável

> Mimo não significa fofo. Mimo significa uma criatura/personagem que você quer ter.

A fofura é **uma** das portas de entrada, não a única. Ver seção 1e para as 6 famílias visuais que ampliam essa definição (Cute, Cool, Majestic, Mystic, Chaotic, Legendary).

### Calibração de nível: "impressionante", não "infantil de 5 anos" (D031)

Mesmo os Mimos da família Cute não devem ler como voltados a bebês/pré-escolar — a referência de nível é **personagem icônico com apelo amplo**, tipo Mario Bros: poses com presença, contornos fortes, atravessando idades. Fofura ≠ passividade/simplicidade excessiva. Isso é uma calibração de execução (Fase de arte), não muda os critérios abaixo.

### Critérios de design que todo Mimo precisa atender (diretriz para a Fase de arte, não implementável no código ainda)

- Extremamente fofo, poderoso, imponente, misterioso, engraçado **ou** simplesmente lindo — pelo menos um apelo forte e claro, não necessariamente fofura.
- Reconhecível pela silhueta (critério "Kirby" de 2c, reforçado aqui como requisito central, não só desejável).
- Funciona bem como skin/variante (silhueta simples permite recolorir/ornamentar sem perder legibilidade).
- Tem potencial de virar meme (algo levemente exagerado, expressivo, ou com um trejeito único).
- Funciona em thumbnail a 150×150px (ver 2d — a mesma regra de contraste/sujeito único).
- Anima bem (poses de descoberta, reação, idle — não precisa ser complexo, precisa ser expressivo).
- Suporta dezenas de variantes sem ficar repetitivo (a forma base é simples o bastante para receber cor/textura/efeito variados).
- É desejável **mesmo para quem nunca jogou** — só de ver uma imagem/vídeo do Mimo, alguém deveria pensar "quero isso", sem precisar entender a mecânica do jogo.

Isso não é um sistema a implementar na Fase 1 — é uma **diretriz de art direction** que passa a valer a partir do Protótipo/Fase de arte, e que já influencia decisões de escopo (poucas espécies-base muito bem desenhadas > muitas espécies medianas, reforçando a decisão já tomada em `09-temas-nichos.md` de qualidade de variação sobre quantidade).

## 1c. Regra de design: todo sistema precisa gerar um "momento compartilhável"

Regra adicionada pelo usuário, para ser aplicada **antes** de qualquer mecânica ser implementada — não é um sistema à parte, é um filtro de decisão:

> Toda criatura, skin ou evento deve ser capaz de gerar um momento que o jogador queira mostrar a alguém.

| Categoria | Exemplo do momento |
|---|---|
| Descoberta | "ENCONTREI O MIMO MAIS RARO!" |
| Mutação/variação | "MEU MIMO VIROU DOURADO!" |
| Evento | "O CÉU FICOU ROXO E TODO MUNDO CORREU PRA FLORESTA." |
| Social | "OLHA O MIMO QUE ELE TEM!" |
| Coleção | "FINALMENTE COMPLETEI A FLORESTA!" |

**Como aplicar na prática**: antes de qualquer feature entrar no roadmap (mesmo pós-MVP), passar pelo teste "isso gera um momento de alguma das 5 categorias acima?" — se não gerar, ou a feature precisa de ajuste, ou não vale a pena priorizar. Isso já filtra a favor de sistemas com forte componente visual/emocional (reveal, raridade, clima, coleção) sobre sistemas puramente numéricos (ex: só "mais um upgrade de +5%"), reforçando decisões já tomadas em `08-analise-retencao-generos.md` e `10-gdd.md` 2d.

## 1e. Seis famílias visuais + Aura + evolução por descoberta (D026-D028)

### Seis famílias visuais

Cada família ativa um motivo de jogar diferente — todas convivendo no mesmo mundo:

| Família | Sensação | Exemplo dos esboços (`12-conceitos-mimo.md`) | Público que atrai |
|---|---|---|---|
| 🥺 Cute | Fofo, adorável | Mosshoof, Bounch | Crianças pequenas |
| 🔥 Cool | Poderoso, estiloso | Emberwick | Adolescentes |
| 👑 Majestic | Raro, imponente | Coronox (novo) | Jogadores de status |
| 👻 Mystic | Estranho, misterioso, bonito | Glimmerslug, Voidling (novo) | Criadores de conteúdo, exploradores |
| 😈 Chaotic | Engraçado, travesso | Kettling (potencial de skin cômica) | Público de meme/humor |
| 🌌 Legendary | Reação de espanto ("CARALHO") | Reservado para os Mimos mais raros de cada família, não uma família à parte visualmente — é um nível de raridade que qualquer família pode atingir | Colecionadores extremos |

**Nota de escopo**: o MVP (seção 6) não precisa cobrir as 6 famílias no lançamento — 2-3 famílias bem executadas entre os 10-15 Mimos do MVP já cumprem a diretriz (evita contradizer o MVP enxuto de D011/D019). A amplitude de família é uma diretriz de identidade de marca de longo prazo, não uma lista de tarefas do MVP.

### Sistema de Aura (D027) — pós-MVP, arquitetura compatível

Camada visual de status **separada da criatura**: efeito ao redor do personagem (partículas, brilho, distorção) — combinável com Mimo + roupa, formando uma identidade visual completa sem multiplicar o número de criaturas a desenhar. Exemplos: Celestial (estrelas orbitando), Void (distorção escura), Storm (raios), Inferno (fogo), Frozen (flocos de neve), Prism (reflexos), Phantom (névoa), Nature (folhas/flores).

- **Compatível com as regras éticas (D020)**: é cosmético, não afeta progresso — pode ser conquistado (marco de coleção) ou comprado a preço fixo, nunca por chance.
- **Fora do MVP** — candidato para Fase 4 (Progressão)/7 (Monetização), reaproveitando a mesma arquitetura de raridade/coleção já definida no MVP.

### Evolução visual por descoberta, não por nível (D028)

Uma criatura pode transformar visualmente (ex: Emberwick → Blazing Emberwick → Astral Emberwick) desbloqueada por **descoberta/interação específica** (achar um lugar secreto, fazer uma ação especial) em vez de só acumular XP — gera vídeos do tipo "HOW TO GET ASTRAL EMBERWICK", reforçando a regra de "momento compartilhável" (1c) e a estrutura viral (2d).

- **Fora do MVP**, mas reaproveita o mesmo princípio de "segredo da região" já no escopo do MVU (seção 6, Super Mario 2b) como semente da mecânica — não exige sistema novo, só estender o que já existe.

### Por que isso não é fofura genérica: exemplos concretos do usuário

- **Voidling** (Mystic, aura-first): pequena, flutuante, sem rosto, com distorção ao redor — não é assustadora, é misteriosa e bonita. Variantes: Void, Galaxy, Celestial, Corrupted.
- **Meme Mimos** (Chaotic): um Mimo pode ter uma skin deliberadamente engraçada (ex: Kettling de óculos escuros) — gera reação de humor, não só de fofura, e amplia o alcance de conteúdo (vídeos "WHY DOES THIS THING EXIST 😂" ao lado de "LOOK AT MY NEW MIMO 🥺").

### Eixo adicional: arquétipos de fantasia (D029)

Além das 6 famílias visuais (estilo), o "reino" de Mimos pode conter **arquétipos de fantasia clássicos** (tipo dragão, tipo elfo/fada, tipo vilão/trapaceiro), sempre em versão miniatura/simplificada — mantendo o critério de silhueta simples (1b), não personagens humanoides detalhados. Este eixo cruza com o de família (ex: um dragão pode ser Majestic ou Cool dependendo do design). Registrado em `12-conceitos-mimo.md` (Rodada 3) como candidatos de **expansão pós-MVP** — o elenco de lançamento do MVP pode continuar simples (blobs/animais/objetos), com arquétipos mais elaborados entrando depois de alguma tração do jogo.

## 1d. Nova etapa antes do protótipo: teste visual de conceitos de Mimo (D021)

O usuário identificou que a maior decisão do projeto pode não ser a mecânica — pode ser **qual criatura faz alguém olhar para a tela e pensar "EU QUERO ESSE"**. Isso é coerente com o critério "Kirby"/personagem-marca (1b): se o Mimo não gerar desejo visual instantâneo, nenhuma mecânica por trás dele compensa.

**A pergunta-teste (refinada pelo usuário)** não é "qual Mimo é mais bonito?" — é:

> "Qual deles faria uma criança parar o scroll e dizer: EU QUERO ESSE?"

**Nova etapa no roadmap, antes de comprometer arte final ou entrar na Fase 2 (Protótipo) de verdade**:

1. Gerar/esboçar **5-10 conceitos visuais diferentes** de Mimo (podem ser silhuetas simples, rascunhos, ou gerados com apoio de IA como material de estudo — ver `04-roadmap.md` e regra 17 do escopo original sobre uso de IA em arte).
2. Avaliar cada conceito pelos critérios expandidos (D023): silhueta, fofura, expressão, personalidade, possibilidade de animação, potencial de virar meme, potencial de skin, reconhecimento em thumbnail pequena, possibilidade de criar uma família de variantes, diferenciação de outros jogos Roblox.
3. Se possível, coletar reação de algumas pessoas fora do projeto (mesmo informalmente, idealmente incluindo crianças do público-alvo) — a pergunta-teste é literalmente "você quer esse bichinho?", não "você entende a mecânica?".
4. Só depois de escolher a direção visual vencedora, seguir para produção de arte do MVP.

Esta etapa é **barata e rápida** (esboços, não arte final) e reduz o risco de investir semanas de desenvolvimento técnico em cima de um personagem que não gera desejo visual — o oposto do erro de "programar primeiro, descobrir se é atraente depois". Fica posicionada entre o Checkpoint 1 (aprovado) e o início efetivo da Configuração Técnica/Protótipo — não bloqueia a configuração técnica em si (que é infraestrutura, independente da arte), mas bloqueia a produção de arte final e o polish (Fase 8).

## 2. Princípios de design (filosofia Nintendo aplicada, não copiada)

Extraídos de pesquisa sobre o processo de design de Miyamoto/Nintendo e aplicados como regras de decisão para este projeto:

| Princípio (fonte) | Como se aplica aqui |
|---|---|
| **"Gameplay primeiro, personagem depois"** — Miyamoto desenha a ação principal antes de decidir tema/personagens. [gamedeveloper.com](https://www.gamedeveloper.com/design/how-the-creator-of-mario-designs-games-shigeru-miyamoto-game-designer-spotlight) | Já seguimos isso sem saber: a estrutura de loop (`08-analise-retencao-generos.md`) foi validada **antes** do tema — o tema é a "roupa", não a base. |
| **Foco na emoção central do jogador** — Miyamoto projeta games ao redor de UMA emoção (ex: "prazer da descoberta" em Pokémon). [NYFA](https://www.nyfa.edu/student-resources/nintendo-can-teach-us-game-design/) | Nossa emoção-alvo já está definida no GDD v1 e mantida: o momento de revelação ("algo está se mexendo dentro..."). Tudo deve reforçar essa emoção, não competir com ela. |
| **Simplicidade combinatória** — poucos elementos, combinados de formas variadas (ex: Mario 1-1 usa só 9 elementos). [gamedeveloper.com](https://www.gamedeveloper.com/design/how-the-creator-of-mario-designs-games-shigeru-miyamoto-game-designer-spotlight) | MVP com poucos sistemas (casulo, raridade, ferramenta, Bestiary) combinados de formas variadas por região — não adicionar sistemas novos, variar como os existentes se expressam. |
| **"Toy-first" / Hakoniwa (jardim em miniatura)** — o jogo deve parecer uma caixa cheia de segredos para brincar, não uma lista de tarefas. [switchaboo.com](https://www.switchaboo.com/legend-shigeru-miyamoto/) | Cada região deve parecer um pequeno diorama explorável, não um "mapa de grind". Reforça a decisão de manter a exploração visualmente rica, não só numérica. |
| **Pokémon: alegria da completude** — coletar, classificar, trocar; exclusividade entre "versões" incentiva troca social. [Domus](https://www.domusweb.it/en/news/2026/02/24/pokemon-game-boy-anniversary-design.html) | Bestiary com % de completude (já no GDD v1) + variações que podem ser exclusivas por região reforçam esse motor psicológico. Trocas entre jogadores ficam fora do MVP (D011), mas o design já deixa espaço para isso depois. |
| **Animal Crossing: liberdade sem pressão, charme, decoração** — sem "chefe final", jogador escolhe o que fazer, decoração é expressão pessoal. [NUS PPE Club](https://nusppeclub.squarespace.com/animal-crossing-philosophy) | Nenhum timer/energia artificial (já era regra do usuário desde `07-hipoteses.md` H4/H2 e reforçada aqui). Sistema leve de "mostrar a coleção" (prateleira/jardim de Mimos descobertos) como expressão pessoal, sem virar sistema central de decoração (evita colidir com Adopt Me — `11-pivot-fofura-colecao-skins.md`). |
| **Ensinar jogando, não com texto** — onboarding via ação, não tutorial explicado. [NUS PPE Club](https://nusppeclub.squarespace.com/animal-crossing-philosophy) | Primeira descoberta deve acontecer por interação natural (o jogador vê um casulo brilhando e toca nele), não por um tutorial com setas e texto — reforça a meta de retenção nos primeiros 5 minutos (`00-fase0-relatorio.md` seção 7). |

## 2b. Princípios específicos do Super Mario (pedido do usuário: usar como referência direta)

Mario é o exemplo mais estudado de design "ensinar jogando" e de variedade dentro de um escopo pequeno — exatamente os dois problemas que este projeto precisa resolver (onboarding sem texto, e evitar repetição num MVP pequeno). Princípios extraídos e aplicados:

| Princípio Mario | Fonte | Como se aplica a *Mimo World* |
|---|---|---|
| **Verbo/ação primária clara** — o herói de *Donkey Kong* se chamava literalmente "Jumpman"; pular é praticamente tudo que Mario faz, e o jogo inteiro é construído em cima dessa única ação. [gamedeveloper.com](https://www.gamedeveloper.com/design/how-the-creator-of-mario-designs-games-shigeru-miyamoto-game-designer-spotlight) | O jogo precisa de **um verbo central e só um**: "tocar/despertar" objetos mágicos (não "minerar", não "capturar em batalha"). Toda mecânica nova (ferramenta, habilidade) deve ser uma variação desse mesmo verbo, não um verbo novo — evita inchar o escopo do MVP e mantém a identidade do jogo legível em segundos. |
| **World 1-1 como tutorial invisível** — a fase 1-1 de *Super Mario Bros.* ensina pular, cogumelo, inimigo e cano só pelo posicionamento dos elementos, sem nenhum texto; validado formalmente como estrutura pedagógica, não coincidência. [University XP](https://www.universityxp.com/news/2026/5/7/why-super-mario-bros-is-still-an-essential-lesson-in-game-design), [gamedeveloper.com](https://www.gamedeveloper.com/design/the-secret-to-i-mario-i-level-design) | A região inicial ("Vale das Primeiras Luzes") deve ser desenhada com o mesmo cuidado: o primeiro casulo fica no caminho óbvio, impossível de não ver; o segundo já exige um pequeno desvio (ensina que vale a pena sair do caminho); só o terceiro introduz variação de raridade. Nada disso é dito em texto — é ensinado pelo posicionamento. |
| **Kishōtenketsu (introduzir → desenvolver → virada → concluir)** — Miyamoto usa essa estrutura de narrativa em 4 atos (de sua origem como desenhista de mangá) para estruturar fases e mundos. [Medium — Chris Norman](https://openedsource.medium.com/kish%C5%8Dtenketsu-hakoniwa-dd5a568da169) | Cada região segue o mesmo arco: **introduz** 1 mecânica/tipo de Mimo novo → **desenvolve** (mais casulos, mais variações) → **virada** (um evento surpresa, tipo "chuva de estrelas" ou um Mimo raro fora do padrão) → **conclui** (Bestiary da região perto de 100%, sinalizando "hora de seguir para a próxima"). |
| **Power Moons: mesma recompensa, métodos de obtenção variados** — em *Super Mario Odyssey*, luas são conseguidas de dezenas de formas diferentes (quebra-cabeça, sequência, plantar semente, minigame, conversar com NPC) em vez de sempre da mesma ação repetida. [mariowiki.com](https://www.mariowiki.com/Power_Moon) | **Este é o antídoto mais direto contra o "grind" que o usuário quer evitar.** Em vez de todo Mimo vir só de "abrir casulo", variar o *método* de descoberta por região: às vezes é achar um casulo escondido, às vezes seguir um rastro de brilho, às vezes uma pequena sequência de toques no ritmo certo, às vezes esperar um Mimo tímido se aproximar sozinho. Mesma recompensa (entrada no Bestiary), forma de chegar lá sempre variando. |
| **Cappy/possessão: variedade de habilidade, não só de número** — em vez de power-ups tradicionais, Mario "possui" inimigos e ganha habilidades novas e temáticas por área. [t3.com](https://www.t3.com/features/super-mario-odyssey-review) | Cada tier de ferramenta/habilidade não deve só ser "mais forte" — deve **desbloquear uma nova forma de interagir** com aquela região específica (ex: tier 2 permite sentir vibração de casulos escondidos; tier 3 permite acalmar Mimos tímidos que fogem). Reforça a progressão como "novas possibilidades", não só "número maior" — mitiga o mesmo risco de grind raso identificado em `08-analise-retencao-generos.md`. |
| **Saídas secretas e áreas escondidas** — *Super Mario World* tem 96 saídas (contando as secretas), recompensando quem explora fora do caminho óbvio com atalhos e áreas bônus. [mariowiki.com](https://www.mariowiki.com/Secret_exit), [Gamerant](https://gamerant.com/super-mario-world-hidden-areas/) | Cada região do MVP deve ter **pelo menos 1 segredo não sinalizado** (um Mimo raro escondido fora do caminho principal, um atalho para a próxima região). Não é conteúdo extra caro de produzir — é reposicionar o mesmo tipo de objeto (casulo) num lugar menos óbvio. Alto retorno de "uau" por baixíssimo custo de desenvolvimento. |
| **Mundos tematicamente distintos** (floresta, deserto, gelo...) — cada mundo de Mario tem identidade visual e regras próprias. [mariowiki.com](https://www.mariowiki.com/Secret_exit) | Já estava implícito no MVP (regiões desbloqueadas por progresso); fica explícito agora como regra de design: cada região futura (pós-MVP) deve ter identidade visual e um pequeno "twist" de mecânica próprio, não ser uma repintura da região anterior. |

## 2c. Síntese de 5 franquias Nintendo (pedido do usuário: ampliar além de Mario)

O usuário pediu para estudar especificamente **por que o loop funciona** em 5 franquias, sem copiar personagens/estética. Cada uma resolve um problema de design diferente do nosso projeto — a síntese abaixo mapeia cada uma a um sistema concreto do GDD, evitando sobreposição entre elas:

| Franquia | O que estudar (não copiar) | Sistema concreto em *Mimo World* |
|---|---|---|
| 🥇 **Pokémon** | Loop Encontrar → Capturar → Descobrir → Completar coleção → Evoluir; a explosão emocional de achar algo raríssimo ("MEU DEUS, EU ACHEI"); variantes/shiny; exclusividade regional incentivando troca | **Já é o coração do jogo**: momento de reveal (seção 5), Bestiary com % de completude (seção 6), variações por raridade. Trocas entre jogadores ficam fora do MVP, mas o design não fecha a porta para depois (D007/D011). |
| 🥈 **Animal Crossing** | O jogador não é lembrado "continue jogando" — ele *quer* deixar seu espaço/personagem mais bonito, visitar o espaço dos amigos, colecionar móveis/roupas | Reforça e **expande** o "espaço de exibição pessoal" (antes tratado como leve/secundário) para um sistema de **personalização de personagem e de um pequeno espaço pessoal** (ver seção 6b, nova) — sem virar um jogo de decoração completo tipo Adopt Me, mas mais robusto que a v2. |
| 🥉 **Mario Odyssey** | Curiosidade como mecânica: "o que será que tem ali?" — ver algo estranho ao longe, ir até lá, descobrir uma área nova | Já coberto por 2b (segredos, kishōtenketsu) — reforçado aqui como regra geral de level design: toda região deve ter pelo menos 1 elemento visível ao longe que gera a pergunta "o que é aquilo?" antes do jogador chegar perto. |
| ⭐ **Kirby** | Personagem instantaneamente reconhecível e fofo — a reação de "QUE FOFO" acontece antes de qualquer explicação de mecânica | **Vira um critério de arte, não de sistema**: cada Mimo precisa ter uma silhueta simples e reconhecível à distância (mesmo princípio de legibilidade visual do Kirby) — registrado como diretriz para a Fase de arte/protótipo, não implementável ainda na Fase 1. |
| ⭐ **Pikmin** | Criaturas pequenas com personalidades/comportamentos distintos por tipo, exploração de um mundo pequeno em escala | Cada "tipo elemental" de Mimo (a definir na arte) deve ter um **comportamento visível diferente** no mundo (ex: um Mimo tímido foge, um Mimo curioso se aproxima, um Mimo dorminhoco só aparece em certos horários) — mecânica leve, gera variedade de método de descoberta (reforça o princípio Power Moons de 2b) sem exigir IA/comportamento complexo no MVP. |

### O gatilho social de curiosidade (explicitado a pedido do usuário)

> "Aquele jogador tem uma criatura que eu nunca vi. Como ele conseguiu isso?"

Este é um **Return Loop** e um **Social Loop** ao mesmo tempo, e fica explícito como requisito de design: o espaço de exibição pessoal (seção 6b) precisa ser **visível a outros jogadores** (mesmo que de forma simples no MVP, tipo um "cartão de perfil" com os 3 Mimos mais raros do jogador), para que a descoberta de alguém vire gatilho de meta para outro jogador — sem exigir sistema de visita completo tipo Animal Crossing no MVP.

## 2d. Estrutura viral: por que alguns jogos Roblox geram vídeo/conteúdo espontâneo

O usuário pediu para olhar especificamente para os jogos que hoje dominam Roblox por visitas/CCU e geram conteúdo orgânico em TikTok/YouTube (Steal a Brainrot, Grow a Garden, Adopt Me, Brookhaven, Dress to Impress, 99 Nights, MM2) e perguntou o que os torna compartilháveis, não só jogáveis. Pesquisa confirma: **não existe um gênero vencedor único — existe uma estrutura vencedora**, e ela aparece tanto na versão "caótica" (Steal a Brainrot) quanto na versão "calma" (Grow a Garden), o que muda são os mecanismos específicos, não a fórmula geral.

### Os dois modelos extremos encontrados na pesquisa

| | **Steal a Brainrot** (modelo adversarial) | **Grow a Garden** (modelo cooperativo) |
|---|---|---|
| Mecânica central | Roubar Brainrots de outros jogadores: quem rouba fica lento, perde itens, e o dono é alertado — qualquer jogador pode atacar o ladrão para devolver o item ao dono original. [u7buy.com](https://www.u7buy.com/blog/steal-a-brainrot-game-mechanics/) | Clima muda a chance de mutação das plantas (chuva/tempestade aumentam mutações raras, algumas multiplicam o valor em 100-135x); eventos administrados introduzem mutações exclusivas por tempo limitado; clima varia por servidor, incentivando trocar de servidor. [bluestacks.com](https://www.bluestacks.com/blog/game-guides/roblox/rl-gag-weather-mutations-guide-en.html), [pcgamesn.com](https://www.pcgamesn.com/grow-a-garden/mutations) |
| Recorde de CCU | **25 milhões** (recorde histórico da Roblox, set/2025) — "o jogo mais jogado da história" no pico. [Wikipedia](https://en.wikipedia.org/wiki/Steal_a_Brainrot) | **21,6-22,3 milhões** (jul-ago/2025) — sem nenhuma mecânica de PvP/perda. |
| Por que gera vídeo | Momentos de perda/ganho imprevisíveis e de alto risco emocional — "ELE ROUBOU MEU BRAINROT" é inerentemente dramático. | Momentos de sorte/descoberta ("consegui uma mutação de 135x!") + estética simplesmente bonita de mostrar. |
| Risco de design | Mecânica adversarial gera atrito real entre jogadores (frustração, sensação de injustiça, moderação de conflito) — exige suporte à comunidade que um solo dev não tem capacidade de sustentar. | Nenhum atrito entre jogadores — todo o "caos" vem do ambiente (clima, eventos), não de outro jogador. |

**Conclusão desta pesquisa, antes de aplicar ao GDD**: a fórmula viral **não depende** de uma mecânica de PvP/roubo — Grow a Garden prova isso na prática, com CCU quase idêntico ao Steal a Brainrot sem nenhum atrito entre jogadores. Dado que este projeto já estabeleceu como pilar "liberdade sem pressão, sem manipulação" (D013, seção 2, princípio Animal Crossing; `07-hipoteses.md` H2/H4), **a recomendação é seguir o modelo Grow a Garden** (caos ambiental/de evento, não caos entre jogadores) — ver pergunta ao usuário no final desta seção antes de fechar isso como decisão.

### Sistemas concretos recomendados (inspirados nos jogos pesquisados, sem copiar assets)

| Sistema | Inspiração | Como funciona em *Mimo World* | Fase do roadmap |
|---|---|---|---|
| **Clima que muda chance de mutação** | Grow a Garden | Clima da região (chuva mágica, névoa, "noite de aurora") altera temporariamente a chance de casulo especial ou desbloqueia uma variação exclusiva daquele clima — reaproveita o sistema de raridade já existente, só adiciona um multiplicador contextual. | Compatível com o MVP (seção 6, "eventos ambientais") — é a mesma "chuva de estrelas" já prevista, só formalizada com mais variações de clima. |
| **Evento server-wide cooperativo** ("Mimo Lendário avistado") | Grow a Garden (eventos administrados) + Roblox Dig (boss com marcador no mapa) | Aviso no topo da tela + marcador no mapa quando um Mimo raríssimo aparece no servidor; jogadores convergem para a área; recompensa compartilhada entre quem chegou a tempo (não é "quem pega primeiro leva tudo" — reduz atrito). [destructoid.com](https://www.destructoid.com/roblox-dig-boss-guide/) | Fase 6 (Social/Multiplayer) — mecanicamente simples (spawn especial + broadcast), mas depende de já ter jogadores simultâneos suficientes para fazer sentido, por isso pós-MVP. |
| **Hall of Fame / status** | Adopt Me (status social), pedido direto do usuário | Placar simples: "1º jogador a encontrar [Mimo Lendário]", "1º a completar o Bestiary da região", "maior coleção do servidor" — tecnicamente barato (`OrderedDataStore`), alto impacto de status social. | Fase 4 (Progressão) ou Fase 6 — baixa complexidade técnica, pode entrar cedo. |
| **Eventos-mistério (não anunciados)** | Reação de criadores de conteúdo tipo "SECRET EVENT FOUND" | Mudanças ambientais sutis e não explicadas (céu muda de cor, música diferente, NPC comporta-se de forma diferente) que sinalizam um evento raro prestes a acontecer — gera curiosidade e vídeo de "o que está acontecendo?" sem exigir sistema novo (reaproveita FX e o clima acima). | Fase 9 (Beta)/11 (Crescimento) — é uma tática de LiveOps (`08-analise-retencao-generos.md`, "Update Loop"), não um sistema a construir agora. |
| **Design de thumbnail/ícone legível em segundos** | Pedido direto do usuário + pesquisa de mercado | Um sujeito só, alto contraste (>4:1), cor saturada, ação/expressão clara, pouco ou nenhum texto — legível a 150×150px. Ícones assim aumentam CTR em 30-50%, podendo dobrar/triplicar a taxa de cliques. [reelmind.ai](https://reelmind.ai/blog/roblox-how-to-make-thumbnails-designing-clickable-previews-for-gaming-content), [Roblox Creator Hub](https://create.roblox.com/docs/production/publishing/thumbnails) | Não é sistema de jogo — é **restrição de arte** a aplicar desde os primeiros designs de Mimo (reforça o critério "Kirby" já em 2c: cada Mimo precisa ter silhueta simples e reconhecível, isso é literalmente o que faz um bom thumbnail funcionar). |

### Pergunta em aberto: adotamos alguma forma de tensão/rivalidade entre jogadores?

O usuário observou corretamente que "situações que geram vídeo" muitas vezes vêm de **conflito**, não só de coleção pacífica. A pesquisa mostra que dá para gerar caos de conteúdo sem PvP direto (clima + eventos + sorte já fazem isso, ver Grow a Garden). Mas existe uma versão intermediária, mais segura que "roubar item de outro jogador", que pode valer a pena considerar mais adiante (pós-MVP, Fase 6+): uma **corrida** pelo Mimo Lendário do evento server-wide (todos veem o mesmo Mimo raro aparecer, é uma disputa de quem chega primeiro, mas ninguém perde o que já tem) — cria tensão e narrativa ("ELE CONSEGUIU ANTES DE MIM!") sem o risco de atrito/moderação de um sistema de roubo de inventário.

**Isso fica registrado como decisão em aberto, não implementada agora** — ver pergunta ao usuário no final do documento.

## 3. Por que o jogador continua jogando

- **Primeiros 5 minutos**: entra num pequeno vale/clareira mágica, vê algo brilhando (casulo), toca — sem tutorial de texto, a ação ensina. Primeira descoberta de Mimo em minutos.
- **Primeiros 15 minutos**: entende o Bestiary (coleção com % de completude), percebe que existem variações raras do mesmo Mimo (dourado, cristal, neon...).
- **Amanhã**: falta pouco para completar uma seção do Bestiary da região; moeda/recursos acumulados o suficiente para o próximo item de progressão.
- **Semanas depois**: perseguir variações raras específicas, desbloquear novas regiões, eventualmente eventos sazonais com Mimos exclusivos por tempo limitado (fora do MVP, mas already compatível com a estrutura).

## 4. Core Loop

```
JOGADOR ENTRA num pequeno vale/clareira mágica
   ↓
EXPLORA a região atual (visual rico, tipo diorama — princípio "Hakoniwa")
   ↓
ENCONTRA um casulo/rastro/Mimo tímido (método varia — princípio "Power Moons", ver 2b)
   ↓
TOCA/DESPERTA (verbo único do jogo, ensinado pela própria interação — princípio "verbo primário")
   ↓
CASULO COMUM → revela recurso simples (moeda/material)
   OU
CASULO ESPECIAL (chance baseada em raridade) → "Algo está se mexendo aqui dentro..."
   ↓
REVEAL → Mimo descoberto, com raridade e variação visual (dourado/cristal/neon/arco-íris)
   ↓
ENTRA NO BESTIARY (registra descoberta, % de completude da região)
   ↓
JOGADOR DECIDE: continuar explorando esta região OU melhorar ferramenta/habilidade
   ↓
FERRAMENTA/HABILIDADE MELHOR → acesso a região nova → casulos/Mimos mais raros
   ↓
RETORNO no dia seguinte: Bestiary incompleto + curiosidade sobre a próxima região
```

Estrutura já validada em `08-analise-retencao-generos.md` (score 4.55/5); ambientação revisada por `11-pivot-fofura-colecao-skins.md` e D013.

## 4b. ⚠️ Core Gameplay: hipótese ainda não validada (D022-D024)

**O que já está resolvido neste GDD**: retenção (loops, `08-analise-retencao-generos.md`), coleção/raridade (Pokémon), personalização/skins (Animal Crossing + monetização ética), eventos/viralização (2d), social (cartão de perfil). Tudo isso é a **estrutura ao redor do jogo**.

**O que ainda não está resolvido**: se a ação central — "tocar/despertar" um casulo — é **divertida por si só**, minuto a minuto, mesmo nas dezenas de vezes em que o resultado é comum, não raro. O usuário identificou corretamente que o risco real é o jogo virar:

> andar → encontrar Mimo → clicar → ganhou Mimo → repetir

Isso seria "pet simulator disfarçado de mundo mágico" — a coleção/skins mascarando uma interação de clique vazia, em vez de amplificar uma interação que já é boa sozinha. **Coleção e skins devem amplificar a diversão da ação central, não substituí-la.**

### Princípio orientador (pesquisa de "game feel"/"juice")

Um jogo parece bom quando três coisas se alinham: o controle responde instantaneamente ao toque, toda ação produz um feedback legível, e uma camada de polimento (squash-and-stretch, partículas, som) torna cada interação satisfatória — **isso vale mesmo quando não há recompensa rara nenhuma envolvida**. [egmatic.com](https://egmatic.com/blog/how-to-make-your-game-feel-good), [designthegame.com](https://www.designthegame.com/learning/tutorial/how-tactile-interactions-game-juice-drive-player-engagement) A filosofia "toy-first" de Miyamoto (já citada em 2) reforça o mesmo ponto: o protótipo mais antigo de um jogo bom costuma ser literalmente um brinquedo testável, sem pontuação nem objetivo, que já é agradável de mexer. [designthegame.com](https://www.designthegame.com/learning/tutorial/how-tactile-interactions-game-juice-drive-player-engagement)

### Candidatos de interação central a testar no Protótipo (Fase 2) — nenhum decidido ainda

Estas são hipóteses concretas para comparar no protótipo, não uma escolha fechada. Todas mantêm o verbo único já definido ("tocar/despertar", seção 2b) mas variam **como** essa ação é fisicamente executada:

1. **Toque físico com reação (squash-and-stretch)**: o casulo reage fisicamente ao toque — treme, quica, se deforma — como estourar bolha de plástico-bolha. Simples de prototipar, testa se só a física de reação já é satisfatória.
2. **Coaxar por ritmo/tempo**: uma pequena sequência de toque no tempo certo "convence" o Mimo a sair (parecido com o timing de pesca do Fisch, mas aplicado à revelação, não à captura). Adiciona uma pequena habilidade sem virar minigame complexo.
3. **Escavar/limpar**: o jogador precisa "escovar" ou remover camadas mágicas (poeira, vinhas, cristal fino) até o casulo se abrir sozinho — interação repetitiva mas com feedback progressivo (cada camada removida muda visualmente o objeto).
4. **Empurrar/rolar**: casulos podem ser fisicamente empurrados/rolados pelo cenário antes de abrir (inspirado em manipulação física tipo Katamari) — testa se a manipulação do objeto no mundo, não só o toque final, já é agradável.
5. **Arremesso preciso** (D030): o jogador mira e arremessa a ferramenta (ex: um kunai mágico) no casulo, com feedback de acerto (whoosh + impacto visual/sonoro) — testa se a mira/timing do arremesso já é satisfatória sozinha, independente do que é revelado.

**Critério de validação no protótipo**: pedir para alguém repetir a ação 15-20 vezes seguidas **sem receber nada raro** e observar se ainda parece agradável, ou se só a expectativa de raridade estava carregando a diversão. Se for a segunda opção, a interação escolhida precisa mudar antes de seguir para o Core Gameplay (Fase 3) completo.

## 5. O momento de descoberta (mantido do GDD v1, só muda o material)

1. Casulo/objeto mágico comum se comporta normalmente (abre, entrega recurso simples).
2. Casulo "especial" (brilho sutil diferente, sem entregar o que é antes de abrir) dispara: **"✨ Algo está se mexendo aqui dentro..."**
3. Pausa curta / animação de abertura, charme visual (não é só uma barra de progresso — reforça o princípio de emoção central de Miyamoto).
4. **"🌟 Você encontrou um Mimo [Nome]! Variação: Dourada — Raridade: Épica"** — efeito visual/sonoro proporcional à raridade.
5. Entrada automática no Bestiary.

## 6. Sistemas do MVP (escopo mantido de D011, só a ambientação muda)

| Sistema | Escopo do MVP |
|---|---|
| Área jogável | 1 região: "Vale das Primeiras Luzes" (placeholder de nome) |
| Materiais/recursos simples | ~20-30 tipos (flores, pedras mágicas, essências — substituindo "minérios") |
| Mimos (criaturas colecionáveis) | ~10-15 espécies-base |
| Variações visuais por Mimo | 4-5 (ex: Comum, Dourada, Cristal, Neon, Arco-íris) — mapeadas aos níveis de raridade |
| Ferramenta/habilidade evolutiva | 3-5 tiers (ex: "Toque Mágico" que evolui — substitui a picareta, mesma função de progressão) |
| Regiões | Bloqueadas por tier de ferramenta/habilidade (progressão espacial visível) |
| Coleção | Bestiary com % de completude por região |
| Personalização de personagem (leve) | Poucos itens cosméticos simples desbloqueados pela coleção (ex: um acessório por marco do Bestiary) — ver 6b |
| Espaço/cartão de exibição pessoal | Mostra os 3-5 Mimos mais raros do jogador, **visível a outros jogadores** — gatilho do loop social de curiosidade (2c) |
| Métodos de descoberta (variedade) | Mínimo 2-3 métodos diferentes de encontrar um Mimo na região (casulo escondido, rastro de brilho para seguir, Mimo tímido que se aproxima) — princípio Power Moons (2b), antídoto direto ao grind |
| Comportamento por tipo de Mimo | Cada tipo elemental tem 1 comportamento visível simples (foge, se aproxima, só aparece em certos horários) — princípio Pikmin (2c), gera variedade sem exigir IA complexa |
| Segredo da região | 1 Mimo raro ou atalho escondido fora do caminho óbvio (princípio de saídas secretas de *Super Mario World*, 2b) |
| Eventos ambientais | Eventos simples (ex: "chuva de estrelas" temporária que aumenta chance de casulo especial) |

**Explicitamente fora do MVP**: 2ª região, sistema de troca entre jogadores, sistema de decoração completo de casa/ambiente (tipo Adopt Me), visitar o espaço de outros jogadores (fica só o "cartão" visível, não visita completa), eventos sazonais com itens exclusivos permanentemente removidos, PvP/roubo entre jogadores.

**Fora do MVP, mas já desenhado para ser compatível depois (ver 2d)**: eventos server-wide cooperativos ("Mimo Lendário avistado"), Hall of Fame/placar de status, eventos-mistério de LiveOps, variações de clima adicionais além do evento simples do MVP — todos reaproveitam os mesmos sistemas de dados (raridade, spawn, Bestiary) já no MVP, então não exigem redesenho de arquitetura quando forem implementados (Fases 4/6/9 do roadmap).

### 6a-bis. Reconfirmação do MVP enxuto (D019, checkpoint 1)

O usuário reforçou explicitamente que o MVP precisa provar **uma única coisa**:

> "Uma pessoa entra, encontra um Mimo, acha outro, vê uma criatura rara e pensa: quero continuar."

Confirmado explicitamente **fora do MVP** (reforça e simplifica a lista acima, sem contradizê-la): Hall of Fame (fica para depois, mesmo que tecnicamente simples), eventos-mistério elaborados, dezenas de biomas (1 região é suficiente para provar o loop), economia avançada, troca entre jogadores, sistemas grandes de pets (o MVP tem só o essencial de coleção, não um sistema de "cuidar do pet"), centenas de skins (poucas variantes bem desenhadas, conforme 1b).

Se o MVP provar essa única frase, o resto do universo (regiões, eventos, Hall of Fame, personalização profunda) é construído depois, com validação real de jogadores — não antes.

## 6b. Personalização — o que pegamos de Animal Crossing, sem virar Adopt Me

Diferença deliberada em relação a um sistema de decoração completo:

- **O que entra no MVP**: 1-2 slots de acessório cosmético no personagem (ex: um chapéu, uma auréola) desbloqueados por marcos do Bestiary — não comprados, **conquistados** pela coleção (reforça "obtidas jogando" da divisão de monetização, seção 8); um "cartão de perfil" simples mostrando os Mimos mais raros.
- **O que fica para depois** (Fase 4+ do roadmap, fora do MVP): decoração de um espaço pessoal completo, visita ao espaço de amigos, catálogo grande de roupas/móveis — isso é essencialmente o produto central do Adopt Me (`11-pivot-fofura-colecao-skins.md`), e replicá-lo cedo demais either estoura o escopo do solo dev either garante comparação direta com o maior jogo do gênero.
- **Por que isso ainda entrega a emoção de Animal Crossing** mesmo pequeno: a motivação "quero deixar meu personagem mais bonito" já funciona com poucos itens bem desenhados, desde que sejam **visíveis a outros jogadores** — é a visibilidade social que gera o efeito, não o tamanho do catálogo.
- **Skins de ferramenta (D030)**: além de cosméticos de personagem, a ferramenta evolutiva (seção 6) pode ter skins visuais (ex: kunai mágico, cajado, pincel encantado — ver `12-conceitos-mimo.md`) — mesma regra ética (cosmético, preço fixo ou conquistado, sem afetar progresso).

## 7. Loops completos (framework de `08-analise-retencao-generos.md`, aplicado à nova ambientação)

- **Core Loop**: explorar → encontrar casulo → abrir → recurso ou descoberta.
- **Progression Loop**: recursos acumulados → ferramenta/habilidade melhor → acesso a região nova.
- **Meta Loop**: completar o Bestiary da região atual; perseguir variações raras específicas (princípio Pokémon: alegria da completude).
- **Return Loop**: reveal pendente + Bestiary incompleto + curiosidade sobre a próxima região.
- **Social Loop** (leve no MVP): mostrar Mimos raros/variações no espaço de exibição pessoal — sem sistema de troca no MVP.
- **Collection Loop**: Bestiary com raridades e variações visuais — coração do jogo, reforçado pela filosofia Pokémon.
- **Update Loop**: nova região = novo lote de materiais/Mimos (adição de dados, sustentável por solo dev).
- **Monetization Loop**: candidatos para Fase 7 — variações cosméticas de **preço fixo, sem aleatoriedade** (não afetam progresso, só aparência, resultado visível antes da compra), eventos sazonais com Mimos exclusivos por tempo limitado sem pressão de urgência artificial (ver seção 8 para as regras éticas completas, D020 — a antiga ideia de "sorte extra" paga foi removida por ser mecânica adjacente a loot box).

## 8. Divisão de monetização (confirmada pelo usuário, aplicada ao tema, com salvaguardas éticas — D020)

### Contexto que motiva as salvaguardas (não é só preferência, é risco real e atual)

O usuário pediu para evitar mecânicas predatórias por ser um jogo mirando crianças. A pesquisa confirma que isso não é excesso de cautela — é o centro de uma crise regulatória acontecendo **agora mesmo, na própria Roblox**:

- **Roblox está sob investigação em múltiplas frentes em 2026** por monetização voltada a crianças: a Procuradoria-Geral da Flórida abriu investigação criminal (out/2025) chamando a plataforma de "terreno fértil para predadores" que lucra com crianças; organizações de defesa infantil (Fairplay, NCOSE) apresentaram queixa formal à FTC americana (mai/2026) alegando design manipulativo, mecânicas viciantes e monetização exploratória; a autoridade de concorrência da Itália abriu investigação (jan/2026) especificamente sobre escolhas de design que empurram menores a gastar muito. [Fortune](https://fortune.com/2026/05/20/exclusive-advocacy-groups-file-complaint-roblox-manipulative-design/), [ingamenews.com](https://www.ingamenews.com/2026/05/roblox-platform-safety-and-monetization.html)
- **Loot boxes (mecânica de pagar por chance, sem garantia) são proibidas ou fortemente restritas** em vários países: Bélgica criminaliza loot boxes pagas (multas de até €800.000, possível prisão); Holanda tem projeto de lei em tramitação para enquadrá-las como jogo de azar independente do jogo em si. [Programming Insider](https://programminginsider.com/loot-boxes-regulation-and-where-the-line-sits-in-2026/), [egamersworld.com](https://egamersworld.com/blog/lootboxes-law-in-the-netherlands-GvdW3zreJ5)
- **Pesquisa acadêmica (CHI 2025)** documenta que design predatório funciona combinando várias táticas ao mesmo tempo (FOMO + aversão à perda + saliência de UI) especificamente porque crianças são mais vulneráveis cognitiva e emocionalmente a isso — não é força bruta de uma mecânica isolada, é a combinação. [ACM CHI 2025](https://dl.acm.org/doi/10.1145/3706598.3713170)
- **Padrão ético/de mercado já estabelecido**: microtransações cosméticas de **preço fixo, sem aleatoriedade**, são consideradas a alternativa aceitável — o jogador sabe exatamente o que está comprando antes de pagar. [daydreamsoft.com](https://www.daydreamsoft.com/blog/ethical-monetization-system-design-earning-revenue-without-losing-player-trust)

### Regras de monetização deste projeto (não-negociáveis, D020)

- ❌ **Proibido**: loot boxes pagas ou qualquer mecânica de "pagar por chance" sem garantia do item (isso inclui a ideia anterior de "sorte extra" temporária mencionada em versões antigas deste GDD e em `01-pesquisa-mercado.md`/`09-temas-nichos.md` — **removida/substituída**, ver abaixo).
- ❌ **Proibido**: pressão de urgência artificial ("só hoje!", contadores regressivos agressivos, notificações insistentes).
- ❌ **Proibido**: qualquer mecânica que gere medo de perder dinheiro/progresso já obtido.
- ❌ **Proibido**: manipulação de FOMO agressiva (diferente de exclusividade sazonal simples, ver abaixo — a diferença é ausência de pressão de urgência artificial).
- ✅ **Permitido**: item cosmético de **preço fixo, comprado diretamente, com resultado garantido e visível antes da compra**.
- ✅ **Permitido**: exclusividade sazonal simples (item de evento não volta tão cedo) **sem** contagem regressiva agressiva ou linguagem de pressão — o jogador vê o item, decide se quer, compra se quiser.
- ✅ **Sempre opcional**: o core loop completo (descoberta, coleção, progressão) precisa ser jogável e satisfatório sem nenhuma compra.

| Categoria | Exemplos aplicados a este tema |
|---|---|
| Obtidas jogando | Mimos base, variações comuns/raras naturais, itens de Bestiary, acessórios de exibição conquistados por marco (1b/6b) |
| Premium (cosmético, preço fixo, sem aleatoriedade) | Efeitos visuais especiais de descoberta, variações cosméticas extras **compradas diretamente** (não por chance), acessórios de exibição exclusivos — jogador vê exatamente o que está comprando |
| Eventos sazonais (exclusividade simples, sem pressão) | Mimos/variações exclusivas por tempo limitado, sem contadores regressivos agressivos nem notificações insistentes — a exclusividade em si já é suficiente como gancho (efeito documentado em `01-pesquisa-mercado.md`, filosofia Pokémon) |

Regra mantida de D009/roadmap: nada disso é implementado agora — fica para a Fase 7, depois da economia balanceada, e **toda decisão de monetização da Fase 7 deve ser checada contra as regras desta seção antes de implementar**.

## 9. Riscos de design já mitigados por este GDD

- **Risco de grind repetitivo**: mitigado pela variação de reveal + variações visuais ricas por Mimo (não é preciso centenas de espécies, só variações marcantes — princípio já validado em `09-temas-nichos.md` Opção B, reaproveitado aqui na forma de variantes coloridas).
- **Risco de pay-to-win**: Mimo é descoberto por exploração, variações cosméticas são a via de monetização principal, não vantagem de progresso.
- **Risco de colidir de frente com Adopt Me/Evomon/Knockout**: mitigado explicitamente em `11-pivot-fofura-colecao-skins.md` — sistema de exibição pessoal deliberadamente leve (não decoração completa), descoberta por casulo (não captura/batalha), variações aplicadas ao Mimo (não skins de avatar separadas).
- **Risco de escopo inchar**: seção 6 trava o que está e não está no MVP, igual ao GDD v1.

## 10. Estrutura Épico → Feature → Tarefa (atualizada para o novo tema)

```
ÉPICO: Exploração e Descoberta
  FEATURE: Região inicial (Vale das Primeiras Luzes)
    - [ ] Layout da região 1 (whitebox, sem arte final)
    - [ ] Casulos/objetos mágicos posicionados no mapa
    - [ ] Interação de abertura (toque/interação simples, sem tutorial de texto)
  FEATURE: Sistema de ferramenta/habilidade
    - [ ] 3-5 tiers definidos (chance de casulo especial / alcance / velocidade)
    - [ ] Checagem de tier necessário para acessar cada região

ÉPICO: Coleção
  FEATURE: Materiais e recursos simples
    - [ ] Tabela de dados de ~20-30 materiais com raridade
    - [ ] Lógica de chance de casulo especial (por raridade)
  FEATURE: Mimos (criaturas colecionáveis)
    - [ ] Tabela de ~10-15 Mimos com 4-5 variações visuais cada
    - [ ] Sequência de reveal (UI + som + animação, charme visual)
  FEATURE: Bestiary
    - [ ] UI de coleção com % de completude
    - [ ] Persistência via ProfileService (Fase 3 técnica, não Fase 1)
  FEATURE: Personalização e exibição pessoal (leve)
    - [ ] 1-2 slots de acessório cosmético desbloqueados por marco do Bestiary
    - [ ] Cartão de perfil com os 3-5 Mimos mais raros, visível a outros jogadores
    - [ ] Comportamento simples por tipo de Mimo (foge/aproxima/horário) — princípio Pikmin

ÉPICO: Economia (MVP mínimo)
  FEATURE: Uso de materiais simples
    - [ ] Valor/uso por raridade
    - [ ] Balanceamento inicial fonte (exploração) vs. sink (progressão de ferramenta)
```

Dependências: Exploração/Descoberta → Coleção → Economia (mesmo padrão de `04-roadmap.md`).

## 11. Critérios de aceitação do MVP

- Jogador consegue completar o loop completo sozinho: entrar → explorar → abrir casulo → recurso OU descoberta → progredir ferramenta → acessar nova região.
- Pelo menos 1 descoberta de Mimo acontece nos primeiros 15 minutos de teste manual, idealmente nos primeiros 5.
- Bestiary persiste corretamente entre sessões.
- Funciona em mobile (controles touch, UI legível em tela pequena) — D004.
- Nenhuma lógica de economia/coleção validada só no cliente (preparar terreno para D005/segurança).
- Onboarding acontece por interação, não por texto explicativo longo (princípio "ensinar jogando").

## 12. O que este GDD não resolve ainda

- Nome final do jogo (placeholder "Mimo World"), identidade visual/arte definitiva, design específico de cada Mimo.
- Números exatos de balanceamento (chances de raridade, custos de progressão) — vem na Fase 3/5 com testes reais.
- Design detalhado dos eventos ambientais ("chuva de estrelas") — mencionado, não especificado.
- Estratégia de monetização detalhada além da divisão de categorias (Fase 7).
- Validação da Direção 5 (Toy World) como tema alternativo — **descartada definitivamente** pelo usuário no Checkpoint 1 (D019), não será revisitada.

---

## Checkpoint 1 — APROVADO (2026-08-13), com ressalva ativa sobre Core Gameplay

```
FASE 0 — Pesquisa Estratégica ✅
CHECKPOINT 0 — aprovado ✅
FASE 1 — Conceito + nicho/tema + GDD ✅ (aprovado como BASE, não como final — ver ressalva)
CHECKPOINT 1 — APROVADO ✅ (D017-D021)
   ↓
FASE 1.5 — Validação Visual (obrigatória, critérios expandidos D023) + CONFIGURAÇÃO TÉCNICA (em paralelo, escopo restrito a infra/arquitetura — D022)
   ↓
PROTÓTIPO (Fase 2) — inclui validar o Core Gameplay como hipótese (D024, seção 4b)
```

Decisões do Checkpoint 1: modelo cooperativo confirmado (D016 fechada); Mimo elevado a personagem/marca do jogo com critérios de art direction (D017); regra de design "momento compartilhável" (D018); MVP reconfirmado enxuto, Toy World descartada definitivamente (D019); salvaguardas éticas de monetização infantil (D020); Fase 1.5 de validação visual criada (D021).

**Ressalva ativa do usuário, não resolvida por este GDD**: o Core Gameplay (interação minuto-a-minuto) é tratado como **hipótese**, não como sistema fechado — ver seção 4b. O GDD está aprovado como base para avançar, mas o usuário deixou explícito que não considera o gameplay "fechado" até essa hipótese ser testada no Protótipo. A Configuração Técnica está liberada, mas **escopada só para infraestrutura/arquitetura** (D022) — não para construir economia/monetização/conteúdo completos, que dependem da validação do Core Gameplay ainda pendente.

Nenhum código foi escrito, Roblox Studio não foi aberto ainda.
