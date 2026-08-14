# Ferramentas e Recursos — Inventário

> Processo aplicado: Pesquisar → Comparar → Validar → Escolher → Integrar. Nenhuma ferramenta abaixo foi instalada ainda — este é o inventário de candidatas levantado na Fase 0.

## MCP Studio oficial (Roblox)
- **Finalidade**: permitir que Claude Code leia/escreva diretamente no Roblox Studio (rodar Lua, inserir modelos, ler console) em tempo real.
- **Link**: [github.com/Roblox/studio-rust-mcp-server](https://github.com/Roblox/studio-rust-mcp-server)
- **Versão/status**: lançado oficialmente fev/2026, mantido pela própria Roblox.
- **Motivo de considerar**: é first-party, sem toolchain extra, setup ~60s (Beta Features → MCP Server).
- **Dependências**: Roblox Studio instalado.
- **Risco**: baixo (mantido pela Roblox); feature ainda em Beta, comportamento pode mudar.
- **Onde seria usado**: Fase 2 em diante (Protótipo).

## roblox-game-skill (Claude Code Skill de terceiros)
- **Finalidade**: Skill dedicada com templates de gênero, workflows guiados e referência de Luau/arquitetura/segurança para desenvolvimento Roblox com Claude Code.
- **Link**: [github.com/brockmartin/roblox-game-skill](https://github.com/brockmartin/roblox-game-skill)
- **Versão/status**: 133 stars, 20 forks, mas apenas 3 commits visíveis — atividade de manutenção baixa/incerta.
- **Motivo de considerar**: templates prontos para simulador (nosso gênero recomendado) e tycoon economizam tempo de um iniciante; workflows de segurança/performance/pré-lançamento cobrem pontos que o prompt mestre exige (itens 14-15).
- **Licença**: não confirmada nesta pesquisa — **validar antes de adotar**.
- **Risco de abandono**: médio-alto (poucos commits). Mitigação: usar como referência de leitura/aprendizado, não como dependência de build (não devemos ficar bloqueados se o repo for descontinuado).
- **Decisão**: **avaliar com mais profundidade na Fase 1/2**, não adotar cegamente agora. Ver `06-decisoes.md`.

## ProfileService (MadStudioRoblox) — reavaliar em favor de ProfileStore
- **Finalidade**: persistência segura de dados de jogador — evita corrupção/duplicação por múltiplas sessões no mesmo DataStore.
- **Link**: [github.com/MadStudioRoblox/ProfileService](https://github.com/MadStudioRoblox/ProfileService) (verificado — link anterior estava correto)
- **Atualização (D032)**: pesquisa confirma que ProfileService está **estável mas não recebe mais atualizações** — o próprio autor recomenda **ProfileStore** para projetos novos. [MattQ blog](https://mattqdev.github.io/blog/profileservice-datastore-in-roblox-studio-2026-developer-guide)
- **Onde seria usado**: Fase 3 (Core Gameplay) em diante, para toda persistência de progresso/moeda/inventário — **decisão revisada para ProfileStore**, ver abaixo.
- **Risco**: baixo (código estável e amplamente testado), mas escolher hoje um módulo em modo manutenção para um projeto novo não é ideal.

## ProfileStore (MadStudioRoblox) — recomendado no lugar de ProfileService
- **Finalidade**: mesmo problema do ProfileService (persistência com session-locking), sucessor mantido ativamente pelo mesmo autor.
- **Link**: [github.com/MadStudioRoblox/ProfileStore](https://github.com/MadStudioRoblox/ProfileStore) (verificado)
- **Versão/status**: 325 estrelas, 60 forks, ativo (32 commits, issues/PRs sendo respondidos). Documentação nota explicitamente que não serve para leaderboards (usar `OrderedDataStore` à parte para isso, ex: Hall of Fame do GDD).
- **Motivo de considerar**: mesma confiabilidade do ProfileService, mas em desenvolvimento ativo — melhor escolha para um projeto que começa em 2026.
- **Onde seria usado**: Fase 3 (Core Gameplay) em diante, substituindo a menção a ProfileService nas decisões anteriores (D005).
- **Risco**: baixo — mesmo autor/linhagem do ProfileService já validado pela comunidade.

## ReplicaService
- **Finalidade**: replicar dados do servidor para o cliente de forma segura, complementa ProfileService/ProfileStore.
- **Motivo de considerar**: mesmo raciocínio — problema comum e já resolvido.
- **Onde seria usado**: junto com ProfileStore, Fase 3+.
- **Status**: não verificado nesta rodada (o link "Loleris/ProfileService" citado pelo usuário retornou 404 — o autor correto é MadStudioRoblox/loleris, mas o repositório específico do ReplicaService ainda precisa ser confirmado antes de adotar).

## Rojo
- **Finalidade**: sincroniza arquivos de código entre um editor externo (ex: VS Code / pasta usada pelo Claude Code) e o Roblox Studio — permite versionar o projeto com git de verdade, em vez de escrever tudo dentro do Studio.
- **Link**: `rojo-rbx/rojo` (repositório oficial da comunidade — não verificado nesta rodada, mas é o nome consistentemente citado por múltiplas fontes independentes).
- **Motivo de considerar**: essencial para que Claude Code consiga editar arquivos de script como texto normal — sem Rojo, o fluxo "Claude Code escreve Luau" fica muito mais manual.
- **Onde seria usado**: Fase 2 (Protótipo), como parte do setup inicial de ambiente.

## Wally (gerenciador de pacotes) — verificado
- **Finalidade**: gerenciador de dependências para Roblox, no espírito do Cargo/npm — instala bibliotecas (ex: ProfileStore, Signal) via comando em vez de copiar/colar código manualmente.
- **Link**: [github.com/UpliftGames/wally](https://github.com/UpliftGames/wally) (verificado)
- **Versão/status**: 489 estrelas, 151 forks, MPL-2.0, ativamente mantido (145 commits, issues/PRs em andamento).
- **Motivo de considerar**: reduz fricção de instalar as bibliotecas já recomendadas aqui (ProfileStore etc.) — mas adiciona uma ferramenta a mais no setup inicial.
- **Decisão**: candidato para Fase 2 (Configuração Técnica) — avaliar junto com o Rojo se vale a pena incluir já no MVP ou só quando o número de dependências crescer.

## Luau LSP — verificado
- **Finalidade**: autocomplete, checagem de tipos e diagnóstico de erros de Luau no VS Code, com suporte nativo a projetos Rojo.
- **Link**: [github.com/JohnnyMorganz/luau-lsp](https://github.com/JohnnyMorganz/luau-lsp) (verificado)
- **Versão/status**: 523 estrelas, 143 forks, MIT, muito ativo (1.917 commits) — projeto maduro/produção.
- **Motivo de considerar**: ajuda tanto o usuário quanto o Claude Code a identificar erros de sintaxe/tipo antes de rodar no Studio.
- **Decisão**: candidato de baixo risco para Fase 2, instalação simples (extensão VS Code).

## Selene e StyLua (lint/formatação) — verificados
- **Selene**: [github.com/Kampfkarren/selene](https://github.com/Kampfkarren/selene) — 805 estrelas, MPL-2.0, muito ativo (505 commits). Linter rápido para Lua/Luau.
- **StyLua**: [github.com/JohnnyMorganz/StyLua](https://github.com/JohnnyMorganz/StyLua) — 2.300 estrelas, MPL-2.0, muito ativo (908 commits). Formatador determinístico de código, segue o guia de estilo Lua da Roblox.
- **Motivo de considerar**: ajudam a manter o código gerado (por mim ou pelo usuário) consistente e sem erros óbvios — baixo risco, ambos maduros.
- **Decisão**: candidatos de baixa prioridade, úteis a partir da Fase 3 quando o volume de código crescer; não bloqueiam nada agora.

## Knit — CONFIRMADO ARQUIVADO, não adotar
- **Finalidade**: framework para organizar comunicação cliente/servidor via Services/Controllers.
- **Link**: [github.com/Sleitnick/Knit](https://github.com/Sleitnick/Knit)
- **Atualização importante**: verificado que o repositório foi **arquivado em 31/07/2024** e não recebe mais atualizações (confirmado pelo próprio `ARCHIVAL.md` do projeto), apesar de 627 estrelas/108 forks — popularidade passada não é mais garantia de manutenção futura.
- **Decisão reforçada**: a cautela já registrada anteriormente (não adotar Knit para o MVP) estava certa por motivo diferente do previsto (era "complexidade prematura"; agora também é "projeto abandonado") — **não adotar em hipótese nenhuma para este projeto**, nem depois que crescer. Se precisar de estrutura similar no futuro, avaliar alternativas ativas na época.

## Fusion (UI declarativa) — verificado, candidato futuro
- **Finalidade**: biblioteca de programação reativa/declarativa para construir UI em Luau (Roact/React-like).
- **Link**: [github.com/Elttob/Fusion](https://github.com/Elttob/Fusion) (verificado)
- **Versão/status**: 791 estrelas, 123 forks, MIT, ativo (933 commits).
- **Motivo de considerar**: só relevante quando o jogo tiver UI complexa (loja, inventário, Bestiary) — não necessário para o MVP inicial, mas boa opção madura para quando chegar a hora.
- **Decisão**: candidato para Fase 3+ (quando a UI do Bestiary/loja for implementada), não para a Configuração Técnica inicial.

## Reflex (state management) — verificado, avaliar depois
- **Finalidade**: gerenciador de estado centralizado para roblox-ts (TypeScript→Luau), útil para sincronizar inventário/moedas/progresso em vários lugares da UI ao mesmo tempo.
- **Link**: [github.com/Littensy/reflex](https://github.com/Littensy/reflex) (verificado — 107 estrelas, MIT, ativo)
- **Ressalva importante**: é uma biblioteca para **roblox-ts** (TypeScript compilado para Luau), não Luau puro — adotar Reflex implica adotar todo o toolchain roblox-ts, uma decisão de arquitetura maior que não foi avaliada ainda.
- **Decisão**: não avaliar agora — decisão de "Luau puro vs. roblox-ts" precisa ser tomada explicitamente antes (nenhuma decisão registrada até aqui presumiu roblox-ts).

## MCPs/pontes de terceiros para Roblox Studio (verificados, todos em estágio inicial)
Pesquisa encontrada pelo usuário incluía três pontes de terceiros entre Claude e o Roblox Studio, além do servidor oficial já adotado. Todas verificadas — nenhuma tem maturidade suficiente para substituir o MCP oficial:

| Ferramenta | Estrelas | Status |
|---|---|---|
| [Claudeblox](https://github.com/Claudeblox/claudeblox) | 12 | Estágio inicial, MIT, sistema de 21 sub-agentes para criar jogos por linguagem natural |
| [Point58/Claude-code-roblox-mcp](https://github.com/Point58/Claude-code-roblox-mcp) | 4 | Estágio inicial, MIT, instalador Windows |
| [madebyshaurya/stud](https://github.com/madebyshaurya/stud) | 4 | Estágio inicial, AGPL-3.0, app desktop Tauri |

**Decisão**: nenhuma dessas substitui o MCP Server oficial da Roblox já registrado acima — todas têm poucas estrelas, poucos commits e adoção mínima. Ficam anotadas como "para acompanhar", não para adotar agora.

## Rodada 2 de verificação (D033) — análise individual pedida pelo usuário

### 🟢 Recomendados para adotar (Fase 2/3)

**GameAnalytics SDK Roblox** — [github.com/GameAnalytics/GA-SDK-ROBLOX](https://github.com/GameAnalytics/GA-SDK-ROBLOX)
- 71 estrelas, 222 commits, MIT, mantido pela própria empresa GameAnalytics (não é projeto hobby).
- **Por que importa**: resolve diretamente o item de analytics que o prompt mestre original pede desde o protótipo (retenção D1/D7/D30, funil de eventos) — em vez de construir instrumentação do zero. Gratuito na configuração básica.
- **Onde entra**: Fase 3 (Core Gameplay), junto com os primeiros eventos de analytics (entrada, primeira descoberta, retorno).

**evaera/Cmdr** — [github.com/evaera/Cmdr](https://github.com/evaera/Cmdr)
- 514 estrelas, 630 commits, MIT — maduro, documentado, com Discord de suporte.
- **Por que importa**: console de comandos de desenvolvedor (tipo Counter-Strike/Skyrim) — permite testar o jogo (dar Mimo, teleportar, forçar raridade) sem precisar editar código a cada teste manual. Ferramenta de produtividade para um solo dev, não faz parte do jogo publicado.
- **Onde entra**: Fase 2/3, como ferramenta de desenvolvimento/debug — não é dependência do jogo em produção.

**Sleitnick/RbxUtil** — [github.com/Sleitnick/RbxUtil](https://github.com/Sleitnick/RbxUtil)
- 447 estrelas, 534 commits, MIT, CI/CD ativo, 33+ módulos (Signal, Trove, Comm, Net, Promise-like, TableUtil...).
- **Por que importa**: resolve o link quebrado da rodada anterior (o "Sleitnick/rbxts-signal" que você citou vive aqui dentro). É uma caixa de ferramentas pequenas e independentes — dá para instalar só o Signal ou só o Trove via Wally, sem adotar um framework inteiro. Isso respeita a regra de simplicidade (evitar dependência grande tipo Knit/NevermoreEngine).
- **Onde entra**: Fase 3+, módulo a módulo, conforme a necessidade aparecer (ex: Signal para eventos internos, Comm para RemoteEvents).

### 🟡 Candidatos para decidir mais adiante (não bloqueiam nada agora)

**centau/vide** — [github.com/centau/vide](https://github.com/centau/vide)
- 313 estrelas, MIT, ativo. Biblioteca de UI reativa (inspirada em Solid.js), alternativa ao Fusion já registrado acima.
- **Decisão**: Fusion e Vide resolvem o mesmo problema (UI declarativa) — escolher **um dos dois** quando a Fase 3+ chegar na UI do Bestiary/loja, não os dois. Registrar como opção B do Fusion.

**Sleitnick/RbxObservers** — [github.com/Sleitnick/RbxObservers](https://github.com/Sleitnick/RbxObservers)
- 54 estrelas, MIT, pequeno e específico (utilitários de observação/reatividade).
- **Decisão**: só relevante se o projeto adotar um padrão reativo (Vide/Fusion) de forma mais profunda — reavaliar nessa hora, não agora.

### 🔴 Não recomendados para este projeto

**matter-ecs/matter** — [github.com/matter-ecs/matter](https://github.com/matter-ecs/matter)
- 111 estrelas, MIT, ativo e bem mantido — mas é um framework **ECS (Entity Component System)**, um paradigma de arquitetura significativamente mais complexo que o necessário para um MVP pequeno solo. Adotar ECS agora seria complexidade prematura (mesma regra que já afastou o Knit) — não porque a ferramenta é ruim, mas porque não combina com o tamanho do projeto.
- **Decisão**: não adotar. Reavaliar só se o jogo crescer para um nível de complexidade de simulação que justifique (não é o caso do MVP nem das fases próximas).

**Quenty/NevermoreEngine** — [github.com/Quenty/NevermoreEngine](https://github.com/Quenty/NevermoreEngine)
- 606 estrelas, 5.754 commits, MIT, extremamente maduro (já rodou em bilhões de sessões de jogo) — mas é uma **mega-coleção de 278 pacotes**, um "framework completo" no mesmo espírito do Knit (mas, diferente do Knit, este está ativo).
- **Decisão**: **não adotar como framework inteiro** — o tamanho e o acoplamento entre os 278 pacotes é overkill para um solo dev com MVP pequeno. Se algum módulo específico (ex: Maid, Spring) for útil isoladamente mais adiante, avaliar puxar só aquele módulo via Wally, não o engine inteiro.

**roblox-compilers (organização)** — [github.com/roblox-compilers](https://github.com/roblox-compilers)
- Coleção de compiladores que traduzem outras linguagens (Python, C/C++, LLVM) para Luau. Vários dos repositórios estão **arquivados**.
- **Decisão**: **não relevante para este projeto** — não há motivo para escrever o jogo em outra linguagem e compilar para Luau; isso adicionaria uma camada de complexidade/risco sem nenhum benefício para o nosso caso (Rojo + Luau direto já é o fluxo padrão e mais simples).

### Resumo de prioridade (D033)

| Ferramenta | Prioridade | Fase |
|---|---|---|
| GameAnalytics SDK | Alta | Fase 3 |
| evaera/Cmdr | Alta (produtividade de dev) | Fase 2/3 |
| RbxUtil (módulos avulsos) | Alta, conforme necessidade | Fase 3+ |
| Fusion **ou** Vide (escolher 1) | Média | Fase 3+ |
| RbxObservers | Baixa | Só se adotar padrão reativo |
| Matter ECS | Não adotar | — |
| NevermoreEngine (inteiro) | Não adotar | — |
| roblox-compilers | Não relevante | — |

## Rodada 3 (D034) — ferramentas que melhoram especificamente o trabalho do Claude Code

O usuário pediu repositórios que reduzam minhas próprias limitações: testar código sem depender só da GUI do Studio, operar a Roblox Cloud via terminal, e melhorar gráficos/performance.

### 🟢 rbxcloud (Sleitnick) — recomendado, ferramenta de alto valor para IA
- **Link**: [github.com/Sleitnick/rbxcloud](https://github.com/Sleitnick/rbxcloud) — 139 estrelas, MIT, 227 commits, ativo.
- **Por que é especialmente útil para mim**: é um CLI (Rust) para a Open Cloud API da Roblox — permite gerenciar DataStores, publicar lugares, mensageria e assets **via terminal**, sem precisar da interface gráfica do Studio. Isso é diretamente relevante à minha limitação de não poder clicar em UI — com rbxcloud, tarefas de deploy/debug de DataStore viram comandos de Bash que eu consigo rodar diretamente.
- **Onde entra**: Fase 2 (Configuração Técnica) ou quando começarmos a testar persistência (Fase 3) — baixo risco, instalação simples via Aftman.

### 🟡 Testes automatizados: TestEZ está arquivado — usar um fork mantido
- **Roblox/testez** (framework oficial de testes BDD da Roblox) — [github.com/Roblox/testez](https://github.com/Roblox/testez) — **arquivado desde 14/09/2024**, mesmo padrão do Knit (projeto bom, mas abandonado). Não adotar o original.
- **Alternativas encontradas, ainda não verificadas em profundidade**: `lrockreal/testez-luau` (fork independente da Roblox) e `l3dotdev/EzSpec` (framework novo inspirado em TestEZ/FusionCI) — **nenhum verificado ainda**, avaliar antes de adotar quando chegarmos na fase de testes automatizados.
- **rojo-rbx/run-in-roblox** — [github.com/rojo-rbx/run-in-roblox](https://github.com/rojo-rbx/run-in-roblox) — 74 estrelas, MIT, ativo, mantido pela mesma organização do Rojo. Permite rodar scripts/testes dentro do Studio a partir da linha de comando, capturando saída — a peça que falta para eu conseguir "rodar e ver o resultado" de forma automatizada em vez de pedir para o usuário testar manualmente no Studio.
- **Decisão**: útil, mas fica para quando o projeto tiver lógica complexa o suficiente para justificar testes automatizados (Fase 3+) — não é prioridade da Configuração Técnica inicial (D022).

### 🔴 Gráficos/VFX: nada maduro o suficiente para recomendar agora
- **Lumina** (sistema de partículas com editor visual) — [github.com/Mqxsyy/Lumina](https://github.com/Mqxsyy/Lumina) — só 30 estrelas, e o próprio autor avisa: **"heavily work in progress"**, recomenda **não usar em produção**. Não adotar.
- Outros resultados de VFX encontrados (vfx-editor, roblox-vfx) eram ainda menores/menos documentados — não verificados a fundo por não passarem no primeiro filtro de maturidade.
- **Conclusão honesta**: não existe um repositório de VFX maduro o suficiente para recomendar agora. Para o MVP, o sistema de partículas **nativo** do Roblox (ParticleEmitter, Beam, Trail) já é suficiente para os efeitos simples previstos no GDD (reveal de Mimo, clima) — não é uma limitação real neste estágio, é simplesmente cedo demais para precisar de uma lib externa de VFX.

### 🔴 Performance: não existe (nem precisa existir) um repositório de terceiros
- A pesquisa não encontrou uma ferramenta de terceiros madura para profiling/otimização — porque a Roblox já resolve isso nativamente com o **MicroProfiler** (embutido no Studio) e a configuração `StreamingEnabled`. Isso não é uma lacuna do ecossistema, é uma área que a própria plataforma já cobre bem. Nenhuma ação necessária agora — otimização entra na Fase 8 (Polish) usando as ferramentas nativas.

### Resumo desta rodada

| Ferramenta | Veredito |
|---|---|
| rbxcloud | ✅ Recomendado — opera Open Cloud via terminal, direto relevante para mim |
| run-in-roblox | 🟡 Útil, mas só quando testes automatizados fizerem sentido (Fase 3+) |
| TestEZ (oficial) | ❌ Arquivado — não adotar |
| testez-luau / EzSpec | 🟡 Candidatos não verificados — avaliar na Fase 3+ se testes automatizados virarem prioridade |
| Lumina (VFX) | ❌ Não adotar — o próprio autor desaconselha uso em produção |
| Performance de terceiros | Não há lacuna — MicroProfiler nativo já cobre isso |

## Rodada 4 (D035) — mais Skills, MCP com visão de cena 3D, templates reutilizáveis

O usuário pediu para ampliar a busca: mais Skills de Claude Code para Roblox, ferramentas que me ajudem a "enxergar" o cenário 3D, e sistemas/templates reutilizáveis de jogabilidade.

### 🟢 Chrrxs/robloxstudio-mcp — achado importante: MCP com captura de tela
- **Link**: [github.com/Chrrxs/robloxstudio-mcp](https://github.com/Chrrxs/robloxstudio-mcp) — 171 estrelas, MIT, 80 commits, ativamente mantido (v2.23.1).
- **Por que é relevante para "identificar no 3D"**: inclui uma ferramenta `capture_screenshot` que captura o viewport do Studio, além de debugging de runtime, profiling de performance/memória e automação de playtest (solo e multiplayer). Isso é exatamente o tipo de capacidade que falta no fluxo padrão — eu consigo ler a árvore de objetos (`DataModel`) via MCP oficial, mas **ver visualmente** o resultado (para checar se um Mimo ficou bem posicionado, se a UI está legível) é uma capacidade adicional.
- **Ressalva**: é mais maduro que os outros MCPs de terceiros já avaliados (D032), mas ainda é um projeto de terceiros, não oficial — a captura de tela é "renderização por dados de geometria" em alguns forks similares, não necessariamente uma imagem fotorrealista pronta para eu interpretar como uma screenshot normal.
- **Decisão**: candidato a **avaliar na prática durante a Configuração Técnica** (Fase 2), como complemento ao MCP oficial da Roblox — não substituto, mas pode preencher a lacuna de "visão" que o MCP oficial não cobre claramente.

### 🟢 MSayib/roblox-dev-skill — alternativa mais recentemente ativa ao roblox-game-skill
- **Link**: [github.com/MSayib/roblox-dev-skill](https://github.com/MSayib/roblox-dev-skill) — 7 estrelas (poucas), mas **atividade confirmada em agosto/2026** (mesmo mês desta pesquisa), versão 2.4.0, MIT.
- **Por que vale considerar**: 5.800+ linhas de conhecimento curado, busca de API local-first (mais eficiente em tokens), integração MCP, e — diferente do `roblox-game-skill` do brockmartin (D003, manutenção incerta, só 3 commits visíveis) — este mostra atualização bem mais recente.
- **Decisão**: **comparar diretamente com `roblox-game-skill` na Fase 2**, antes de escolher qual (ou se ambos, um como referência de leitura) — critério de manutenção ativa pesa a favor deste, mas o `roblox-game-skill` tem mais estrelas/adoção (133 vs. 7). Validar licença de ambos antes de usar código, não só a Skill em si.

### 🟡 sentinelcore/roblox-skills — modular, mas muito inicial
- **Link**: [github.com/sentinelcore/roblox-skills](https://github.com/sentinelcore/roblox-skills) — 13 estrelas, 4 commits, estrutura modular interessante (7 módulos: monetização, DataStores, RemoteEvents, GUI, segurança, animações, performance).
- **Decisão**: estágio inicial demais para adotar agora — a estrutura modular é um bom padrão de referência, mas o conteúdo em si tem pouca maturidade comprovada (poucos commits).

### 🟡 MonzterDev/Roblox-Game-Template — referência de arquitetura, não adoção direta
- **Link**: [github.com/MonzterDev/Roblox-Game-Template](https://github.com/MonzterDev/Roblox-Game-Template) — 15 estrelas, 11 commits. Template com ProfileService + Cmdr + Net + Reflex + React (branch "Standard") ou versão mais simples com GUI nativa do Studio (branch "Simple").
- **Por que é útil mesmo sendo pequeno**: mostra um padrão real de como organizar um projeto Roblox profissional (estrutura de pastas, Rojo+Wally+Aftman configurados). A branch "Simple" combina melhor com o nosso perfil (solo, sem Reflex/React ainda).
- **Decisão**: **usar como referência de estrutura de pastas na Configuração Técnica**, não importar o código inteiro — poucos commits/estrelas para confiar como dependência viva, mas útil para copiar o *padrão* de organização.

### 🟢 awesome-roblox/awesome-roblox — bom índice para pesquisas futuras
- **Link**: [github.com/awesome-roblox/awesome-roblox](https://github.com/awesome-roblox/awesome-roblox) — 75 estrelas, CC0 (domínio público), 95 commits, organizado em 7 categorias (Software, Experiences, Plugins, Modules, Libraries, Tooling).
- **Decisão**: não é uma ferramenta em si — é um **índice curado**. Guardar como referência para consultar quando surgir uma necessidade nova (ex: "existe módulo pronto para X?") em vez de pesquisar do zero toda vez.

### 🟢 n4tivex/mcp-roblox-docs — resolve diretamente o pedido de economizar tokens
- **Link**: [github.com/n4tivex/mcp-roblox-docs](https://github.com/n4tivex/mcp-roblox-docs) — 14 estrelas, MIT, v3.3.1, atualizado em abril/2026, ativo.
- **Por que é exatamente o que foi pedido**: é um MCP que indexa toda a documentação da Roblox (850+ classes, 35.000+ membros da API, 14.000+ FastFlags, 865 endpoints da Cloud API) com busca de texto completo, cache em memória e respostas compactas — em vez de eu precisar fazer WebFetch em páginas inteiras da documentação (gastando muito mais tokens) toda vez que precisar checar uma API do Roblox durante a Fase 2/3.
- **Achado complementar**: o **MCP oficial da Roblox já tem, por padrão, "resumos compactos" e "hierarquia de instância como JSON simplificado com filtros"** — ou seja, o design de eficiência de tokens já é uma preocupação nativa da ferramenta principal, não só de terceiros.
- **Decisão**: candidato de alta prioridade para a Configuração Técnica — reduz diretamente meu consumo de contexto ao escrever/depurar código Roblox.

### Resumo desta rodada

| Ferramenta | Veredito |
|---|---|
| Chrrxs/robloxstudio-mcp | 🟢 Avaliar na prática na Fase 2 — pode dar "visão" de screenshot que falta |
| MSayib/roblox-dev-skill | 🟢 Comparar com roblox-game-skill antes de escolher (mais ativo, menos adotado) |
| sentinelcore/roblox-skills | 🟡 Muito inicial, só observar |
| MonzterDev/Roblox-Game-Template | 🟡 Usar como referência de estrutura, não como dependência |
| awesome-roblox/awesome-roblox | 🟢 Guardar como índice de pesquisa futura |
| n4tivex/mcp-roblox-docs | 🟢 Alta prioridade — resolve diretamente a economia de tokens pedida |

## Rodada 5 (D037) — networking, zonas/regiões, geração de arte por IA nativa, e um alerta de spam

### 🟢 ZonePlus (1ForeverHD) — direto relevante para o sistema de regiões do GDD
- **Link**: [github.com/1ForeverHD/ZonePlus](https://github.com/1ForeverHD/ZonePlus) (verificado via busca — documentação extensa, múltiplas versões, ativo no DevForum até v3.2.0).
- **Finalidade**: detecta jogadores/objetos dentro de zonas dinâmicas (usando a Spatial Query API + raycasting) — dispara eventos `itemEntered`/`itemExited`.
- **Por que importa para este projeto**: nosso GDD já prevê regiões com clima/eventos (seção 2d) e transições entre áreas (seção 6) — ZonePlus resolve exatamente "detectar quando o jogador entra numa região" sem reinventar a lógica de colisão/raycasting.
- **Decisão**: candidato forte para Fase 3 (quando a 1ª região ganhar limites definidos) ou Fase 6 (eventos regionais).

### 🟡 ByteNet (ffrostflame) — otimização de rede, não prioritário agora
- **Link**: [github.com/ffrostflame/ByteNet](https://github.com/ffrostflame/ByteNet) (verificado — 176★, MIT, 78 commits, ativo).
- **Finalidade**: serializa dados em buffers para reduzir uso de banda em RemoteEvents, mais eficiente que serialização tradicional.
- **Decisão**: só relevante quando o jogo tiver volume de jogadores simultâneos alto o bastante para banda ser um problema real — nada a fazer agora, um MVP pequeno não sente esse gargalo. Anotar para Fase 11 (Crescimento) se necessário.

### 🟢 Geração de mesh 3D por IA — recurso NATIVO do Roblox Studio (não é um repositório, é ainda mais direto)
- **Achado importante**: desde março/2026, o Assistant embutido no Roblox Studio gera **meshes 3D texturizados a partir de um prompt de texto**, direto no editor (`Cube 3D`, via `GenerateModelAsync`). Em abril/2026 ganhou "Planning Mode" e "Procedural Models" (estruturas 3D editáveis definidas em código). [Roblox DevForum](https://devforum.roblox.com/t/assistant-updates-mesh-generation-new-mcp-server-tools-screenshot-tool-and-more/4527258)
- **Por que isso é potencialmente enorme para este projeto**: pode ajudar diretamente na produção de arte dos Mimos (Fase 8) ou até em placeholders melhores que whitebox já no Protótipo (Fase 2/3) — sem depender de nenhuma ferramenta externa de terceiros, é parte do próprio Studio.
- **Decisão**: **testar na prática assim que o Studio for aberto** (Fase 2) — é gratuito, nativo, sem risco de dependência externa. Potencialmente resolve parte do gargalo de arte identificado no GDD (seção 12, "o que ainda não resolve").

### ⚪ Localização/tradução — não há lacuna, recurso nativo já cobre
- Roblox já tem `LocalizationService` + tradução automática (Automatic Text Capture) nativos — não é necessário nenhum repositório de terceiros. Não é uma pendência real deste projeto.

### 🔴 Alerta de spam encontrado: phinehas7/hatch-script-roblox-toolkit
- Apareceu numa busca por "sistema de eggs/hatching open source" (relevante ao nosso momento de reveal de Mimo) — mas a verificação mostrou que é **vaporware**: 0 estrelas, 0 forks, **nenhum código real**, apenas um README com linguagem de marketing exagerada ("integrações de IA", "suporte 24/7") e um link de download suspeito fora do GitHub padrão.
- **Registrado como exemplo de alerta**: mesmo com "License: MIT" declarada, isso não significa nada se não há código — reforça por que a verificação individual (D032-D037) é necessária, não presumir que qualquer resultado de busca é confiável.
- **Decisão**: não usar. Se precisarmos de referência de sistema de "hatching"/reveal, os posts do DevForum com sistemas realmente compartilhados (não este) são mais confiáveis, mas nenhum foi verificado a fundo ainda.

### Resumo desta rodada

| Ferramenta | Veredito |
|---|---|
| ZonePlus | 🟢 Candidato forte — resolve detecção de região do GDD (Fase 3/6) |
| ByteNet | 🟡 Anotado — só relevante em escala maior (Fase 11) |
| Geração de mesh 3D nativa (Studio Assistant) | 🟢 Testar já na Fase 2 — gratuito, nativo, pode ajudar a resolver o gargalo de arte |
| Localização | ⚪ Não é lacuna — recurso nativo já resolve |
| phinehas7/hatch-script-roblox-toolkit | 🔴 Spam/vaporware confirmado — não usar |

## Rodada 6 (D038) — áreas que eu identifiquei como faltantes para completar o trabalho

Nesta rodada busquei ativamente lacunas que eu mesmo percebi como necessárias para o projeto ficar completo, não só o que foi pedido literalmente: UI de coleção (Bestiary é núcleo do MVP), áudio (o "momento de descoberta" do GDD depende de som), e automação de qualidade de código.

### 🟢 InventoryMaker — melhor candidato para a UI do Bestiary
- **Link**: [github.com/Asiandayboy/InventoryMaker](https://github.com/Asiandayboy/InventoryMaker) — 16★, MIT, 61 commits, ativo.
- **Por que é relevante**: o Bestiary (coleção com % de completude) é um dos sistemas centrais do MVP (`10-gdd.md` seção 6/10) e ainda não tínhamos nenhum candidato de UI para ele. Este framework não impõe nenhum design visual (dá liberdade total de estilo) e já resolve containers, filtro e ordenação — exatamente o que um Bestiary precisa (filtrar por raridade, região, família visual).
- **Vantagem sobre a alternativa**: não exige Fusion como dependência (ao contrário do Stoway abaixo), então não força a decisão de arquitetura de UI antes da hora.
- **Decisão**: candidato de referência forte para Fase 3 (quando o Bestiary for implementado).

### 🟡 Stoway — alternativa mais robusta, mas exige Fusion
- **Link**: [github.com/Zyn-ic/Stoway](https://github.com/Zyn-ic/Stoway) — 11★, MIT, 73 commits, ativo. UI reativa com Fusion, replicação delta eficiente, rastreamento de item por UUID.
- **Decisão**: só faz sentido se decidirmos adotar Fusion para UI (ver Rodada 2, Fusion vs. Vide ainda em aberto) — não decidir agora.

### 🟢 Bibliotecas de áudio gratuito — resolve uma lacuna real do GDD
- O momento de descoberta (`10-gdd.md` seção 5) descreve efeito sonoro no reveal, mas nenhuma fonte de áudio tinha sido identificada até agora.
- **soundeffectapp/Free-Sound-Effects-Library** — [github.com/soundeffectapp/Free-Sound-Effects-Library](https://github.com/soundeffectapp/Free-Sound-Effects-Library) — mais de 400.000 efeitos sonoros gratuitos, licenciamento claro por arquivo.
- **arnofaure/free-sfx** — pacote pequeno sob Creative Commons Attribution 4.0 (uso livre, sem exigência de atribuição).
- **Recomendação prática**: para produção real, a Roblox Audio Library integrada ao Studio já é o caminho mais direto (assets pré-aprovados pela moderação da plataforma); os dois repositórios acima servem para prototipagem rápida ou como fonte adicional quando a Audio Library não tiver o som certo.
- **Decisão**: nenhuma ação agora — anotado para quando a Fase 3 (Core Gameplay) precisar do primeiro som de reveal.

### 🟢 Pre-commit hooks para Selene/StyLua — automação de qualidade
- **StyLua** já tem hooks de pre-commit oficiais prontos (`.pre-commit-hooks.yaml` no próprio repositório) — três variantes (compilar via cargo, binário no PATH, ou baixar automaticamente do GitHub Releases).
- **Selene** tem suporte de pre-commit em desenvolvimento pela comunidade (PR #565 no repositório oficial).
- **Por que importa**: em vez de eu (ou o usuário) lembrar de rodar lint/formatação manualmente, um hook de pre-commit garante que todo código commitado já passou por Selene+StyLua automaticamente — appropriado para quando o volume de código justificar (não a Configuração Técnica inicial).
- **Decisão**: configurar quando Selene/StyLua forem efetivamente adotados (Fase 3+, conforme Rodada 2).

### ⚪ Creator Store API (busca de assets gratuitos) — recurso nativo, não repositório
- A própria Roblox expõe uma API externa de busca no catálogo (`search.roblox.com/catalog/json`) para consultar meshes, modelos, áudio e plugins do Creator Store/Toolbox programaticamente.
- **Decisão**: não é uma ferramenta de terceiros a adotar — é um endpoint documentado que pode ser útil se algum dia precisarmos buscar assets gratuitos de forma automatizada, mas não é prioridade agora (o MVP usa geometria simples/whitebox e possivelmente geração de mesh nativa, Rodada 5).

### Resumo desta rodada

| Ferramenta | Veredito |
|---|---|
| InventoryMaker | 🟢 Melhor candidato para UI do Bestiary (Fase 3), sem depender de Fusion |
| Stoway | 🟡 Alternativa melhor só se adotarmos Fusion |
| Bibliotecas de áudio (2) | 🟢 Resolve lacuna de som do reveal — anotado para Fase 3 |
| Pre-commit hooks (Selene/StyLua) | 🟢 Configurar quando o volume de código justificar |
| Creator Store API | ⚪ Recurso nativo, não prioridade agora |

## greedychipmunk/agent-skills — verificado, não específico de Roblox
- **Link**: [github.com/greedychipmunk/agent-skills](https://github.com/greedychipmunk/agent-skills) — 13 estrelas, MIT, biblioteca de skills genéricas para agentes de IA (DevOps, observability, frameworks web) — **não é focado em Roblox** apesar de ter sido sugerido nesse contexto. Não relevante para este projeto.

## Coyenn/awesome-roblox-ts — verificado, útil só se adotar roblox-ts
- **Link**: [github.com/Coyenn/awesome-roblox-ts](https://github.com/Coyenn/awesome-roblox-ts) — 41 estrelas, lista curada de pacotes para roblox-ts. Só relevante se a decisão de arquitetura for usar roblox-ts (ver ressalva do Reflex acima) — não avaliado ainda.

## Ferramentas mencionadas pelo usuário e NÃO verificadas (risco de alucinação)
O usuário colou uma lista maior, gerada por outra IA, com vários repositórios cujos links vinham "embrulhados" em `google.com/search?q=...` em vez de URLs diretas — isso é um sinal de que a IA que gerou o texto não tinha certeza da URL exata (comportamento típico de alucinação de link). **Não adicionar ao projeto sem verificar individualmente**:
- `CoderDayton/roblox-bridge-mcp`, `108264/ReplicaService`, `EtienneS1/FastCastRedux`, `TeamSwordFin/raycast-hitbox-v4`, `Sleitnick/rbxts-camera-plus`, `1337DataGuy/ZonePlus`, `Evaera/cmdr`, `Sleitnick/rbxts-network-signal`, `ffDevs/ByteNet`, `Roblox/open-cloud-api-keys` (não é um repositório, é a documentação da Open Cloud API, não código).
- Dois links citados diretamente pelo usuário **falharam a verificação** (HTTP 404): `Loleris/ProfileService` (correto é `MadStudioRoblox/ProfileService`) e `Sleitnick/rbxts-signal` (o Signal do Sleitnick está dentro de `Sleitnick/RbxUtil`, não em um repo próprio).
- Regra prática: qualquer ferramenta dessa lista só entra no inventário depois de uma verificação individual (existência, estrelas, atividade, licença), igual ao que foi feito com as ferramentas acima.

## Ferramenta de gestão de processo/mapa
- **Decisão desta fase**: Markdown + estrutura de pastas em `docs/` (ver `06-decisoes.md` para justificativa completa). Não adotar Notion/ClickUp/Plane agora — exigiriam autenticação não disponível nesta sessão e adicionam uma dependência externa sem necessidade comprovada para um solo dev nesta fase inicial.

## O que ainda falta avaliar (pendências para Fase 2)
- Licença exata do `roblox-game-skill` antes de qualquer uso de código dele
- Rojo: verificar diretamente o repositório oficial (`rojo-rbx/rojo`) antes de instalar — ainda não verificado nesta rodada
- Decisão explícita "Luau puro vs. roblox-ts" antes de considerar Reflex/awesome-roblox-ts
- Ferramentas de analytics dentro do próprio Roblox (Creator Hub Analytics nativo) vs. soluções de terceiros — não pesquisado a fundo nesta rodada
- Qualquer item da lista "não verificada" acima, se o usuário quiser considerá-los específicamente
