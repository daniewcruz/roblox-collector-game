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
