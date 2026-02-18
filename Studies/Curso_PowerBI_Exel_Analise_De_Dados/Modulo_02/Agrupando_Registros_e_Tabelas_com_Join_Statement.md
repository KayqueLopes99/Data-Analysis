## Agrupando Registros e Tabelas com Join Statement
#### CASE statement
- `CASE` é uma **estrutura condicional** no SQL.
Serve para retornar valores diferentes com base em condições — como um `if/else`.
- Troca de valor. Condição de troca. Mapeamento de valores de correspondência.
-  Sintaxes
- Normal:
```sql
CASE coluna
    WHEN valor1 THEN resultado1
    WHEN valor2 THEN resultado2
    ELSE resultado_padrao
END 
```

- Codições:

```sql
CASE
    WHEN condição1 THEN resultado1
    WHEN condição2 THEN resultado2
    ELSE resultado_padrao
END 
```

> `ELSE` é opcional.
> Se não colocar, o retorno padrão será `NULL`.

- Exemplo - Classificando salário

```sql
SELECT 
    name,
    salary,
    CASE
        WHEN salary < 2000 THEN 'Baixo'
        WHEN salary BETWEEN 2000 AND 5000 THEN 'Médio'
        ELSE 'Alto'
    END AS faixa_salarial
FROM employee;
```

* Menor que 2000 → "Baixo"
* Entre 2000 e 5000 → "Médio"
* Acima disso → "Alto"

- Pode ser usado para setar um valor. 
- Pode ser usado em funções agregadas como `SELECT` `ORDER BY` `GROUP BY` `UPDATE`. 


#### Agrupamentos com CASE
```sql
SELECT year,
    CASE
        WHEN wind_speed >= 40 THEN 'HIGH'
        WHEN wind_speed >= 30 THEN 'MODERATE'
        ELSE 'LOW'
    END AS wind_severity, -- Nome da coluna do CASE.
    COUNT(*) AS record_count
FROM station_data
GROUP BY 1, 2;

— Atualizando apenas um departamento
UPDATE employee
SET faixa_salarial =
    CASE
        WHEN salary < 2000 THEN 'Baixo'
        WHEN salary BETWEEN 2000 AND 5000 THEN 'Médio'
        ELSE 'Alto'
    END;


```

#### O caso zero/null trick
- É uma técnica usada com `COUNT` ou `SUM` para contar registros **condicionalmente**.

A ideia é simples:

* `COUNT(coluna)` **não conta NULL**
* `SUM()` soma números
* Então usamos `CASE` para retornar `1`, `0` ou `NULL`


- Exemplos:

```sql
COUNT(
    CASE 
        WHEN salary > 3000 THEN 1
    END
)
```
* Se a condição for verdadeira → retorna `1`
* Se for falsa → retorna `NULL`
* `COUNT` ignora `NULL`
* Resultado: conta só quem atende à condição

```sql
SUM(
    CASE
        WHEN salary > 3000 THEN 1
        ELSE 0
    END
)
```

* Verdadeiro → 1
* Falso → 0
* `SUM` soma tudo
* Resultado: total de quem atende à condição


| Técnica      | Usa NULL? | Usa 0? |
| ------------ | --------- | ------ |
| COUNT + CASE | ✔         | ❌      |
| SUM + CASE   | ❌         | ✔      |

---

- Exemplo:
```sql
SELECT year, month,
    SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) AS tornado_precipitation,
    SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END) AS non_tornado_precipitation
FROM station_data
GROUP BY year, month;
```

- MAX, AVG, MIN, NAD, OR, NOT, COUNT.

#### Entendendo Queries de múltiplas tabelas com JOIN

-  Definição: `JOIN` serve para **combinar dados de duas ou mais tabelas** usando uma condição de relacionamento (normalmente chave primária + chave estrangeira).
- Se não usar condição somente junta as tabelas com todos os atributos. Ele faz um CROSS JOIN: Ele combina cada linha da tabela A com todas as linhas da tabela B.

- Sintaxe

```sql
SELECT colunas
FROM tabela1
JOIN tabela2
    ON tabela1.coluna = tabela2.coluna;
```

- Tipos principais de JOIN
> INNER JOIN

Retorna apenas registros que têm correspondência nas duas tabelas.
Atributo de junção.
Linhas não correspondentes excluídas. 
```sql
SELECT e.first_name, d.department_name
FROM employee e
INNER JOIN department d
    ON e.department_id = d.department_id;
```
- ON: Atributos com noes diferentes (Use sempre).
- USING: Atributos com linhas iguais.

- Mostra funcionário + nome do departamento. Se o funcionário não tiver departamento, não aparece.

#### Agrupamento com mais de duas tabelas + JOIN


1. **Juntar várias tabelas**
2. Depois **agrupar os dados**
3. Aplicar funções como `COUNT`, `SUM`, `AVG`

Ordem lógica da query:

```
FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT
```

- Exemplo com 3 tabelas
Quantas horas foram trabalhadas por departamento?

Tabelas envolvidas:

* `employee`
* `works_on`
* `department`

```sql
SELECT 
    d.department_name,
    SUM(w.hours) AS total_horas
FROM department d
JOIN employee e 
    ON d.department_id = e.department_id
JOIN works_on w 
    ON e.ssn = w.employee_ssn
GROUP BY d.department_name;
```

1. Junta departamento → funcionário
2. Junta funcionário → projeto (works_on)
3. Agrupa por departamento
4. Soma as horas

- Estrutura padrão

```sql
SELECT colunas_agrupadas, função_agregada
FROM tabela1
INNER JOIN tabela2 ON CONDIÇÃO_LIGAÇÃO
INNER JOIN tabela3 ON CONDIÇÃO_LIGAÇÃO
INNER JOIN tabelaK ON CONDIÇÃO_LIGAÇÃO
WHERE ...
GROUP BY colunas_agrupadas;
```

- A ordem dos iners não impota 


#### A ordem importa em queries JOIN?
- Não.
- O SGBD interpreta e escolhe a sequência de comandos. 
- Especificar a ordem: STRINGHT_JOIN depois da palavra SELECT.

#### Nested (Subqueries) com JOIN Statement
- Usando sub queries. 

```sql
SELECT a.account_id, a.cust_id, a.open_date, a.product_cd
FROM account a
INNER JOIN (
    SELECT emp_id, assigned_branch_id
    FROM employee
    WHERE start_date < '2007-01-01'
      AND (title = 'Teller' OR title = 'Head Teller')
) e
    ON a.open_emp_id = e.emp_id
INNER JOIN (
    SELECT branch_id
    FROM branch
    WHERE name = 'Woburn Branch'
) b
    ON e.assigned_branch_id = b.branch_id;
```

#### Self JOIN: Mesma tabela em uma Query JOIN
- `Self JOIN` é quando você faz JOIN de **uma tabela com ela mesma**.
- Usado quando existe **relacionamento interno** na própria tabela.

- Quando uma linha da tabela se relaciona com outra linha da mesma tabela.

No seu banco isso acontece aqui:

```sql
employee.super_ssn
```

Um funcionário pode ter outro funcionário como supervisor.

```sql
SELECT 
    e.first_name AS funcionario,
    s.first_name AS supervisor
FROM employee e
LEFT JOIN employee s
    ON e.super_ssn = s.ssn;
```

* `employee e` → funcionário
* `employee s` → supervisor
* Liga: `e.super_ssn = s.ssn`

Se `super_ssn` for NULL → aparece NULL (por causa do LEFT JOIN).

- O Certo:

```sql
FROM employee e
JOIN employee s
```

> Quando Self JOIN é comum?

* Hierarquia (funcionário → gerente)
* Estrutura organizacional
* Categoria pai/filho
* Comparar registros da mesma tabela

#### Comparando condições de Junção e Filtros
> Diferença 1:
ON → define como as tabelas se relacionam
WHERE → filtra o resultado depois da junção

- Cuidado com as redundância semanticas: usar comandos que retornam uma tabela diferente do esperado.


#### Como utilizar o OUTER JOIN Statement?
- `OUTER JOIN` retorna registros **mesmo quando não existe correspondência** na outra tabela. Diferente do `INNER JOIN`, que só traz o que combina nas duas.

```sql
SELECT colunas
FROM tabela1 -- Orientação.
LEFT OUTER JOIN tabela2
    ON tabela1.coluna = tabela2.coluna;

```


- Tipos de OUTER JOIN

> LEFT OUTER JOIN 

Retorna:
* Tudo da tabela da esquerda
* E o que combinar da direita
* Se não combinar → vem `NULL`

Sintaxe
```sql
SELECT colunas
FROM tabela1
LEFT JOIN tabela2
    ON condição;
```

- Mostrar todos os funcionários e seus departamentos:
```sql
SELECT e.first_name, d.department_name
FROM employee e
LEFT JOIN department d
    ON e.department_id = d.department_id;
```

```sql
SELECT 
    e.first_name,
    d.department_name
FROM employee e
LEFT JOIN department d
    ON e.department_id = d.department_id;
```


Se algum funcionário não tiver departamento → aparece com `NULL`.

> RIGHT OUTER JOIN 

Retorna:

* Tudo da tabela da direita
* E o que combinar da esquerda
```sql
SELECT e.first_name, d.department_name
FROM employee e
RIGHT JOIN department d
    ON e.department_id = d.department_id;
```

Menos usado. Pode inverter a ordem e usar LEFT.

> FULL OUTER JOIN

Retorna:

* Tudo das duas tabelas
* Mesmo sem correspondência

#### Entendendo melhor os tipos de JOINs
> INNER ou OUTER JOIN: A  tabela referenciada modifica o resultado da query.

> Obs: equivalem aos resaltados anteriomente.
| Tipo       | Retorna o quê?      |
| ---------- | ------------------- |
| INNER JOIN | Só correspondências |
| LEFT JOIN  | Tudo da esquerda    |
| RIGHT JOIN | Tudo da direita     |
| FULL JOIN  | Tudo das duas tabelas |
| LEFT ANTI JOIN |	Registros da esquerda sem correspondência na direita |
| RIGHT ANTI JOIN |	Registros da direita sem correspondência na esquerda |
> No SQL, matches (combinações ou correspondências).

#### NATURAL JOIN
- Condição de junção implícita. Atributos comuns.
- NATURAL JOIN faz o JOIN automaticamente usando:
Todas as colunas que têm o mesmo nome nas duas tabelas.
Você não escreve ON.

```sql
SELECT *
FROM tabela1
NATURAL JOIN tabela2;

SELECT *
FROM employee
NATURAL JOIN department;
```