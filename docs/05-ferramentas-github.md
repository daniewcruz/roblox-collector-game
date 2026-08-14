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

## ProfileService (MadStudioRoblox)
- **Finalidade**: persistência segura de dados de jogador — evita corrupção/duplicação por múltiplas sessões no mesmo DataStore.
- **Link**: [madstudioroblox.github.io/ProfileService](https://madstudioroblox.github.io/ProfileService/)
- **Motivo de considerar**: é o padrão de facto recomendado pela comunidade em 2026 para este problema específico; resolve um problema real e comprovado (lock de sessão) sem reinventar.
- **Onde seria usado**: Fase 3 (Core Gameplay) em diante, para toda persistência de progresso/moeda/inventário.
- **Risco**: baixo, adoção ampla e madura.

## ReplicaService
- **Finalidade**: replicar dados do servidor para o cliente de forma segura, complementa ProfileService.
- **Motivo de considerar**: mesmo raciocínio do ProfileService — problema comum e já resolvido.
- **Onde seria usado**: junto com ProfileService, Fase 3+.

## Rojo
- **Finalidade**: sincroniza arquivos de código entre um editor externo (ex: VS Code / pasta usada pelo Claude Code) e o Roblox Studio — permite versionar o projeto com git de verdade, em vez de escrever tudo dentro do Studio.
- **Link**: [github.com/topics/roblox?l=luau](https://github.com/topics/roblox?l=luau) (buscar repositório oficial `rojo-rbx/rojo`)
- **Motivo de considerar**: essencial para que Claude Code consiga editar arquivos de script como texto normal — sem Rojo, o fluxo "Claude Code escreve Luau" fica muito mais manual.
- **Onde seria usado**: Fase 2 (Protótipo), como parte do setup inicial de ambiente.

## Knit (framework opcional)
- **Finalidade**: organizar comunicação cliente/servidor via Services/Controllers.
- **Motivo de NÃO adotar ainda**: para um MVP pequeno e solo, a estrutura de Knit pode ser complexidade prematura (viola a Regra de Simplicidade do prompt mestre, item 42). **Reavaliar apenas se o projeto crescer** a ponto de a comunicação cliente/servidor ficar difícil de organizar sem framework.

## Ferramenta de gestão de processo/mapa
- **Decisão desta fase**: Markdown + estrutura de pastas em `docs/` (ver `06-decisoes.md` para justificativa completa). Não adotar Notion/ClickUp/Plane agora — exigiriam autenticação não disponível nesta sessão e adicionam uma dependência externa sem necessidade comprovada para um solo dev nesta fase inicial.

## O que ainda falta avaliar (pendências para Fase 1/2)
- Licença exata do `roblox-game-skill` antes de qualquer uso de código dele
- Rojo: confirmar repositório oficial, versão atual, processo de instalação
- Ferramentas de analytics dentro do próprio Roblox (Creator Hub Analytics nativo) vs. soluções de terceiros — não pesquisado a fundo nesta rodada
