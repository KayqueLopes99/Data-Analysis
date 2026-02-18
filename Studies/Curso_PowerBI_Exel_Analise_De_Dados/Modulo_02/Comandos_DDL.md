## Explorando os Comandos de DDL – Data Definition Language
- Data Definition Language
Responsável pela **definição e modificação da estrutura** do banco de dados.

Principais comandos:
- `CREATE` – Criar objetos (tabelas, bancos, índices)
- `DROP` – Remover objetos
- `ALTER` – Alterar estrutura
- `RENAME` – Renomear objetos
- `TRUNCATE` – Remover todos os registros de uma tabela
- `MERGE` – Mesclar dados entre tabelas (dependendo do SGBD)

> Observação: `INSERT`, `UPDATE` e `DELETE` pertencem à DML (Data Manipulation Language), pois manipulam dados, não estrutura. Apesar disso, eles usam estes comando quandi vão buscar dados. 

- **Update**: Modificação a partir de uma condição.
```
UPDATE nome_da_tabela
SET coluna1 = valor1, coluna2 = valor2, ...
WHERE condição;

```

- **DROP**: Remoção de estruturas

```
DROP DATABASE databasename
```

- **DELETE**: Remoção de registros a partir de uma condição.

```
DELETE FROM table_name WHERE condition
```

- **ALTER**: Modifição da estrutura do BD.
``` sql
ALTER TABLE Customers
ADD Email VARCHAR(255)
```

> Elaborando queries SQL com Expressões
- Expressões:

Atributos arotméticos, operações matemáticas e tipos de dados como string e numérico.

```sql
SELECT Fname, Lname, Salary, Salary * 0.11 AS INSS FROM EMPLOYEE
```

- *Armazenamento*: dados simples. Resultado de expressões: dados complexos. Plus: ultilizar alias.

- *Em consulta na expressão string*: Atributos compostos, como nome dividido em 3 na tabela. Usa-se a concatenação para essas informações, pode ser ``|| STATE AS``.


```sql
SELECT Fname, Minit, Lname || ',' || ' ' || STATE AS Complete_name FROM EMPLOYEE;

```

#### Introdução a operações de conjuntos com SQL
- **LIKE | BETWEEN**
- Usados para comparar informações;
- Caracteres especiais: % e _
- *%*: pode ser colocar em qualquer lado / vários elementos.
- *_*: apenas um elemento


``` sql
SELECT Fname, Lname
FROM EMPLOYEE
WHERE Address LIKE ‘%Houston,TX%’;

SELECT Nome, Renda_mensal
FROM bankClient
WHERE Renda_mensal BETWEEN 3000 AND 6000;
```

- *Strings*: ``'AB\_CD%EF' ESCAPE '\'``
- Usado com LIKE onde a barra \ funciona como caractere de escape, fazendo com que _ e % sejam tratados como texto literal e não como curingas.


- *Valores numéricos*:
Between: Numerico
Like: Strings

- intervalos.


#### Comandos baseados em operações matemáticas: UNION, INTERSECTION & EXCEPT

> 1. UNION

O `UNION` une os resultados de duas consultas, removendo registros duplicados.

Sintaxe:

```sql
SELECT coluna1, coluna2
FROM tabela1
UNION
SELECT coluna1, coluna2
FROM tabela2;
```

Regras importantes:

* As consultas devem ter o mesmo número de colunas.
* As colunas devem ser do mesmo tipo ou compatíveis.
* O resultado não traz duplicados.

Exemplo com suas tabelas:

```sql
SELECT first_name AS nome
FROM employee
UNION
SELECT dependent_name AS nome
FROM dependent;
```

Esse comando retorna nomes de funcionários e dependentes sem repetir valores iguais.

Se quiser manter duplicados, use:
```sql
UNION ALL
```

> 2. INTERSECT

O `INTERSECT` retorna apenas os registros que aparecem nas duas consultas.

Sintaxe:

```sql
SELECT coluna
FROM tabela1
INTERSECT
SELECT coluna
FROM tabela2;
```

Exemplo conceitual:

```sql
SELECT ssn
FROM employee
INTERSECT
SELECT manager_ssn
FROM department;
```

Retorna os funcionários que também são gerentes.

Observação: no MySQL tradicional, `INTERSECT` não é suportado diretamente. Pode ser simulado com `INNER JOIN`.

> 3. EXCEPT

O `EXCEPT` retorna os registros da primeira consulta que não aparecem na segunda.

Sintaxe:

```sql
SELECT coluna
FROM tabela1
EXCEPT
SELECT coluna
FROM tabela2;
```

Exemplo conceitual:

```sql
SELECT ssn
FROM employee
EXCEPT
SELECT manager_ssn
FROM department;
```

Retorna funcionários que não são gerentes.

Observação: no MySQL tradicional, `EXCEPT` também não é suportado diretamente. Pode ser simulado com `LEFT JOIN` + `IS NULL`.


#### Nested Queries (Subqueries) com SQL
- Subquery (ou nested query) é uma consulta dentro de outra consulta.
- Ela é usada para que o resultado de uma SELECT sirva como condição ou fonte de dados para outra.


- Comparação por atributos buscados.
- Nested Query - Consulta aninhada.
- Consulta interna e externa. 

``SELECT FROM WHERE``

> Exemplo: Subquery no WHERE

Usada para filtrar dados com base no resultado de outra consulta.
Exemplo: funcionários que ganham acima da média salarial.

```sql
SELECT nome, salario
FROM funcionarios
WHERE salario > (
    SELECT AVG(salario)
    FROM funcionarios
);
```

Primeiro o banco calcula a média.
Depois compara cada salário com esse valor.



> IN - comparação com set

> = - comparação com unidade

> retorno tabela.

Keywords: ANY, SOME, ALL.
Operadores: > >= < <= and <>

##### Clausulas EXISTS & UNIQUE
*EXISTS*: TRUE se o resultados da consulta aninhada contiver pelo menos um tupla.

*NOT EXISTS*: TRUE se o resultado da consulta aninhada não contiver tuplas.

*UNIQUE*: retorna TRUE se único.

- Conjuntos explicitos: 
- Conjuntos explícitos são listas de valores definidos diretamente na consulta. Ou seja, você escreve manualmente quais valores quer considerar.

``` sql
SELECT first_name, salary
FROM employee
WHERE department_id IN (1, 3, 5);
```