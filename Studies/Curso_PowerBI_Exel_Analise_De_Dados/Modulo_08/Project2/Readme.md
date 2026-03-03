# Projeto de Data Analytics - Performance Financeira com Power BI

## Descrição do Projeto

Este projeto foi desenvolvido como resolução de um desafio prático de Data Analytics utilizando o Microsoft Power BI. O objetivo principal foi transformar um conjunto de dados financeiros brutos em um relatório interativo e analítico, focado na experiência do usuário e no detalhamento avançado de métricas de vendas e lucro.

O relatório final foi estruturado pensando na jornada de consumo de dados pelo cliente final, evoluindo de uma visão macro (Executive Summary) para páginas de detalhamento profundo (Drill-down e Insights Geográficos).

## Requisitos do Desafio e Implementação

O desafio exigia a criação de uma página de detalhes com visuais específicos, bem como a modelagem de dados e criação de medidas. A solução foi dividida em duas páginas de detalhes focadas para evitar poluição visual e melhorar a UX:

### 1. Sales & Profit Details (Detalhamento de Vendas e Lucros)

Nesta página, o foco foi agrupar as métricas de produtos e a temporalidade das vendas:

* **Visuais sobre os TOP 3 Produtos:** Foram criados gráficos de barras horizontais destacando o Top 3 produtos por Vendas (Paseo, VTT, Velo) e o Top 3 por Lucro (Paseo, VTT, Amarilla).
* **Gráfico de Dispersão (Unidades x Vendas):** O visual "Units Sold & Sales Correlation" foi adicionado para mostrar a relação linear de faturamento por volume mensal.
* **Agrupamento de Dados:** Utilização do visual "Sales & Profit by Month" para identificar os picos de sazonalidade (com Outubro liderando).
* **Compartimentação de Dados:** Segmentação das vendas e lucros por "Faixa Preço" (Baixo, Médio e Alto).

### 2. Geographic & Distribution Insights (Insights Geográficos)

Esta página foca na rentabilidade por localização e na distribuição estatística de volume:

* **Principais Países:** Visual de colunas destacando o "Total Profit by Country", revelando França e Alemanha como líderes de rentabilidade.
* **Visuais de Compartimentação (Histograma):** Implementação de um Histograma ("Units Sold Distribution") para entender a frequência e distribuição do volume de unidades vendidas em compartimentos.
* **Dispersão Animada:** Um gráfico de dispersão com *Play Axis* (linha do tempo mensal) mostrando a evolução das vendas e unidades por produto dinamicamente ao longo dos meses.

## Medidas DAX Criadas

Para sustentar as análises solicitadas, foram criadas as seguintes medidas essenciais:

* `Total Revenue`: Soma do faturamento bruto.
* `Total Profit`: Soma do lucro líquido.
* `Total Units Sold`: Volume total de unidades comercializadas.

## Principais Insights Gerados

* A operação atingiu **114,24 Mi** em receita com **1,08 Mi** de unidades vendidas.
* O produto **Paseo** é o principal motor financeiro, gerando **33 Mi** em vendas brutas e quase **4,8 Mi** em lucro sozinho.
* A **América do Norte** concentra a maior fatia do mercado com **62,56%** da distribuição, enquanto a **Europa** representa **37,44%**.


## Como Visualizar

1. Baixe o arquivo `.pbix` presente neste repositório.
2. Abra no Power BI Desktop.
3. Navegue pelas páginas utilizando os botões do menu lateral/inferior.
