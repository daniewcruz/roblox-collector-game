# Game Design Document (GDD) — Fase 1 (revisado, v4)

**Nome provisório**: *Mimo World* (placeholder — não decidido, trocar livremente)
**Gênero/estrutura**: Híbrido Coleta + Exploração (referência estrutural: Fisch — não cópia temática)
**Tema**: "Um pequeno mundo cheio de criaturas que você ainda não descobriu" — criaturas colecionáveis ("Mimos") reveladas a partir de casulos/sementes/bolhas mágicas encontradas explorando
**Referências de filosofia de design**: 5 franquias Nintendo estudadas por sistema — Pokémon (coleção/raridade/descoberta), Animal Crossing (personalização/decoração leve/social), Mario Odyssey (curiosidade/exploração), Kirby (fofura/legibilidade visual), Pikmin (criaturas com comportamento/exploração em mundo pequeno) — ver seções 2, 2b, 2c. **Sem copiar personagens, nomes, assets ou propriedade intelectual — só estrutura/filosofia de design.**
**Plataforma primária**: Mobile-first (80% das sessões Roblox são mobile — D004)
**Status**: Fase 1 (Conceito) — sem código, sem Roblox Studio aberto (D009)
**Histórico**: v1 usava tema "Mineração + Criaturas de Cristal" (D012); v2 trocou a ambientação para mundo mágico (D013); v3 incorporou princípios do Super Mario (D014, seção 2b); v4 amplia a referência para 5 franquias Nintendo e expande personalização/loop social de curiosidade (D015, seções 2c e 6b).

---

## 1. Pitch em uma frase

**Um pequeno mundo cheio de criaturas que você ainda não descobriu.** O jogador explora regiões encantadoras, encontra casulos/sementes mágicas escondidas, e ao abri-los descobre pequenas criaturas ("Mimos") com raridades e variações visuais únicas (dourada, cristal, neon, arco-íris...) — colecionando-as em um Bestiary, personalizando seu personagem/espaço pessoal com o que descobre, e desbloqueando novas regiões com ferramentas/habilidades melhores. (Reformulação de pitch pedida pelo usuário — D015, abandona de vez o enquadramento "jogo de mineração".)

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

**Explicitamente fora do MVP**: 2ª região, sistema de troca entre jogadores, sistema de decoração completo de casa/ambiente (tipo Adopt Me), visitar o espaço de outros jogadores (fica só o "cartão" visível, não visita completa), eventos sazonais com itens exclusivos permanentemente removidos, PvP.

## 6b. Personalização — o que pegamos de Animal Crossing, sem virar Adopt Me

Diferença deliberada em relação a um sistema de decoração completo:

- **O que entra no MVP**: 1-2 slots de acessório cosmético no personagem (ex: um chapéu, uma auréola) desbloqueados por marcos do Bestiary — não comprados, **conquistados** pela coleção (reforça "obtidas jogando" da divisão de monetização, seção 8); um "cartão de perfil" simples mostrando os Mimos mais raros.
- **O que fica para depois** (Fase 4+ do roadmap, fora do MVP): decoração de um espaço pessoal completo, visita ao espaço de amigos, catálogo grande de roupas/móveis — isso é essencialmente o produto central do Adopt Me (`11-pivot-fofura-colecao-skins.md`), e replicá-lo cedo demais either estoura o escopo do solo dev either garante comparação direta com o maior jogo do gênero.
- **Por que isso ainda entrega a emoção de Animal Crossing** mesmo pequeno: a motivação "quero deixar meu personagem mais bonito" já funciona com poucos itens bem desenhados, desde que sejam **visíveis a outros jogadores** — é a visibilidade social que gera o efeito, não o tamanho do catálogo.

## 7. Loops completos (framework de `08-analise-retencao-generos.md`, aplicado à nova ambientação)

- **Core Loop**: explorar → encontrar casulo → abrir → recurso ou descoberta.
- **Progression Loop**: recursos acumulados → ferramenta/habilidade melhor → acesso a região nova.
- **Meta Loop**: completar o Bestiary da região atual; perseguir variações raras específicas (princípio Pokémon: alegria da completude).
- **Return Loop**: reveal pendente + Bestiary incompleto + curiosidade sobre a próxima região.
- **Social Loop** (leve no MVP): mostrar Mimos raros/variações no espaço de exibição pessoal — sem sistema de troca no MVP.
- **Collection Loop**: Bestiary com raridades e variações visuais — coração do jogo, reforçado pela filosofia Pokémon.
- **Update Loop**: nova região = novo lote de materiais/Mimos (adição de dados, sustentável por solo dev).
- **Monetization Loop**: candidatos para Fase 7 — variações cosméticas extras (não afetam progresso, só aparência), "sorte extra" temporária sem garantir raridade (evita pay-to-win), eventos sazonais com Mimos exclusivos por tempo limitado (mencionado pelo usuário como estratégia de monetização — ver `09-temas-nichos.md` e mensagem do usuário sobre divisão "obtidas jogando / premium / eventos").

## 8. Divisão de monetização (confirmada pelo usuário, aplicada ao tema)

| Categoria | Exemplos aplicados a este tema |
|---|---|
| Obtidas jogando | Mimos base, variações comuns/raras naturais, itens de Bestiary, alguns acessórios de exibição |
| Premium (cosmético, não afeta progresso) | Efeitos visuais especiais de descoberta, variações cosméticas extras, acessórios de exibição exclusivos |
| Eventos sazonais | Mimos/variações exclusivas por tempo limitado (ex: tema de inverno, tema lunar) — alguns deixam de estar disponíveis depois, criando valor de colecionador (efeito documentado em `01-pesquisa-mercado.md` e reforçado pela filosofia Pokémon de exclusividade) |

Regra mantida de D009/roadmap: nada disso é implementado agora — fica para a Fase 7, depois da economia balanceada.

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
- Validação da Direção 5 (Toy World) como tema alternativo — descartada por ora a favor desta síntese, mas não pesquisada a fundo (`11-pivot-fofura-colecao-skins.md`, pergunta 3).

---

## Checkpoint 1 — pronto para aprovação (revisado)

```
FASE 0 — Pesquisa Estratégica ✅
CHECKPOINT 0 — aprovado ✅
FASE 1 — Conceito + nicho/tema + GDD ✅ (revisado nesta versão)
CHECKPOINT 1 — aguardando aprovação do usuário
```

Nenhum código foi escrito, Roblox Studio não foi aberto, nenhuma ferramenta técnica (MCP/Rojo) foi instalada — conforme D009.

**Pergunta para o Checkpoint 1**: este GDD v4 (mundo mágico + Mimos, síntese de 5 franquias Nintendo, personalização leve + gatilho social de curiosidade, sem cópia de IP) está aprovado para avançarmos à Configuração Técnica (MCP Server + Rojo + Roblox Studio) e depois ao Protótipo (Fase 2)? Ou há algo a ajustar antes — por exemplo, nome do jogo/dos "Mimos", ou revisitar a Direção 5 (Toy World)?
