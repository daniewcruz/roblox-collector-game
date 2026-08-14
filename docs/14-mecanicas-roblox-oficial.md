# Pesquisa de Documentação Oficial da Roblox: Mecânica, Jogabilidade, Prototipagem, Onboarding

> Pedido do usuário: consumir a documentação oficial já existente sobre mecânica/jogabilidade no Roblox, em vez de confiar só em raciocínio próprio. Fonte: [Roblox Creator Hub — pasta production/game-design](https://github.com/Roblox/creator-docs/tree/main/content/en-us/production/game-design) (17 documentos oficiais).

## Inventário completo da pasta oficial de game design

| Documento | Tópico |
|---|---|
| analytics-essentials.md | Insights orientados a dados |
| balance-virtual-economies.md | Design de economia virtual |
| content-updates.md | Estratégia de conteúdo contínuo |
| contextual-purchases.md | Mecânicas de compra in-game |
| **core-loops.md** | **Ciclos fundamentais de jogabilidade** |
| design-for-roblox.md | Princípios de design específicos da plataforma |
| introduction-to-quest-design.md | Fundamentos de design de missão |
| liveops-essentials.md / liveops-planning.md | Operação ao vivo (já usado em `08-analise-retencao-generos.md`) |
| monetization-foundations.md | Fundamentos de monetização |
| **onboarding.md / onboarding-techniques.md** | **Sistemas de introdução do jogador** |
| **prototyping.md** | **Abordagens de desenvolvimento e teste** |
| season-pass-design.md | Estrutura de conteúdo sazonal |
| subscription-design.md | Modelos de assinatura |
| ui-ux-design.md | Design de interface |

Os três em negrito são os mais diretamente aplicáveis ao momento atual do projeto (fechando a Fase 1, entrando na Configuração Técnica/Protótipo) — detalhados abaixo.

## 1. Core Loop — framework oficial de 3 partes

A [documentação oficial](https://create.roblox.com/docs/production/game-design/core-loops) divide todo core loop em 3 seções:

1. **Interação minuto-a-minuto**: as ações constantes que formam a base do jogo, variam por gênero (ex: em um RPG de ação, é a exploração).
2. **Conjunto de ações mais repetidas**: a mecânica definidora do jogo, que emerge da interação de base (ex: combate num RPG de ação, incluindo sub-ações como esquivar/atacar/bloquear).
3. **Motor de progressão**: o que evita estagnação — "sem sistema de progressão, um jogo fica repetitivo, chato e raso".

### Aplicação ao nosso GDD (validação cruzada, não invenção nova)

| Camada oficial | O que já temos (`10-gdd.md`) |
|---|---|
| Interação minuto-a-minuto | Explorar a região, procurar casulos/rastros |
| Ação mais repetida (mecânica definidora) | "Tocar/despertar" um casulo — ainda hipótese não validada (seção 4b) |
| Motor de progressão | Ferramenta evolutiva + Bestiary + acesso a novas regiões |

Isso confirma que a estrutura do nosso core loop já está alinhada ao framework oficial da própria Roblox — a lacuna real não é estrutural, é a qualidade de execução da camada 2 (por isso a seção 4b trata isso como hipótese a testar, não como resolvido).

## 2. Prototipagem — processo oficial recomendado

Da [documentação oficial](https://create.roblox.com/docs/production/game-design/prototyping):

- **O que testar primeiro, nesta ordem**: Core Loop → UI/UX (controles/menus intuitivos) → Regras do jogo (respawn, posicionamento, fatores variáveis) → Casos extremos (como jogadores tentam "quebrar" o jogo).
- **Princípio central**: "prototipagem deve ser rápida, atingindo certos aspectos da feature testada, não a feature inteira" — confirma exatamente a abordagem já adotada em `10-gdd.md` seção 4b (testar 6 candidatos de interação isoladamente, não construir o Core Gameplay completo de uma vez).
- **Dois métodos**: **Paper Prototyping** (iteração mais rápida para sistemas/UI, sem código) e **Studio Prototyping** (testa viabilidade técnica real, permite playtesting rápido com assets reutilizáveis).
- **Validação de diversão**: múltiplas sessões de playtest com a equipe, compartilhar com amigos/família/redes sociais para perspectiva nova, iterar até satisfeito.
- **Por que importa**: evita "erros custosos de detectar falhas de design tarde no desenvolvimento" — a mesma lógica já usada para justificar D021 (teste visual antes de arte final) e D024 (validar Core Gameplay antes de construir tudo).

### Aplicação prática recomendada para a Fase 2

Considerar começar os 6 candidatos de interação (seção 4b) como **Paper Prototyping** ou protótipo mínimo no Studio (sem arte, whitebox) antes de qualquer produção — está alinhado com o que já planejamos, mas a documentação oficial reforça: teste **rápido e estreito**, não a feature inteira.

## 3. Onboarding — checklist oficial

Da [documentação oficial](https://create.roblox.com/docs/production/game-design/onboarding):

Ao final do onboarding, o jogador precisa entender:
1. **Mecânicas centrais**: controles de navegação/interação + o Core Loop do jogo.
2. **Proposta de valor**: **por que** deveria se engajar com os sistemas (não só o quê fazer, o porquê).
3. **Conteúdo disponível**: consciência da amplitude de conteúdo do jogo, para sustentar interesse de longo prazo.

**Técnicas concretas recomendadas**:
- **Progressão inicial rápida**: limiares de XP baixos no início, para o jogador "subir de nível rápido e sentir a diversão da progressão imediatamente" — curva ajustável depois com dados reais.
- **Recursos iniciais**: distribuir itens/moeda gratuitos estrategicamente logo no início.
- **Visibilidade de metas**: expor metas de curto, médio e longo prazo (season pass, missões, árvore de habilidade) para o jogador já visualizar sessões futuras.
- **Momentos de celebração**: pareá-los com animação/efeito visual recompensador.

**Erros comuns a evitar** (segundo a documentação): tutorial ou tela de controles complicada demais; atrasar conteúdo divertido por muito tempo (jogadores decidem interesse em minutos); deixar o jogador novo sob-recursado a ponto de frustração; esconder sistemas de progressão disponíveis.

### Aplicação ao nosso GDD

Nosso onboarding já segue o princípio "ensinar jogando" (Mario World 1-1, seção 2b) — a documentação oficial da Roblox **confirma e complementa** com pontos que ainda não tínhamos formalizado:
- **Garantir que a primeira descoberta (reveal) aconteça rápido o suficiente para contar como "limiar baixo inicial"** — já é a meta dos "primeiros 5 minutos" (seção 3), agora com respaldo oficial direto.
- **Expor visibilidade de metas de curto/médio/longo prazo desde cedo** — o Bestiary já cumpre isso parcialmente (% de completude visível), mas vale garantir que o jogador veja isso já nos primeiros minutos, não só depois de descobrir várias criaturas.
- **Momento de celebração com efeito visual** — já coberto pelo "momento de descoberta" (seção 5), mas a documentação reforça que isso deve ser tratado como prioridade de polish, não afterthought.

## 4. Achado extra: Character Controller Library (CCL) — sistema novo de movimento

Descoberto durante a pesquisa: a Roblox lançou uma **Character Controller Library** oficial (substituindo o antigo sistema de estados do Humanoid) — framework modular baseado em **Habilidades** (o que o personagem pode fazer: correr, pular, escalar, nadar) e **Controllers** (simulação física). [Roblox Creator Hub](https://create.roblox.com/docs/characters/character-controller-library), [DevForum](https://devforum.roblox.com/t/full-release-the-future-of-character-movement-character-controller-library/4565267)

- **Por que importa para nós**: o sistema já suporta habilidades customizadas futuras (agachar, mirar, pular na parede) — relevante se algum dos candidatos de Core Gameplay (seção 4b, ex: arremesso preciso) precisar de uma habilidade de movimento/mira customizada.
- **Decisão**: avaliar na Fase 2 (Configuração Técnica) se usamos a CCL nova ou o Humanoid tradicional — não decidido ainda, registrar como pendência técnica.

## 5. Design específico da plataforma Roblox (design-for-roblox.md) — achado fundamental

Este documento é o mais estrutural de todos: define **3 pilares** de design específicos da Roblox, diferentes de outras plataformas.

### Pilar 1 — Design para o comportamento do usuário
- Usuários trocam de jogo constantemente — "FTUEs [primeira experiência] que levam o usuário à diversão rapidamente tendem a se sair melhor na Roblox".
- **Interação social impulsiona retenção** — muitos usuários tratam a Roblox como um "espaço de encontro", não uma plataforma de desafio.
- **Jogos single-player sofrem significativamente** na plataforma.

### Pilar 2 — Design para o público
- Usuários mais jovens priorizam **exploração e socialização** acima de competição/conquistas.
- "Esquisitice e criatividade são parte central da cultura Roblox" — jogos não-convencionais prosperam.
- **Polimento visual importa menos que diversão de jogabilidade** para o público mais jovem.
- Público mais velho (crescente) busca engajamento mais profundo e oportunidades de monetização.
- Criadores de conteúdo influenciam adoção fortemente — "streamability" (o quanto o jogo rende em vídeo) deve informar decisões de design.

### Pilar 3 — Design para o engine
- **Mobile-first é essencial** — "a maioria dos usuários joga Roblox em dispositivos móveis" (confirma D004 com fonte oficial adicional).
- Replicar padrões de UI já familiares (inventário embaixo, elementos centrais compartilhados) para navegação intuitiva.
- Interfaces visuais/baseadas em ícone superam design pesado em texto, especialmente para jogadores mais jovens.

### Aplicação direta ao nosso GDD

- **"Jogos single-player sofrem significativamente"** — reforça por que o cartão de perfil visível a outros jogadores (2c) não é opcional, é estrutural: mesmo o MVP pequeno precisa de alguma visibilidade social, não pode ser 100% solitário.
- **"Polimento visual importa menos que diversão"** — confirma a priorização já estabelecida em D024/4b: validar se o Core Gameplay é divertido vem antes de investir em arte final.
- **"Esquisitice e criatividade prosperam"** — valida diretamente a lógica de mundo eclético (D042) e a filosofia "brinquedo vivo" (D040) como caminho compatível com a cultura da própria plataforma, não um risco.

## 6. Economia virtual — framework oficial de balanceamento (Fase 5)

- **4 práticas centrais**: conteúdo orientado a dados, planejamento de recursos (fontes/sumidouros), estimativa de impacto, sumidouros de recurso.
- **Cálculo de Valor Esperado (EV)** para prever impacto de eventos: valor do item × probabilidade de obtenção, somado. Ex: "Peixe-gato = 10 Ouro × 70% = 7 Ouro esperado" — revela se um evento vai gerar excesso de moeda não saudável.
- **Sumidouros mais eficazes**: itens cosméticos por tempo limitado, eventos sequenciais que exigem gasto, lojas de evento, e — mais eficaz — **moedas de evento exclusivas**, usáveis só na loja daquele evento, protegendo a economia principal.
- **Aplicação**: quando a Fase 5 (Economia) chegar, usar EV para validar se o drop rate de Mimos raros (seção 5/6 do GDD) não vai gerar excesso/escassez de recursos.

## 7. Design de missões (quest design) — relevante para o Bestiary

- **2 tipos centrais**: **Achievements** (tarefa única, exige tempo/esforço, marcador de orgulho/progresso — o jogador mostra a outros) e **Dailies** (janela de 24h, objetivo simples, recompensa modesta, incentiva login consistente via rotação).
- **Estrutura de missão**: Objetivo + Quantidade (dificuldade) + Recompensa.
- **9 funções motivacionais de missões**: metas mistas de curto/médio/longo prazo; expor conteúdo subutilizado; ensinar mecânica por prática ativa; adicionar variedade; gerar urgência por tempo limitado; estruturar progressão dentro do core loop; desafiar jogadores experientes; enriquecer com texto de sabor narrativo.
- **Aplicação direta**: o Bestiary (já central no GDD) já funciona como um sistema de **Achievements** natural (cada descoberta = conquista de orgulho). **Dailies fica como candidato pós-MVP** — ex: "encontre 1 Mimo hoje" — não implementar agora, mas a estrutura já valida a decisão de manter o Bestiary como eixo central de meta (seção 6/7 do GDD).

## 8. UI/UX — recomendações oficiais (relevante para a UI do Bestiary, Fase 3)

- **Mobile**: telas pequenas saturam fácil — priorizar layout limpo, **UI contextual** (só mostra o que é relevante no momento), testar variações via Experiments.
- **Legibilidade**: sempre priorizar fonte legível e contraste forte com o fundo.
- **Hierarquia de informação**: usar tamanho/cor/espaço/proximidade para guiar atenção ao que importa.
- **Consistência**: documentar escolhas de design num Style Guide interno (mesmo sendo solo dev, vale manter uma referência simples).
- **Convenções já estabelecidas na Roblox**: prompts de proximidade com tecla (ex: "E" para interagir) — usar convenções que o jogador já conhece de outros jogos da plataforma, em vez de inventar padrão novo.
- **Feedback de ação**: toda ação do jogador precisa de confirmação (animação, som, mudança visual) — já é exatamente o princípio de "momento de descoberta" (seção 5) e "game feel" (4b) já adotados.

## 9. Analytics — confirmação das categorias já adotadas

- Documentação oficial confirma 3 categorias centrais de KPI: **engajamento, retenção, monetização** — exatamente a estrutura já usada em `01-pesquisa-mercado.md` e no plano de eventos do GDD.
- Duas ferramentas nativas mencionadas: **Experiments** (testes A/B para medir impacto causal de mudanças) e **Configs** (ajustar valores do jogo em tempo real, sem reiniciar servidores) — candidatos a usar já na Fase 3/5 para balancear a chance de raridade sem precisar republicar o jogo a cada ajuste.
- Documento oficial mais detalhado ainda não consumido: `/docs/en-us/production/analytics/get-started` — pendência para quando a instrumentação de analytics for implementada (Fase 3).

## Conclusão

A pesquisa não revelou nenhuma contradição com o que já está no GDD — pelo contrário, **validou a estrutura já escolhida** (core loop de 3 camadas, abordagem de prototipagem rápida/estreita, onboarding por ação, mobile-first, visibilidade social, cultura de "esquisitice") usando a fonte mais autoritativa possível (documentação oficial da própria plataforma). Os ajustes práticos (visibilidade de metas cedo, XP inicial baixo, CCL como pendência técnica, framework de EV para economia, estrutura de Achievements/Dailies para o Bestiary, diretrizes de UI/UX mobile) foram incorporados ao GDD/roadmap.

**Cobertura desta pesquisa**: 9 dos 17 documentos oficiais da pasta game-design foram consumidos em profundidade (core-loops, prototyping, onboarding, design-for-roblox, balance-virtual-economies, introduction-to-quest-design, ui-ux-design, analytics-essentials, mais o achado extra da Character Controller Library). Os 8 restantes (content-updates, contextual-purchases, liveops — já cobertos em `08-analise-retencao-generos.md` —, monetization-foundations, onboarding-techniques, season-pass-design, subscription-design) são de menor prioridade para o estágio atual (pré-monetização, pré-conteúdo pós-lançamento) — candidatos a consumir quando as Fases 7/9/11 chegarem.
