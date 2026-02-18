USE databaseDIO;
CREATE TABLE IF NOT EXISTS employee (
    ssn CHAR(9) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_initial CHAR(1),
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    address VARCHAR(100) NOT NULL,
    sex CHAR(1) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    CHECK (salary >= 1500), 
    super_ssn CHAR(9),
    department_id INT,

    PRIMARY KEY (ssn)
);

CREATE TABLE IF NOT EXISTS department (
    department_id INT NOT NULL,
    department_name VARCHAR(15) NOT NULL,
    manager_ssn CHAR(9) NOT NULL,
    manager_start_date DATE NOT NULL,
    department_create_date DATE NOT NULL,

    CHECK (department_create_date < manager_start_date),
    PRIMARY KEY (department_id),
    UNIQUE (department_name),
    FOREIGN KEY (manager_ssn) REFERENCES employee(ssn)
);

ALTER TABLE employee
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES department(department_id);

CREATE TABLE IF NOT EXISTS dept_locations (
    department_id INT NOT NULL,
    location VARCHAR(15) NOT NULL,

    PRIMARY KEY (department_id, location),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE IF NOT EXISTS project (
    project_id INT NOT NULL,
    project_name VARCHAR(15) NOT NULL,
    project_location VARCHAR(15) NOT NULL,
    department_id INT NOT NULL,

    PRIMARY KEY (project_id),
    UNIQUE (project_name),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE IF NOT EXISTS works_on (
    employee_ssn CHAR(9) NOT NULL,
    project_id INT NOT NULL,
    hours DECIMAL(3,1) NOT NULL,

    PRIMARY KEY (employee_ssn, project_id),
    FOREIGN KEY (employee_ssn) REFERENCES employee(ssn),
    FOREIGN KEY (project_id) REFERENCES project(project_id)
);


CREATE TABLE IF NOT EXISTS dependent (
    employee_ssn CHAR(9) NOT NULL,
    dependent_name VARCHAR(15) NOT NULL,
    sex CHAR(1) NOT NULL,
    birth_date DATE NOT NULL,
    relationship VARCHAR(20) NOT NULL,

    PRIMARY KEY (employee_ssn, dependent_name),
    FOREIGN KEY (employee_ssn) REFERENCES employee(ssn)
);

-- Persistindo informações no banco de dados Employee
-- =====================================================
-- 1️ EMPLOYEE (5 registros)
-- =====================================================

INSERT INTO employee
(ssn, first_name, middle_initial, last_name, birth_date, address, sex, salary, super_ssn, department_id)
VALUES
('111111111', 'Carlos', 'A', 'Silva', '1990-05-10', 'Rua A, 100', 'M', 3500.00, NULL, NULL),
('222222222', 'Ana', 'B', 'Souza', '1995-08-22', 'Rua B, 200', 'F', 4200.50, '111111111', NULL),
('333333333', 'Bruno', 'C', 'Oliveira', '1988-12-03', 'Rua C, 300', 'M', 2800.75, '111111111', NULL),
('444444444', 'Mariana', 'D', 'Costa', '1992-03-15', 'Rua D, 400', 'F', 5100.00, '222222222', NULL),
('555555555', 'Lucas', 'E', 'Pereira', '2000-07-30', 'Rua E, 500', 'M', 2600.00, '222222222', NULL);


-- =====================================================
-- 2️ DEPARTMENT (5 registros)
-- Regra: department_create_date < manager_start_date
-- =====================================================

INSERT INTO department
(department_id, department_name, manager_ssn, manager_start_date, department_create_date)
VALUES
(1, 'TI', '111111111', '2020-01-01', '2018-01-01'),
(2, 'RH', '222222222', '2021-02-01', '2019-01-01'),
(3, 'Financeiro', '333333333', '2022-03-01', '2020-01-01'),
(4, 'Marketing', '444444444', '2023-04-01', '2021-01-01'),
(5, 'Operacoes', '555555555', '2024-05-01', '2022-01-01');


-- =====================================================
-- Atualizando employee para vincular departamentos
-- =====================================================

UPDATE employee SET department_id = 1 WHERE ssn = '111111111';
UPDATE employee SET department_id = 2 WHERE ssn = '222222222';
UPDATE employee SET department_id = 3 WHERE ssn = '333333333';
UPDATE employee SET department_id = 4 WHERE ssn = '444444444';
UPDATE employee SET department_id = 5 WHERE ssn = '555555555';


-- =====================================================
-- 3️ DEPT_LOCATIONS (5 registros)
-- =====================================================

INSERT INTO dept_locations
(department_id, location)
VALUES
(1, 'São Paulo'),
(2, 'Rio'),
(3, 'Belo Horizonte'),
(4, 'Curitiba'),
(5, 'Porto Alegre');


-- =====================================================
-- 4️ PROJECT (5 registros)
-- =====================================================

INSERT INTO project
(project_id, project_name, project_location, department_id)
VALUES
(101, 'SistemaERP', 'São Paulo', 1),
(102, 'Recrutamento', 'Rio', 2),
(103, 'Auditoria', 'Belo Horizonte', 3),
(104, 'CampanhaAds', 'Curitiba', 4),
(105, 'LogisticaApp', 'Porto Alegre', 5);


-- =====================================================
-- 5️ WORKS_ON (5 registros)
-- =====================================================

INSERT INTO works_on
(employee_ssn, project_id, hours)
VALUES
('111111111', 101, 8.0),
('222222222', 102, 6.5),
('333333333', 103, 7.0),
('444444444', 104, 5.5),
('555555555', 105, 4.0);


-- =====================================================
-- 6️ DEPENDENT (5 registros)
-- =====================================================

INSERT INTO dependent
(employee_ssn, dependent_name, sex, birth_date, relationship)
VALUES
('111111111', 'Pedro', 'M', '2015-05-01', 'Filho'),
('222222222', 'Laura', 'F', '2018-08-10', 'Filha'),
('333333333', 'Marcia', 'F', '1985-09-20', 'Esposa'),
('444444444', 'João', 'M', '2010-03-15', 'Filho'),
('555555555', 'Carla', 'F', '1998-11-30', 'Esposa');

-- Nome do funcionário.
SELECT * FROM employee ORDER BY first_name, last_name;
desc project;

-- Nome do departamento e nome do gerente.
SELECT department_name, CONCAT(e.first_name, ' ', e.last_name) AS employee_name
FROM department d, employee e, works_on w, project p
WHERE d.department_id = e.department_id
  AND e.ssn = d.manager_ssn
  AND e.ssn = w.employee_ssn
  AND w.project_id = p.project_id
ORDER BY d.department_name, e.first_name, e.last_name;

-- Nome do departamento e nome do gerente.
SELECT DISTINCT d.department_name AS department,
       CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       p.project_name
FROM department d, employee e, works_on w, project p
WHERE d.department_id = e.department_id
  AND e.ssn = w.employee_ssn
  AND w.project_id = p.project_id
ORDER BY d.department_name, e.first_name, e.last_name;

-- recupere todos os empregados e seus projetos em andamento
SELECT DISTINCT d.department_name AS department,
       CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       p.project_name
FROM department d, employee e, works_on w, project p
WHERE d.department_id = e.department_id
  AND e.ssn = w.employee_ssn
  AND w.project_id = p.project_id
ORDER BY department, employee_name;

-- Funções e cláusula de agrupamento
SELECT * FROM employee;

SELECT e.department_id AS department_number, COUNT(*) AS funcionarios_dapartamento, ROUND(AVG(e.salary), 2) AS media_salario FROM employee e, department d
WHERE d.department_id=e.department_id GROUP BY e.department_id;

SELECT e.department_id AS department_number, COUNT(*) AS funcionarios_dapartamento, ROUND(AVG(e.salary), 2) AS media_salario FROM employee e, department d
WHERE d.department_id=e.department_id AND d.department_name = 'TI';

SELECT p.project_id,
       p.project_name,
       COUNT(w.employee_ssn) AS total_funcionarios
FROM project p, works_on w
WHERE p.project_id = w.project_id
GROUP BY p.project_id, p.project_name;

SELECT COUNT(DISTINCT salary) AS contagem_salarios FROM employee;

SELECT 
    ROUND(SUM(salary), 2) AS total_salary,
    ROUND(MAX(salary), 2) AS salario_max,
    ROUND(AVG(salary), 2) AS media_salary,
    ROUND(MIN(salary), 2) AS salario_min
FROM employee;

SELECT 
    ROUND(SUM(e.salary), 2) AS total_salary,
    ROUND(MAX(e.salary), 2) AS salario_max,
    ROUND(AVG(e.salary), 2) AS media_salary,
    ROUND(MIN(e.salary), 2) AS salario_min
FROM employee e
JOIN department d 
    ON d.department_id = e.department_id;
    
    
-- Explorando cláusulas de agrupamento com SQL
-- group by

SELECT p.project_id,
       p.project_name,
       COUNT(w.employee_ssn) AS total_funcionarios, 
       ROUND(AVG(e.salary), 2) AS media_salary
FROM project p, works_on w, employee e
WHERE p.project_id = w.project_id
GROUP BY p.project_id, p.project_name;

SELECT p.project_id, p.project_name, count(*) AS total
FROM project p, works_on w
WHERE p.project_id = w.project_id
GROUP BY p.project_id, p.project_name
HAVING count(*) > 0;


-- group by having
SELECT e.department_id, count(*) AS total
FROM employee e
WHERE e.salary > 1000
GROUP BY e.department_id
HAVING COUNT(*)>0;

SELECT e.department_id, count(*) AS total
FROM employee e
WHERE e.salary > 1000 AND e.department_id IN (SELECT e.department_id FROM employee e
GROUP BY e.department_id HAVING COUNT(*)>0
)
GROUP BY e.department_id;
