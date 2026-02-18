CREATE DATABASE IF NOT EXISTS databaseManipulationDIO; 
USE databaseManipulationDIO;
SELECT NOW() AS Timestamp;

CREATE TABLE bankAccounts (
    Id_account INT AUTO_INCREMENT PRIMARY KEY,
    Ag_num INT NOT NULL,
    Ac_num INT NOT NULL,
    Saldo FLOAT,
    CONSTRAINT identification_account_constraint 
        UNIQUE (Ag_num, Ac_num)
);

CREATE TABLE bankClient (
    Id_client INT AUTO_INCREMENT,
    ClientAccount INT,
    CPF CHAR(11) NOT NULL,
    RG CHAR(9) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,
    Renda_mensal FLOAT,
    PRIMARY KEY (Id_client, ClientAccount),
    CONSTRAINT fk_account_client 
        FOREIGN KEY (ClientAccount) 
        REFERENCES bankAccounts(Id_account)
        ON UPDATE CASCADE
);

CREATE TABLE bankTransactions (
    Id_transaction INT AUTO_INCREMENT PRIMARY KEY,
    Ocorrencia DATETIME,
    Status_transaction VARCHAR(20),
    Valor_transferido FLOAT,
    Source_account INT,
    Destination_account INT,
    CONSTRAINT fk_source_transaction 
        FOREIGN KEY (Source_account) 
        REFERENCES bankAccounts(Id_account),
    CONSTRAINT fk_destination_transaction 
        FOREIGN KEY (Destination_account) 
        REFERENCES bankAccounts(Id_account)
);


INSERT INTO bankAccounts (Ag_num, Ac_num, Saldo, limiteCredito) VALUES
(1001, 11111, 5000.00, 1000.00),
(1001, 22222, 3200.50, 800.00),
(1002, 33333, 1500.75, 500.00),
(1003, 44444, 7800.00, 2000.00),
(1004, 55555, 950.25, 400.00);

INSERT INTO bankClient 
(ClientAccount, CPF, RG, Nome, Endereco, Renda_mensal, UFF) VALUES
(1, '11111111111', '111111111', 'Kay', 'Rua A, 100', 3000.00, 'MG'),
(2, '22222222222', '222222222', 'Bruno', 'Rua B, 200', 4500.00, 'SP'),
(3, '33333333333', '333333333', 'Ana', 'Rua C, 300', 2800.00, 'RJ'),
(4, '44444444444', '444444444', 'Carlos', 'Rua D, 400', 5200.00, 'MG'),
(5, '55555555555', '555555555', 'Marina', 'Rua E, 500', 6100.00, 'ES');

INSERT INTO bankTransactions
(Ocorrencia, Status_transaction, Valor_transferido, Source_account, Destination_account) VALUES
(NOW(), 'CONCLUIDA', 500.00, 1, 2),
(NOW(), 'CONCLUIDA', 300.00, 2, 3),
(NOW(), 'PENDENTE', 150.00, 3, 4),
(NOW(), 'CONCLUIDA', 700.00, 4, 5),
(NOW(), 'CANCELADA', 200.00, 5, 1);


-- Comando DDL
DROP TABLE backAccount;

ALTER TABLE bankAccounts ADD limiteCredito FLOAT NOT NULL DEFAULT 500.00;

DESC bankAccounts;

ALTER TABLE bankAccounts ADD Email VARCHAR(150) NOT NULL;
ALTER TABLE bankAccounts DROP Email;

-- Alter table nome_tabela modify nome_atributo tipo condição;
-- Alter table nome tabela_add constraint_nome constraint_condições;

ALTER TABLE bankClient ADD UFF CHAR(2) NOT NULL DEFAULT 'RJ';
UPDATE bankClient SET UFF='MG' WHERE Nome='Kay';






