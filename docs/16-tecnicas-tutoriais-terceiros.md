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

## Regra geral para tutoriais futuros

Quando o usuário compartilhar mais tutoriais: (1) identificar a técnica/arquitetura reutilizável, separando do conteúdo/nomes específicos; (2) checar contra o roadmap se é escopo da fase atual ou futura; (3) se futura, registrar aqui sem implementar; (4) se atual, implementar de forma mínima e testada, como já foi feito com `MimoData.luau`.
