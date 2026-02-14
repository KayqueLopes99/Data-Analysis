CREATE DATABASE IF NOT EXISTS company_constraints;
USE company_constraints;

-- =========================
-- TABELAS
-- =========================

CREATE TABLE IF NOT EXISTS departament (
    Dnumber INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee (
    Ssn INT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2),
    Sex CHAR(1),
    Dno INT,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (Dno) REFERENCES departament(Dnumber)
);

CREATE TABLE IF NOT EXISTS project (
    Pnumber INT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    Dnum INT,
    CONSTRAINT fk_project_department
        FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE project;
TRUNCATE TABLE employee;
TRUNCATE TABLE departament;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================
-- INSERTS
-- =========================

INSERT INTO departament (Dnumber, Dname) VALUES
(1, 'TI'),
(2, 'RH'),
(3, 'Financeiro');

INSERT INTO employee (Ssn, Fname, Salary, Sex, Dno) VALUES
(101, 'Carlos', 40000, 'M', 1),
(102, 'Ana', 30000, 'F', 1),
(103, 'Bruno', 20000, 'M', 2),
(104, 'Mariana', 18000, 'F', 3);

INSERT INTO project (Pnumber, Pname, Dnum) VALUES
(1, 'Sistema ERP', 1),
(2, 'Recrutamento 2026', 2),
(3, 'Auditoria Interna', 3),
(4, 'App Mobile', 1);

-- =========================
-- CONSULTAS BÁSICAS
-- =========================

SHOW TABLES;

SELECT * FROM employee;
SELECT * FROM departament;

SELECT e.Dno, e.Ssn
FROM employee e
INNER JOIN departament d ON e.Dno = d.Dnumber;

-- =========================
-- FREQUÊNCIA
-- =========================

-- Funcionários por departamento (AJUSTADO)
SELECT d.Dname, COUNT(*) AS Employees
FROM employee e
INNER JOIN departament d ON e.Dno = d.Dnumber
GROUP BY d.Dname
ORDER BY Employees ASC;

-- =========================
-- PROJETOS POR DEPARTAMENTO
-- =========================

SELECT p.Pname, p.Dnum
FROM project p
INNER JOIN departament d ON p.Dnum = d.Dnumber;

SELECT d.Dname, COUNT(*) AS Projects
FROM project p
INNER JOIN departament d ON p.Dnum = d.Dnumber
GROUP BY d.Dname
ORDER BY Projects ASC;

-- =========================
-- DISCRETIZAÇÃO
-- =========================

SELECT Fname,
    CASE
        WHEN Salary > 39000 THEN 'Executivo'
        WHEN Salary > 29000 THEN 'Senior'
        WHEN Salary > 19000 THEN 'Pleno'
        ELSE 'Junior'
    END AS Employee_level
FROM employee
ORDER BY Employee_level;

-- =========================
-- PADRONIZAÇÃO
-- =========================

SELECT Fname,
    CASE
        WHEN Sex = 'M' THEN 'Masculino'
        WHEN Sex = 'F' THEN 'Feminino'
        ELSE 'Não informado'
    END AS Gender
FROM employee;