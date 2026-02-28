CREATE SCHEMA IF NOT EXISTS azure_company;
USE azure_company;

SELECT * FROM information_schema.table_constraints
WHERE constraint_schema = 'azure_company';

-- restrição atribuída a um domínio (Comentado pois MySQL não suporta CREATE DOMAIN nativamente)
-- create domain D_num as int check(D_num> 0 and D_num< 21);

CREATE TABLE employee(
    Fname varchar(150) NOT NULL,
    Minit char,
    Lname varchar(150) NOT NULL,
    Ssn char(9) NOT NULL, 
    Bdate date,
    Address varchar(300),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int NOT NULL,
    CONSTRAINT chk_salary_employee CHECK (Salary > 2000.0),
    CONSTRAINT pk_employee PRIMARY KEY (Ssn)
);

ALTER TABLE employee 
    ADD CONSTRAINT fk_employee 
    FOREIGN KEY(Super_ssn) REFERENCES employee(Ssn)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE employee MODIFY Dno int NOT NULL DEFAULT 1;

DESC employee;

CREATE TABLE departament(
    Dname varchar(105) NOT NULL,
    Dnumber int NOT NULL,
    Mgr_ssn char(9) NOT NULL,
    Mgr_start_date date, 
    Dept_create_date date,
    CONSTRAINT chk_date_dept CHECK (Dept_create_date < Mgr_start_date),
    CONSTRAINT pk_dept PRIMARY KEY (Dnumber),
    CONSTRAINT unique_name_dept UNIQUE(Dname),
    FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
);

-- modificar uma constraint: drop e add
-- CORREÇÃO: Necessário usar "FOREIGN KEY" para fazer o drop no MySQL
ALTER TABLE departament DROP FOREIGN KEY departament_ibfk_1;

ALTER TABLE departament 
    ADD CONSTRAINT fk_dept FOREIGN KEY(Mgr_ssn) REFERENCES employee(Ssn)
    ON UPDATE CASCADE;

DESC departament;

CREATE TABLE dept_locations(
    Dnumber int NOT NULL,
    Dlocation varchar(1005) NOT NULL,
    CONSTRAINT pk_dept_locations PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament (Dnumber)
);

-- CORREÇÃO: Necessário usar "FOREIGN KEY" para fazer o drop no MySQL
ALTER TABLE dept_locations DROP FOREIGN KEY fk_dept_locations;

ALTER TABLE dept_locations 
    ADD CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

CREATE TABLE project(
    Pname varchar(105) NOT NULL,
    Pnumber int NOT NULL,
    Plocation varchar(105),
    Dnum int NOT NULL,
    PRIMARY KEY (Pnumber),
    CONSTRAINT unique_project UNIQUE (Pname),
    CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);

CREATE TABLE works_on(
    Essn char(9) NOT NULL,
    Pno int NOT NULL,
    Hours decimal(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno),
    CONSTRAINT fk_employee_works_on FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    CONSTRAINT fk_project_works_on FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

-- CORREÇÃO: Adicionado IF EXISTS para evitar travamento na primeira execução
DROP TABLE IF EXISTS dependent;

CREATE TABLE dependent(
    Essn char(9) NOT NULL,
    Dependent_name varchar(105) NOT NULL,
    Sex char,
    Bdate date,
    Relationship varchar(80),
    PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT fk_dependent FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);

SHOW TABLES;
DESC dependent;


USE azure_company;
ALTER TABLE departament MODIFY Dname VARCHAR(50) NOT NULL;
ALTER TABLE dept_locations MODIFY Dlocation VARCHAR(50) NOT NULL;
ALTER TABLE project MODIFY Plocation VARCHAR(50);
ALTER TABLE project MODIFY Pname VARCHAR(50) NOT NULL;

select * from employee;
UPDATE azure_company.employee SET Super_ssn = NULL WHERE Ssn = '100000001';

-- 1. INSERINDO EMPREGADOS (30 registros)
-- O primeiro registro (CEO) tem Super_ssn nulo. Os demais respondem a ele ou a outros.
-- Salários todos acima de 2000.0 para respeitar a constraint chk_salary_employee.
INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) VALUES
('Carlos', 'A', 'Silva', '100000001', '1980-05-15', 'Rua A, 123 - São Paulo', 'M', 15000.00, NULL, 1),
('Mariana', 'B', 'Costa', '100000002', '1985-08-20', 'Av B, 45 - Rio de Janeiro', 'F', 9500.00, '100000001', 2),
('João', 'C', 'Santos', '100000003', '1990-02-10', 'Rua C, 78 - Pau dos Ferros', 'M', 8000.00, '100000001', 3),
('Ana', 'D', 'Oliveira', '100000004', '1992-11-30', 'Av D, 90 - Mossoró', 'F', 7500.00, '100000002', 4),
('Pedro', 'E', 'Lima', '100000005', '1988-04-25', 'Rua E, 12 - Fortaleza', 'M', 6000.00, '100000003', 5),
('Fernanda', 'F', 'Gomes', '100000006', '1995-07-14', 'Rua F, 34 - Natal', 'F', 5500.00, '100000003', 6),
('Lucas', 'G', 'Pereira', '100000007', '1991-09-05', 'Av G, 56 - Recife', 'M', 5000.00, '100000004', 7),
('Juliana', 'H', 'Alves', '100000008', '1989-12-12', 'Rua H, 78 - Salvador', 'F', 6200.00, '100000004', 8),
('Diego', 'I', 'Ribeiro', '100000009', '1993-03-22', 'Rua I, 90 - Curitiba', 'M', 4500.00, '100000005', 9),
('Camila', 'J', 'Martins', '100000010', '1996-06-18', 'Av J, 11 - Porto Alegre', 'F', 4800.00, '100000005', 10),
('Bruno', 'K', 'Carvalho', '100000011', '1987-01-28', 'Rua K, 22 - Belo Horizonte', 'M', 7100.00, '100000002', 11),
('Amanda', 'L', 'Melo', '100000012', '1994-10-09', 'Rua L, 33 - Vitória', 'F', 5300.00, '100000006', 12),
('Ricardo', 'M', 'Araujo', '100000013', '1986-05-05', 'Av M, 44 - Manaus', 'M', 8200.00, '100000002', 13),
('Letícia', 'N', 'Barbosa', '100000014', '1998-02-14', 'Rua N, 55 - Belém', 'F', 4100.00, '100000007', 14),
('Thiago', 'O', 'Cardoso', '100000015', '1990-08-08', 'Rua O, 66 - Goiânia', 'M', 5900.00, '100000008', 15),
('Isabelly', 'P', 'Teixeira', '100000016', '1997-12-01', 'Av P, 77 - Brasília', 'F', 4600.00, '100000009', 16),
('Kayc', 'Q', 'Moraes', '100000017', '1995-04-11', 'Rua Q, 88 - Cuiabá', 'M', 4900.00, '100000010', 17),
('Isabella', 'R', 'Farias', '100000018', '1999-07-25', 'Rua R, 99 - Campo Grande', 'F', 3800.00, '100000011', 18),
('Samuel', 'S', 'Rocha', '100000019', '1992-03-15', 'Av S, 10 - São Luís', 'M', 5400.00, '100000012', 19),
('Débora', 'T', 'Almeida', '100000020', '1984-11-20', 'Rua T, 20 - Teresina', 'F', 8500.00, '100000013', 20),
('Gabriel', 'U', 'Dias', '100000021', '1991-06-30', 'Rua U, 30 - João Pessoa', 'M', 5100.00, '100000014', 21),
('Laura', 'V', 'Monteiro', '100000022', '1996-01-10', 'Av V, 40 - Maceió', 'F', 4300.00, '100000015', 22),
('Rafael', 'W', 'Correia', '100000023', '1989-09-25', 'Rua W, 50 - Aracaju', 'M', 6400.00, '100000016', 23),
('Beatriz', 'X', 'Macedo', '100000024', '1994-05-05', 'Rua X, 60 - Florianópolis', 'F', 5800.00, '100000017', 24),
('Eduardo', 'Y', 'Borges', '100000025', '1988-12-30', 'Av Y, 70 - Palmas', 'M', 6700.00, '100000018', 25),
('Sofia', 'Z', 'Campos', '100000026', '1997-08-15', 'Rua Z, 80 - Boa Vista', 'F', 4200.00, '100000019', 26),
('Marcelo', 'A', 'Freitas', '100000027', '1990-04-20', 'Rua AA, 90 - Macapá', 'M', 5600.00, '100000020', 27),
('Larissa', 'B', 'Pinto', '100000028', '1993-10-10', 'Av BB, 100 - Rio Branco', 'F', 4900.00, '100000021', 28),
('Felipe', 'C', 'Mendes', '100000029', '1985-02-28', 'Rua CC, 110 - Porto Velho', 'M', 7300.00, '100000022', 29),
('Vitória', 'D', 'Nunes', '100000030', '1998-11-11', 'Rua DD, 120 - Campinas', 'F', 3900.00, '100000023', 30);



-- 2. INSERINDO DEPARTAMENTOS (30 registros)
-- Respeitando a regra Dept_create_date < Mgr_start_date
INSERT INTO departament (Dname, Dnumber, Mgr_ssn, Mgr_start_date, Dept_create_date) VALUES
('Diretoria', 1, '100000001', '2015-01-01', '2010-01-01'),
('Engenharia SW', 2, '100000002', '2016-03-15', '2012-05-10'),
('Dados e BI', 3, '100000003', '2018-07-20', '2015-08-01'),
('Recursos Humanos', 4, '100000004', '2017-02-10', '2011-11-20'),
('Financeiro', 5, '100000005', '2019-05-05', '2010-06-15'),
('Marketing', 6, '100000006', '2020-01-10', '2013-09-01'),
('Vendas', 7, '100000007', '2018-11-01', '2014-04-25'),
('Suporte TI', 8, '100000008', '2021-03-01', '2016-12-10'),
('Pesquisa e Inov', 9, '100000009', '2019-09-15', '2017-01-20'),
('Logística', 10, '100000010', '2022-06-01', '2018-05-30'),
('Operações', 11, '100000011', '2017-08-20', '2012-02-15'),
('Qualidade', 12, '100000012', '2020-11-10', '2015-03-10'),
('Jurídico', 13, '100000013', '2016-04-25', '2011-07-05'),
('Compras', 14, '100000014', '2021-08-15', '2019-01-10'),
('Auditoria', 15, '100000015', '2018-12-01', '2014-06-20'),
('Comunicação', 16, '100000016', '2022-02-10', '2020-09-15'),
('Design UI/UX', 17, '100000017', '2019-10-05', '2016-08-25'),
('Infraestrutura', 18, '100000018', '2023-01-15', '2021-05-10'),
('Segurança Info', 19, '100000019', '2020-07-20', '2018-11-05'),
('Atendimento', 20, '100000020', '2017-05-10', '2013-10-15'),
('Treinamento', 21, '100000021', '2021-09-01', '2019-04-20'),
('Estratégia', 22, '100000022', '2018-01-15', '2015-12-01'),
('Compliance', 23, '100000023', '2022-04-10', '2020-02-28'),
('Administração', 24, '100000024', '2019-06-25', '2017-07-10'),
('Facilities', 25, '100000025', '2020-03-15', '2018-09-05'),
('Produto', 26, '100000026', '2021-12-01', '2019-10-20'),
('Sucesso Cliente', 27, '100000027', '2023-05-10', '2022-01-15'),
('Relações Pub', 28, '100000028', '2018-08-20', '2016-03-30'),
('Expansão', 29, '100000029', '2020-10-05', '2017-11-15'),
('Sustentabilidade', 30, '100000030', '2022-07-15', '2021-08-10');

-- 3. INSERINDO LOCALIZAÇÕES DOS DEPARTAMENTOS (30 registros)
INSERT INTO dept_locations (Dnumber, Dlocation) VALUES
(1, 'São Paulo'), (2, 'Pau dos Ferros'), (3, 'Pau dos Ferros'), (4, 'Rio de Janeiro'),
(5, 'São Paulo'), (6, 'Curitiba'), (7, 'Belo Horizonte'), (8, 'Mossoró'),
(9, 'Campinas'), (10, 'Manaus'), (11, 'Fortaleza'), (12, 'Recife'),
(13, 'Brasília'), (14, 'Goiânia'), (15, 'Salvador'), (16, 'Porto Alegre'),
(17, 'Florianópolis'), (18, 'Natal'), (19, 'São José dos Campos'), (20, 'Vitória'),
(21, 'Cuiabá'), (22, 'Campo Grande'), (23, 'Belém'), (24, 'São Luís'),
(25, 'Teresina'), (26, 'Maceió'), (27, 'Aracaju'), (28, 'João Pessoa'),
(29, 'Palmas'), (30, 'Boa Vista');

-- 4. INSERINDO PROJETOS (30 registros)
INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES
('Planejamento Anual', 1, 'São Paulo', 1),
('Sistema KLIJ', 2, 'Pau dos Ferros', 2),
('Dashboard RH', 3, 'Rio de Janeiro', 3),
('App SIEAGAS', 4, 'Pau dos Ferros', 2),
('Portal Usabilidade', 5, 'Natal', 17),
('Migração Nuvem', 6, 'São Paulo', 18),
('Campanha Q1', 7, 'Curitiba', 6),
('Expansão Nordeste', 8, 'Fortaleza', 29),
('Auditoria Interna', 9, 'Brasília', 15),
('Otimização Frota', 10, 'Manaus', 10),
('Nova Identidade', 11, 'Florianópolis', 17),
('Capacitação Lider', 12, 'Cuiabá', 21),
('Redução Custos', 13, 'São Paulo', 5),
('Segurança ZeroTrust', 14, 'São José dos Campos', 19),
('Pesquisa Mercado', 15, 'Belo Horizonte', 9),
('Automação Vendas', 16, 'Salvador', 7),
('Gestão Resíduos', 17, 'Boa Vista', 30),
('Atualização ERP', 18, 'Porto Alegre', 8),
('Portal do Cliente', 19, 'Recife', 26),
('LGPD Compliance', 20, 'Brasília', 13),
('Integração API', 21, 'Campinas', 2),
('Data Lake Azure', 22, 'Pau dos Ferros', 3),
('Feira Tech 2026', 23, 'São Paulo', 16),
('Mapeamento Processo', 24, 'Goiânia', 11),
('Certificação ISO', 25, 'Vitória', 12),
('Renovação Frota', 26, 'Belém', 14),
('Programa Trainee', 27, 'Rio de Janeiro', 4),
('Pesquisa Clima', 28, 'João Pessoa', 28),
('Chatbot Suporte', 29, 'Maceió', 20),
('Expansão Sede', 30, 'Palmas', 25);
select * from dependent;
-- 5. INSERINDO ALOCAÇÃO EM PROJETOS (WORKS_ON) (30 registros)
INSERT INTO works_on (Essn, Pno, Hours) VALUES
('100000001', 1, 10.5), ('100000002', 2, 40.0), ('100000003', 22, 35.0),
('100000004', 3, 20.0), ('100000005', 13, 15.0), ('100000006', 7, 25.0),
('100000007', 16, 30.0), ('100000008', 18, 40.0), ('100000009', 15, 20.0),
('100000010', 10, 35.0), ('100000011', 24, 25.0), ('100000012', 25, 10.0),
('100000013', 20, 15.0), ('100000014', 26, 30.0), ('100000015', 9, 20.0),
('100000016', 23, 15.0), ('100000017', 5, 40.0), ('100000018', 6, 35.0),
('100000019', 14, 40.0), ('100000020', 29, 25.0), ('100000021', 12, 20.0),
('100000022', 1, 10.0), ('100000023', 20, 15.0), ('100000024', 24, 30.0),
('100000025', 30, 40.0), ('100000026', 19, 35.0), ('100000027', 19, 20.0),
('100000028', 28, 15.0), ('100000029', 8, 40.0), ('100000030', 17, 25.0);

-- 6. INSERINDO DEPENDENTES (30 registros)
INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES
('100000001', 'Alice', 'F', '2010-04-12', 'Filha'),
('100000002', 'Miguel', 'M', '2015-08-22', 'Filho'),
('100000003', 'Helena', 'F', '2018-01-30', 'Filha'),
('100000004', 'Arthur', 'M', '2020-11-05', 'Filho'),
('100000005', 'Laura', 'F', '2012-05-18', 'Filha'),
('100000006', 'Gael', 'M', '2019-09-14', 'Filho'),
('100000007', 'Valentina', 'F', '2016-12-01', 'Filha'),
('100000008', 'Theo', 'M', '2021-03-25', 'Filho'),
('100000009', 'Chloe', 'F', '2014-07-08', 'Filha'),
('100000010', 'Davi', 'M', '2017-02-19', 'Filho'),
('100000011', 'Lívia', 'F', '2011-10-10', 'Filha'),
('100000012', 'Heitor', 'M', '2013-06-28', 'Filho'),
('100000013', 'Mirella', 'F', '2022-01-15', 'Filha'),
('100000014', 'Bernardo', 'M', '2010-08-04', 'Filho'),
('100000015', 'Isabella', 'F', '2015-11-11', 'Filha'),
('100000016', 'Lorenzo', 'M', '2018-05-02', 'Filho'),
('100000017', 'Sophia', 'F', '2020-09-09', 'Filha'),
('100000018', 'Enzo', 'M', '2012-12-12', 'Filho'),
('100000019', 'Luiza', 'F', '2017-04-20', 'Filha'),
('100000020', 'Gabriel', 'M', '2019-10-31', 'Filho'),
('100000021', 'Manuela', 'F', '2014-03-14', 'Filha'),
('100000022', 'Matheus', 'M', '2016-07-07', 'Filho'),
('100000023', 'Cecília', 'F', '2021-02-28', 'Filha'),
('100000024', 'Pedro', 'M', '2013-08-16', 'Filho'),
('100000025', 'Maite', 'F', '2018-12-25', 'Filha'),
('100000026', 'Lucas', 'M', '2011-01-05', 'Filho'),
('100000027', 'Antonella', 'F', '2015-06-30', 'Filha'),
('100000028', 'Joaquim', 'M', '2020-04-18', 'Filho'),
('100000029', 'Maria', 'F', '2017-09-22', 'Filha'),
('100000030', 'Samuel', 'M', '2019-05-08', 'Filho');