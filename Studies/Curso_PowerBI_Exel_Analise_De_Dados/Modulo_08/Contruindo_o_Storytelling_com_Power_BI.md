## Construindo o Storytelling com Power BI
> Storytelling no Power BI é a técnica de transformar dados e análises complexas em narrativas visuais claras, estruturadas e envolventes.

- **Layout**: a organização estratégica de elementos em um espaço.
> Projetando layout de Relatórios
- Requisitos empresariais
- Público-alvo do relatório
- Disposição dos visuais

> Diretrizes
- Desenhe um esboço
- Concentre-se no que é importante
- Escolha o fundo ideal

##### Acessibilidade

**Perceptível** – as informações e os componentes da interface do usuário precisam ser apresentadas aos usuários de maneiras que eles possam percebê-los.

**Operável** – os componentes e a navegação da interface do usuário precisam ser operáveis.

**Compreensível** – as informações e a operação da interface do usuário precisam ser compreensíveis.

#### Algumas ponderações
> A navegabilidade deve ser ajustada na abaa Seleção (ordem de camadas).

> Agrupe em conjuntos.

> Navegabilidade com acessibilidade – Ordenando as camadas e tabulação.

> Nomeações claras, concisas, diretas e sem abreviações. 

> Utilizando marcadores para facilitar a leitura dos visuais. pontos nas transições noas graficos.



##### Recursos 

- **Indicadores** - capturam a exibição configurada de uma página do relatório para que você possa voltar rapidamente para essa exibição mais tarde.
- **Botões** - criam uma experiência mais interativa para os usuários do relatório.
- **Seleções** - permitem determinar quais itens no relatório ficam visíveis e quais ficam ocultos.

##### Segmentador 

- Fornecer acesso mais rápido aos filtros mais usados ou mais importantes.
- Simplificar a capacidade do usuário de ver o estado filtrado atual sem precisar abrir uma lista suspensa.
- Filtrar por colunas desnecessárias e ocultas nas tabelas de dados.

##### Segmentador 

- Criar relatórios mais direcionados (colocando a segmentação de dados ao lado de visuais importantes).
- Adiar as consultas ao modelo de dados usando uma segmentação suspensa, especialmente ao usar o DirectQuery.

**Observação:** As segmentações não têm suporte para campos de entrada nem para funções de drill down.

##### Segmentador 

- **Seleção única** – essa opção está desativada por padrão. Ela garante que apenas um item possa ser selecionado por vez.
- **Seleção múltipla com CTRL** – essa opção está ativada por padrão. Ela permite que você selecione vários itens pressionando a tecla Ctrl.
- **Mostrar "Selecionar tudo"** – essa opção está desativada por padrão. Se você habilitar essa opção, uma caixa de seleção Selecionar tudo será adicionada à segmentação.

##### Filtros 

Ao expandir o painel Filtros, dependendo do item do relatório que você selecionou, você verá as seguintes seções:

- **Filtros neste visual** – filtros que se aplicam ao visual selecionado e nada mais. Esta seção só será exibida se você tiver um visual selecionado.
- **Filtros nesta página** – filtros que se aplicam a toda a página que você tem aberta.
- **Filtros em todas as páginas** – filtros que se aplicam a todas as páginas no relatório.
- **Detalhamento** – filtros que se aplicam a uma só entidade no relatório.

##### Classificar Dados 

- **Decrescente** - classifica o visual de acordo com a coluna selecionada na ordem do maior valor para o menor.
- **Crescente** - classifica o visual de acordo com a coluna selecionada na ordem do menor valor para o maior.
- **Classificar por** - classifica os dados de acordo com uma coluna específica. Focalize essa opção para exibir a lista de colunas entre as quais você pode selecionar.


##### Gráfico de Sankey
- É uma visualização que mostra fluxos e relacionamentos entre categorias através de conexões proporcionais. Útil para análise de movimentação de dados, vendas por canal ou mudanças de status em Power BI.