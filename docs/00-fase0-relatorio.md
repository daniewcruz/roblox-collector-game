# RELATÓRIO DE FASE 0 — Pesquisa Estratégica

**Data**: 2026-08-13
**Perfil do projeto**: solo, iniciante total em Roblox/Luau, apoio de IA (Claude Code), 10-20h/semana, documentação em Markdown+GitHub.

---

## 1. O que descobrimos

- **Mobile domina a Roblox** (~80% das sessões, Q1 2026) — qualquer design deve ser mobile-first, não desktop-first.
- **Simuladores e tycoons** são os gêneros de melhor relação dificuldade/retenção/monetização; obbies têm menor barreira mas menor teto.
- **Retenção é o principal canal de aquisição gratuita**: o algoritmo de Discovery promove jogos com bom D1/D7/D30, então retenção não é só saúde do produto — é marketing.
- **Onboarding ruim é a maior causa de churn** citada por outros desenvolvedores (até 50% não completam o tutorial).
- **Monetização em 2026 mudou**: cross-game sales de Game Passes/Dev Products foi desabilitado (mai/2026); Creator Rewards Program substituiu o antigo sistema de payouts.
- **Segurança é inegociável**: toda lógica de gameplay (moeda, dano, inventário) precisa validação 100% server-side — a comunidade Roblox tem casos documentados de exploits por confiar no cliente.
- **Achado que muda o plano de execução**: existe agora um **MCP Server oficial da Roblox** (fev/2026) que conecta Claude Code diretamente ao Roblox Studio, e uma **Skill de Claude Code dedicada a Roblox** (`roblox-game-skill`) com templates de gênero prontos. Isso reduz significativamente a barreira de entrada para um iniciante.
- **ProfileService** é o padrão de mercado 2026 para persistência de dados de jogador — não deve ser reinventado.

Fontes completas em [`01-pesquisa-mercado.md`](01-pesquisa-mercado.md).

## 2. Oportunidades

- Nicho dentro de "simulador de coleta/progressão" com tema popular fora do Roblox mas pouco explorado dentro dele (hipótese H1, a validar na Fase 1).
- Diferenciação por equilíbrio "free-to-play não frustrante" — crítica recorrente contra líderes do gênero é percepção de pay-to-win.
- Tycoon simples como alternativa igualmente viável se a pesquisa de nicho em simulador não encontrar um bom espaço.

## 3. Melhores conceitos (ver ranking completo)

Ver [`03-conceitos-ranking.md`](03-conceitos-ranking.md) para a tabela completa com critérios e pontuação.

**Top 3 do ranking (perfil-ponderado, /35):**
1. Simulador de coleta/progressão em nicho específico — **28**
2. Tycoon simples em nicho específico — **25**
3. Obby temático/curado — **24**

## 4. Ranking

Ver tabela completa em [`03-conceitos-ranking.md`](03-conceitos-ranking.md). Critérios: dificuldade técnica, concorrência, retenção potencial, monetização potencial, diferenciação viável, sustentabilidade de manutenção, risco técnico — todos ponderados para o perfil solo/iniciante/10-20h.

## 5. Concorrentes

Analisados: Pet Simulator 99, Grow a Garden, Steal a Brainrot, Blox Fruits, tycoons de referência (Retail/Restaurant/Theme Park Tycoon 2), Tower of Hell. Detalhes, pontos fortes/fracos e limitações da pesquisa em [`02-concorrentes.md`](02-concorrentes.md).

**Limitação importante**: não foi possível obter reviews estruturados/quantitativos de concorrentes específicos nesta rodada — pendente para quando o conceito final for escolhido.

## 6. Estratégia de gameplay

- Core loop recomendado: **ação simples → recompensa imediata → número que cresce → forma de mostrar progresso**.
- Primeira sessão deve entregar a primeira recompensa em minutos, não ao final de um tutorial longo (combate direto à causa nº1 de churn).
- Progressão deve ter curva testável desde o MVP, mesmo que curta.
- Detalhes de fases em [`04-roadmap.md`](04-roadmap.md).

## 7. Estratégia de retenção

- Meta inicial realista: **D1 ≥ 20%, D7 ≥ 8%, D30 ≥ 3%** (faixa "Bom" dos benchmarks 2026).
- Prioridade #1 de design: onboarding — reduzir tempo até a primeira recompensa.
- Eventos de analytics a instrumentar desde o protótipo: entrada, conclusão de tutorial, primeira recompensa, progressão, retorno, duração de sessão (ver item 18 do escopo original e `04-roadmap.md` Fase 9).
- Hipóteses de retenção documentadas e testáveis em [`07-hipoteses.md`](07-hipoteses.md) (H2, H4).

## 8. Estratégia de monetização

- Combinação Game Passes (compra única, ex: VIP/multiplicador) + Developer Products (recompráveis, ex: moeda) — ver mecânica detalhada em [`01-pesquisa-mercado.md`](01-pesquisa-mercado.md) seção 7.
- Regra: monetização só entra na Fase 7, depois que economia (Fase 5) já estiver balanceada — nunca antes de haver algo divertido para vender em cima.
- Evitar pay-to-win explícito — crítica recorrente contra concorrentes (H3 em `07-hipoteses.md`).
- Atenção à mudança de maio/2026: produtos/passes devem ser nativos da experiência (sem cross-game sales).
- Creator Rewards Program roda automaticamente (Daily Engagement Rewards) — não exige setup extra além de manter o jogo em conformidade.

## 9. Tecnologia

- Luau + Roblox Studio (linguagem/engine da plataforma, sem alternativa).
- **Rojo** para sincronizar código com editor externo/git — essencial para o fluxo com Claude Code.
- **MCP Server oficial da Roblox** para Claude Code interagir com o Studio em tempo real.
- **ProfileService + ReplicaService** para persistência segura de dados.
- Validação server-side obrigatória em toda lógica de gameplay/economia desde o primeiro commit (não é polimento posterior).
- Detalhes e justificativas por dependência em [`05-ferramentas-github.md`](05-ferramentas-github.md).

## 10. Ferramentas/GitHub

Inventário completo com licença/risco/manutenção em [`05-ferramentas-github.md`](05-ferramentas-github.md). Resumo:
- **Adotar já**: MCP Server oficial (Roblox), Rojo, ProfileService, ReplicaService.
- **Avaliar antes de adotar**: `roblox-game-skill` (candidata forte, mas manutenção incerta — 3 commits visíveis apesar de 133 stars).
- **Não adotar ainda**: Knit (framework) — complexidade prematura para o escopo do MVP.

## 11. Arquitetura inicial

Alto nível, sem código ainda:
- **Cliente/servidor**: toda decisão que afeta estado do jogo (moeda, itens, progressão) vive em Scripts no servidor; cliente só envia intenção via RemoteEvents e recebe resultado validado.
- **Persistência**: ProfileService por jogador, com ReplicaService replicando estado relevante para o cliente.
- **Módulos**: separar por domínio (Coleta, Progressão, Economia, Monetização) em ModuleScripts, evitando scripts monolíticos (regra 13 do escopo original).
- **Sem framework pesado (Knit) no MVP** — reavaliar apenas se a complexidade de comunicação cliente/servidor justificar.
- Detalhado incrementalmente conforme as Fases 2-3 do roadmap avançam.

## 12. Mapa de processos

Adotado: **Markdown + estrutura de pastas em `docs/`** como substituto de ferramenta externa (Notion/ClickUp/Plane), decisão registrada em [`06-decisoes.md`](06-decisoes.md) (D001). Estrutura Épico→Feature→Tarefa em checkboxes já demonstrada em [`04-roadmap.md`](04-roadmap.md).

## 13. Roadmap

Fase 0 (esta) → Fase 12 (Escala), com objetivo/dependências/critério de sucesso/riscos por fase. Completo em [`04-roadmap.md`](04-roadmap.md).

## 14. Riscos

- **Mercado muda rápido**: dados de CCU/tendências podem estar desatualizados em poucos meses — revalidar antes do lançamento real.
- **Risco de abandono de dependência**: `roblox-game-skill` tem atividade de commits baixa.
- **Risco de escopo**: maior ameaça ao sucesso de um solo iniciante não é falta de ideias, é MVP inchando além do sustentável em 10-20h/semana — mitigado pelo ranking que já filtrou gêneros de alto risco técnico.
- **Risco de viralização como premissa**: picos de CCU recordes (Grow a Garden etc.) não são replicáveis por planejamento — não devem virar meta de lançamento (H4).
- **Risco de segurança**: exploits de DataStore/RemoteEvents são bem documentados na comunidade — mitigado por adotar ProfileService + validação server-side desde o início.

## 15. O que ainda não sabemos

Lista completa em [`07-hipoteses.md`](07-hipoteses.md), seção "Perguntas em aberto":
1. Tema/nicho específico dentro de "simulador de coleta" (depende de pesquisa de gap, Fase 1)
2. Reviews estruturados de concorrentes diretos
3. Licença exata do `roblox-game-skill`
4. Estratégia de aquisição orgânica fora do Discovery (TikTok, YouTube Shorts)
5. Estratégia de assets/arte (IA vs. manual vs. Creator Store)

## 16. Perguntas que o usuário precisa responder

1. **Confirma o gênero recomendado** (simulador de coleta/progressão) como direção para a Fase 1, ou prefere explorar Tycoon (2º colocado) primeiro?
2. Quer que a Fase 1 já inclua a pesquisa de nicho/tema específico (H1), ou prefere sugerir um tema de partida?
3. Autoriza a criação de um **repositório Git/GitHub real** para o projeto (ação que, por ser visível/pouco reversível, não foi feita nesta fase sem confirmação)?
4. Quer configurar o MCP Server do Roblox Studio + Rojo já na próxima sessão (Fase 2), ou prefere fechar o GDD (Fase 1) primeiro?

## 17. Recomendação

Seguir para a **Fase 1 (Conceito)** com o gênero **Simulador de coleta/progressão em nicho específico**, mantendo Tycoon simples como plano B documentado. Não pular para código/Studio antes de fechar um GDD curto que responda concretamente "por que o jogador volta amanhã" para o nicho escolhido — isso evita o erro mais comum de iniciantes solo: começar a programar antes de saber o que exatamente está sendo construído.

## 18. Próxima decisão

**Aguardando confirmação do usuário** sobre as perguntas da seção 16 antes de iniciar a Fase 1. Nenhum código Luau, nenhuma abertura do Roblox Studio, e nenhuma criação de repositório Git foi feita nesta fase — conforme o plano aprovado.
