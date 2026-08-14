# Log de Decisões Técnicas

Formato: DECISÃO / MOTIVO / ALTERNATIVAS / TRADE-OFFS / IMPACTO / DATA

---

## D001 — Documentação em Markdown + pastas locais, não Notion/ClickUp/Plane
- **DECISÃO**: usar arquivos Markdown em `docs/` como GDD vivo e mapa de processo (Épico→Feature→Tarefa via checkboxes), em vez de ferramenta externa de gestão.
- **MOTIVO**: usuário indicou preferência explícita por Markdown+GitHub; ferramentas como Notion/ClickUp exigem OAuth não disponível nesta sessão; para um solo dev, arquivo versionável é suficiente e sem custo.
- **ALTERNATIVAS**: Notion, ClickUp, Plane, Miro/FigJam (mencionados no prompt mestre).
- **TRADE-OFFS**: perdemos visualização tipo board/kanban nativo; ganhamos versionamento via git, zero custo, zero fricção de autenticação, edição direta pelo Claude Code.
- **IMPACTO**: se o projeto crescer para equipe, reavaliar — um board visual colaborativo pode compensar o custo de setup.
- **DATA**: 2026-08-13

---

## D002 — Gênero recomendado: Simulador de coleta/progressão (não RPG, não PvP, não social/roleplay)
- **DECISÃO**: recomendar simulador de coleta/progressão em nicho específico como conceito de partida para a Fase 1.
- **MOTIVO**: maior pontuação no ranking ponderado por perfil (`03-conceitos-ranking.md`) — melhor equilíbrio entre dificuldade técnica baixa (compatível com iniciante total) e potencial de retenção/monetização comprovado por dados de mercado (`01-pesquisa-mercado.md`).
- **ALTERNATIVAS**: Tycoon simples (2º lugar, boa alternativa), Obby (mais fácil mas teto baixo), RPG/PvP/Fighting (desclassificados por risco técnico incompatível com o perfil).
- **TRADE-OFFS**: mercado de simuladores é mais concorrido; compensamos com escolha de nicho/tema específico (a definir na Fase 1), não com complexidade técnica extra.
- **IMPACTO**: define toda a arquitetura recomendada nas fases seguintes (foco em progressão numérica + persistência, não em física/combate).
- **DATA**: 2026-08-13

---

## D003 — Não adotar `roblox-game-skill` (nem qualquer dependência de terceiros) sem validação adicional
- **DECISÃO**: registrar a Skill como candidata forte, mas não integrar automaticamente antes de confirmar licença e reavaliar maturidade na Fase 1/2.
- **MOTIVO**: só 3 commits visíveis no repositório apesar de 133 stars — sinal de manutenção incerta; regra do prompt mestre exige avaliar atividade/licença/risco de abandono antes de adotar (item 10).
- **ALTERNATIVAS**: construir do zero seguindo a documentação oficial da Roblox Creator Hub; usar só como material de leitura/aprendizado sem incorporar código diretamente.
- **TRADE-OFFS**: perdemos velocidade inicial se não usarmos os templates prontos; ganhamos independência de uma dependência de manutenção incerta.
- **IMPACTO**: Fase 2 (Protótipo) deve reavaliar esse repositório especificamente antes de decidir.
- **DATA**: 2026-08-13

---

## D004 — Mobile-first obrigatório desde o design inicial
- **DECISÃO**: toda decisão de UI/UX e controle deve assumir tela pequena/touch como caso primário, não desktop.
- **MOTIVO**: 80% das sessões Roblox são mobile em 2026 (`01-pesquisa-mercado.md` seção 1) — desenhar para desktop primeiro e portar depois é a ordem errada e cara de corrigir.
- **ALTERNATIVAS**: design desktop-first com adaptação mobile posterior (comum em outras plataformas, mas inadequado aqui).
- **TRADE-OFFS**: nenhum trade-off real identificado — é estritamente melhor dado o perfil de audiência da plataforma.
- **IMPACTO**: afeta Fase 1 (GDD), Fase 3 (Core Gameplay) e Fase 8 (Polish).
- **DATA**: 2026-08-13

---

## D005 — ProfileService + ReplicaService como base de persistência, não solução customizada
- **DECISÃO**: usar ProfileService para dados de jogador desde a Fase 3, em vez de escrever um sistema de DataStore do zero.
- **MOTIVO**: resolve um problema já resolvido e testado pela comunidade (lock de sessão, prevenção de corrupção/duplicação) — construir isso do zero seria reinvenção desnecessária (regra 45 do prompt mestre) e um risco de segurança alto para um iniciante.
- **ALTERNATIVAS**: DataStore2 (alternativa mais antiga, mas ProfileService é indicado como melhor base para novos projetos em 2026), solução 100% customizada.
- **TRADE-OFFS**: dependência de uma lib de terceiros madura, porém pequena e estável — risco de abandono baixo dado uso amplo pela comunidade.
- **IMPACTO**: define parte da arquitetura de persistência em `04-roadmap.md` Fase 3.
- **DATA**: 2026-08-13

---

## D006 — Gênero (Simulador) confirmado como ponto de partida, mas não definitivo
- **DECISÃO**: iniciar a Fase 1 assumindo Simulador de coleta/progressão, mas rodar uma validação comparativa rápida contra Tycoon simples antes de fechar o conceito definitivamente.
- **MOTIVO**: usuário aprovou a direção do ranking (D002), mas pediu explicitamente para não tratar a escolha como 100% travada — quer ver evidência antes de descartar a 2ª colocada.
- **ALTERNATIVAS**: fechar o gênero agora sem revalidação (rejeitado pelo usuário); adiar toda a Fase 1 até comparar todos os 8 conceitos do ranking (descartado — desproporcional, já filtrado por critérios objetivos em D002).
- **TRADE-OFFS**: mais uma rodada de pesquisa antes de fechar o conceito; ganho é reduzir risco de comprometer meses de trabalho com o gênero errado.
- **IMPACTO**: Fase 1 inclui uma comparação dedicada Simulador vs. Tycoon antes da escolha de tema.
- **DATA**: 2026-08-13

---

## D007 — Pesquisa de nicho/tema é obrigatória na Fase 1
- **DECISÃO**: a Fase 1 deve necessariamente incluir descoberta e comparação de temas candidatos dentro do gênero escolhido, avaliados por: demanda, concorrência, diferenciação, facilidade de desenvolvimento, retenção, monetização, potencial de conteúdo/atualizações, adequação a solo iniciante, potencial visual/viral, e possibilidade de acelerar produção com IA.
- **MOTIVO**: usuário não tem tema definido e explicitamente rejeitou escolher por "parecer divertido" — quer análise comparativa fundamentada.
- **ALTERNATIVAS**: escolher tema por preferência pessoal do usuário ou do assistente (rejeitado).
- **TRADE-OFFS**: mais tempo de pesquisa antes do GDD, mas reduz risco de escolher um tema saturado ou difícil de produzir sozinho.
- **IMPACTO**: `03-conceitos-ranking.md` ganha uma seção de temas candidatos com os mesmos critérios de rigor usados para gêneros.
- **DATA**: 2026-08-13

---

## D008 — Repositório GitHub aprovado, detalhes a confirmar antes da criação
- **DECISÃO**: usuário aprovou a criação de um repositório Git/GitHub real como parte central do projeto (código, docs, decisões, roadmap, issues, versionamento). Nome, visibilidade, estrutura inicial e conteúdo do primeiro commit serão confirmados com o usuário antes da criação efetiva.
- **MOTIVO**: criação de repositório é ação visível/pouco reversível — mesmo com aprovação geral, os detalhes específicos são confirmados antes de executar, por instrução direta do usuário.
- **ALTERNATIVAS**: criar com valores padrão sem confirmar (rejeitado pelo usuário).
- **TRADE-OFFS**: nenhum — é apenas uma etapa de confirmação antes da execução.
- **IMPACTO**: nenhuma informação sensível será commitada; repositório passa a ser a fonte de verdade do projeto a partir de sua criação.
- **DATA**: 2026-08-13

---

## D009 — MCP Server, Rojo e Roblox Studio adiados até aprovação da Fase 1
- **DECISÃO**: nenhuma ferramenta técnica (MCP Studio, Rojo, Roblox Studio) será instalada ou configurada até que o GDD da Fase 1 seja aprovado no Checkpoint 1. A Fase 1 não abre o Roblox Studio nem escreve Luau.
- **MOTIVO**: instrução explícita do usuário — evitar instalar ferramentas antes de saber exatamente o que o conceito aprovado vai precisar.
- **ALTERNATIVAS**: configurar ambiente técnico em paralelo à Fase 1 (rejeitado pelo usuário).
- **TRADE-OFFS**: nenhum — é sequenciamento deliberado (Fase 0 → Checkpoint 0 → Fase 1 → Checkpoint 1 → Configuração técnica → Protótipo).
- **IMPACTO**: define a ordem de execução registrada em `04-roadmap.md`.
- **DATA**: 2026-08-13

---

## D010 — Critério de decisão de gênero muda de "tempo de desenvolvimento" para "retenção estrutural ponderada"
- **DECISÃO**: a comparação Simulador vs. Tycoon (D006) é substituída por uma análise de 4 estruturas (Tycoon puro, Simulador puro, Híbrido Tycoon+Simulador, Híbrido Coleta+Exploração tipo "Fisch"), pontuadas principalmente por potencial de retenção estrutural (loops), não por velocidade de construção.
- **MOTIVO**: usuário rejeitou explicitamente decidir pelo menor tempo de desenvolvimento — objetivo é o menor jogo construível solo que ainda tenha estrutura de retenção forte o suficiente para crescer em produto de longo prazo.
- **ALTERNATIVAS**: manter o critério de tempo como decisivo (rejeitado pelo usuário).
- **TRADE-OFFS**: o vencedor do novo score (Híbrido Fisch-like) é também o mais complexo tecnicamente dos 4 — por isso a recomendação é uma versão deliberadamente simplificada dele, não a escala completa do jogo de referência.
- **IMPACTO**: nova análise completa em `08-analise-retencao-generos.md`; decisão final de gênero ainda pendente de confirmação do usuário.
- **DATA**: 2026-08-13

---

## D011 — Gênero/estrutura confirmado: Híbrido Coleta + Exploração (Fisch-like), MVP deliberadamente pequeno
- **DECISÃO**: confirmado o Híbrido Coleta+Exploração (vencedor do score em `08-analise-retencao-generos.md`) como estrutura do jogo. Escopo do MVP definido explicitamente pelo usuário: 1 área jogável, poucas dezenas de itens/criaturas, 3-5 níveis de raridade, algumas mutações/variantes visuais, uma ferramenta que evolui, coleção/Bestiary, progressão suficiente para desbloquear uma 2ª área no futuro (não incluída no MVP).
- **MOTIVO**: melhor equilíbrio entre retenção estrutural e complexidade viável para um solo iniciante, segundo o usuário — mas só aceitável se o escopo for muito menor que o jogo de referência (Fisch).
- **ALTERNATIVAS**: Simulador puro (2º lugar no score, mais simples) — descartado pelo usuário em favor do híbrido, desde que o MVP seja pequeno.
- **TRADE-OFFS**: mais complexidade técnica que um simulador puro (sistema de raridade/mutação, Bestiary, minigame de coleta), compensada por escopo restrito nas primeiras fases.
- **IMPACTO**: este escopo de MVP passa a ser a referência para todo o roadmap (`04-roadmap.md`) e o GDD (Fase 1, próxima etapa). A pesquisa de tema (D007) agora é feita especificamente para essa estrutura.
- **DATA**: 2026-08-13
