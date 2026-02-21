> Pronpt_1:
Action:
create a script to create a table in postgresql

Context:
- the fisrt table is a table to save a pokemon tcg cards
- the second table is table to save collections set

connect to tables with foreign key 

Information: **Table_cards**

The fisrt_table:
* id
* hp
* name
* type
* stage
* info
* attack
* damage
* weak
* resis
* retreat
- CardNumberInCollection


The second_table: **Table_collection**
- id
- collectionSetName
- ReleaseDate
- totalCardsInCollection

create another tables and link to table_cards - create a table to separe type - create a table to separete stage

> Pronpt_2:
Consider tables:
-- Table for collections (parent)
CREATE TABLE Table_collection (
    id SERIAL PRIMARY KEY,
    collectionSetName VARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    totalCardsInCollection INT NOT NULL
);

-- Table for card types
CREATE TABLE Table_type (
    id SERIAL PRIMARY KEY,
    typeName VARCHAR(100) UNIQUE NOT NULL
);

-- Table for card stages
CREATE TABLE Table_stage (
    id SERIAL PRIMARY KEY,
    stageName VARCHAR(100) UNIQUE NOT NULL
);

-- Table for cards (child)
CREATE TABLE Table_cards (
    id SERIAL PRIMARY KEY,
    hp INT,
    name VARCHAR(255) NOT NULL,
    info TEXT,
    attack VARCHAR(255),
    damage VARCHAR(50),
    weak VARCHAR(100),
    resis VARCHAR(100),
    retreat VARCHAR(100),
    CardNumberInCollection INT NOT NULL,
    collection_id INT NOT NULL,
    type_id INT NOT NULL,
    stage_id INT NOT NULL,
    CONSTRAINT fk_collection
        FOREIGN KEY (collection_id)
        REFERENCES Table_collection (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_type
        FOREIGN KEY (type_id)
        REFERENCES Table_type (id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_stage
        FOREIGN KEY (stage_id)
        REFERENCES Table_stage (id)
        ON DELETE RESTRICT
);

create a initial seed to all tables with tcg pokémon generate inserts scripts





generate 20 inserts records na table_cards
generate all types inserts records na table_type


Pronpt_3:
Considere o modelo relacional abaixo e traga todoas a sinformações substituindo substituindo prlso nomes chaves estrangeiras salve isso em uma view postgree sql