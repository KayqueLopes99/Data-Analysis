## Criando Queries com Funções e Cláusulas de Agrupamentos
### **ORDER BY**: Cláusulas de ordenação com SQL
- Ordenação em Queries SQL
- Recuperação de dados não é ordenada, logo usa-se ORDER BY para essa situação.

> Order by:
- Claúsula SQL.
- Ordenação por coluna.
- Expressões baseadas em dados.
- + de um dados.

```sql
SELECT Fname, Lname Dno FROM employee ORDER BY (Dno);

```

- Pode ser Ascendente (Menor para o maior) ou descendente  (Maior para o menor).

- *Sintaxe*: 
```
SELECT <attribute list>
FROM <table list>
[WHERE <condition>]
[ORDER BY <attribute list> ];
```

> WHERE STATMENT:
- Critério a ser considerado na query ao recuperar a informação. A tupla (linha ou instância) deve conter a condição definida em where

> Ordenação: 
- Estrutura.
```
SELECT <attribute list>
FROM <table list>
[ORDER BY <attribute list>
DESC];
```

- Exemplo:
``` sql
SELECT idAccount 
FROM accounts ORDER BY amount LIMIT 5
```

#### Ordenação com SQL utilizando expressões
- Ordenação de dados para trazer constencia e sequencia.
- Alias para fornecer a nomenclatura adequada à dados derivados ou armazenados.

- Order + Expressões.
```
SELECT <attribute list>
FROM <table list>
[WHERE <condition>]
[ORDER BY <attribute list>];
-
```

- Classificação dos dados:
- Operadores numéricos, Nomes dos atributos. + de um atributo. DESC ou ASC.

```
SELECT <attribute list>
FROM <table list>
[WHERE <condition>]
[ORDER BY <atribute a, atribute b> ]
[DESC | ASC];

SELECT <attribute list>
FROM <table list>
[WHERE <condition>]
[ORDER BY <EXPRESSION> ]
[DESC | ASC];
```

#### Funções de agregação com SQL
- Funções de agrupamento: Agregar. Aglutinar. Agrupar. 

- Usados no SELECT e HAVING
```
COUNT: registros.
SUM: somátorio.
MIN: valor minimo - atributo.
MAX: valor máximo - atributo.
AVERAGE: média de valor - atributo.
```

- Exemplos:

```sql
SELECT year, COUNT(*) AS record_count
FROM station_data
WHERE tornado = 1
GROUP BY year;
```
- O que faz:

* Filtra apenas registros onde `tornado = 1`
* Agrupa por `year`
* Conta quantos registros existem por ano
* Retorna:
  * o ano
  * a quantidade de ocorrências de tornado naquele ano

```sql
SELECT year, month, COUNT(*) AS record_count
FROM station_data
WHERE tornado = 1
GROUP BY year, month;
```
- O que faz:

* Filtra registros com `tornado = 1`
* Agrupa por `year` e `month`
* Conta quantos registros existem por mês em cada ano


```sql
SELECT COUNT(*) AS record_count
FROM station_data;
```
- O que faz:

* Conta todos os registros da tabela
* Não tem filtro
* Não tem agrupamento

Resultado: total geral de registros na tabela.

#### **GROUP BY**: Cláusulas de agrupamento com SQL
- Atributos de relacionamentos e grupos de valores. 
- criar grupos.

```sql
SELECT department_id, COUNT(*) AS total_funcionarios
FROM employee
GROUP BY department_id;

```

#### Entendendo o **HAVING** Statement
- HAVING serve para filtrar resultados depois do GROUP BY.

SELECT: seleciona tabelas e atributos.
GROUP BY: grupos de valores.
HAVING filtragem dos grupos.

- Diferença entre `WHERE` e `HAVING`

| WHERE                              | HAVING                              |
| ---------------------------------- | ----------------------------------- |
| Filtra linhas antes do agrupamento | Filtra grupos depois do agrupamento |
| Não usa função agregada            | Usa função agregada                 |


```sql
SELECT department_id, COUNT(*) AS total
FROM employee
GROUP BY department_id;
```


```sql
SELECT department_id, COUNT(*) AS total
FROM employee
GROUP BY department_id
HAVING COUNT(*) > 1;

```

- Agora ele filtra os grupos.


Ordem real de execução

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY

- Estrutura padrão exemplar:
```sql
SELECT City, COUNT(CustomerID)
FROM Customers
WHERE Country = 'USA'
GROUP BY City
HAVING COUNT(CustomerID) > 5
ORDER BY City;

```

- Use parenteses sempre.

> Diferenças: ORDER BY (Ordena) e GROUP BY (Agrupa)
