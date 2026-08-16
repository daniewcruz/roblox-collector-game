# Técnicas Extraídas de Tutoriais de Terceiros (arquitetura, não conteúdo)

> Documento para registrar padrões técnicos reutilizáveis que o usuário compartilha via tutoriais em vídeo. Regra fixa (confirmada com o usuário): extrair a **arquitetura/lógica**, nunca copiar nomes, assets ou construir o sistema inteiro fora de ordem do roadmap. Cada item aqui é avaliado contra o escopo atual (`04-roadmap.md`) antes de qualquer implementação — a maioria fica registrada para uso **futuro**, não implementada na hora.

## De um tutorial de sistema de pets (D068)

- **Tabela de raridade cumulativa** — já extraída e implementada em `src/Shared/MimoData.luau` (D068). Ver `06-decisoes.md`.

## De um tutorial de loja de crates/moeda (D069)

Tutorial sobre uma loja de "crates" com GUI, preview 3D dos itens, compra validada no servidor, e save/load de moeda via DataStore.

### Técnica extraída e considerada valiosa: preview 3D de item em UI via ViewportFrame + câmera dedicada
- **Como funciona**: um `ViewportFrame` na UI 2D pode renderizar um modelo 3D "de verdade" dentro dele, desde que receba uma `Camera` própria (`CurrentCamera`) posicionada olhando para um clone do modelo colocado dentro do próprio ViewportFrame (não no Workspace principal). Isso permite mostrar uma criatura/item em 3D real dentro de uma tela de inventário ou popup, girando/com iluminação, em vez de só uma imagem estática.
- **Por que é relevante para nós**: aplicação direta ao **Bestiary** (mostrar o Mimo descoberto em 3D ao selecionar na coleção) e ao **momento de reveal** (seção 5 do GDD — "✨ Você descobriu um Mimo!" pode mostrar o modelo de verdade, não só texto) e às **skins temáticas** (D043 — pré-visualizar o tema antes de comprar).
- **Decisão de escopo**: **não implementar agora** — é uma técnica de UI que só faz sentido quando o Bestiary/inventário de verdade for construído (Fase 3, após o Core Gameplay estar validado). Registrada aqui para não esquecer.

### Padrões confirmatórios (já sabíamos, mas o tutorial reforça)
- **RemoteEvent + validação 100% no servidor para compras**: cliente nunca decide se tem moeda suficiente, só o servidor deduz e confirma — já é exatamente o princípio de segurança já documentado (D005, D054, `01-pesquisa-mercado.md`).
- **Módulo de configuração de item (currency + amount + layoutOrder)**: mesmo padrão de "ModuleScript como fonte de dados" já adotado em `MimoData.luau` — o próximo módulo natural quando a Fase 7 (Monetização) chegar seria algo como `CosmeticShopData.luau`, seguindo a mesma estrutura.
- **DataStore de moeda com save on player-leaving + BindToClose**: válido, mas **já superado** pela nossa decisão de usar ProfileStore em vez de DataStore cru (D005/D032) — ProfileStore já resolve esse boilerplate de forma mais seguro (session-locking).

### Por que a loja em si não foi construída agora
O sistema de loja/moeda pertence à **Fase 5 (Economia)** e **Fase 7 (Monetização)** do roadmap — o projeto está na Fase 2 (Configuração Técnica + validação do Core Gameplay), e D022 restringe explicitamente esta fase a infraestrutura, não economia. Construir a loja agora repetiria exatamente o erro de "superambição" que a própria comunidade identificou como causa nº1 de projetos travarem (D055) — features antes do núcleo estar prontos.

## De um tutorial de sistema de teleporte entre lugares (party/lobby estilo 99 Nights) (D070)

Tutorial sobre um sistema de "zona de teleporte": jogador entra numa área, forma um grupo (mín/máx de jogadores), espera contagem regressiva, e é teleportado via `TeleportService` para outro **Place** publicado separadamente (arquitetura multi-lugar do Roblox).

### Técnica extraída e considerada valiosa: padrão de UX de formação de grupo
- **Como funciona**: zona/parte no mapa detecta jogadores próximos, abre uma UI de "criar grupo" com botões +/- para ajustar tamanho desejado (min/máx), contagem regressiva visível, botão de sair. Se o tempo esgotar sem preencher o grupo, expulsa os jogadores da zona automaticamente.
- **Por que é relevante para nós**: esse padrão de UX (não a arquitetura de teleporte entre lugares) se aplica bem aos **mini-jogos cooperativos da visão de arena** (D047-D051 — corridas, fugas, PvP leve) e ao evento **"Mimo Lendário avistado"** (2d do GDD) — qualquer atividade que precise reunir um grupo antes de começar. **Fica registrado como referência de UX para quando a arena for construída (Fase 6+)**, não implementado agora.

### O que NÃO é necessário para nós: arquitetura de múltiplos Places
- O tutorial usa `TeleportService` para levar o jogador a um **Place separado publicado** (arquitetura multi-lugar) — isso exige gerenciar múltiplos Place IDs, publicar cada lugar separadamente, e é uma decisão de arquitetura de jogo inteiro (usada por jogos como 99 Nights que têm lobby + rodada como lugares distintos).
- **Nosso MVP e mesmo a visão de arena pós-MVP não precisam disso**: os mini-jogos cooperativos podem rodar dentro do **mesmo lugar** (uma zona/sala diferente no mesmo mapa), sem o custo de manter múltiplos Places sincronizados. Isso é consistente com a régua de simplicidade já aplicada em D022/D044/D045 — não adotar arquitetura de escala de jogo grande (multi-place) sem necessidade comprovada.

### ⚠️ Alerta de segurança encontrado no próprio tutorial
O tutorial instrui baixar um "modelo gratuito" de um servidor Discord de terceiros e importar direto no jogo sem inspecionar o conteúdo. Isso é exatamente o tipo de prática que a pesquisa da comunidade já tinha sinalizado como risco (`15-licoes-comunidade-roblox.md`: "modelos gratuitos do Toolbox frequentemente contêm scripts bugados/maliciosos — inspecionar antes de usar"). **Regra reforçada para este projeto**: nunca importar modelos/scripts de terceiros sem ler o conteúdo primeiro, mesmo vindo de um criador de conteúdo aparentemente confiável — isso vale tanto para mim quanto para o usuário.

## Regra geral para tutoriais futuros

Quando o usuário compartilhar mais tutoriais: (1) identificar a técnica/arquitetura reutilizável, separando do conteúdo/nomes específicos; (2) checar contra o roadmap se é escopo da fase atual ou futura; (3) se futura, registrar aqui sem implementar; (4) se atual, implementar de forma mínima e testada, como já foi feito com `MimoData.luau`.
