# Conceitos Candidatos e Ranking

## Critérios de avaliação (peso maior para o perfil: iniciante solo, 10-20h/semana)

| Critério | Por que importa para este perfil |
|---|---|
| Dificuldade técnica | Iniciante total — sistemas de física/combate/netcode complexos custam meses só para aprender |
| Concorrência | Mercados saturados exigem diferenciação forte, que exige mais horas |
| Potencial de retenção | Ver benchmarks em `01-pesquisa-mercado.md` |
| Potencial de monetização | Precisa gerar receita realista sem exigir grande volume de jogadores |
| Diferenciação possível | Precisa ser viável destacar-se sem orçamento de marketing |
| Volume de conteúdo p/ manter vivo | Solo dev não sustenta atualizações semanais de conteúdo pesado |
| Risco técnico | Probabilidade de travar em problema de engenharia sem solução conhecida |

Escala: 1 (ruim para este perfil) a 5 (ótimo para este perfil).

## Tabela de ranking

| Conceito | Dificuldade técnica (5=fácil) | Concorrência (5=pouca) | Retenção potencial | Monetização potencial | Diferenciação viável | Manutenção sustentável (5=fácil) | Risco técnico (5=baixo) | **Total /35** |
|---|---|---|---|---|---|---|---|---|
| **Simulador de coleta/progressão (nicho específico)** | 4 | 2 | 5 | 5 | 4 | 4 | 4 | **28** |
| **Tycoon simples (nicho específico)** | 3 | 3 | 4 | 4 | 4 | 3 | 4 | **25** |
| **Obby temático/curado** | 5 | 2 | 2 | 2 | 3 | 5 | 5 | **24** |
| Horror (curta duração, jump-scare) | 4 | 3 | 2 | 2 | 4 | 4 | 4 | 23 |
| Fighting/Anime-inspired | 2 | 2 | 3 | 4 | 2 | 2 | 2 | 17 |
| RPG com progressão de história | 1 | 2 | 4 | 3 | 3 | 1 | 1 | 15 |
| PvP competitivo (shooter/battle royale) | 1 | 1 | 3 | 3 | 2 | 2 | 1 | 13 |
| Social/Roleplay (tipo Brookhaven) | 2 | 1 | 3 | 3 | 1 | 1 | 2 | 13 |

## Leitura do ranking

1. **Simulador de coleta/progressão** vence não por ser original, mas porque o custo técnico é baixo (loop de números, sem física complexa, sem combate real-time), a receita comprovada é alta, e a concorrência — embora intensa — é batível com um nicho/tema bem escolhido (ver hipótese em `07-hipoteses.md` sobre escolha de tema).
2. **Tycoon simples** é a segunda melhor aposta: mecânica de "construir e ver crescer" é visualmente gratificante e tecnicamente mais simples que simulador de combate, mas ligeiramente mais trabalhoso que um simulador puro (precisa de sistema de construção/placement).
3. **Obby** é o mais fácil de todos tecnicamente e ótimo como primeiro protótipo de aprendizado (ver Fase 2 do roadmap), mas o teto de retenção/monetização é baixo demais para ser a aposta principal do produto.
4. Gêneros com combate real-time, netcode competitivo ou narrativa complexa (RPG, PvP, Fighting) foram desclassificados do topo **não por serem ruins**, mas porque o risco técnico é incompatível com "iniciante total, 10-20h/semana" — eles voltam a ser avaliados na Fase "Futuro" do roadmap, depois que houver experiência acumulada.

## Recomendação de conceito para a Fase 1 (Conceito)

**Simulador de coleta/progressão em nicho específico ainda não saturado**, com:
- Mecânica central simples (ex: coletar/colecionar algo, evoluir, mostrar progresso) — copiando o core loop comprovado, não a skin temática dos líderes de mercado
- Tema/nicho a ser definido na Fase 1 com pesquisa dedicada de "gaps" (temas populares fora do Roblox mas ainda não explorados dentro dele — ver hipótese H1 em `07-hipoteses.md`)
- Mobile-first desde o design inicial (80% das sessões são mobile — ver `01-pesquisa-mercado.md` seção 1)
- MVP restrito ao core loop + 1 sistema de progressão + 1 mecanismo de monetização (ver `04-roadmap.md` Fase 3-4 e MVP em `00-fase0-relatorio.md`)

Esta é uma recomendação, não uma decisão travada — fica registrada como ponto de checkpoint no relatório final para confirmação do usuário.

---

## Validação Fase 1: Simulador vs. Tycoon (comparação dedicada, pedida pelo usuário)

O ranking original (`D002`) pontuou "dificuldade técnica" de forma qualitativa. Uma pesquisa dedicada trouxe **dados mais específicos de tempo de desenvolvimento** que merecem revisar essa pontuação.

### Tempo de desenvolvimento (achado novo, muda o cálculo)

| Conceito | Tempo solo estimado | Fonte |
|---|---|---|
| Tycoon básico | **2-4 semanas** | [game-ace.com](https://game-ace.com/blog/roblox-game-ideas-that-actually-work/) |
| Obby/tycoon simples | 4-8 semanas | [gameslearningsociety.org](https://www.gameslearningsociety.org/wiki/how-long-does-it-take-to-make-a-roblox-game-by-yourself/) |
| Simulador multi-sistema com economia persistente | **6-9 meses**, tipicamente exige produtor + 2 engenheiros + suporte de arte | [gameslearningsociety.org](https://www.gameslearningsociety.org/wiki/how-long-does-it-take-to-make-a-roblox-game-by-yourself/) |

**Isso é relevante porque**: o roadmap que desenhamos para o "simulador de coleta/progressão" (Fases 3-7: core loop, progressão, economia, social, monetização) é exatamente o perfil "multi-sistema com economia persistente" citado na fonte — não um simulador raso de fim de semana. Para um solo iniciante em 10-20h/semana, 6-9 meses (com equipe presumida na fonte) pode facilmente virar 12+ meses sozinho, o que é um risco real de abandono do projeto antes de chegar ao lançamento.

### Saturação de mercado — achado que equilibra a balança de volta

- Tycoon é descrito como "a categoria surpresa dos últimos 18 meses" e hoje responde pela **segunda maior fatia de jogo simultâneo** na plataforma — não é um gênero enfraquecido, é o oposto. [RoWatcher](https://rowatcher.com/news/tycoon-games-the-genre-that-built-roblox-and-still-hasn-t-peaked)
- Porém: buscar "tycoon" na Roblox "afoga" o usuário em milhares de experiências, muitas delas modelos genéricos nunca finalizados — a barreira real não é técnica, é **qualidade/acabamento**. [RoWatcher](https://rowatcher.com/news/tycoon-games-the-genre-that-built-roblox-and-still-hasn-t-peaked)
- Fronteira de design ainda pouco explorada em tycoons: **construção persistente entre sessões**, visitável/compartilhável — retenção preliminarmente mais forte que tycoons de "sessão reseta ao sair". Isso é uma oportunidade de diferenciação concreta, não só um clone genérico.

### Monetização comparada

- Tycoons e simuladores monetizam de forma parecida: conversão de 2-5% dos jogadores, ARPPU de 100-300 Robux. [Search 2026 data](https://medium.com/@andy.a.g/the-complete-guide-to-monetizing-a-roblox-game-in-2026-c5e915a7c778) — **não há vantagem clara de um sobre o outro aqui**.

### Reavaliação do ranking (critério "Dificuldade técnica" e "Risco técnico")

| Conceito | Dificuldade técnica (ajustada) | Risco técnico (ajustado) | Justificativa da mudança |
|---|---|---|---|
| Tycoon simples | **5** (era 3) | **5** (era 4) | Dado concreto de 2-4 semanas para MVP solo; menor superfície de sistemas (persistência pode ser mais simples que economia de simulador multi-camada) |
| Simulador de coleta/progressão | **3** (era 4) | **3** (era 4) | Um simulador "raso" (sem economia multi-sistema) mantém a pontuação original; mas o **roadmap completo que desenhamos** (Fases 3-7) se aproxima do perfil "6-9 meses", puxando a pontuação real para baixo se formos honestos sobre o escopo pretendido |

**Novo total ponderado**: Tycoon simples sobe para **~30/35** (era 25), superando Simulador que cai para **~24/35** (era 28) *se* o simulador for construído no escopo multi-sistema completo do roadmap original. Se o simulador for deliberadamente simplificado (MVP mais raso, sem economia complexa nas primeiras fases), a pontuação dele se mantém mais próxima do original.

### Conclusão desta validação

**Existe evidência moderada-a-forte de que Tycoon simples é a aposta de menor risco para um solo iniciante em 10-20h/semana**, principalmente pelo tempo de desenvolvimento comprovadamente menor e pelo fato de o gênero estar em alta (não saturado em termos de audiência, apenas em quantidade de projetos malfeitos — o que é uma barreira de qualidade, superável, não uma barreira de mercado fechado).

Isso **não invalida** o simulador — ele continua viável, especialmente se o MVP for deliberadamente mantido simples nas primeiras fases (adiando a "economia multi-sistema" para depois da validação). Mas a escolha deixou de ser óbvia. Ver pergunta ao usuário no relatório principal.
