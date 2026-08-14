# Projeto Roblox

Projeto de desenvolvimento de um jogo Roblox tratado como Game Studio + Startup + Produto de Software: pesquisa → validação → conceito → protótipo → MVP → beta → lançamento → crescimento → escala.

**Perfil**: solo, iniciante total em Roblox/Luau, com apoio de Claude Code, dedicação de 10-20h/semana.

## Status atual

```
FASE 0 — Pesquisa Estratégica ✅
CHECKPOINT 0 — aprovado ✅
FASE 1 — Conceito + nicho/tema + GDD ✅ (aprovado como BASE — Core Gameplay ainda é hipótese)
CHECKPOINT 1 — APROVADO ✅ (D017-D021)
   ↓
FASE 1.5 — Validação Visual 🔄 (8 conceitos gerados, aguardando escolha do usuário — ver docs/12) + CONFIGURAÇÃO TÉCNICA ⏳ (em paralelo, escopo restrito a infra — D022)
```

**Conceito aprovado**: Híbrido Coleta + Exploração, "um mundo de brinquedos vivos" com criaturas ("Mimos") — Mimo é personagem/marca do jogo E um brinquedo com valor contínuo (não só recompensa colecionável). Modelo de viralização cooperativo, regra de design "momento compartilhável", monetização ética (sem loot box/FOMO/pressão — D020), 6 famílias visuais + skins temáticas + combinação. Inspirado em Nintendo, LEGO, Grow a Garden, Adopt Me, Dress to Impress — filosofia de design, nunca cópia de IP (checklist completo em D040/GDD 1f). Ver [`docs/10-gdd.md`](docs/10-gdd.md) para o GDD completo (v10).

**Ressalva ativa**: o Core Gameplay (a interação minuto-a-minuto) ainda é tratado como hipótese não validada, não como sistema fechado — ver GDD seção 4b e D024. A Configuração Técnica está liberada, mas escopada só para infraestrutura/arquitetura (D022), sem construir economia/monetização/conteúdo completos antes de validar se a ação central do jogo é divertida por si só.

Nenhum código foi escrito, Roblox Studio ainda não foi aberto.

## Estrutura da documentação

| Arquivo | Conteúdo |
|---|---|
| [`docs/00-fase0-relatorio.md`](docs/00-fase0-relatorio.md) | Relatório principal da Fase 0 |
| [`docs/01-pesquisa-mercado.md`](docs/01-pesquisa-mercado.md) | Dados brutos de mercado, gêneros, retenção, monetização, segurança |
| [`docs/02-concorrentes.md`](docs/02-concorrentes.md) | Análise de concorrentes |
| [`docs/03-conceitos-ranking.md`](docs/03-conceitos-ranking.md) | Conceitos avaliados e ranking com critérios (+ validação Tycoon vs Simulador) |
| [`docs/04-roadmap.md`](docs/04-roadmap.md) | Roadmap Fase 0 → Fase 12 + estrutura Épico/Feature/Tarefa |
| [`docs/05-ferramentas-github.md`](docs/05-ferramentas-github.md) | Inventário de ferramentas e dependências |
| [`docs/06-decisoes.md`](docs/06-decisoes.md) | Log de decisões técnicas (decisão/motivo/alternativas/trade-offs) |
| [`docs/07-hipoteses.md`](docs/07-hipoteses.md) | Hipóteses registradas e como validá-las |
| [`docs/08-analise-retencao-generos.md`](docs/08-analise-retencao-generos.md) | Análise profunda de retenção por estrutura de gênero (loops, score ponderado) |
| [`docs/09-temas-nichos.md`](docs/09-temas-nichos.md) | Pesquisa comparativa de temas/nichos (v1, tema mineração) |
| [`docs/11-pivot-fofura-colecao-skins.md`](docs/11-pivot-fofura-colecao-skins.md) | Avaliação do pivot para fofura+coleção+skins vs. concorrentes reais (Adopt Me, Evomon, Knockout) |
| [`docs/10-gdd.md`](docs/10-gdd.md) | **GDD — Game Design Document da Fase 1 (v10, filosofia "mundo de brinquedos")** |
| [`docs/12-conceitos-mimo.md`](docs/12-conceitos-mimo.md) | Fase 1.5 — 21 esboços de conceito de Mimo em 5 rodadas, avaliação e recomendação |

Esta pasta funciona como GDD vivo — atualizar os arquivos conforme o projeto evolui, em vez de deixar decisões só na conversa.
