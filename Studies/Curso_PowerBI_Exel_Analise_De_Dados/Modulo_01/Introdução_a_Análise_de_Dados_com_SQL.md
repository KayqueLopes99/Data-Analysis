## Introdução a Análise de Dados com SQL
### Considerações sobre SQL – Ferramenta de todo BI Analyst
- Banco de dados relacionais.
- Sql linguagem de consulta a banco de dados

Linguagem para:
- Manipulação de dados 
- Execução de operações

Classificações 
- DDL – Data Definition Language 
- DML – Data Manipulation Language 
- DCL – Data Control Language 
- DQL – Data Query Language

- Estrutura Tabular e JOINs Queries.
- SQL Analytics consiste na utilização do SQL para manipulação, transformação e análise de dados com foco em BI. 

Plano de Estudo
- Cenário do mundo real
- Situação com problema de negócios
- Escolha da abordagem (análise)

- Construção de Queries para realização de uma analise.

> Dica:
- Realização de uma Análise Descritiva.
- Visualize as informações da entidade.
- Criando perguntas e respondendo cada pergunta configurando uma querie que seja a resposta.
- Avaliação individual das entidades e verificação de possiveis junções de seleção.

> Analise descritiva
- Uma análise descritiva no SQL é o uso de consultas para resumir e descrever os dados, mostrando o que aconteceu, sem explicar causas nem prever resultados.



> Cracterização
- Na análise descritiva, a caracterização de registros é o processo de classificar, agrupar e rotular os dados para torná-los mais fáceis de entender.

- Em vez de olhar registro por registro, você define perfis e categorias.

- É transformar dados brutos em grupos com significado.

> Utilizando Junções para Caracterizar os Dados

- Na análise descritiva, junções (JOINs) são utilizadas para combinar dados de diferentes tabelas e, assim, caracterizar melhor os registros, adicionando contexto às informações. Em vez de analisar dados isolados, o JOIN permite enriquecer os registros.

> Analisando Frequência dos Dados com Funções de Agregação
- Na análise descritiva, analisar frequência significa contar quantas vezes um valor aparece em um conjunto de dados.

> Discretização com `CASE` Statement

**Discretização** é o processo de transformar valores numéricos contínuos em **categorias** (faixas ou níveis).
- No SQL, isso é feito com o `CASE`, que funciona como uma estrutura condicional.

- Exemplo – Classificação por Salário

```sql
SELECT Fname,
       Salary,
       CASE
           WHEN Salary > 39000 THEN 'Executivo'
           WHEN Salary > 29000 THEN 'Senior'
           WHEN Salary > 19000 THEN 'Pleno'
           ELSE 'Junior'
       END AS Nivel
FROM employee;
```

Aqui o salário (valor numérico) foi transformado em categorias.

> Aplicando Padronização na Recuperação dos Dados com CASE Statement

- Padronização é o processo de ajustar valores diferentes que representam a mesma informação para um único padrão, garantindo consistência na análise.

- O CASE é usado para corrigir variações e uniformizar os dados no momento da consulta.
```sql
SELECT Fname,
       CASE
           WHEN Sex IN ('M', 'm') THEN 'Masculino'
           WHEN Sex IN ('F', 'f') THEN 'Feminino'
           ELSE 'Não informado'
       END AS Gender
FROM employee;
```