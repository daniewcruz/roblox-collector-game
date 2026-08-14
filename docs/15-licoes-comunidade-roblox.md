# Lições da Comunidade de Desenvolvedores Roblox (erros comuns, jogos que falharam, feedback negativo)

> Pedido do usuário: vasculhar a comunidade de criadores de jogos Roblox (DevForum e afins) por erros comuns e feedback negativo de jogadores, para não repetir os mesmos erros. Diferente da pesquisa de documentação oficial (`14-mecanicas-roblox-oficial.md`), esta é sabedoria vivida de desenvolvedores reais, incluindo postmortems de projetos que falharam.

## Achado mais importante: valida (e reforça) quase todas as decisões de escopo já tomadas nesta sessão

Uma thread com 8 anos de experiência acumulada de um desenvolvedor Roblox ([DevForum](https://devforum.roblox.com/t/what-8-years-of-roblox-development-taught-me/4703824)) descreve quase exatamente os riscos que este projeto já vinha ativamente evitando:

### 1. Superambição ("Overambition") — o erro nº1 citado
- "Se você não consegue executar o jogo por completo, não existe experiência de jogador nenhuma."
- Adicionar funcionalidades antes de terminar o núcleo (ex: editor de mapas customizado, sistema de habilidades) parece ótimo, mas aumenta exponencialmente o fardo de execução.
- **Isso é exatamente por que este projeto separou repetidamente ideias grandes em backlog** (`13-backlog-ideias-futuras.md`) em vez de misturá-las ao MVP — a comunidade confirma que essa disciplina é o que separa projetos que terminam dos que não terminam.

### 2. "Fat" vs. "Tall" — priorizar sistemas centrais sobre polimento/conteúdo
- Sistemas "tall" (centrais, ex: controles, matchmaking, sistema de morte) devem vir **antes** de sistemas "fat" (polimento, variedade de conteúdo, ex: variedade de armas).
- **Aplicação direta**: confirma D024 — validar se o Core Gameplay (a ação de tocar/despertar) é divertido **antes** de produzir dezenas de Mimos/skins. Não é só teoria nossa, é padrão observado por quem já passou por isso.

### 3. "70% cópia, 30% originalidade" — não reinventar tudo do zero
- Estudar jogos de sucesso do mesmo gênero de perto (GUI, core loop, teclas de atalho, timing) e construir a maior parte dos sistemas em cima do que já funciona, reservando a originalidade para o que realmente diferencia o jogo.
- **Aplicação direta**: confirma a abordagem já usada — estrutura de loop copiada de Fisch (comprovada), originalidade concentrada no tema/identidade (Mimos, mundo de brinquedos).

### 4. Falta de validação externa — "eco de desenvolvimento solo"
- Desenvolvimento solo cria uma "câmara de eco" — sem progresso visível ou feedback externo, projetos empacam.
- **Recomendação prática**: compartilhar trabalho cedo e imperfeito para descobrir se jogadores reais se importam com o conceito, em vez de polir em isolamento por meses.
- **Isso é uma lacuna real no nosso plano atual** — o roadmap já tem "Fase 9 — Beta" para testar com jogadores reais, mas isso é tarde. Recomendação nova: buscar feedback externo **já no Protótipo (Fase 2/3)**, não só no Beta.

## Erros técnicos comuns citados pela comunidade

- **Confiar no cliente para dano, moeda, itens ou estado do jogo** — "exploradores vão abusar disso em minutos" — já é pilar deste projeto (D005 e segurança geral), mas a comunidade confirma que é o erro nº1 técnico mais citado.
- **Lançar sem testar o suficiente** — leva a bugs e avaliações negativas.
- **Problemas de performance**: excesso de parts, luzes, objetos não ancorados, scripts rodando com frequência excessiva, mapas grandes sem carregamento adequado (streaming).
- **Publicar jogos incompletos** — prejudica a experiência do jogador e a percepção do jogo.
- **Modelos gratuitos do Toolbox**: frequentemente contêm scripts "bugados" ou inchados — inspecionar antes de usar qualquer asset de terceiros (reforça a mesma régua de verificação já aplicada às ferramentas GitHub, D032-D039).

## Postmortems específicos de jogos que falharam

- **"Chaos at the Bistro"** ([DevForum](https://devforum.roblox.com/t/so-your-game-died-a-thread-on-game-design-and-the-market/2644450)): falhou por profundidade de conteúdo insuficiente — mapas limitados, loja básica, loop repetitivo, jogadores esgotavam o conteúdo rápido e não tinham motivo para voltar.
  - **Relevância para nós**: reforça por que o MVP, mesmo pequeno, precisa ter os "6 métodos de descoberta variados" e "segredo da região" já planejados (seção 4b/6 do GDD) — um loop raso demais mata o jogo mesmo com boa execução técnica.
- **Causas gerais de fracasso** (mesma thread): (1) priorizar tudo **exceto diversão** — "antes de qualquer outra decisão, você precisa pensar em diversão"; (2) falta de originalidade num mercado saturado (milhares de simuladores/tycoons clones nunca jogados); (3) marketing/comunicação de visão fraca, mesmo com jogo bem projetado.

## O que desenvolvedores de sucesso fazem diferente (mesma fonte)

- Constroem em torno de uma visão clara e diferenciada, não de tendências.
- Contratam seletivamente (quando aplicável) alinhado ao conceito, em vez de crescer a equipe sem critério.
- Priorizam construir comunidade fiel sobre perseguir picos virais.
- Atualizam continuamente com base em feedback real e dados de retenção — não em suposição.

## Ação recomendada incorporada ao roadmap

**Nova prática (D055)**: buscar feedback externo real (mesmo informal — amigos, familiares, comunidade) já durante o Protótipo (Fase 2/3), não só esperar até o Beta (Fase 9). Isso ataca diretamente o risco de "câmara de eco" que a comunidade identifica como causa comum de projetos solo travarem.
