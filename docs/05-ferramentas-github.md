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
