USE databasetest;

CREATE TABLE IF NOT EXISTS person (
person_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender ENUM('M', 'F') NOT NULL,
birth_date DATE NOT NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
state VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
postal_code VARCHAR(100) NOT NULL

);
desc person;

CREATE TABLE IF NOT EXISTS favorite_food (
    favorite_food_id INT AUTO_INCREMENT,
    person_id INT NOT NULL,    
	food_name VARCHAR(100) NOT NULL,

     PRIMARY KEY (favorite_food_id, person_id),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);
desc favorite_food;

INSERT INTO person 
(first_name, last_name, gender, birth_date, street, city, state, country, postal_code)
VALUES
('Carlos', 'Silva', 'M', '1990-05-10', 'Rua A', 'São Paulo', 'SP', 'Brasil', '01000-000'),
('Ana', 'Souza', 'F', '1995-08-22', 'Rua B', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-000'),
('Bruno', 'Oliveira', 'M', '1988-12-03', 'Rua C', 'Belo Horizonte', 'MG', 'Brasil', '30000-000'),
('Mariana', 'Costa', 'F', '1992-03-15', 'Rua D', 'Curitiba', 'PR', 'Brasil', '80000-000'),
('Lucas', 'Pereira', 'M', '2000-07-30', 'Rua E', 'Porto Alegre', 'RS', 'Brasil', '90000-000');


INSERT INTO favorite_food (person_id, food_name)
VALUES
(1, 'Pizza'),
(2, 'Sushi'),
(3, 'Churrasco'),
(4, 'Lasanha'),
(5, 'Hambúrguer');

TRUNCATE TABLE favorite_food;
TRUNCATE TABLE person;

select * from person;