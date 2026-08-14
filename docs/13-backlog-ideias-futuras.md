# Backlog de Ideias Futuras (D046)

> Este documento existe para **não perder nenhuma ideia**, sem misturar tudo no GDD ativo. Nada aqui está aprovado para implementação — é material para revisitar **depois** que o MVP pequeno estiver validado e o jogo tiver alguma tração real (equivalente a Fase 9+/11 do roadmap), possivelmente já com equipe além de um solo dev.
>
> Grande parte deste material foi trazido pelo usuário a partir de brainstorms com outra IA (padrão de escrita "Beleza, Daniel!"/"Boa, Daniel!" sugere origem de outra conversa) — tratado aqui como matéria-prima criativa a avaliar, não como plano já decidido.

## Por que isso não entra no GDD ativo agora

Tomado como um todo, este pacote de ideias descreve um jogo **estruturalmente diferente** do que foi validado nas Fases 0-1: um action-adventure com chefes, campanha com clímax narrativo, modos de física alterada (gravidade), fusão de personagens e mapas temáticos extras — muito além do "mundo pequeno de exploração/coleção" que serviu de base para toda a pesquisa de retenção, ranking de conceitos e escopo de MVP já aprovados (D011/D019/D022/D044/D045). Aceitar tudo de uma vez recriaria exatamente o risco que o processo já evitou várias vezes: comprometer meses de trabalho solo em sistemas grandes antes de validar se o núcleo pequeno é divertido (Core Gameplay ainda é hipótese, seção 4b do GDD).

## Ideias registradas (por categoria)

### Personagens irreverentes (NPCs adicionais além dos 5 já no GDD 1g)
- Herói desajeitado, vilão atrapalhado, inventor maluco, chef caótico, mascote zoeiro, fantasma brincalhão, robô bugado, mestre do drama, clone zoado, zumbi fashionista, mago esquecido, alien turista, super-herói preguiçoso, animal caótico tipo "chefe" cômico.
- **Observação**: vários desses são variações do mesmo princípio já adotado em D045 (NPC com personalidade exagerada/cômica ligada a um sistema do jogo) — se algum dia entrarem, devem seguir a mesma regra: amarrados a um sistema real, não decorativos soltos.

### Jogabilidade/eventos "caos"
- Modo "caos" (objetos se movem sozinhos), missões nonsense (pizza gigante de blocos, patinhos de borracha, escada que não leva a lugar nenhum), reações exageradas ao completar tarefas, humor físico em colisões, mapa musical (blocos tocam notas), dimensão de gravidade invertida, cidade nonsense (NPCs atravessam paredes, carros andam de lado), chuva de blocos gigantes, invasão de patos de borracha, fusão temporária de personagens ao encostar, mapas inspirados em memes.
- **Observação**: algumas dessas (reações exageradas, eventos ambientais estranhos) já têm uma versão pequena e compatível registrada em D045 (segredos com tom bobo, eventos-mistério de 2d) — não precisam da versão grande para funcionar.

### Estrutura narrativa/campanha
- Bosses sérios com humor escondido, clímax narrativo épico, cutscenes (sérias e cômicas), narrativa de missão principal com progressão de história.
- **Observação**: nada disso está na estrutura atual do jogo (Híbrido Coleta+Exploração sem narrativa de campanha) — seria uma mudança de gênero, não uma adição.

### Balanceamento tonal (sério vs. irreverente)
- Missões principais sérias + interlúdios irreverentes; ambientes contrastantes (área séria vs. área nonsense); eventos programados a cada X minutos em vez de caos constante; missões opcionais "modo zoeira"; NPCs de personalidade dupla (sério ↔ irreverente conforme a situação).
- **Este princípio foi adotado** (não fica só no backlog) — ver `10-gdd.md` seção 1g, atualizada com a diretriz de dosagem tonal. É barato (é uma regra de como já usamos os sistemas existentes, não um sistema novo) e reforça a regra de "momento compartilhável" (1c) sem exigir conteúdo grande.

## O que foi extraído para o GDD ativo (não fica só no backlog)

1. **Princípio de dosagem tonal** (sério vs. irreverente, eventos programados não constantes) — `10-gdd.md` 1g.
2. **PvP leve opcional em arena separada** — decisão própria, ver D047 e `10-gdd.md` seção correspondente. Não é deste backlog exatamente (veio de uma pergunta separada), mas é o item de maior porte que *foi* aprovado para entrar na visão de roadmap (Fase 6+), diferente do resto deste documento.

### Plataforma de precisão estilo Crash Bandicoot (D048)
- Caixas que quebram dão itens/pontos; frutas colecionáveis aumentam pontuação; máscara-escudo temporária; fases lineares com perseguições (Crash fugindo de algo) e sequências de salto preciso; sistema de vidas; memorização de padrões fixos de inimigos/armadilhas; gemas/cristais escondidos para exploração opcional.
- **Observação**: reconhecida como necessidade real (evitar tédio na exploração pura), mas resolvida de forma mais barata via mini-jogos de arena (D048, adotados no GDD) em vez de um gênero de plataforma completo — que exigiria movimento de personagem preciso, câmera dedicada e sistema de vidas/checkpoint muito além do verbo central já definido (tocar/despertar, D014) e do escopo técnico atual.

## Como revisitar este backlog

Quando o jogo tiver tração real (métricas de retenção validadas, base de jogadores estabelecida — Fase 9+/11), revisitar este documento e escolher itens específicos para avaliar com o mesmo rigor já aplicado a tudo neste projeto: pesquisa → comparação → decisão registrada — não adotar em bloco.
