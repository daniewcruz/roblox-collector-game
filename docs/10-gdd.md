# Game Design Document (GDD) — Fase 1

**Nome provisório**: *Crystal Depths* (placeholder — não decidido, trocar livremente)
**Gênero/estrutura**: Híbrido Coleta + Exploração (referência estrutural: Fisch — não cópia temática, ver D012)
**Tema**: Mineração + Criaturas de Cristal
**Plataforma primária**: Mobile-first (80% das sessões Roblox são mobile — D004)
**Status**: Fase 1 (Conceito) — sem código, sem Roblox Studio aberto (D009)

---

## 1. Pitch em uma frase

O jogador explora uma mina abandonada, quebra cristais para vendê-los ou descobrir criaturas raras adormecidas dentro deles, e usa picaretas cada vez melhores para acessar câmaras mais profundas com descobertas mais raras.

## 2. Por que o jogador continua jogando

- **Primeiros 5 minutos**: golpear cristais visíveis logo na entrada da mina, com feedback imediato (partícula, som, item cai). Primeira venda/recompensa em menos de 2 minutos — ataca diretamente a causa nº1 de abandono identificada na pesquisa (`01-pesquisa-mercado.md` seção 6).
- **Primeiros 15 minutos**: primeira descoberta de criatura (mesmo que comum) — introduz o Bestiary e o "momento de reveal" como gancho central do jogo.
- **Amanhã**: falta pouco para completar uma seção do Bestiary, ou já tem moeda suficiente para a próxima picareta que abre uma nova câmara.
- **Semanas depois**: perseguir raridades específicas, desbloquear câmaras mais profundas, eventualmente 2ª área (fora do MVP, mas já prevista estruturalmente).

## 3. Core Loop

```
JOGADOR ENTRA na mina abandonada
   ↓
EXPLORA a câmara atual (procurando veios de cristal visíveis)
   ↓
MINERA um cristal (ação ativa: golpear/interagir, com pequeno timing/skill)
   ↓
CRISTAL COMUM → vende por moeda
   OU
CRISTAL ESPECIAL (chance baseada em raridade) → "Algo está se movendo dentro..."
   ↓
REVEAL → criatura descoberta, com raridade e variação visual
   ↓
ENTRA NO BESTIARY (registra descoberta, mostra % de completude da região)
   ↓
JOGADOR DECIDE: continuar minerando esta câmara OU comprar picareta melhor
   ↓
PICARETA MELHOR → acesso a câmara mais profunda → cristais/criaturas mais raras
   ↓
RETORNO no dia seguinte: Bestiary incompleto + moeda acumulada + curiosidade sobre a próxima câmara
```

Este loop já foi validado estruturalmente em `08-analise-retencao-generos.md` (Híbrido Fisch-like, score 4.55/5) e refinado com o tema em `09-temas-nichos.md` (Opção A).

## 4. O momento de descoberta (diferencial de design, proposto pelo usuário)

A criatura **não é o recurso principal** — é a recompensa da exploração, não o motivo dela. Sequência de UI/feedback:

1. Cristal comum se comporta normalmente (quebra, vira minério, vai pro inventário).
2. Cristal "especial" (indicado por brilho/cor sutil diferente, sem entregar o que é antes de quebrar) ao ser minerado dispara: **"💎 CRISTAL DESCONHECIDO — Algo está se movendo dentro..."**
3. Pausa curta / animação de quebra.
4. **"✨ Você descobriu uma Lumicriatura! Raridade: Épica"** — com efeito visual/sonoro proporcional à raridade.
5. Entrada automática no Bestiary.

Esse momento é o **Return Loop** e o **Collection Loop** do jogo ao mesmo tempo — é o que justifica "vou jogar só mais um pouco" e "quero voltar amanhã".

## 5. Sistemas do MVP (escopo travado por D011, não expandir sem nova decisão)

| Sistema | Escopo do MVP |
|---|---|
| Área jogável | 1 bioma: "Mina Abandonada" |
| Minérios/cristais | ~20-30 tipos |
| Criaturas de cristal | ~10-15 |
| Níveis de raridade | 4-5 (ex: Comum, Incomum, Rara, Épica, Lendária) |
| Picaretas | 3-5 tiers, cada uma abre acesso a câmaras mais profundas |
| Câmaras/zonas | Bloqueadas por nível de picareta (progressão espacial visível) |
| Coleção | Sistema de Bestiary com % de completude por região |
| Variações visuais | Mutações/variantes de criaturas (reforça Collection Loop sem exigir centenas de espécies) |
| Eventos ambientais | Alguns eventos simples (ex: "tremor" temporário que aumenta chance de cristal especial por tempo limitado) |

**Explicitamente fora do MVP** (fica para Fases 4+ do roadmap): 2ª área, sistema de rebirth/prestígio, PvP/competição, trocas entre jogadores, eventos sazonais complexos.

## 6. Loops completos (aplicando o framework de `08-analise-retencao-generos.md`)

- **Core Loop**: explorar → minerar → vender ou descobrir.
- **Progression Loop**: moeda acumulada → picareta melhor → acesso a câmara nova.
- **Meta Loop**: completar o Bestiary da região atual; perseguir raridades específicas.
- **Return Loop**: reveal pendente + Bestiary incompleto + moeda parada esperando a próxima picareta.
- **Social Loop** (leve no MVP): mostrar Bestiary/criaturas raras a outros jogadores — sem sistema de troca no MVP (fica para depois).
- **Collection Loop**: Bestiary com raridades e variações visuais — o coração do jogo.
- **Update Loop**: nova câmara = novo lote de minérios/criaturas (adição de dados, não de sistema) — sustentável por solo dev, conforme `08-analise-retencao-generos.md`.
- **Monetization Loop**: candidatos a avaliar na Fase 7 (não implementar ainda) — Game Pass de picareta cosmética/permanente, Developer Product de "sorte extra" temporária (sem garantir raridade, para não virar pay-to-win).

## 7. Riscos de design já mitigados por este GDD

- **Risco de grind repetitivo** (minerar→vender→upgrade→minerar, citado na análise): mitigado pela variação de reveal (nem todo cristal é previsível) e pela progressão espacial visível (câmaras diferentes visualmente).
- **Risco de pay-to-win**: criatura é descoberta por sorte/exploração, não comprada diretamente — reduz o padrão de crítica documentado contra concorrentes como Pet Simulator 99 (`02-concorrentes.md`).
- **Risco de escopo inchar**: seção 5 trava explicitamente o que está e o que não está no MVP.

## 8. Estrutura Épico → Feature → Tarefa para este conceito

```
ÉPICO: Exploração e Mineração
  FEATURE: Câmara inicial (Mina Abandonada)
    - [ ] Layout da câmara 1 (bloco cinza/whitebox, sem arte final)
    - [ ] Veios de cristal posicionados no mapa
    - [ ] Interação de mineração (golpear/interagir com timing simples)
  FEATURE: Sistema de picaretas
    - [ ] 3-5 tiers definidos (dano/velocidade/chance de especial)
    - [ ] Checagem de tier necessário para acessar cada câmara

ÉPICO: Coleção
  FEATURE: Sistema de cristais e raridades
    - [ ] Tabela de dados de ~20-30 minérios/cristais com raridade
    - [ ] Lógica de drop de cristal especial (chance por raridade)
  FEATURE: Criaturas de cristal
    - [ ] Tabela de ~10-15 criaturas com raridade e variação visual
    - [ ] Sequência de reveal (UI + som + animação)
  FEATURE: Bestiary
    - [ ] UI de coleção com % de completude
    - [ ] Persistência via ProfileService (Fase 3 técnica, não Fase 1)

ÉPICO: Economia (MVP mínimo)
  FEATURE: Venda de minérios
    - [ ] Preço por raridade
    - [ ] Balanceamento inicial fonte (mineração) vs. sink (picaretas)
```

Dependências: Exploração/Mineração → Coleção → Economia (mesmo padrão de `04-roadmap.md`).

## 9. Critérios de aceitação do MVP (o que precisa ser verdade para considerar "pronto para Beta")

- Jogador consegue completar o loop completo sozinho: entrar → minerar → vender OU descobrir → progredir picareta → acessar nova câmara.
- Pelo menos 1 descoberta de criatura acontece nos primeiros 15 minutos de jogo em teste manual.
- Bestiary persiste corretamente entre sessões (mesmo jogador, reabrindo o jogo).
- Funciona em mobile (controles touch, UI legível em tela pequena) — D004.
- Nenhuma lógica de economia/coleção é validada só no cliente (preparar terreno para D005/segurança, mesmo que a implementação seja só na Fase 3).

## 10. O que este GDD não resolve ainda (fica para depois do Checkpoint 1)

- Nome final do jogo, identidade visual/arte definitiva.
- Números exatos de balanceamento (preços, chances de raridade, dano de picareta) — vem na Fase 3/5 com testes reais.
- Design detalhado dos eventos ambientais ("tremor") — mencionado mas não especificado.
- Estratégia de monetização detalhada (Fase 7).

---

## Checkpoint 1 — pronto para aprovação

Este GDD fecha a Fase 1 conforme a ordem definida pelo usuário:

```
FASE 0 — Pesquisa Estratégica ✅
CHECKPOINT 0 — aprovado ✅
FASE 1 — Conceito + nicho/tema + GDD ✅ (este documento)
CHECKPOINT 1 — aguardando aprovação do usuário
```

Nenhum código foi escrito, Roblox Studio não foi aberto, nenhuma ferramenta técnica (MCP/Rojo) foi instalada — conforme D009.

**Pergunta para o Checkpoint 1**: este GDD está aprovado para avançarmos à Configuração Técnica (MCP Server + Rojo + Roblox Studio) e depois ao Protótipo (Fase 2)? Ou há algum sistema/decisão aqui que você quer ajustar antes?
