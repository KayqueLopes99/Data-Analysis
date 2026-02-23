# Resumo de Estudos: Microsoft Power BI

## 1. Definição do Power BI

O **Power BI** é uma ferramenta de **Business Intelligence**, desenvolvida pela Microsoft, utilizada para coletar, tratar, analisar e visualizar dados provenientes de diferentes fontes. Seu principal objetivo é transformar dados brutos em informações organizadas por meio de relatórios e painéis interativos, auxiliando na análise e na tomada de decisões.

## 2. Guias Principais do Power BI

O Power BI Desktop possui três guias principais, responsáveis pelas etapas de visualização, análise e modelagem dos dados.

#### 1. Guia Relatório

A guia **Relatório** é o ambiente onde os dados são apresentados de forma visual.

Sua função é permitir a criação de relatórios interativos por meio de gráficos, tabelas, mapas, cartões e filtros. Nessa guia, o usuário organiza os elementos visuais, define o layout e estabelece interações entre os gráficos, possibilitando uma análise dinâmica das informações.

Essa guia é fundamental, pois é nela que os dados são transformados em informações compreensíveis para o usuário final.

---

#### 2. Guia Exibição de Tabela (Dados)

A guia **Exibição de Tabela**, também conhecida como **guia Dados**, apresenta os dados em formato tabular.

Sua função é permitir a visualização detalhada das tabelas importadas, facilitando a conferência de registros, colunas e valores. Além disso, nessa guia podem ser criadas colunas calculadas e medidas utilizando a linguagem DAX.

Essa etapa é importante para garantir a consistência e a confiabilidade dos dados antes da construção dos relatórios.

---

#### 3. Guia Modelo (Relacionamentos entre Tabelas)

A guia **Modelo** é responsável pela estrutura lógica dos dados.

Sua função é criar e gerenciar os relacionamentos entre as tabelas, definindo como elas se conectam por meio de chaves primárias e estrangeiras. Também permite ajustar o tipo e a direção dos relacionamentos, como um-para-muitos ou muitos-para-muitos.

Uma modelagem correta assegura que os dados sejam cruzados adequadamente, evitando erros nos cálculos e garantindo resultados precisos nos relatórios.

## 3. Etapas de Desenvolvimento
1. Importação e tratamento de dados (Excel).
2. Estabelecer relacionamentos (Tabelas).
3. Estabelecer Fórmulas.
4. Criação do Dashboard.
5. Visualização.

### Importação
- Opção "Obter dados", possui várias opções.
- Transformar dados, sempre para realizar edições.

### Edição de planilhas com Power Query
- Limpeza dos dados.
- Renomear tabelas.
- Varrer tabela, eliminando colunas vazias. 

> **Limpar linhas em branco:**
> *[Explicação da Imagem correspondente: Mostra o menu "Reduzir Linhas" na faixa de opções do Power Query, onde se seleciona "Remover Linhas" e depois "Remover Linhas em Branco" para limpar a base de dados.]*

> **Separação de dados:**
> *[Explicação da Imagem correspondente: Exibe uma coluna chamada "Localidade" onde os dados estão concatenados (ex: "França - Europa"), ilustrando a necessidade de separar o País do Continente para uma análise correta.]*

- Guia transformar e guia adicionar coluna.
- Divisão de dados de uma coluna.
> *[Explicação da Imagem correspondente: Mostra a janela "Dividir Coluna por Delimitador", configurada para separar o texto a cada ocorrência de um traço ("-"), dividindo assim os dados combinados em duas novas colunas.]*

- Realização de cálculos entre colunas.
- Seleção de mais de uma coluna pressione `ctrl`. 
- **Etapas aplicadas:** histórico de alterações importante para retornar em qualquer momento, marcando o X nesta parte.
- **Atualização de dados automática:** manda uma nova planilha, o sistema faz os cálculos e procedimentos.

- **Coluna de exemplos:** fornece um padrão de aplicabilidade e ele replica nas demais linhas daquela coluna.
> *[Explicação da Imagem correspondente: Demonstra a ferramenta "Coluna de Exemplos" em ação. O usuário digita "Sobrenome Nome" manualmente na primeira linha, e a IA do Power BI detecta o padrão e preenche automaticamente as linhas restantes com a mesma lógica de inversão de nomes.]*

- Fechar e Aplicar: opção para carregamento no PowerBi.

- Exibição por nome da coluna.
> *[Explicação da Imagem correspondente: Visão geral da interface do Power BI Desktop, destacando o painel "Visualizações" à esquerda (com os ícones de gráficos) e o painel "Dados" à direita (mostrando a lista de tabelas e suas colunas disponíveis).]*

- Exibição de modelo. 

## 4. Recomendações de Visualização
- Lista de dados a serem apresentados (Indicadores).
- Da informação geral para detalhada.
- Gráfico apropriado para cada situação.

###### Gráficos:
1. **Cartão:** única informação.
2. **Outros visuais:**
> *[Explicação da Imagem correspondente: Demonstração de como adicionar dados a um visual. Mostra o painel onde se arrasta os campos da tabela para os eixos do gráfico (Eixo X, Eixo Y, Legenda) para montar a visualização.]*

> *[Explicação da Imagem correspondente: Foco na formatação de um "Cartão" (KPI). O cursor está sobre o ícone de pincel ("Formatar seu visual"), indicando onde se altera a cor, tamanho da fonte e título do número exibido.]*

**Formatações:**
- **Visual:** Só existem no gráfico (eixos, cores das barras).
- **Geral:** Para qualquer elemento, ex: "Título", sombra, tamanho.
- Alinhamento e organização.

**Filtros:**
- Aba filtros lateral.
- Leitura em Z (organização visual da esquerda para direita, topo para baixo).

**Interação:**
- Interação entre gráficos por clique.
- **Formatação de interação:** Arquivo > Opções e Configurações > Configurações do relatório > Opções visuais > Colocar (Alterar filtragem cruzada).
- Filtrar dois itens: pressionar `ctrl` e selecionar.

## Aula 2 - Dashboard de Produção
- Entender a base de dados. 
- Fórmulas DAX.
- Inserção de plano de fundo via png.
- `CALCULATE` + sintaxe. 
- Site de cores: `color-hex`.
- Combina com sua cor: `mycolor space`.
- Ícones: `flat icon`.

## Aula 3 - Dashboard de RH
- Antes de começar deve-se pensar no que será analisado.
- `COUNT` é diferente de `COUNTROWS`.
- Estabelecer um tema: na aba exibição > personalizar tema. 
- Isso deixa formatação e tipografia prontos.
- Importar mais gráficos.
- Design: `dribble`.
- Captura de cor (conta gotas): `instant eyedropper`.
- MINI DASHBOARD DENTRO DE UM GRÁFICO (Tooltip).

## Aula 4 - Dashboard Financeiro
- Mistura de gráficos.
- Imagem/Logo (ex: BB).