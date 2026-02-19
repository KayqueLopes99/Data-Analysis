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

-- CASE STATEMENT
UPDATE employee 
SET salary =
 CASE 
  WHEN department_id=5 THEN salary+2000 
  WHEN department_id=4 THEN salary+3000 
  WHEN department_id=3 THEN salary+4000 
  ELSE salary
 END
WHERE ssn IS NOT NULL;

SELECT first_name, salary, department_id from employee;

-- JOIN STATEMENT
SELECT * FROM employee JOIN works_on; 

-- JOIN
SELECT * FROM employee JOIN works_on ON ssn = employee_ssn;
SELECT * FROM employee, works_on WHERE ssn = employee_ssn;

SELECT * FROM employee e JOIN department d ON e.department_id =  d.department_id;

SELECT e.first_name, e.last_name, e.address 
FROM (employee e JOIN department d ON e.department_id =  d.department_id)
WHERE d.department_name = 'TI';

-- INNER JOIN
SELECT department_name, department_create_date, location FROM department d JOIN dept_locations l ON
(d.department_id=l.department_id) ORDER BY department_create_date, location;


DESC employee;
DESC works_on;
DESC dependent;
DESC project;
DESC dept_locations;

-- CROSS JOIN
SELECT * FROM employee CROSS JOIN dependent;


-- INNER JOIN COM 3 TABELAS.
-- project, works_on, employee e department
SELECT CONCAT(first_name, ' ', last_name) AS Complete_name, p.project_id, project_name, 
department_name, project_location
FROM employee e 
INNER JOIN works_on w ON e.ssn = w.employee_ssn
INNER JOIN project p ON p.project_id = w.project_id
INNER JOIN department d ON p.department_id =  d.department_id
WHERE project_name LIKE 'Sistema%'
ORDER BY p.project_id;


-- department, dept_locations, employeee
SELECT d.department_id, department_name, CONCAT(first_name, ' ', last_name) AS manager, salary, 
ROUND(salary*1.05, 2) AS bonus, location, dependent_name
FROM employee e 
INNER JOIN department d ON e.department_id =  d.department_id
INNER JOIN dept_locations l ON l.department_id =  d.department_id
INNER JOIN dependent dp ON dp.employee_ssn =  e.ssn;

-- OUTER JOIN
SELECT * FROM employee;
SELECT * FROM dependent;

SELECT * FROM employee INNER JOIN dependent ON ssn = employee_ssn;
SELECT * FROM employee RIGHT JOIN dependent ON ssn = employee_ssn;
SELECT * FROM employee RIGHT OUTER JOIN dependent ON ssn = employee_ssn;
