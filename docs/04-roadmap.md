# Roadmap — Fase 0 a Fase 12

> Cada fase lista objetivo, entregas, dependências, critério de sucesso e principais riscos. Adaptado ao perfil: iniciante solo, 10-20h/semana — por isso as fases iniciais são deliberadamente mais longas em tempo de calendário do que seriam para uma equipe experiente.

## FASE 0 — Pesquisa (ESTA FASE)
- **Objetivo**: entender mercado, escolher direção de gênero, mapear ferramentas.
- **Entregas**: os documentos em `docs/`.
- **Critério de sucesso**: relatório final aprovado pelo usuário, com decisão de conceito tomada conscientemente.
- **Riscos**: pesquisa desatualizar rápido (mercado Roblox muda mês a mês) — recomenda-se revalidar dados de mercado antes do lançamento real.

## FASE 1 — Conceito
- **Objetivo**: transformar a recomendação de gênero em um conceito de jogo específico (tema, nome provisório, público-alvo, referência visual).
- **Dependências**: Fase 0 concluída e aprovada.
- **Tarefas**: escolher nicho/tema (pesquisa de gaps fora do Roblox), esboçar GDD inicial (core loop, primeira sessão, primeira recompensa), decidir escopo do MVP (Épico → Feature).
- **Critério de sucesso**: GDD curto (1-2 páginas) capaz de responder "por que o jogador volta amanhã?" de forma concreta.

## FASE 1.5 — Validação Visual (D021, critérios expandidos D023)
- **Objetivo**: testar 5-10 conceitos visuais de Mimo (esboços/silhuetas) antes de comprometer arte final. Pergunta-teste: "qual deles faria uma criança parar o scroll e dizer: EU QUERO ESSE?" — não "qual é mais bonito?".
- **Dependências**: Checkpoint 1 aprovado (GDD `10-gdd.md`, seção 1b/1d).
- **Tarefas**: gerar/esboçar conceitos variados; avaliar por silhueta, fofura, expressão, personalidade, potencial de animação, potencial de meme, potencial de skin, legibilidade em thumbnail pequena, potencial de família de variantes, diferenciação de outros jogos Roblox; coletar reação informal de pessoas fora do projeto (idealmente incluindo crianças do público-alvo) se possível.
- **Critério de sucesso**: uma direção visual vencedora escolhida, com justificativa registrada em `06-decisoes.md`.
- **Nota**: roda em paralelo com a Configuração Técnica (Fase 2), que pode usar placeholders — só bloqueia produção de arte final (Fase 8).

## FASE 2 — Configuração Técnica + Protótipo (D022: escopo restrito a infraestrutura)
- **Objetivo**: preparar infraestrutura e arquitetura, e validar o Core Gameplay como hipótese (D024, GDD seção 4b) — **não** construir economia, monetização ou conteúdo completos ainda, que dependem da validação do Core Gameplay.
- **Dependências**: Fase 1 (Checkpoint 1 aprovado).
- **Tarefas permitidas nesta fase** (D022): configurar Rojo + Claude Code + MCP Studio oficial; estrutura de pastas do projeto; esquema de dados de criaturas (Mimos); esquema de sistema de raridade; esquema de sistema de variantes/skins (estrutura de dados, não catálogo completo); estrutura de dados de eventos (hooks, não eventos implementados); estrutura de dados de progressão; configuração de persistência (ProfileService); configuração de ambiente de desenvolvimento; Git/branches; placeholders visuais/de dados.
- **Tarefas explicitamente fora desta fase**: sistemas completos de economia, monetização, conteúdo final (dezenas de Mimos reais, catálogo de skins) — ficam para Fases 3/5/7, só depois do Core Gameplay validado.
- **Tarefas de validação de gameplay (paralelas, D024)**: implementar 2-4 protótipos isolados dos candidatos de interação central listados no GDD (seção 4b: toque físico, coaxar por ritmo, escavar/limpar, empurrar/rolar); testar repetição de 15-20 vezes sem recompensa rara para checar se a interação sozinha é agradável.
- **Pendência técnica (D052)**: decidir Character Controller Library (sistema novo de movimento por habilidades modulares) vs. Humanoid tradicional — relevante se algum candidato de interação (ex: arremesso preciso) precisar de habilidade de mira/movimento customizada.
- **Método de prototipagem recomendado pela documentação oficial (D052)**: Paper Prototyping (mais rápido, sem código, bom para validar UI/sistemas) ou Studio Prototyping (testa viabilidade técnica real) — prototipagem deve ser "rápida e estreita", testando só o aspecto específico da interação, não a feature inteira.
- **Critério de sucesso**: usuário consegue rodar Studio, ver código sincronizado via Rojo, usar Claude Code para gerar/depurar um script simples — **e** uma interação central validada como divertida por si só, escolhida entre os candidatos testados.
- **Prática recomendada pela comunidade de desenvolvedores (D055, `15-licoes-comunidade-roblox.md`)**: mostrar o protótipo (mesmo bruto/whitebox) para 2-3 pessoas fora do projeto **já nesta fase**, não só esperar o Beta (Fase 9) — desenvolvimento solo cria "câmara de eco"; feedback externo antecipado é barato e reduz risco real de o projeto travar sem ninguém perceber.

## FASE 3 — Core Gameplay
- **Objetivo**: implementar o loop central do conceito escolhido (ex: coletar → progressão → mostrar resultado).
- **Dependências**: Fase 2 (ambiente funcionando).
- **Tarefas**: arquitetura cliente/servidor inicial (ver seção Arquitetura no relatório), sistema de progressão básico, validação server-side desde o primeiro commit.
- **Critério de sucesso**: um jogador consegue completar o loop core sozinho, sem bugs bloqueantes, com dados persistidos corretamente.

## FASE 4 — Progressão
- **Objetivo**: profundidade de progressão (níveis, raridades, upgrades) que sustente sessões repetidas.
- **Dependências**: Fase 3.
- **Critério de sucesso**: existe uma curva de progressão testável (ainda que curta) do início ao "final do conteúdo do MVP".

## FASE 5 — Economia
- **Objetivo**: balancear fontes e sinks de moeda in-game antes de qualquer monetização real.
- **Dependências**: Fase 4.
- **Método recomendado pela documentação oficial (D053)**: calcular Valor Esperado (EV = valor do item × probabilidade de obtenção) para prever se a chance de raridade gera excesso/escassez de recursos antes de publicar; usar sumidouros eficazes (itens cosméticos por tempo limitado, moeda de evento exclusiva) em vez de só reduzir ganho.
- **Critério de sucesso**: economia não quebra (inflação descontrolada) em testes manuais de sessões longas simuladas.

## FASE 6 — Social/Multiplayer básico
- **Objetivo**: adicionar elementos sociais mínimos (ver outros jogadores, talvez trocar/mostrar progresso) — sem exigir netcode competitivo.
- **Dependências**: Fase 5.
- **Critério de sucesso**: funcionalidade social não quebra a performance nem a economia.
- **Visão de longo prazo (D045, não obrigatório desta fase)**: sistema completo de papéis/classes jogáveis (jogador escolhe um papel, ganha árvore de habilidades própria, desafios cooperativos que exigem 2+ papéis diferentes) — avaliar só depois do Core Gameplay pequeno já validado e do jogo ter alguma tração.
- **Visão de longo prazo (D047, não obrigatório desta fase)**: arena de PvP leve e opcional, separada do loop principal de exploração/coleção — exige sistema de dano/vida/hit detection. Manter tom "brinquedo" (contestos de empurrar/derrubar), não combate realista, para preservar a identidade do jogo e as salvaguardas éticas de público infantil (D020).

## FASE 7 — Monetização
- **Objetivo**: implementar Game Passes + Developer Products de forma não agressiva, seguindo estritamente as regras éticas de `10-gdd.md` seção 8 (D020) — sem loot boxes/pagar-por-chance, sem pressão de urgência artificial, core loop sempre jogável sem gastar.
- **Dependências**: Fase 6 (economia e progressão já equilibradas).
- **Critério de sucesso**: monetização não reduz retenção observável em teste com jogadores reais (ver Fase 9); nenhuma mecânica viola as regras da seção 8 do GDD.

## FASE 8 — Polish
- **Objetivo**: UX/UI, mobile responsivo, feedback visual/sonoro, performance.
- **Dependências**: Fase 7.
- **Critério de sucesso**: experiência jogável fim-a-fim sem fricção óbvia, testada em mobile real.

## FASE 9 — Beta
- **Objetivo**: validar com jogadores reais antes do lançamento público.
- **Dependências**: Fase 8.
- **Tarefas**: convidar grupo pequeno, medir D1 preliminar, coletar feedback qualitativo.
- **Critério de sucesso**: métricas de retenção preliminares dentro da faixa "Bom" dos benchmarks (`01-pesquisa-mercado.md` seção 4).

## FASE 10 — Lançamento
- **Objetivo**: publicar oficialmente, com ícone/thumbnail/descrição otimizados para Discovery.
- **Dependências**: Fase 9 com resultado aceitável.
- **Critério de sucesso**: jogo público, analytics básicos funcionando, sem erros críticos nas primeiras 48h.

## FASE 11 — Crescimento
- **Objetivo**: aquisição de jogadores além do orgânico do Discovery (conteúdo social, atualizações regulares).
- **Dependências**: Fase 10.
- **Critério de sucesso**: crescimento sustentado de DAU/retenção por 2+ atualizações consecutivas.

## FASE 12 — Escala
- **Objetivo**: só relevante se o jogo already provou tração — endereçar performance/arquitetura para volume maior de jogadores.
- **Dependências**: Fase 11 com tração comprovada.
- **Critério de sucesso**: decisão explícita de investir mais tempo/recursos, baseada em dados, não em esperança.

---

## Estrutura Épico → Feature → Tarefa (exemplo aplicado ao MVP)

```
ÉPICO: Core Gameplay
  FEATURE: Loop de Coleta
    - [ ] Definir mecânica de coleta (ação do jogador)
    - [ ] Implementar spawn de itens coletáveis (servidor)
    - [ ] Implementar validação server-side da coleta
    - [ ] UI de feedback imediato (mobile-first)
  FEATURE: Progressão
    - [ ] Sistema de níveis/raridades
    - [ ] Persistência via ProfileService
    - [ ] Balanceamento inicial (fontes vs. sinks)

ÉPICO: Monetização
  FEATURE: Developer Products
    - [ ] Definir produtos (ex: moeda extra)
    - [ ] Criar IDs no Creator Dashboard
    - [ ] Implementar ProcessReceipt com validação
    - [ ] Registrar evento de analytics na compra
  FEATURE: Game Passes
    - [ ] Definir passes (ex: VIP, multiplicador permanente)
    - [ ] Implementar checagem via UserOwnsGamePassAsync
```

Dependências explícitas: Core Gameplay → Progressão → Economia → Monetização (mesma ordem do prompt mestre, item 25).
