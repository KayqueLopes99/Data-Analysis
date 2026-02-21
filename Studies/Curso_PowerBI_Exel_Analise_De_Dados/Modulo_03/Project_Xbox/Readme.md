# Dashboard de Vendas: Xbox Game Pass Subscription Analysis

## Descrição

Este projeto consiste em um dashboard interativo desenvolvido no Excel para análise de desempenho de assinaturas do serviço Xbox Game Pass. O objetivo foi transformar dados brutos de assinantes em um painel visual estratégico que permite ao gestor identificar padrões de faturamento, preferências de planos e o comportamento dos principais clientes.

O dashboard foi construído utilizando **Tabelas Dinâmicas** para o processamento dos dados e **Gráficos Dinâmicos** conectados por segmentadores de dados, garantindo uma experiência interativa e em tempo real.

---

## Base de Dados

A base de dados utilizada contém informações detalhadas de cada transação, incluindo:

* **Subscriber ID & Name**: Identificação única dos clientes.
* **Plan & Subscription Type**: Detalhes sobre o nível da assinatura (Standard ou Ultimate) e a recorrência (Mensal, Trimestral ou Anual).
* **Auto Renewal**: Status indicando se o cliente optou pela renovação automática da assinatura.
* **Total Value**: O faturamento líquido final por transação, considerando o preço base e o uso de cupons de desconto.

---

## Questões de Negócio Abordadas

O painel foi desenhado para responder a 6 questões fundamentais para a gestão do serviço:

1. **Faturamento Total de Planos Anuais**: Qual o valor agregado total gerado apenas por assinaturas de ciclo anual?
2. **Faturamento por Status de Renovação**: Qual a divisão da receita entre clientes que mantêm a renovação automática ativa (Yes) versus os que não mantêm (No)?
3. **Volume de Vendas EA Play**: Qual o total faturado especificamente com o serviço acoplado EA Play Season Pass?
4. **Distribuição por Plano (Popularidade)**: Qual a proporção de assinantes entre os planos Standard e Ultimate?
5. **Engajamento em Renovação Automática**: Qual a porcentagem da base de clientes que prefere a comodidade da renovação automática?
6. **Ranking de Faturamento por Cliente (Top 10)**: Quem são os 10 clientes que geraram a maior receita total para a plataforma?

---

##  Visual do Dashboard (Diagrama)

O layout foi planejado para seguir a identidade visual da marca (Xbox), utilizando tons de verde e um modo escuro (Dark Mode) para facilitar a leitura.

* **Cabeçalho**: Identificação do período de avaliação e data de atualização (21/02/2026).
* **Slicers (Filtros)**: Filtro lateral para alternar entre tipos de assinatura (Annual, Monthly, Quarterly).
* **Cards de Valor**: Localizados no topo para visualização rápida do faturamento por serviço (EA Play e Minecraft).
* **Gráficos Analíticos**:
* **Subscriptions by Plan**: Gráfico de Rosca para análise de mix de produtos.
* **Auto Renewal Status**: Gráfico de Pizza para análise de retenção.
* **Top 10 Customers by Revenue**: Gráfico de Barras horizontais destacando os clientes com maior LTV (Lifetime Value).
---

### Como reproduzir:

1. Baixe o arquivo `.xlsx` deste repositório.
2. Abra no Microsoft Excel (recomenda-se versão 2019 ou superior para compatibilidade total dos gráficos).
3. Navegue até a aba `Dashboard` para interagir com os dados.

---

