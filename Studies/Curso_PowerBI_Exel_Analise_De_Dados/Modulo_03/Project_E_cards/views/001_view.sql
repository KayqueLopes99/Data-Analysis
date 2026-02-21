
-- Consulta 1: Listar Pokémon e seus dados ordenados por Tipagem (Type)
SELECT 
    t.typeName AS "Tipo",
    c.CardNumberInCollection AS "Nº da Carta",
    c.name AS "Nome do Pokémon",
    c.hp AS "HP",
    s.stageName AS "Estágio",
    c.attack AS "Ataque Principal",
    c.damage AS "Dano"
FROM Table_cards c
JOIN Table_type t ON c.type_id = t.id
JOIN Table_stage s ON c.stage_id = s.id
ORDER BY t.typeName ASC, c.hp DESC;


-- View com nomes mais amigáveis
CREATE OR REPLACE VIEW vw_pokemon_cards AS
SELECT 
    c.id AS "Card ID",
    c.name AS "Card Name",
    c.hp AS "Hit Points",
    c.info AS "Card Info",
    c.attack AS "Attack Name",
    c.damage AS "Attack Damage",
    c.weak AS "Weakness",
    c.resis AS "Resistance",
    c.retreat AS "Retreat Cost",
    c.CardNumberInCollection AS "Card Number in Collection",
    col.collectionSetName AS "Collection Name",
    col.ReleaseDate AS "Collection Release Date",
    col.totalCardsInCollection AS "Total Cards in Collection",
    t.typeName AS "Pokémon Type",
    s.stageName AS "Evolution Stage"
FROM Table_cards c
JOIN Table_collection col ON c.collection_id = col.id
JOIN Table_type t ON c.type_id = t.id
JOIN Table_stage s ON c.stage_id = s.id;

SELECT * FROM vw_pokemon_cards;