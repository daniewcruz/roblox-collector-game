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
- **STATUS**: **revisada por D032** — ProfileService substituído por ProfileStore (mesmo autor, sucessor ativamente mantido).

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

---

## D012 — Tema final: Mineração + Criaturas de Cristal
- **DECISÃO**: confirmado o tema "Mineração + Criaturas de Cristal" (Opção A de `09-temas-nichos.md`), com um refinamento de design proposto pelo próprio usuário: a criatura não é o recurso principal, é a **recompensa da exploração** — descoberta ao quebrar um cristal raro, com um momento de reveal dedicado ("Algo está se movendo dentro...").
- **MOTIVO**: cria identidade visual/narrativa própria (não é confundível com Fisch/Catch Bugs à primeira vista, ao contrário da Opção B); mineração favorece produção incremental natural (novo minério → nova profundidade → nova criatura → nova ferramenta), facilitando expansão pós-MVP; reduz necessidade de centenas de espécies porque a criatura é rara por design, não o volume principal de conteúdo.
- **ALTERNATIVAS**: Opção B (Oceano + Mutação) — descartada por comparação mais fácil com Fisch.
- **TRADE-OFFS**: nenhum trade-off negativo identificado além dos já registrados em D011 (complexidade do híbrido em geral).
- **IMPACTO**: define o GDD (`10-gdd.md`) e todo o roadmap de conteúdo daqui em diante. Core loop fechado: Explorar → Minerar → Descobrir → Colecionar → Evoluir → Explorar mais fundo.
- **DATA**: 2026-08-13
- **STATUS**: **substituído por D013** — tema "mina de cristal" trocado por "mundo mágico" mantendo a mesma estrutura de loop.

---

## D013 — Tema final revisado: Mundo Mágico com Criaturas (substitui a ambientação de D012), inspirado na filosofia de design Nintendo
- **DECISÃO**: manter a estrutura já validada (Explorar → Descobrir → Colecionar → Evoluir → Explorar mais fundo, score 4.55/5 em `08-analise-retencao-generos.md`), mas trocar a ambientação de "mina de cristal" (fria/genérica, segundo o usuário) para um mundo mágico e fofo, com criaturas reveladas a partir de casulos/sementes/bolhas mágicas em vez de cristais minerados. Referência declarada de filosofia de design: jogos Nintendo (Pokémon, Animal Crossing), sem copiar personagens/IP.
- **MOTIVO**: usuário identificou que "mineração" soa genérica/já-padrão e quer identidade visual forte com apelo de colecionismo tipo Nintendo. A pesquisa em `11-pivot-fofura-colecao-skins.md` confirmou que a crítica era de posicionamento estético, não de estrutura — a estrutura de retenção validada continua a melhor opção, só precisa de uma ambientação com mais personalidade.
- **ALTERNATIVAS**: adotar uma das 5 direções originais do usuário "puras" (descartado — cada uma colide de frente com um concorrente dominante: Evomon, Knockout, ou Adopt Me, ver `11-pivot-fofura-colecao-skins.md`).
- **TRADE-OFFS**: nenhum trade-off estrutural novo — é uma re-ambientação (reskin temático), não uma mudança de sistemas. O trabalho de análise de retenção e escopo de MVP (D011) permanece válido.
- **IMPACTO**: `10-gdd.md` é revisado com a nova ambientação e uma seção de princípios de design inspirados em Nintendo (Miyamoto: ação principal, foco emocional, ensinar jogando, simplicidade; Pokémon: alegria da completude, descoberta; Animal Crossing: liberdade sem pressão, charme, decoração leve).
- **DATA**: 2026-08-13

---

## D014 — Referência de design restrita especificamente a jogos Super Mario
- **DECISÃO**: usar jogos da franquia Super Mario (Super Mario Bros. World 1-1, Super Mario World, Super Mario Odyssey) como referência direta de design, além da filosofia geral de Nintendo já registrada em D013. Princípios extraídos: verbo/ação primária única, ensinar jogando via posicionamento (não texto), estrutura kishōtenketsu por região, variedade de métodos de obtenção da mesma recompensa (Power Moons), variedade de habilidade por progressão (não só força numérica, referência Cappy/possessão), segredos/saídas escondidas de baixo custo e alto impacto, mundos tematicamente distintos. Sem copiar personagens, nomes ou assets — só estrutura de design.
- **MOTIVO**: pedido explícito do usuário para aprofundar a referência de "filosofia Nintendo" (D013) especificamente nos jogos Mario, provavelmente por serem o exemplo mais reconhecível de "ensinar jogando" e "variedade dentro de escopo pequeno" — que são exatamente os dois maiores desafios de design deste projeto (onboarding sem texto; evitar repetição num MVP pequeno, ver D011).
- **ALTERNATIVAS**: manter só os princípios gerais de Nintendo já registrados em D013 (rejeitado — usuário pediu especificamente Mario).
- **TRADE-OFFS**: nenhum negativo — os princípios extraídos são estruturais/pedagógicos, aplicáveis sem risco de violação de propriedade intelectual (nenhum personagem, nome ou asset é reutilizado).
- **IMPACTO**: `10-gdd.md` seção 2b, mais ajustes no Core Loop (verbo único, variedade de métodos de descoberta) e no escopo do MVP (segredo por região, mínimo de métodos de descoberta variados).
- **DATA**: 2026-08-13

---

## D015 — Ampliação da referência para 5 franquias Nintendo (Pokémon, Animal Crossing, Mario Odyssey, Kirby, Pikmin) + personalização expandida
- **DECISÃO**: ampliar a referência de design além de Mario (D014) para uma síntese de 5 franquias, cada uma mapeada a um sistema concreto e não-sobreposto do GDD: Pokémon → coleção/raridade/descoberta (já central); Animal Crossing → personalização de personagem + espaço de exibição pessoal (expandido, seção 6b nova); Mario Odyssey → curiosidade como regra de level design ("o que é aquilo ao longe?"); Kirby → critério de arte (silhueta simples/reconhecível, "fator fofura"); Pikmin → comportamento simples por tipo de criatura, gerando variedade de descoberta sem IA complexa. Pitch reformulado para "um pequeno mundo cheio de criaturas que você ainda não descobriu", abandonando de vez qualquer enquadramento de "mineração". Adicionado explicitamente o gatilho social de curiosidade ("como ele conseguiu isso?") como Return Loop + Social Loop.
- **MOTIVO**: usuário considerou a referência só a Mario insuficiente e pediu estudo de mais franquias especificamente pela ótica de "por que o loop funciona" (retenção, coleção, personalização, social, competição, emoção) — não só mecânica de exploração. Também pediu explicitamente mais peso em personalização/skins, que a v3 do GDD ainda tratava como sistema secundário.
- **ALTERNATIVAS**: manter só a referência Mario (D014) — insuficiente segundo o usuário para o objetivo de personalização/skins; copiar sistemas completos de Animal Crossing (decoração de casa completa) — rejeitado por já colidir de frente com Adopt Me, ver `11-pivot-fofura-colecao-skins.md`.
- **TRADE-OFFS**: sistema de personalização cresce um pouco em relação à v3 (1-2 slots cosméticos + cartão de perfil visível), mas continua deliberadamente menor que um sistema de decoração completo — mantém o MVP pequeno (D011) enquanto entrega a emoção de "quero deixar meu personagem mais bonito" que o usuário pediu.
- **IMPACTO**: `10-gdd.md` v4 — novo pitch (seção 1), nova seção 2c (síntese das 5 franquias + gatilho social), nova seção 6b (personalização vs. Adopt Me), ajustes nas seções 6 e 10 (Épico/Feature/Tarefa).
- **DATA**: 2026-08-13

---

## D016 — Estrutura viral pesquisada (Steal a Brainrot, Grow a Garden, Adopt Me, Dig); modelo cooperativo recomendado sobre adversarial
- **DECISÃO**: incorporar sistemas de "estrutura viral" pesquisados em jogos Roblox atuais — clima que altera chance de mutação/raridade (Grow a Garden), evento server-wide cooperativo com Mimo raríssimo (Grow a Garden + Roblox Dig), Hall of Fame/placar de status (inspirado em Adopt Me, pedido direto do usuário), eventos-mistério de LiveOps, e uma restrição de design de thumbnail/ícone (sujeito único, alto contraste, legível a 150px). Todos esses sistemas ficam **fora do MVP** (D011) mas desenhados para serem compatíveis com a arquitetura de dados já definida, entrando nas Fases 4/6/9 do roadmap. Quanto à mecânica de roubo/PvP do Steal a Brainrot, a **recomendação é não adotar** — seguir o modelo cooperativo de Grow a Garden, que atinge CCU comparável (21-22M vs. 25M) sem atrito entre jogadores. Fica registrado como **decisão em aberto**, não fechada, aguardando confirmação do usuário.
- **MOTIVO**: usuário pediu para estudar especificamente o que gera viralização/conteúdo espontâneo (TikTok/YouTube) nos maiores jogos atuais da Roblox. A pesquisa confirmou que existe mais de um caminho para CCU recorde — um adversarial (Steal a Brainrot) e um cooperativo (Grow a Garden) — e que o cooperativo é mais coerente com os pilares de design já estabelecidos neste projeto (sem pressão/manipulação, D013; H2/H4 em `07-hipoteses.md`) e mais viável para um solo dev sem equipe de moderação/suporte à comunidade.
- **ALTERNATIVAS**: adotar mecânica de roubo/PvP direta (padrão Steal a Brainrot) — não descartada de vez, mas sinalizada como tendo maior risco de atrito/moderação para o perfil deste projeto; uma versão intermediária ("corrida" pelo Mimo Lendário do evento, sem perda de itens já possuídos) foi proposta como meio-termo a considerar pós-MVP.
- **TRADE-OFFS**: modelo cooperativo pode gerar menos momentos de drama extremo que o modelo adversarial, mas evita custo de suporte/moderação que um solo dev não tem capacidade de sustentar — trade-off aceito dado o perfil do projeto (10-20h/semana, sem equipe).
- **IMPACTO**: `10-gdd.md` v5, nova seção 2d. Roadmap (`04-roadmap.md`) ganha referência a esses sistemas nas Fases 4/6/9 quando formos detalhá-las.
- **DATA**: 2026-08-13
- **STATUS**: fechada no Checkpoint 1 — modelo cooperativo confirmado pelo usuário (ver D019).

---

## D017 — Mimo elevado a personagem/marca do jogo, não apenas pet colecionável
- **DECISÃO**: o Mimo passa a ter status de personagem central/mascote do jogo, com critérios de art direction explícitos: extremamente fofo ou visualmente impressionante, silhueta reconhecível, bom para virar skin/meme/thumbnail/animação, suporta dezenas de variantes, desejável mesmo sem entender o jogo. Registrado como diretriz de arte (não sistema de código) para a fase de arte/protótipo.
- **MOTIVO**: usuário quer que o personagem carregue a identidade da marca do jogo (paralelo a mascotes de franquias de sucesso), mudando a meta de "jogo de coletar criaturas" para "EU QUERO AQUELE BICHINHO" — reação de desejo imediato, não só interesse em mecânica.
- **ALTERNATIVAS**: manter Mimo como item de coleção sem status especial de marca (era o padrão implícito das v1-v5) — insuficiente para o objetivo de identidade/viralização visual que o usuário quer.
- **TRADE-OFFS**: nenhum trade-off técnico — é uma diretriz de arte, não adiciona sistema/complexidade de código ao MVP.
- **IMPACTO**: `10-gdd.md` v6, nova seção 1b. Reforça a decisão já tomada de poucas espécies-base muito bem desenhadas em vez de muitas médias (`09-temas-nichos.md`).
- **DATA**: 2026-08-13

---

## D018 — Regra de design: "momento compartilhável" como filtro obrigatório
- **DECISÃO**: toda criatura, skin ou evento futuro precisa ser capaz de gerar um momento que o jogador queira mostrar a alguém (categorias: descoberta, mutação/variação, evento, social, coleção). Este filtro deve ser aplicado antes de qualquer feature entrar no roadmap, inclusive pós-MVP.
- **MOTIVO**: usuário quer garantir que a estrutura viral pesquisada em D016 não fique só documentada, mas vire critério ativo de priorização de features daqui em diante.
- **ALTERNATIVAS**: tratar viralização como preocupação só de marketing/thumbnail, não de design de sistema (rejeitado pelo usuário).
- **TRADE-OFFS**: nenhum negativo — é um filtro de priorização, não uma obrigação de construir mais coisas.
- **IMPACTO**: `10-gdd.md` v6, nova seção 1c. Deve ser aplicado em toda decisão futura de roadmap/feature a partir de agora.
- **DATA**: 2026-08-13

---

## D019 — CHECKPOINT 1 APROVADO: GDD fechado, MVP reconfirmado enxuto, avança para Configuração Técnica
- **DECISÃO**: usuário aprova o GDD v6 no Checkpoint 1. Confirma modelo cooperativo (fecha D016). Descarta definitivamente a Direção 5 (Toy World), sem revisitar. Reconfirma o MVP enxuto, explicitando que ficam fora do MVP (mesmo sendo tecnicamente simples): Hall of Fame, eventos-mistério elaborados, dezenas de biomas, economia avançada, troca entre jogadores, sistemas grandes de pets, centenas de skins. O MVP precisa provar uma única frase: "uma pessoa entra, encontra um Mimo, acha outro, vê uma criatura rara e pensa: quero continuar". Libera o avanço para a Configuração Técnica (MCP Server + Rojo + Roblox Studio), com a condição explícita de que a arquitetura seja preparada para expansão futura sem construir, agora, sistemas que o MVP não precisa.
- **MOTIVO**: fechar a Fase 1 de forma decisiva antes de qualquer trabalho técnico, e evitar que a Configuração Técnica ou o Protótipo comecem a construir prematuramente sistemas pós-MVP (Hall of Fame, eventos complexos etc.) só porque foram documentados como "compatíveis" em D016.
- **ALTERNATIVAS**: incluir mais sistemas no MVP desde já (rejeitado — contraria D011 e a regra de simplicidade do prompt mestre original, item 42).
- **TRADE-OFFS**: nenhum negativo — é a aplicação direta do MVP já definido, com reforço explícito para não ser inflado durante a implementação técnica.
- **IMPACTO**: encerra a Fase 1. Próxima etapa é a Configuração Técnica (D009 deixa de bloquear instalação de ferramentas). `10-gdd.md` marcado como v6/Checkpoint 1 aprovado.
- **DATA**: 2026-08-13

---

## D020 — Salvaguardas éticas de monetização: proibição explícita de mecânicas predatórias (público infantil)
- **DECISÃO**: proibir explicitamente, para este projeto: loot boxes pagas ou qualquer mecânica de "pagar por chance" sem garantia do item (inclusive a antiga ideia de "sorte extra" temporária, removida); pressão de urgência artificial (contadores agressivos, notificações insistentes); qualquer mecânica que gere medo de perder dinheiro/progresso; manipulação de FOMO agressiva. Permitido: cosméticos de preço fixo com resultado garantido e visível antes da compra; exclusividade sazonal simples sem pressão de urgência; core loop sempre jogável sem gastar.
- **MOTIVO**: usuário levantou preocupação ética por o público-alvo ser majoritariamente infantil. Pesquisa confirmou que isso é também um risco regulatório real e atual, não só uma preferência: a própria Roblox está sob investigação criminal da Procuradoria da Flórida (out/2025), queixa formal à FTC por organizações de defesa infantil (mai/2026) e investigação da autoridade de concorrência italiana (jan/2026), todas alegando monetização manipulativa voltada a menores. Loot boxes pagas são criminalizadas na Bélgica (multas até €800.000) e têm projeto de lei em tramitação na Holanda. Pesquisa acadêmica (CHI 2025) documenta que crianças são especialmente vulneráveis a táticas combinadas de FOMO + aversão à perda + saliência de UI.
- **ALTERNATIVAS**: manter a mecânica de "sorte extra" paga considerada em versões anteriores do GDD (removida por ser mecânica adjacente a loot box); ignorar o contexto regulatório (rejeitado — risco real de banimento/multa/dano reputacional, não hipotético).
- **TRADE-OFFS**: potencial de receita por transação pode ser menor que com mecânicas de chance (loot boxes geralmente maximizam gasto via compulsão), mas o padrão de mercado ético (cosméticos de preço fixo) ainda é uma via de monetização comprovada e sustentável, com menor risco legal/reputacional — trade-off aceito.
- **IMPACTO**: `10-gdd.md` v7, seção 8 reescrita com regras explícitas e fontes. Referência em `01-pesquisa-mercado.md`/`09-temas-nichos.md` sobre "sorte extra" fica superada por esta decisão.
- **DATA**: 2026-08-13

---

## D021 — Nova etapa: teste visual de 5-10 conceitos de Mimo antes da arte final/protótipo
- **DECISÃO**: adicionar uma etapa de validação visual (esboços/silhuetas de 5-10 conceitos de Mimo, avaliados pelos critérios de personagem-marca da seção 1b) entre o Checkpoint 1 aprovado e a produção de arte final/polish (Fase 8). Não bloqueia a Configuração Técnica em si (infraestrutura independe da arte), mas bloqueia investir em arte final antes de validar a direção visual.
- **MOTIVO**: usuário identificou que a maior decisão do projeto pode não ser mecânica, e sim qual criatura gera desejo visual imediato ("EU QUERO ESSE") — testar isso barato (esboços) antes de comprometer tempo de produção de arte final reduz risco de investir semanas na direção errada.
- **ALTERNATIVAS**: seguir direto para produção de arte definitiva de um único conceito sem comparação (rejeitado — maior risco de escolher a direção errada sem dado nenhum).
- **TRADE-OFFS**: adiciona uma etapa antes da produção de arte final, mas é rápida/barata (esboços, não arte definitiva) — não atrasa a Configuração Técnica nem o Protótipo funcional (Fase 2), que podem rodar em paralelo com placeholders visuais.
- **IMPACTO**: `10-gdd.md` v7, nova seção 1d. Roadmap (`04-roadmap.md`) deve refletir esta etapa entre Fase 1 e a produção de arte da Fase 8 (ou antes, como validação antecipada).
- **DATA**: 2026-08-13

---

## D022 — Configuração Técnica escopada só para infraestrutura/arquitetura, não sistemas completos
- **DECISÃO**: a Fase 2 (Configuração Técnica + Protótipo) cobre apenas: setup de Rojo/MCP/ambiente, estrutura de pastas, esquemas de dados (criaturas, raridade, variantes/skins, eventos, progressão como estrutura, não conteúdo final), configuração de persistência (ProfileService), Git/branches, placeholders. Sistemas completos de economia, monetização e conteúdo final ficam explicitamente fora desta fase.
- **MOTIVO**: usuário aprovou avançar para a Configuração Técnica, mas não quer que ela transforme uma ideia ainda não validada (o Core Gameplay, ver D024) em um jogo já comprometido com dezenas de sistemas — evita investir esforço de implementação em cima de uma hipótese de diversão ainda não testada.
- **ALTERNATIVAS**: construir sistemas completos de economia/monetização junto com a infraestrutura (rejeitado pelo usuário — risco de comprometer trabalho em cima de gameplay não validado).
- **TRADE-OFFS**: nenhum negativo — é sequenciamento deliberado, coerente com a regra de simplicidade e MVP enxuto já estabelecidas (D011, D019).
- **IMPACTO**: `04-roadmap.md` Fase 2 reescrita com escopo explícito de tarefas permitidas vs. fora de escopo.
- **DATA**: 2026-08-13

---

## D023 — Critérios de Validação Visual expandidos (Fase 1.5)
- **DECISÃO**: a pergunta-teste da Fase 1.5 passa de "qual Mimo é mais bonito?" para "qual deles faria uma criança parar o scroll e dizer: EU QUERO ESSE?", avaliada por: silhueta, fofura, expressão, personalidade, potencial de animação, potencial de meme, potencial de skin, reconhecimento em thumbnail pequena, potencial de família de variantes, diferenciação de outros jogos Roblox.
- **MOTIVO**: usuário considerou o critério original (D021) bom mas incompleto — quer avaliação mais próxima do comportamento real do público-alvo (crianças decidindo em segundos se querem algo), não só uma nota estética abstrata.
- **ALTERNATIVAS**: manter critério original mais simples (insuficiente segundo o usuário).
- **TRADE-OFFS**: nenhum — mesmo custo de execução (esboços), critério de avaliação mais completo.
- **IMPACTO**: `10-gdd.md` seção 1d atualizada; `04-roadmap.md` Fase 1.5 atualizada.
- **DATA**: 2026-08-13

---

## D024 — Core Gameplay (interação minuto-a-minuto) marcado como hipótese não validada
- **DECISÃO**: o GDD é aprovado como base para avançar, mas a ação central do jogo ("tocar/despertar" um casulo) é tratada explicitamente como **hipótese**, não como sistema fechado. Adicionados 4 candidatos de interação a testar no protótipo (toque físico com reação, coaxar por ritmo, escavar/limpar, empurrar/rolar), todos mantendo o verbo único já definido (D014) mas variando a execução física. Critério de validação: a interação precisa ser agradável repetida 15-20 vezes **sem** recompensa rara — se só a expectativa de raridade sustenta o interesse, a interação precisa mudar antes da Fase 3 (Core Gameplay completo).
- **MOTIVO**: usuário identificou que toda a estrutura ao redor do jogo (retenção, coleção, skins, eventos, social, monetização) está bem resolvida, mas falta responder "o que é divertido de fazer minuto a minuto?" — risco real de o jogo virar "andar → encontrar Mimo → clicar → ganhou Mimo → repetir", um pet simulator disfarçado em que a coleção mascara uma interação vazia em vez de amplificar uma interação boa. Pesquisa de "game feel"/"juice" confirma que uma ação central precisa ser satisfatória por si só (resposta instantânea, feedback legível, polimento tátil), independente de recompensa.
- **ALTERNATIVAS**: considerar o GDD como fechado em gameplay e seguir direto para implementação completa (rejeitado pelo usuário); escolher uma única interação sem comparação (rejeitado — mesmo risco que motivou D021 para a arte, agora aplicado à mecânica).
- **TRADE-OFFS**: adiciona uma etapa de comparação de protótipos de interação dentro da Fase 2, mas evita o risco maior de construir Fases 3-7 inteiras em cima de uma ação central que não é divertida sozinha.
- **IMPACTO**: `10-gdd.md` v8, nova seção 4b. `04-roadmap.md` Fase 2 inclui tarefas de validação de gameplay em paralelo à infraestrutura.
- **DATA**: 2026-08-13

---

## D025 — 8 esboços de conceito de Mimo gerados e avaliados (Fase 1.5, primeira rodada)
- **DECISÃO**: gerados 8 esboços deliberadamente diferentes entre si (não variações do mesmo bichinho): Bounch (animal fofo clássico), Emberwick (espírito de chama), Potling (vaso vivo), Glimmerslug (lesma cristalina), Nibnut (bolota andante), Puffdrift (nuvem fofa), Kettling (bule vivo), Mosshoof (cervo musgoso) — cobrindo as 5 categorias pedidas pelo usuário (animal fofo, criatura fantástica, objeto vivo, forma estranha, combinação inesperada). Avaliados pelos 10 critérios de D023. Resultado: Emberwick e Kettling empatam em 1º (42/50); Bounch e Mosshoof em seguida (37-38) com fofura alta mas menor diferenciação. Nenhuma escolha final travada — decisão fica com o usuário.
- **MOTIVO**: usuário pediu para começar pela Fase 1.5 antes da Configuração Técnica, por a maior incerteza do projeto ser identidade visual, não infraestrutura.
- **ALTERNATIVAS**: gerar variações do mesmo arquétipo (rejeitado pelo usuário — pediu diversidade real entre conceitos).
- **TRADE-OFFS**: nenhum — são esboços rápidos (SVG simples), não arte final, coerente com D021.
- **IMPACTO**: novo documento `12-conceitos-mimo.md` com tabela de avaliação completa; esboços salvos em `assets/mimo-concepts-sketch.svg`. Observação de design registrada: a estrutura de "mundo mágico" já estabelecida permite uma família heterogênea de Mimos (unidos por serem "criaturas de magia", não por parentesco biológico), reabrindo a possibilidade de combinar os conceitos de maior pontuação em vez de escolher um único arquétipo puro.
- **DATA**: 2026-08-13

---

## D026 — Identidade do Mimo ampliada: 6 famílias visuais, não só "fofo"
- **DECISÃO**: "Mimo" deixa de significar apenas fofo/adorável — passa a significar "criatura/personagem que você quer ter", cobrindo 6 famílias visuais: Cute (fofo, adorável), Cool (poderoso, estiloso), Majestic (raro, imponente), Mystic (estranho/misterioso), Chaotic (engraçado/travesso), Legendary (reação de espanto). Cada família atrai um segmento de público diferente (criança pequena → Cute; adolescente → Cool; colecionador → completar; jogador social → status/Majestic; criador de conteúdo → descobertas/Mystic/Legendary).
- **MOTIVO**: usuário identificou que um jogo só com criaturas fofas é infantil demais e perde potencial de skins/status/desejo — quer que diferentes perfis de jogador tenham motivo próprio para jogar, todos dentro do mesmo mundo.
- **ALTERNATIVAS**: manter só o registro "fofo" das v1-v8 do GDD (rejeitado — limitava o público e o potencial de status social).
- **TRADE-OFFS**: mais variedade de estilo de arte a produzir a longo prazo, mas o MVP pode continuar pequeno (poucos Mimos, cobrindo só 2-3 famílias inicialmente) sem contradizer D011/D019 — a amplitude é uma diretriz de identidade de marca, não uma obrigação de conteúdo imediato.
- **IMPACTO**: `10-gdd.md` v9, seção 1b revisada e nova seção 1e. `12-conceitos-mimo.md` ganha coluna de família e 2 novos esboços (Voidling, Coronox) para preencher famílias Mystic/Majestic que faltavam nos 8 originais.
- **DATA**: 2026-08-13

---

## D027 — Sistema de Aura: camada visual de status, separada da criatura
- **DECISÃO**: adicionar "Aura" como um sistema cosmético futuro — efeito visual ao redor do personagem (partículas, brilho, distorção) independente do Mimo equipado, combinável com criatura + roupa para formar uma identidade visual completa. Exemplos: Celestial (estrelas orbitando), Void (distorção escura), Storm (raios), Inferno (fogo), Frozen (flocos de neve), Prism (reflexos), Phantom (névoa), Nature (folhas/flores).
- **MOTIVO**: usuário quer uma camada de status social visível a distância no mundo (efeito "QUE AURA É ESSA?" ao ver outro jogador), mais rica que só a criatura em si — e observou corretamente que isso não precisa ser pay-to-win, encaixa nas regras éticas já definidas (D020): cosmético, sem afetar progresso.
- **ALTERNATIVAS**: tratar aura como parte do Mimo em vez de camada separada (rejeitado — separar permite combinações múltiplas Mimo × Aura × Roupa, ampliando muito o espaço de personalização sem multiplicar o número de criaturas a desenhar).
- **TRADE-OFFS**: sistema de VFX de aura é mais complexo tecnicamente que os cosméticos simples já no MVP (seção 6b) — fica explicitamente **fora do MVP**, candidato para Fase 4 (Progressão)/7 (Monetização), reaproveitando a mesma arquitetura de dados (raridade, coleção) já definida.
- **IMPACTO**: `10-gdd.md` v9, nova seção 1e. Registrado como sistema pós-MVP compatível com a arquitetura, seguindo o mesmo padrão de D016/D019 (compatível, não construído agora).
- **DATA**: 2026-08-13

---

## D028 — Evolução visual por descoberta (não por nível) como mecânica futura
- **DECISÃO**: uma criatura pode ter uma transformação visual (ex: Emberwick → Blazing Emberwick → Astral Emberwick) desbloqueada por **descoberta/interação específica** (achar um lugar secreto, fazer uma ação especial), não só por acumular nível/XP. Gera conteúdo de vídeo do tipo "HOW TO GET ASTRAL EMBERWICK".
- **MOTIVO**: usuário quer que a evolução seja parte da estrutura viral (2d) e da regra de "momento compartilhável" (1c), reforçando descoberta como motor central em vez de progressão puramente numérica.
- **ALTERNATIVAS**: evolução só por nível/XP acumulado (mais simples, mas menos "descoberta", menos compartilhável).
- **TRADE-OFFS**: exige desenhar múltiplos estágios visuais por criatura evoluível — fica **fora do MVP**, mas reaproveita o mesmo princípio de "segredo da região" já no MVP (seção 6, Super Mario 2b) como semente da mecânica.
- **IMPACTO**: `10-gdd.md` v9, seção 1e e nota em 4b/Meta Loop. Fase 4/6 do roadmap passam a incluir esta mecânica como candidata.
- **DATA**: 2026-08-13

---

## D029 — Eixo de arquétipos de fantasia (dragão, elfo/fada, vilão...) além das 6 famílias visuais
- **DECISÃO**: adicionar um segundo eixo de variedade ao mundo de Mimos, cruzando com as 6 famílias visuais (D026): arquétipos clássicos de fantasia (tipo dragão, tipo elfo/fada, tipo vilão/travesso, e outros a explorar), cada um em versão miniatura/simplificada compatível com a escala e simplicidade de silhueta já exigidas (1b). 3 esboços gerados: Draconyx (mini dragão, Majestic/Cool), Sylvae (fada-elfo em miniatura, Mystic/Cute), Grimlet (criatura travessa/vilã, Chaotic).
- **MOTIVO**: usuário quis reforçar que a inspiração de "um reino com vários tipos de criatura" (dragões, elfos, fadas, vilões) não é sobre copiar nenhuma obra específica, e sim sobre ter uma variedade real de **arquétipos de fantasia** povoando o mundo, não só variações de um único tipo de bichinho.
- **ALTERNATIVAS**: manter só as 6 famílias visuais como eixo único de variedade (D026) — insuficiente segundo o usuário, que quer arquétipos de criatura reconhecíveis (dragão, fada, vilão) além de só "estilo visual".
- **TRADE-OFFS**: arquétipos tipo elfo/humanoide são naturalmente mais complexos de desenhar/animar que blobs simples — mitigado ao manter todos em escala/silhueta miniatura e simplificada (não personagens humanoides detalhados), preservando o critério de silhueta simples (1b) e o MVP enxuto (D011/D019). Nenhum arquétipo entra no MVP ainda — ficam como candidatos para expandir o elenco pós-MVP.
- **IMPACTO**: `12-conceitos-mimo.md` ganha os 3 novos esboços e uma nota sobre o eixo de arquétipos. `10-gdd.md` seção 1e referencia este eixo como complementar às 6 famílias.
- **DATA**: 2026-08-14

---

## D030 — Ferramentas/armas estilizadas como categoria colecionável + novo candidato de Core Gameplay (arremesso)
- **DECISÃO**: adicionar "ferramentas mágicas estilizadas" (ex: kunai encantado, cajado, pincel mágico) como skins visuais da ferramenta evolutiva já definida (seção 6/1e), tratadas como categoria cosmética colecionável (compatível com D020 — sem afetar progresso). 3 esboços gerados: Kunai mágico (runa brilhante, sugere arremesso/precisão), Cajado curto (cristal aquático), Pincel encantado (cerdas brilhantes, conecta com o candidato "escovar/limpar" já em 4b). Adicionado um 5º candidato de interação central ao Core Gameplay (4b): **Arremesso preciso** — jogador mira e arremessa a ferramenta no casulo, com feedback de acerto (whoosh + impacto), testando se a precisão/timing de mira já é satisfatória sozinha.
- **MOTIVO**: usuário pediu inspiração de "armas estilo kunai" (filosofia de design de ferramentas estilizadas tipo anime de ação, não cópia de nenhuma obra específica) — isso tanto abre uma nova categoria de personalização (skins de ferramenta, além de skins de Mimo) quanto sugere uma mecânica de interação ainda não testada (arremesso com mira), relevante para a hipótese de Core Gameplay ainda aberta (D024).
- **ALTERNATIVAS**: tratar ferramentas só como progressão numérica sem skin visual (era o padrão implícito das versões anteriores) — perdia oportunidade de personalização e de uma mecânica de interação potencialmente mais divertida que toque simples.
- **TRADE-OFFS**: nenhum trade-off técnico relevante — skins de ferramenta reaproveitam a mesma arquitetura de cosméticos já prevista (6b/8); o candidato de arremesso é só mais uma opção a testar no protótipo, não uma escolha travada.
- **IMPACTO**: `10-gdd.md` seção 4b ganha o 5º candidato de interação; seção 6b/8 passam a mencionar skins de ferramenta como categoria cosmética. `12-conceitos-mimo.md` ganha nova seção com os 3 esboços de ferramenta.
- **DATA**: 2026-08-14

---

## D031 — Calibração de art direction: "impressionante", não "infantil de 5 anos"
- **DECISÃO**: os esboços produzidos até aqui (formas redondas, estáticas, cores pastel simples) leram como voltados a crianças muito pequenas — não é a calibração certa. A diretriz de arte passa a ser explicitamente **"impressionante" no nível de personagens icônicos tipo Mario Bros** (apelo amplo, atravessando idades, não só pré-escolar): poses mais dinâmicas, contornos fortes, presença visual de impacto, mesmo em criaturas da família Cute — fofura não deve significar "bebê"/"passivo". Isso não substitui as 6 famílias visuais (D026) nem os critérios de 1b — é uma correção de **execução/nível de acabamento**, não de conceito.
- **MOTIVO**: usuário observou que os esboços pareciam mirar crianças de 5 anos, quando o objetivo é um personagem/marca com apelo amplo e impressionante, citando Mario Bros como referência de nível.
- **ALTERNATIVAS**: manter o estilo atual e só ajustar na produção de arte final (rejeitado — melhor calibrar a referência agora, barato em esboço, do que descobrir o problema só na Fase 8).
- **TRADE-OFFS**: nenhum — esboços em SVG continuam rápidos/baratos mesmo com poses mais dinâmicas; não muda o cronograma.
- **IMPACTO**: gerado um exemplo comparativo (Draconyx v1 vs. v2, pose dinâmica + contorno forte) mostrado ao usuário nesta sessão. Nota importante de limitação: esboços em SVG simples têm teto de acabamento — a elevação real a "nível Mario Bros" acontece na produção de arte de verdade (Fase 8, com ilustrador/ferramenta de arte apropriada), os esboços servem só para testar silhueta/pose/conceito, não para prever o resultado final.
- **DATA**: 2026-08-14

---

## D032 — Verificação de ferramentas sugeridas pelo usuário: correções, confirmações e ferramentas não verificadas
- **DECISÃO**: usuário colou uma lista grande de repositórios GitHub, parte digitada diretamente (11 links reais) e parte copiada de outra IA (blob de texto com links "embrulhados" em `google.com/search?q=...`, sinal de possível alucinação). Verificação individual de todos os 11 links diretos + 5 adicionais de maior impacto:
  - **Confirmados e úteis**: Wally (489★, ativo), Luau LSP (523★, muito ativo, maduro), Selene (805★, linter maduro), StyLua (2.300★, formatador maduro), Fusion (791★, UI declarativa, candidato Fase 3+), Reflex (107★, mas é para roblox-ts, decisão de arquitetura ainda não tomada).
  - **Correção importante de persistência**: ProfileService está em modo manutenção — sucessor ativo é **ProfileStore** (mesmo autor, MadStudioRoblox), recomendado no lugar (substitui parte de D005).
  - **Confirmação importante de risco**: **Knit está oficialmente arquivado desde 31/07/2024** — a decisão anterior de não adotar (por complexidade prematura) está reforçada por um motivo mais forte agora (projeto abandonado). Não adotar em hipótese nenhuma.
  - **Links quebrados no material do usuário**: `Loleris/ProfileService` e `Sleitnick/rbxts-signal` retornaram HTTP 404 — nomes/caminhos corretos identificados e corrigidos (`MadStudioRoblox/ProfileService`; Signal vive dentro de `Sleitnick/RbxUtil`).
  - **MCPs de terceiros para Roblox Studio** (Claudeblox, Point58/Claude-code-roblox-mcp, madebyshaurya/stud): todos verificados como reais, mas em estágio muito inicial (4-12 estrelas) — não substituem o MCP oficial da Roblox já adotado.
  - **Não verificados** (vieram só no blob de texto de outra IA, vários com links de busca do Google em vez de URL direta): `CoderDayton/roblox-bridge-mcp`, `108264/ReplicaService`, `EtienneS1/FastCastRedux`, `TeamSwordFin/raycast-hitbox-v4`, `Sleitnick/rbxts-camera-plus`, `1337DataGuy/ZonePlus`, `Evaera/cmdr`, `Sleitnick/rbxts-network-signal`, `ffDevs/ByteNet` — nenhum adicionado ao inventário sem verificação individual futura.
- **MOTIVO**: aplicar a regra do prompt mestre (Pesquisar → Comparar → Validar → Escolher → Integrar, item 10) diante de uma lista de ferramentas sugeridas por fonte externa (outra IA) cuja confiabilidade não podia ser presumida — vários sinais no próprio texto (links de busca em vez de URLs diretas) indicavam risco de alucinação.
- **ALTERNATIVAS**: incorporar a lista inteira sem verificar (rejeitado — violaria a regra 47 do prompt mestre, "existe solução existente?" exige checar, não presumir); ignorar a lista inteira por vir de fonte externa (rejeitado — vários itens eram reais e úteis, descartar tudo seria desperdiçar informação boa).
- **TRADE-OFFS**: nenhum — o custo de verificação (WebFetch em cada link) foi baixo comparado ao risco de adotar uma dependência inexistente ou abandonada.
- **IMPACTO**: `05-ferramentas-github.md` reescrito com todas as entradas verificadas, corrigidas ou marcadas como não verificadas. `06-decisoes.md` D005 marcada como revisada.
- **DATA**: 2026-08-14

---

## D033 — Segunda rodada: análise individual de 8 ferramentas adicionais
- **DECISÃO**: verificados individualmente 8 repositórios pedidos pelo usuário. Recomendados para adotar: **GameAnalytics SDK Roblox** (analytics gratuito, MIT, mantido pela empresa — Fase 3), **evaera/Cmdr** (console de comandos de dev/debug, 514★, maduro — Fase 2/3, ferramenta de desenvolvimento, não do jogo publicado), **Sleitnick/RbxUtil** (447★, coleção de módulos pequenos independentes — adotar módulo a módulo via Wally, não o pacote inteiro). Candidatos para decidir depois: **centau/vide** (alternativa ao Fusion para UI reativa — escolher um dos dois na Fase 3+, não os dois) e **Sleitnick/RbxObservers** (só relevante se adotar padrão reativo). **Não recomendados**: **matter-ecs/matter** (framework ECS — complexidade de arquitetura desproporcional a um MVP solo pequeno, mesmo raciocínio que já afastou o Knit), **Quenty/NevermoreEngine** (606★, muito maduro, mas é uma mega-coleção de 278 pacotes acoplados — overkill para o projeto; módulos individuais podem ser avaliados isoladamente no futuro), **roblox-compilers** (org de compiladores de outras linguagens para Luau — não relevante, seria complexidade sem benefício já que o fluxo Rojo+Luau direto já é simples e padrão).
- **MOTIVO**: usuário pediu análise individual de cada ferramenta para expandir o "ecossistema" de desenvolvimento — aplicando o mesmo processo de verificação (Pesquisar → Comparar → Validar) da rodada anterior (D032), e a mesma régua de simplicidade já usada para rejeitar Knit (D005/histórico) e para não adotar frameworks grandes cedo demais.
- **ALTERNATIVAS**: adotar frameworks grandes (Matter, NevermoreEngine inteiro) para "ter mais recursos disponíveis" — rejeitado por violar a regra de simplicidade do prompt mestre (item 42) e por não haver necessidade comprovada num MVP pequeno solo.
- **TRADE-OFFS**: nenhum — as recomendações de adoção (GameAnalytics, Cmdr, RbxUtil modular) têm baixo custo de integração e resolvem problemas reais; as rejeições evitam acoplamento desnecessário sem perder nenhuma capacidade que o MVP precise agora.
- **IMPACTO**: `05-ferramentas-github.md` ganha seção "Rodada 2 de verificação" com tabela de prioridade por ferramenta e fase do roadmap.
- **DATA**: 2026-08-14

---

## D034 — Ferramentas para reduzir limitações do próprio Claude Code (testes, CLI, gráficos)
- **DECISÃO**: usuário pediu especificamente repositórios que melhorem minha capacidade de trabalhar (não só o jogo). Pesquisados: **rbxcloud** (CLI Rust para Open Cloud API, 139★, ativo) — **recomendado**, permite gerenciar DataStores/deploy via terminal em vez de GUI do Studio, endereça diretamente minha limitação de não poder clicar em interface gráfica. **Roblox/testez** (framework de testes oficial) — **arquivado desde 14/09/2024**, não adotar; forks candidatos (`lrockreal/testez-luau`, `l3dotdev/EzSpec`) ainda não verificados, avaliar na Fase 3+. **rojo-rbx/run-in-roblox** (74★, ativo, mesma org do Rojo) — permite rodar scripts/testes via linha de comando com captura de saída, útil mas só quando testes automatizados fizerem sentido (Fase 3+, não na Configuração Técnica). **Lumina** (VFX, 30★) — o próprio autor desaconselha uso em produção, não adotar. Performance: nenhuma ferramenta de terceiros madura encontrada — não é uma lacuna real, a Roblox já resolve nativamente com MicroProfiler/StreamingEnabled.
- **MOTIVO**: usuário quer um "estúdio autônomo" completo, incluindo ferramentas que resolvam limitações minhas especificamente (não poder usar GUI, não poder rodar/ver resultado de testes automaticamente), além de gráficos/performance.
- **ALTERNATIVAS**: adotar Lumina mesmo com aviso do autor contra uso em produção (rejeitado — risco desnecessário); assumir que existe lacuna de performance e procurar forçosamente uma ferramenta de terceiros (rejeitado — pesquisa honesta mostrou que a plataforma já cobre isso nativamente).
- **TRADE-OFFS**: nenhum — rbxcloud é a única adição concreta desta rodada, de baixo risco e alto valor específico para mim.
- **IMPACTO**: `05-ferramentas-github.md` ganha seção "Rodada 3" com essas descobertas e uma tabela resumo.
- **DATA**: 2026-08-14

---

## D035 — Rodada 4: mais Skills, MCP com captura de tela, templates de referência
- **DECISÃO**: pesquisados mais Skills de Claude Code para Roblox, MCPs com capacidade de "visão" do cenário 3D, e templates reutilizáveis. Achados: **Chrrxs/robloxstudio-mcp** (171★, MIT, ativo) — tem ferramenta `capture_screenshot` que captura o viewport do Studio, preenchendo uma lacuna real (eu consigo ler a árvore de objetos via MCP oficial, mas não "ver" visualmente o resultado) — candidato a avaliar na prática na Fase 2, como complemento ao MCP oficial, não substituto. **MSayib/roblox-dev-skill** (7★, mas atividade confirmada em agosto/2026, mais recente que o `roblox-game-skill` do brockmartin) — candidato a comparar diretamente antes de escolher qual Skill usar. **sentinelcore/roblox-skills** (13★, muito inicial) e **MonzterDev/Roblox-Game-Template** (15★, útil como referência de estrutura de pastas, não como dependência) — anotados, não adotados. **awesome-roblox/awesome-roblox** (75★, CC0) — guardado como índice de pesquisa futura, não é uma ferramenta em si.
- **MOTIVO**: usuário pediu para ampliar a busca especificamente por Skills adicionais, ferramentas que ajudem a "identificar no 3D" (visão espacial/screenshot), e sistemas de jogabilidade reutilizáveis.
- **ALTERNATIVAS**: continuar só com o `roblox-game-skill` original sem comparar alternativas (rejeitado — regra de ouro do prompt mestre pede comparar antes de escolher); adotar o MonzterDev/Roblox-Game-Template inteiro como base do projeto (rejeitado — poucas estrelas/commits para ser dependência viva, mas serve como referência de padrão).
- **TRADE-OFFS**: nenhum negativo — são todas adições de baixo risco (anotadas como candidatas, nenhuma adotada cegamente).
- **IMPACTO**: `05-ferramentas-github.md` ganha seção "Rodada 4". Fase 2 (Configuração Técnica) passa a incluir comparar `roblox-game-skill` vs. `roblox-dev-skill`, e avaliar `Chrrxs/robloxstudio-mcp` na prática.
- **DATA**: 2026-08-14

---

## D036 — MCP de documentação Roblox de baixo consumo de tokens + pausa na pesquisa de ferramentas
- **DECISÃO**: adicionado **n4tivex/mcp-roblox-docs** (14★, MIT, ativo) como candidato de alta prioridade — indexa toda a documentação da Roblox (classes, API, FastFlags, Cloud API) com busca compacta em vez de exigir WebFetch de páginas inteiras. Confirmado também que o MCP oficial da Roblox já tem "resumos compactos" nativos. **Esta é a última rodada de pesquisa de ferramentas antes de agir**: o inventário de `05-ferramentas-github.md` já cobre infraestrutura, persistência, analytics, testes, MCPs, Skills e agora eficiência de tokens — passar para mais uma rodada de pesquisa sem começar a construir passaria a ter retorno decrescente.
- **MOTIVO**: usuário pediu ferramentas que economizem meu consumo de tokens/contexto, e sinalizou explicitamente querer que o projeto comece a **criar algo**, não só pesquisar — "que faça a gente criar algo".
- **ALTERNATIVAS**: continuar pesquisando mais rodadas de ferramentas (rejeitado — o inventário já está maduro o suficiente para começar a Configuração Técnica; mais pesquisa agora seria adiar a ação sem necessidade real).
- **TRADE-OFFS**: nenhum.
- **IMPACTO**: `05-ferramentas-github.md` ganha a entrada do mcp-roblox-docs. Próximo passo recomendado: iniciar de fato a Configuração Técnica (Fase 2) — criar estrutura de pastas, instalar Rojo, configurar o MCP oficial — em vez de continuar pesquisando.
- **DATA**: 2026-08-14

---

## D037 — Rodada 5: networking, zonas/regiões, geração de mesh 3D nativa, alerta de spam
- **DECISÃO**: usuário pediu para continuar a pesquisa apesar da recomendação de pausar (D036) — respeitado. Novos achados: **ZonePlus** (1ForeverHD, ativo, bem documentado) — detecta jogadores/objetos dentro de zonas dinâmicas, resolve diretamente a necessidade de "detectar região" já prevista no GDD (seção 2d/6) — candidato forte para Fase 3/6. **ByteNet** (176★, MIT, ativo) — otimização de serialização de rede, só relevante em escala maior (Fase 11), anotado sem prioridade agora. **Achado potencialmente importante**: o Assistant nativo do Roblox Studio ganhou geração de mesh 3D texturizado a partir de texto (`Cube 3D`/`GenerateModelAsync`, lançado mar/2026, com Planning Mode e Procedural Models em abr/2026) — recurso gratuito e nativo (não um repositório de terceiros) que pode ajudar diretamente na produção de arte dos Mimos, um dos gargalos já identificados no GDD. Localização: confirmado que não há lacuna, `LocalizationService` nativo já resolve. **Alerta de spam**: `phinehas7/hatch-script-roblox-toolkit` (apareceu numa busca por sistemas de "egg hatching") é vaporware confirmado — 0 estrelas, nenhum código real, apenas README com marketing exagerado e link de download suspeito fora do GitHub padrão.
- **MOTIVO**: usuário pediu para continuar pesquisando ativamente; o alerta de spam reforça por que a verificação individual (processo já estabelecido em D032-D036) continua necessária mesmo quando um resultado de busca parece relevante ao contexto do jogo.
- **ALTERNATIVAS**: insistir na pausa de pesquisa recomendada em D036 (rejeitado — usuário decidiu continuar, decisão dele prevalece).
- **TRADE-OFFS**: nenhum — a rodada trouxe achados genuinamente novos e relevantes (ZonePlus, geração de mesh nativa), não foi busca redundante.
- **IMPACTO**: `05-ferramentas-github.md` ganha seção "Rodada 5". Geração de mesh 3D nativa deve ser testada já na Fase 2 (é gratuita e sem risco de dependência externa). ZonePlus fica registrado como candidato de Fase 3/6.
- **DATA**: 2026-08-14

---

## D038 — Rodada 6: lacunas identificadas pelo próprio Claude (UI de Bestiary, áudio, automação de qualidade)
- **DECISÃO**: usuário pediu para eu identificar ativamente áreas faltantes, não só responder a pedidos literais. Identifiquei e pesquisei 3 lacunas reais: **UI do Bestiary** (sistema central do MVP, nenhum candidato de UI existia até agora) — **InventoryMaker** (16★, MIT, não exige Fusion) recomendado como referência principal; **Stoway** (11★, exige Fusion) como alternativa condicional. **Áudio do momento de descoberta** (GDD seção 5 descreve som de reveal, mas nenhuma fonte estava identificada) — duas bibliotecas gratuitas encontradas (soundeffectapp/Free-Sound-Effects-Library, arnofaure/free-sfx), com recomendação de usar a Roblox Audio Library nativa como caminho principal e essas como complemento. **Automação de qualidade de código** — StyLua já tem hooks de pre-commit oficiais prontos; Selene tem suporte em desenvolvimento — configurar quando o volume de código justificar (Fase 3+). Também documentada a Creator Store API (busca de assets nativa) como recurso disponível, não prioridade agora.
- **MOTIVO**: usuário pediu explicitamente para eu identificar o que percebo como necessário para completar o trabalho, não só responder a buscas literais — exercício de iniciativa dentro do processo já estabelecido de pesquisar/verificar antes de recomendar.
- **ALTERNATIVAS**: continuar só respondendo a pedidos explícitos do usuário (não seria atender ao pedido desta rodada, que foi justamente pedir iniciativa).
- **TRADE-OFFS**: nenhum — todos os achados são anotações para fases futuras (Fase 3+), nenhum exige ação imediata que atrapalhe o MVP enxuto já definido.
- **IMPACTO**: `05-ferramentas-github.md` ganha seção "Rodada 6". Fase 3 (Core Gameplay/Bestiary) passa a ter candidatos de UI e áudio já mapeados quando chegar a hora.
- **DATA**: 2026-08-14

---

## D039 — Auditoria de pendências: verificado o Rojo (nunca tinha sido checado!) e outras lacunas antigas
- **DECISÃO**: usuário pediu para procurar ativamente lacunas — em vez de nova busca por área nova, auditei o próprio documento em busca de itens marcados "não verificado" em rodadas anteriores e nunca resolvidos. Achado mais importante: **o Rojo, a ferramenta mais central de todo o fluxo de trabalho, nunca tinha sido verificado de fato** — confirmado agora: 1.700★, 312 forks, 1.528 commits, MPL-2.0, muito ativo, org oficial `rojo-rbx`, com recursos adicionais não mapeados antes (sincronização bidirecional "syncback", deploy via CLI). **ReplicaService confirmado real** (MadStudioRoblox/ReplicaService), mas mesmo padrão do ProfileService: o autor lançou um sucessor mais novo chamado "Replica", documentação ainda "pendente" segundo o próprio autor — avaliar maturidade antes de escolher entre os dois. **Testes**: `lrockreal/testez-luau` verificado como **abandonado** (0 estrelas, sem atividade); `l3dotdev/EzSpec` verificado como candidato real (6★, estruturado, configurado com Selene/StyLua) — recomendação passa a ser EzSpec, não mais "ambos não verificados".
- **MOTIVO**: usuário pediu para continuar procurando lacunas ativamente. Uma auditoria do que já estava documentado como "pendente de verificação" revelou que itens fundamentais (o próprio Rojo!) tinham ficado sem checagem real por várias rodadas — risco de recomendar algo com base só em "nome consistentemente citado", não em verificação de fato.
- **ALTERNATIVAS**: continuar buscando áreas temáticas novas em vez de auditar pendências antigas (também válido, mas essa auditoria tinha prioridade por envolver a ferramenta mais crítica do projeto).
- **TRADE-OFFS**: nenhum — só reduz risco.
- **IMPACTO**: `05-ferramentas-github.md` seções de ReplicaService, Rojo e testes atualizadas com dados reais. Lista de pendências reescrita para refletir o que genuinamente ainda falta (não mais Rojo).
- **DATA**: 2026-08-14

---

## D040 — Jogos LEGO como referência de filosofia de design (não cópia de IP); Mimo redefinido como "brinquedo vivo"
- **DECISÃO**: adotar jogos LEGO (LEGO Fortnite, LEGO Worlds, LEGO City Undercover, LEGO Star Wars, LEGO Harry Potter) como referência de **filosofia** de design — mundo de brinquedo, humor físico, personagens com personalidade forte, customização, exploração, coleção — nunca como cópia de elementos protegidos (nome LEGO, peças/studs idênticos, minifiguras, personagens licenciados como Star Wars/Harry Potter/Marvel, ou visual "indistinguível" de um jogo LEGO). O Mimo deixa de ser só "criatura que se coleciona como recompensa" e passa a ser **um brinquedo vivo com valor mesmo depois da descoberta**: pode ser exibido, animado, vestido com skins, levado para explorar, usado em atividades, mostrado a outros jogadores.
- **MOTIVO**: usuário identificou que LEGO combina exatamente os elementos que o projeto busca (fofo + engraçado + épico + coleção + personalização + aventura, sem escolher entre "infantil" e "cool") e propôs a mudança de "criatura-recompensa" para "brinquedo com valor contínuo" — mas também apontou corretamente, por conta própria, o risco de propriedade intelectual/trade dress da LEGO, definindo uma lista explícita do que evitar.
- **ALTERNATIVAS**: usar a estética LEGO diretamente (studs, minifiguras) — **rejeitado explicitamente pelo próprio usuário** por risco de propriedade intelectual; manter Mimo só como recompensa colecionável (padrão das versões v1-v9) — substituído por esta decisão.
- **TRADE-OFFS**: nenhum negativo — é uma expansão de filosofia sobre a base já validada (retenção, coleção, monetização ética continuam intactas), só muda como o Mimo é tratado depois de descoberto.
- **IMPACTO**: `10-gdd.md` v10 — pitch e critérios de personagem-marca (1b) revisados; nova seção sobre "brinquedo vivo com valor pós-descoberta".
- **DATA**: 2026-08-14

---

## D041 — Mecânica de combinação (não só evolução linear)
- **DECISÃO**: adicionar combinação como mecânica de progressão/personalização — dois itens (ex: Emberwick + Storm Core = Storm Emberwick) geram uma variação temática nova. Complementa (não substitui) a evolução por descoberta já registrada (D028).
- **MOTIVO**: usuário identificou que combinação gera conteúdo de vídeo naturalmente ("I COMBINED 100 ITEMS AND GOT THIS...") e dá ao jogador um motivo de experimentação contínua, alinhado à regra de "momento compartilhável" (1c) já estabelecida.
- **ALTERNATIVAS**: manter só evolução linear por descoberta (D028) — mais simples, mas gera menos variedade de conteúdo e menos incentivo de experimentação.
- **TRADE-OFFS**: mais uma camada de sistema de dados (receitas de combinação) — fica **fora do MVP** (mesma régua de D011/D019), candidato pós-MVP (Fase 4/6), mas compatível com a arquitetura de dados já definida.
- **IMPACTO**: `10-gdd.md` v10, nova seção. Roadmap ganha nota de sistema de combinação como candidato pós-MVP.
- **DATA**: 2026-08-14

---

## D042 — Lógica de "mundo de brinquedos": regiões não precisam de coerência realista
- **DECISÃO**: adotar a lógica de que, sendo um "mundo de brinquedos" (não um mundo realista), as regiões futuras podem ser tematicamente ecléticas (floresta → terra de doces → espaço → ilha pirata → castelo → vulcão → reino das nuvens) sem quebrar a identidade do jogo — a inconsistência realista não importa quando o enquadramento já é "playground mágico".
- **MOTIVO**: usuário observou que jogos LEGO (e o próprio Roblox de forma geral) sustentam saltos temáticos grandes entre mundos sem parecer estranho, porque a premissa já é "brinquedo", não "simulação de um lugar real". Isso libera criatividade de conteúdo futuro sem exigir justificativa de worldbuilding realista.
- **ALTERNATIVAS**: manter regiões futuras tematicamente conectadas/coerentes (ex: todas biomas naturais) — mais "seguro" narrativamente, mas mais restritivo para conteúdo futuro variado.
- **TRADE-OFFS**: nenhum imediato — só afeta o design de regiões pós-MVP (Fase 6+), o MVP continua com 1 única região (D011).
- **IMPACTO**: `10-gdd.md` v10, nota adicionada à seção de regiões/roadmap futuro.
- **DATA**: 2026-08-14

---

## D043 — Skins como "temas" completos (aura+animação+aparência) + fórmula de escala de conteúdo
- **DECISÃO**: skins deixam de ser só variação de cor — passam a ser **temas completos** por Mimo (ex: Emberwick Infernal, Cosmic, Royal, Mecha, Pirate, Candy, Phantom), cada um combinando aparência + aura + pequena diferença de animação. Fórmula de escala de conteúdo registrada: **N criaturas-base × M variantes temáticas = N×M colecionáveis visuais**, sem precisar desenhar uma criatura nova do zero a cada atualização — reforça a eficiência de conteúdo já valorizada em `08-analise-retencao-generos.md` (Update Loop sustentável para solo dev).
- **MOTIVO**: usuário quer que skins gerem identidade tão forte quanto a criatura em si, e que o volume de conteúdo cresça multiplicativamente (criatura × tema) em vez de aditivamente (uma criatura nova por vez) — mais sustentável para um solo dev de longo prazo.
- **ALTERNATIVAS**: manter skins como variação de cor simples (padrão anterior, D017/1e) — mais simples de produzir mas gera menos identidade/conteúdo por unidade de esforço.
- **TRADE-OFFS**: cada "tema" precisa de aura + pequena variação de animação, não só recolorir — mais trabalho por skin que uma variação de cor simples, mas compensado pela reutilização da base (mesma criatura) e pelo sistema de Aura já existente (D027).
- **IMPACTO**: `10-gdd.md` v10 — seção de monetização (8) e personalização (1e/6b) atualizadas para refletir skins temáticas. Referência de filosofia de design ampliada para incluir LEGO (mundo de brinquedos), Dress to Impress (skins/identidade) e Grow a Garden (eventos/retorno) na lista já existente de Pokémon/Animal Crossing/Mario/Adopt Me.
- **DATA**: 2026-08-14

---

## D044 — Referência visual/jogabilidade LEGO (dragão épico + mundo aberto): coleta magnética agora, montaria como visão de longo prazo
- **DECISÃO**: usuário trouxe duas imagens LEGO como referência — um dragão montável épico/imponente, e uma cena de perseguição em mundo aberto com coleta de moedas que "voam" até o jogador, marcadores de objetivo e minimapa. Extraído: (1) **coleta magnética** (itens próximos voam até o jogador ao coletar) — técnica de "juice" barata, adicionada como 6º candidato de interação central no protótipo (seção 4b), compatível com o MVP; (2) **montaria/condução em mundo aberto** — registrada como **visão de longo prazo** (Fase 11+), não compatível com o MVP enxuto atual (1 região pequena). A vibe visual do dragão reforça a família Majestic/Epic (1e) já em desenvolvimento via Draconyx/Coronox, sem copiar o design específico (regras de 1f continuam valendo).
- **MOTIVO**: usuário quer calibrar tanto a arte (mais imponente/épica) quanto explorar jogabilidade de mundo aberto — mas montaria/condução é um sistema de escopo muito maior que o MVP, e adotá-lo agora repetiria o erro que o processo já evitou de comprometer o projeto a sistemas grandes antes de validar o núcleo pequeno.
- **ALTERNATIVAS**: tentar incorporar montaria/mundo aberto ao MVP agora (rejeitado — contradiz D011/D019/D022 e o próprio raciocínio já validado com o usuário em decisões anteriores sobre escopo).
- **TRADE-OFFS**: nenhum — a parte aproveitável agora (coleta magnética) é barata; a parte ambiciosa (montaria) fica anotada sem custo de implementação até ser priorizada.
- **IMPACTO**: `10-gdd.md` v10, seção 4b ganha candidato 6 e uma nota de "visão de longo prazo" citando a referência do usuário.
- **DATA**: 2026-08-14

---

## D045 — NPCs com personalidade ligados aos sistemas do jogo (não papéis genéricos de RPG) + pilar de humor irreverente
- **DECISÃO**: em vez dos 4 papéis genéricos propostos pelo usuário como exemplo (construtor, explorador, guardião, comerciante — o próprio usuário disse que eram só exemplos), criar arquétipos de NPC **amarrados aos sistemas que já existem no GDD**: 🧭 O Guia (ensina o loop por ação, não texto — reforça princípio Mario 1-1 já em 2b), 📖 O Colecionador (avalia/comenta Mimos raros, prepara terreno para troca futura), 😴 O Guardião Sonolento (obstáculo cômico perto de um segredo — reforça "segredo da região" já no MVP), 🎨 A Costureira Mágica (vendedora de temas/skins, dá voz à divisão de monetização ética já definida), 🌪️ O Mensageiro Caótico (anuncia eventos de forma dramática, reforça a estrutura viral de 2d). Também formalizado um **pilar de humor irreverente**: reações de reveal escaladas por raridade (comum = tédio cômico do NPC, lendário = comemoração exagerada), pequena física cômica em interações específicas, e "segredos" com tom bobo/nonsense (não só sério), tudo reaproveitando sistemas já existentes (reveal, segredo de região, eventos) em vez de criar sistemas novos.
- **MOTIVO**: usuário quer que o mundo pareça vivo (personagens com comportamento/personalidade, referência LEGO City Undercover) e trouxe humor/irreverência como tom desejado, mas pediu explicitamente para propor algo melhor que os exemplos genéricos dados. Amarrar os NPCs a sistemas já existentes evita criar um sistema de classes/RPG paralelo ao já definido.
- **ALTERNATIVAS**: sistema completo de classes de personagem jogável com árvore de habilidades por papel e puzzles cooperativos obrigatórios (proposta original do usuário) — **não descartado, mas separado**: fica registrado como visão de longo prazo (Fase 6+, Social/Multiplayer), não como parte do MVP, pela mesma régua já aplicada a monta ria (D044) e sistemas grandes em geral (D011/D019/D022).
- **TRADE-OFFS**: a versão MVP-compatível (poucos NPCs com personalidade leve, 1-2 falas/animações cada) é barata; a versão completa (classes jogáveis, progressão de habilidade por papel, puzzles cooperativos) exigiria muito mais tempo de solo dev — não cabe no MVP enxuto.
- **IMPACTO**: `10-gdd.md` v11, nova seção sobre NPCs e pilar de humor. Roadmap ganha nota de "sistema de papéis/classes jogáveis" como visão de Fase 6+.
- **DATA**: 2026-08-14

---

## D046 — Grande leva de ideias irreverentes tratada como backlog separado, não incorporada ao GDD ativo
- **DECISÃO**: usuário trouxe um volume grande de ideias adicionais (personagens irreverentes extras, modo "caos", missões nonsense, dimensão de gravidade invertida, fusão de personagens, mapas-meme, bosses, clímax narrativo). Avaliado como um todo: descreve um jogo estruturalmente diferente (action-adventure com campanha/chefes) do que foi validado nas Fases 0-1. Criado `13-backlog-ideias-futuras.md` para preservar tudo sem misturar ao GDD ativo. Extraído e **adotado** apenas o princípio de dosagem tonal (sério vs. irreverente, eventos programados não constantes) por ser barato e já compatível com sistemas existentes.
- **MOTIVO**: usuário pediu para perguntar antes de decidir (AskUserQuestion), e a resposta confirmou o caminho recomendado — backlog separado, sem mexer no MVP ativo — para o grosso das ideias, com uma exceção tratada à parte (combate/PvP, ver D047).
- **ALTERNATIVAS**: incorporar tudo ao GDD ativo (rejeitado — contradiz o MVP enxuto já validado repetidamente); descartar as ideias (rejeitado — são material criativo válido para o futuro, só não para agora).
- **TRADE-OFFS**: nenhum — nada se perde, só fica organizado por prioridade temporal.
- **IMPACTO**: novo documento `13-backlog-ideias-futuras.md`. `10-gdd.md` 1g ganha o princípio de dosagem tonal.
- **DATA**: 2026-08-14

---

## D047 — PvP leve opcional em arena separada, fora do loop principal (visão de Fase 6+)
- **DECISÃO**: usuário defendeu que combate/PvP é o que mais atrai jogadores, reabrindo parcialmente D016 (que havia escolhido modelo 100% cooperativo). Após esclarecer o nível pretendido (pergunta dedicada), confirmado: **PvP leve opcional, em modo de arena separado** do loop principal de exploração/coleção — não integrado à progressão central, não obrigatório. Ainda exige sistema de dano/vida/hit detection (trabalho técnico real, maior que qualquer coisa no MVP atual).
- **MOTIVO**: dados já levantados (`01-pesquisa-mercado.md`, `08-analise-retencao-generos.md`) confirmam que jogos com forte componente competitivo (MM2, Rivals) têm alto CCU — o usuário tem razão que existe apelo real. Mas D016 já demonstrou, com dados igualmente reais (Grow a Garden vs. Steal a Brainrot), que é possível atingir CCU recorde **sem** PvP. A solução de compromisso — arena separada e opcional — preserva o núcleo cooperativo/sem-pressão já validado (D013, D020) enquanto abre espaço para competição para quem quiser, sem forçar todo o jogo a virar combate.
- **ALTERNATIVAS**: combate integrado à exploração/progressão principal (rejeitado pelo usuário na pergunta de esclarecimento — reconhecido como custo técnico e de risco de toxicidade/moderação maior demais para um solo dev iniciante); manter só cooperativo sem nenhuma forma de PvP (D016 original — revisado por esta decisão, mas não descartado: o núcleo continua cooperativo, só a arena é nova).
- **TRADE-OFFS**: sistema de arena exige dano/vida/hit detection/balanceamento — **fora do MVP**, fica como visão de Fase 6+ (Social/Multiplayer) ou mais tarde. Recomendação de tom: manter a arena no mesmo registro "brinquedo"/não-violento já estabelecido (1f/1g) — ex: contestos de empurrar/derrubar, não combate realista com sangue/armas — para não contradizer a identidade "toy world" nem as salvaguardas éticas de público infantil (D020).
- **IMPACTO**: `10-gdd.md` ganha nota de visão em Fase 6/roadmap. `04-roadmap.md` Fase 6 atualizada com a menção de arena PvP opcional ao lado do sistema de papéis/classes já registrado (D045).
- **DATA**: 2026-08-14
