# Hipóteses e Validação

> Nada aqui é tratado como fato até ser testado. Formato: HIPÓTESE → VALIDAÇÃO.

## H1 — Escolha de nicho/tema
**HIPÓTESE**: "Acreditamos que um simulador de coleta com um tema popular fora do Roblox mas ainda pouco explorado dentro dele terá menos concorrência direta e maior chance de destaque no Discovery do que copiar o tema de um líder de mercado atual (ex: mais um simulador de pets genérico)."

**VALIDAÇÃO**: na Fase 1, pesquisar temas/franquias/tendências culturais com alta popularidade geral (fora do Roblox) e cruzar com busca dentro do catálogo Roblox para medir saturação. Escolher tema onde a lacuna for maior.

---

## H2 — Onboarding é o maior fator de churn inicial
**HIPÓTESE**: "Acreditamos que, assim como reportado por outros desenvolvedores no DevForum (`01-pesquisa-mercado.md` seção 6), a maior perda de jogadores no nosso MVP também ocorrerá nos primeiros 2 minutos, e que resolver isso terá mais impacto em D1 do que adicionar mais conteúdo de progressão."

**VALIDAÇÃO**: na Fase 9 (Beta), medir especificamente tempo até a primeira recompensa e taxa de abandono nos primeiros 2 minutos via analytics (item 18 do prompt mestre). Se D1 estiver abaixo de 20% (faixa "Bom"), investigar onboarding antes de qualquer outra mudança.

---

## H3 — Monetização balanceada não reduz retenção
**HIPÓTESE**: "Acreditamos que é possível implementar Game Passes + Developer Products (Fase 7) sem reduzir retenção D7/D30, desde que a progressão free-to-play continue satisfatória (evitando a crítica de 'pay to win' observada em concorrentes como Pet Simulator 99 — `02-concorrentes.md`)."

**VALIDAÇÃO**: comparar coortes de retenção antes/depois de ativar monetização no Beta (Fase 9); se D7/D30 caírem significativamente após ativar monetização, rebalancear preços/vantagens antes do lançamento.

---

## H4 — Viés de "gancho viral" não deve ser assumido no MVP
**HIPÓTESE**: "Acreditamos que os picos de CCU recordes (Grow a Garden, Steal a Brainrot) foram resultado de timing cultural não replicável por planejamento, e que nosso MVP deve ser avaliado por retenção sólida, não por aposta em viralização."

**VALIDAÇÃO**: não definir metas de lançamento em termos de "viralizar" — definir metas em termos de D1/D7/D30 dentro dos benchmarks "Bom" (`01-pesquisa-mercado.md` seção 4). Qualquer gancho de compartilhamento social é tratado como feature a testar (Fase 6/8), não como premissa do plano.

---

## H5 — Simulador é mais rápido de aprender que Tycoon para um iniciante total
**HIPÓTESE**: "Acreditamos que a mecânica de simulador (spawn de item → coleta → contador que sobe) é tecnicamente mais simples de implementar do zero do que um sistema de tycoon (placement de objetos, geração de renda passiva por estrutura), o que justifica priorizar simulador sobre tycoon no ranking mesmo ambos sendo boas opções."

**VALIDAÇÃO**: validar concretamente na Fase 2 (Protótipo) — cronometrar quanto tempo leva para implementar uma versão mínima de cada mecânica antes de comprometer a Fase 3 inteira a uma escolha.

---

## Perguntas em aberto (ainda não respondidas por esta pesquisa)
1. Qual tema/nicho específico escolher dentro de "simulador de coleta"? (depende de H1)
2. Reviews estruturados de concorrentes diretos — pendente, ver limitação em `02-concorrentes.md`
3. Licença exata do `roblox-game-skill` — pendente, ver `05-ferramentas-github.md`
4. Estratégia de aquisição orgânica além do Discovery (TikTok, YouTube Shorts) — não aprofundado nesta rodada, mencionado no prompt mestre item 38
5. Assets/arte: o que fazer com IA vs. manual vs. Creator Store — não aprofundado nesta rodada (item 17 do prompt mestre)
