# Power BI Analytics: Storytelling e Parâmetros Dinâmicos

## Sobre o Projeto

Este repositório contém a entrega do desafio final de Data Analytics com Power BI da DIO. O objetivo deste projeto foi elevar o nível de um relatório financeiro estático, transformando-o em uma ferramenta de tomada de decisão altamente interativa através do uso de Storytelling e Parâmetros de Campos (Field Parameters).

Em vez de sobrecarregar o usuário com dezenas de gráficos, o painel foi projetado para dar total autonomia ao gestor, permitindo que ele cruze métricas e dimensões em tempo real com apenas alguns cliques.

## O Desafio

O projeto exigia a replicação e evolução de um dashboard financeiro, cumprindo as seguintes diretrizes:

- Criação de pelo menos dois visuais controlados por parâmetros.
- Primeira Visão: Parâmetro com base em categorias (Dimensões).
- Segunda Visão: Parâmetro com base em valores/métricas numéricas.
- Manter a estilização executiva do relatório original.
- Criar uma página orientada a apresentação ao cliente, utilizando técnicas de Storytelling de dados.

## Solução Desenvolvida: Página "Dynamic Analysis"

Para atender ao desafio, foi desenvolvida uma página exclusiva de análise dinâmica contendo:

### 1. UX e Storytelling

A página foi estruturada com uma narrativa clara no painel lateral esquerdo, guiando o cliente sobre como utilizar os seletores avançados para explorar os dados sob a perspectiva exata de sua necessidade de negócio.

### 2. Parâmetros de Campos Dinâmicos

Foram implementados dois Slicers (segmentadores) construídos via DAX e Modelagem avançada:

- **Visão por Categoria (Eixo Dinâmico)**: Permite alterar a dimensão da análise entre Product (Produto), Country (País) ou Segment (Segmento).
- **Métrica Analisada (Valor Dinâmico)**: Permite alternar o cálculo dos gráficos entre Total Vendas, Total Lucro e Total Units Sold.

### 3. Visuais Dinâmicos

- **Gráfico de Evolução Temporal (Linha)**: Mostra o comportamento da Métrica Analisada ao longo dos meses (Month Name), permitindo identificar sazonalidade e picos de performance (ex: Alta de vendas em Outubro).
- **Gráfico de Distribuição (Barras Horizontais)**: Um visual super adaptável que cruza a Métrica Analisada com a Visão por Categoria, revelando imediatamente quem são os líderes do negócio sob qualquer ótica (ex: Vendas por Segmento, Lucro por Produto, etc).

## Tecnologias e Habilidades Aplicadas

- Microsoft Power BI (ETL, Modelagem, DataViz)
- DAX (Data Analysis Expressions) para criação de Medidas Explícitas.
- Field Parameters (Parâmetros de Campos) para redução de ruído visual.
- Data Storytelling & UI/UX Design para dashboards.

## Estrutura do Repositório

- **Sales_Performance_Analysis_Kayque.pbix**: Arquivo completo do projeto no Power BI, com todas as medidas, relacionamentos e visuais interativos.
- **Data_Analysis_Finance.pdf**: Relatório exportado demonstrando o design e os insights estáticos do projeto.



## Como Visualizar

1. Baixe o arquivo `.pbix` presente neste repositório.
2. Abra no Power BI Desktop.
3. Navegue pelas páginas utilizando os botões do menu lateral/inferior.
