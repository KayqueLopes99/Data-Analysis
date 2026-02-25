# Relatório de Vendas e Lucratividade (Financial Sample) - Power BI
- Objetivo e Descrição do Desafio
Este projeto foi desenvolvido como parte do desafio de projeto da **Formação Power BI Analyst** da DIO. 

O objetivo principal foi criar um relatório analítico e interativo de múltiplas páginas utilizando o conjunto de dados *Financial Sample* do Power BI. O desafio exigia a aplicação de boas práticas de design (layout estruturado), criação de botões de navegação, segmentadores de dados avançados e a utilização de **Indicadores (Bookmarks)** para alternar dinamicamente entre diferentes tipos de visuais na mesma página.

## Estrutura do Relatório

O painel foi dividido em duas páginas principais para separar a visão macro de faturamento do detalhamento de lucratividade:

### Página 1: Sales Report (Relatório de Vendas)
Focada na visão geral de receitas e volume de vendas.
* **KPIs Principais:** Receita Total (Total Revenue), Unidades Vendidas, Descontos, Vendas Brutas e Custos (COGS).
* **Análise Temporal:** Gráfico de linhas demonstrando a sazonalidade da receita mês a mês.
* **Interatividade Avançada:** Botões interativos que permitem ao usuário alternar a visualização da "Receita por Segmento" entre Gráfico de Pizza e Gráfico de Barras, e a "Receita por País" entre Treemap e Mapa.
* **Filtros e Controles:** Slicer de datas com calendário e botão dedicado para limpar todos os filtros aplicados.


### Página 2: Profit Detail Report (Detalhe de Lucratividade)
Focada em entender a composição do lucro da empresa.
* **Árvore de Decomposição:** Lucro Total ($16.89M) por Ano e, em seguida, por País, facilitando a identificação dos maiores geradores de lucro.
* **Gráfico de Cascata:** Demonstra a evolução e o acúmulo do lucro ao longo dos trimestres.
* **Gráfico de Radar:** Oferece uma visão multidimensional do lucro gerado por cada produto (Paseo, VTT, etc.).
* **Navegabilidade:** Botões de retorno para facilitar a transição fluida entre as páginas do relatório.

##  Como baixar e visualizar o projeto

Para abrir e interagir com este projeto na sua máquina, siga os passos abaixo:

1. Certifique-se de ter o **[Power BI Desktop](https://powerbi.microsoft.com/desktop/)** instalado no seu computador.
2. Faça o clone deste repositório ou baixe o arquivo.
3. Extraia os arquivos e abra o arquivo com a extensão `.pbix` diretamente no seu Power BI Desktop.

Obs: Você pode visualizar o relatório em formato pdf na pasta `pdf` ao lado.

---
