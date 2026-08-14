# Pesquisa de Mercado — Roblox (agosto/2026)

> Fontes citadas linha a linha. Dados sujeitos a mudar rápido — revalidar antes de decisões grandes.

## 1. Plataforma e distribuição de jogadores

- **Mobile domina a plataforma**: mobile responde por **~80% das sessões** no Q1 2026 (subindo de ~72% no ano anterior); PC ~25%→menor, console ~3%. [SQ Magazine](https://sqmagazine.co.uk/roblox-statistics/), [Udonis](https://www.blog.udonis.co/mobile-marketing/mobile-games/roblox-player-count)
  - **Implicação direta**: qualquer conceito que dependa de teclado/mouse preciso (FPS, RTS complexo) já nasce excluindo 80% da base potencial. UI e controles devem ser mobile-first, não portados depois.

## 2. Gêneros mais populares e lucrativos (2026)

- **Simuladores** são consistentemente o gênero mais lucrativo e com maior tempo de jogo. Blox Fruits e Pet Simulator 99 geram bilhões de visitas. [RobloxDesk](https://www.robloxdesk.com/most-profitable-roblox-game-genres-2026/), [Adellion](https://www.adellion.com/roblox-simulator-games)
- **Tycoons** — junto com simuladores, é onde jogadores passam mais horas. Exemplos: Retail Tycoon 2, Restaurant Tycoon 2, Theme Park Tycoon 2. [Studio23](https://games.studio23.london/blog/roblox-top-5-game-genres/)
- **Obbies** (obstacle course) — Tower of Hell, Escape Room, Mega Easy Obby — baixa barreira técnica, sessões curtas. [RobloxDesk](https://www.robloxdesk.com/most-profitable-roblox-game-genres-2026/)
- **Fighting/Anime games** — categoria de crescimento mais rápido, mas puxada por tendência cultural (anime), maior risco de saturação e maior exigência de combate/netcode.
- Receita: desenvolvedores de topo faturam em média **$1.1M/ano**; criadores solo bem-sucedidos frequentemente atingem **$20K–30K/mês** com um único jogo de nicho bem executado. [RobloxDesk](https://www.robloxdesk.com/most-profitable-roblox-game-genres-2026/)

## 3. Concorrência por CCU (concurrent users) — panorama atual

- Murder Mystery 2 (~1.0M CCU, ago/2026), Brookhaven RP (~497K), Adopt Me! (~324K), 99 Nights in the Forest (~285K), RIVALS (~222K). [RoWatcher](https://rowatcher.com/news/the-most-popular-roblox-games-right-now-ranked-by-live-players)
- Recordes históricos: **Steal a Brainrot** (>25M CCU) e **Grow a Garden** (22.3M CCU, ago/2025) — ambos simuladores/coleta com forte componente viral de meme cultural. [SpawnRadar](https://www.spawnradar.com/records), [Wikipedia — Grow a Garden](https://en.wikipedia.org/wiki/Grow_a_Garden)
- **Leitura**: os maiores picos de CCU vêm de simuladores simples com forte gancho social/viral (meme, trend do TikTok), não de complexidade técnica. Isso reforça que o gargalo para um solo dev não é "quão sofisticado é o jogo", mas sim core loop + gancho de compartilhamento.

## 4. Retenção — benchmarks por cohort

| Métrica | Bom | Ótimo | Excelente |
|---|---|---|---|
| D1 | 20% | 30% | 40%+ |
| D7 | 8% | 15% | 20%+ |
| D30 | 3% | 7% | 10%+ |

[BLOXG — Retention Benchmarks by Genre](https://bloxg.com/statistics/roblox-retention-benchmarks), [Roblox Creator Hub — Retention](https://create.roblox.com/docs/production/analytics/retention)

- Simuladores tendem a reter melhor que obbies/experiências single-session — a mecânica de progressão numérica ("números maiores") dá motivo estrutural para voltar.
- Retenção forte é insumo direto do algoritmo de Discovery: jogos com D1/D7/D30 fortes recebem mais promoção orgânica (Discover, Recommended For You, busca). Ou seja, retenção não é só "saúde do produto" — é o principal canal de aquisição gratuita na Roblox.

## 5. Por que simuladores funcionam (core loop)

- Mecânica central: **ação simples → recompensa → número maior → mostrar para amigos**. Funciona muito bem com o público jovem majoritário da plataforma. [RobloxDesk](https://www.robloxdesk.com/most-profitable-roblox-game-genres-2026/)
- Sub-gênero de maior retenção historicamente: **coleta de pets** (chocar, evoluir, fundir pets). Em 2026 o topo do ranking já é mais diverso — combate-first sims, fishing-loop, craft-loop também têm audiência relevante, não só pets. [Adellion](https://www.adellion.com/roblox-simulator-games)
- Pet Simulator 99 combina jogo ativo + progressão passiva (idle), ampliando o público-alvo além do "grind hardcore". [Adellion](https://www.adellion.com/roblox-simulator-games)

## 6. Por que jogadores abandonam (DevForum + estudos)

- **Onboarding ruim é a causa nº1 citada**: até 50% dos jogadores não completam os passos iniciais do tutorial; algumas experiências relatam 20% de churn só no tutorial. [DevForum thread](https://devforum.roblox.com/t/help-with-retention/3882323)
- Jogadores desistem em 1–2 minutos após falhar um desafio simples ou não entender o objetivo — o "gancho" da primeira sessão precisa ser imediato.
- Reclamações recorrentes na comunidade mais ampla: **monetização agressiva empurrada cedo demais**, mecânicas pay-to-win explícitas, prioridade de quantidade sobre qualidade nos jogos publicados, toxicidade em chats sociais. [DevForum threads diversos](https://devforum.roblox.com/t/players-keep-leaving-reason/4191385)

## 7. Monetização — como funciona na prática (2026)

- **Game Passes**: compra única e permanente, aplicada e reforçada pela própria plataforma (`UserOwnsGamePassAsync`). Bom para VIP, ferramentas permanentes, cosméticos, multiplicadores. [Mythras](https://gamertagmythras.com/blog/roblox/roblox-game-passes-developer-products-guide)
- **Developer Products**: recompráveis, processados via `MarketplaceService.ProcessReceipt`. Ideal para moeda in-game, consumíveis. Segundo análises de 2026, a receita recorrente do "top 8% de gastadores" via Dev Products supera as vendas únicas de Game Passes em quase todos os gêneros na escala. [RoWatcher](https://rowatcher.com/news/developer-products-vs-game-passes-you-re-using-both-wrong)
- **Mudança importante em 29/mai/2026**: Roblox desabilitou vendas cross-game de Game Passes/Dev Products — cada produto precisa ser nativo da experiência que o usa; migrar para Transfers API se necessário. [gamertagmythras.com](https://gamertagmythras.com/blog/roblox/roblox-game-passes-developer-products-guide)
- **Corte da plataforma**: Roblox retém 30% (marketplace fee) — o criador fica com 70% em Robux.
- **Creator Rewards Program** (sucessor do antigo Engagement-Based Payouts, lançado jul/2025):
  - *Daily Engagement Rewards*: automático, sem inscrição — creator ganha Robux quando um "Active Spender" fica 10+ min na experiência e ela está entre as 3 primeiras que ele abre no dia. [Roblox Creator Hub](https://create.roblox.com/docs/creator-rewards)
  - *Audience Expansion Rewards*: exige conta verificada por ID e DevEx válido.
- **DevEx (cash-out para dinheiro real)**: requer 13+ anos, mínimo de **30.000 Robux ganhos**, email verificado, conta DevEx válida, informações fiscais. Taxa de câmbio 2026: **$0.0038 por Robux**. [ROLearn](https://rolearn.dev/guidance/roblox-devex-requirements-2026/)

## 8. Segurança — exploits e validação server-side

- Princípio fundamental: **um exploiter tem controle total sobre o cliente e o tráfego de rede local** — qualquer validação que confie no cliente será eventualmente quebrada. [Simplified Media](https://simplified.media/guides/roblox-anti-exploit)
- Toda decisão que afeta gameplay (dano, moeda, posição, inventário) deve viver em `Script` (servidor), nunca em `LocalScript`. O cliente só envia *intenção*, nunca resultado. [Roblox Creator Hub — Security Tactics](https://create.roblox.com/docs/scripting/security/security-tactics)
- Se um RemoteEvent grava direto num DataStore sem re-validar no servidor, exploiters encontram a falha em menos de uma semana pós-lançamento — achado recorrente em relatos do DevForum.
- Em 2026 a Roblox lançou **Server Authority**, feature de plataforma para reforçar que o servidor é a fonte de verdade da simulação. [Roblox Newsroom, jul/2026](https://about.roblox.com/newsroom/2026/07/creating-responsive-cheat-resistant-games-roblox-server-authority)

## 9. Ferramentas/frameworks open source relevantes

- **ProfileService** (MadStudioRoblox) — hoje é a base recomendada para persistência de dados de jogador em 2026: garante que o profile do jogador só é carregado em um servidor por vez (lock token via DataStore), evitando duplicação/corrupção por múltiplas sessões simultâneas. [ProfileService docs](https://madstudioroblox.github.io/ProfileService/), [MattQ blog](https://mattqdev.github.io/blog/profileservice-datastore-in-roblox-studio-2026-developer-guide)
- **ReplicaService** — complementa o ProfileService para replicar dados do jogador do servidor pro cliente de forma segura.
- **Knit** — framework leve para organizar comunicação cliente/servidor (Services + Controllers). Amplamente adotado pela comunidade.
- **Rojo** — sincroniza código entre editor externo (VS Code / Claude Code) e Roblox Studio, permitindo workflow de "código como arquivo" com controle de versão real (git) em vez de escrever tudo dentro do Studio. [GitHub topics: roblox+luau](https://github.com/topics/roblox?l=luau)

## 10. Integração Claude Code ↔ Roblox Studio — achado crítico

- A Roblox lançou em **fevereiro de 2026** um **MCP server oficial embutido no Studio** (File → Studio Settings → Beta Features → MCP Server, porta padrão `localhost:3004`). Não exige toolchain Rust. [Roblox/studio-rust-mcp-server (GitHub oficial)](https://github.com/Roblox/studio-rust-mcp-server)
- Com isso, Claude Code pode: rodar código Lua diretamente no Studio, inserir modelos, monitorar console, e interagir com o workspace em tempo real — sem copiar/colar manual. [luismori.dev](https://luismori.dev/article/roblox-game-development-with-mcp/)
- Existe também uma **Skill de Claude Code dedicada a Roblox**: [`brockmartin/roblox-game-skill`](https://github.com/brockmartin/roblox-game-skill) — 133 stars, 20 forks, oferece 16 arquivos de referência (Luau, arquitetura, segurança, DataStore, GUI), 7 templates de gênero prontos (simulador, tycoon, obby, RPG, horror, battle royale), 7 workflows guiados (do zero, debug, auditoria de performance, revisão de segurança, checklist de pré-lançamento) e integração com o MCP Studio. Atividade de commits é baixa (3 commits visíveis), então tratar como ponto de partida a auditar, não como dependência crítica de longo prazo.
  - **Ação recomendada**: registrar como ferramenta candidata em `05-ferramentas-github.md`, avaliar antes de adotar (ver critérios do prompt mestre: manutenção, licença, risco de abandono).

## Fontes consolidadas
- [BloxSniper — Trending Rankings](https://bloxsniper.cc/trending/roblox-august-2026)
- [RoWatcher — Most Popular Games Now](https://rowatcher.com/news/the-most-popular-roblox-games-right-now-ranked-by-live-players)
- [SpawnRadar — All-Time CCU Records](https://www.spawnradar.com/records)
- [ExitLag — Genres and Popularity 2026](https://www.exitlag.com/blog/roblox-game-genres-and-popularity/)
- [RobloxDesk — Most Profitable Genres 2026](https://www.robloxdesk.com/most-profitable-roblox-game-genres-2026/)
- [Roblox Creator Hub — Retention Docs](https://create.roblox.com/docs/production/analytics/retention)
- [BLOXG — Retention Benchmarks](https://bloxg.com/statistics/roblox-retention-benchmarks)
- [Roblox Creator Hub — Creator Rewards](https://create.roblox.com/docs/creator-rewards)
- [ROLearn — DevEx Requirements 2026](https://rolearn.dev/guidance/roblox-devex-requirements-2026/)
- [gamertagmythras — Game Pass vs Dev Product Guide](https://gamertagmythras.com/blog/roblox/roblox-game-passes-developer-products-guide)
- [Roblox Creator Hub — Security Tactics](https://create.roblox.com/docs/scripting/security/security-tactics)
- [Roblox Newsroom — Server Authority (jul/2026)](https://about.roblox.com/newsroom/2026/07/creating-responsive-cheat-resistant-games-roblox-server-authority)
- [ProfileService Docs](https://madstudioroblox.github.io/ProfileService/)
- [Roblox/studio-rust-mcp-server (oficial)](https://github.com/Roblox/studio-rust-mcp-server)
- [brockmartin/roblox-game-skill](https://github.com/brockmartin/roblox-game-skill)
- [SQ Magazine — Roblox Statistics 2026](https://sqmagazine.co.uk/roblox-statistics/)
