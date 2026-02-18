-- UNION, EXCEPT, INTERCEPT
CREATE DATABASE empresa_teste;
USE empresa_teste;

CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    departamento VARCHAR(50),
    salario DECIMAL(10,2)
);

CREATE TABLE gerentes (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    departamento VARCHAR(50)
);

INSERT INTO funcionarios VALUES
(1, 'Carlos', 'TI', 5000),
(2, 'Ana', 'RH', 4000),
(3, 'Bruno', 'TI', 4500),
(4, 'Marina', 'Financeiro', 6000);

INSERT INTO gerentes VALUES
(1, 'Carlos', 'TI'),
(4, 'Marina', 'Financeiro'),
(5, 'Fernanda', 'Marketing');

SELECT nome FROM funcionarios
UNION
SELECT nome FROM gerentes;

SELECT nome FROM funcionarios
UNION ALL
SELECT nome FROM gerentes;

SELECT f.nome
FROM funcionarios f
INNER JOIN gerentes g
ON f.nome = g.nome;

SELECT f.nome
FROM funcionarios f
LEFT JOIN gerentes g
ON f.nome = g.nome
WHERE g.nome IS NULL;




