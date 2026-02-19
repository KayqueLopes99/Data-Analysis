# E-Commerce Database Project - Logical Schema & Refinement
## Descrição do Projeto

Este repositório contém o desenvolvimento do projeto lógico de banco de dados para um cenário de **E-commerce**, realizado como parte de um desafio da **DIO (Digital Innovation One)**. O objetivo principal foi traduzir um modelo conceitual em um esquema relacional eficiente, aplicando refinamentos essenciais para aproximar a modelagem da realidade de grandes marketplaces.


## Implementações e Refinamentos

Para atender aos objetivos propostos, foram implementados três pontos cruciais de refinamento:

* **Especialização de Clientes (PF/PJ):** Utilizei uma abordagem de tabela única para `Customer` com uma `CHECK CONSTRAINT`. Isso garante que uma conta seja obrigatoriamente Pessoa Física (CPF) ou Pessoa Jurídica (CNPJ), mas **nunca ambas simultaneamente**, mantendo a integridade cadastral.
* **Gestão de Pagamentos Flexível:** A relação foi estruturada para permitir que um único pedido receba **múltiplas formas de pagamento** (ex: dividir entre Pix e Cartão), aumentando a versatilidade da transação.
* **Módulo de Logística (Delivery):** Criada uma entidade dedicada para entregas, desacoplando o status do pedido da logística de transporte. Cada entrega possui seu próprio **Código de Rastreio** e status independente.



##  Arquitetura do Repositório

```text
project-e_commerce/
│
├── sql/                        
│   ├── 01_schema.sql           # Estrutura do banco, tabelas e constraints (DDL)
│   ├── 02_data_insertion.sql   # Scripts para persistência e carga de dados (DML)
│   └── 03_queries.sql          # Consultas complexas para análise de negócio
│
├── docs/                       
│   └── eer_diagram.png         # Diagrama visual do modelo (EER)
│
└── README.md                   # Documentação do projeto

```

## Requisitos Técnicos Atendidos
As consultas SQL presentes no arquivo `03_queries.sql` foram desenvolvidas para extrair inteligência de dados, utilizando:
1. **Recuperações Simples:** Visualização de cadastros básicos.
2. **Filtros com WHERE:** Segmentação de pedidos e status.
3. **Atributos Derivados:** Cálculos de subtotais e faturamento total.
4. **Ordenação com ORDER BY:** Ranking de vendas e histórico cronológico.
5. **Filtros de Grupo (HAVING):** Identificação de produtos com alta rotatividade.
6. **Junções (JOINs):** Cruzamento de dados entre Clientes, Pedidos, Fornecedores e Estoques.

## Como Executar
Para replicar este ambiente em seu MySQL local:
1. Execute o arquivo `01_schema.sql` para criar a estrutura do banco.
2. Execute o arquivo `02_data_insertion.sql` para popular as tabelas com dados de teste.
3. Rode os scripts de `03_queries.sql` para visualizar os resultados das análises de negócio propostas.

---
