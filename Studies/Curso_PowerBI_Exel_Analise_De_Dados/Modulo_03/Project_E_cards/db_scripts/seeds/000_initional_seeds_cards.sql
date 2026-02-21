-- ============================
-- Seed Table_collection
-- ============================
INSERT INTO Table_collection (collectionSetName, ReleaseDate, totalCardsInCollection)
VALUES ('Base Set', '1999-01-09', 102);

-- ============================
-- Seed Table_type (todos os tipos oficiais)
-- ============================
INSERT INTO Table_type (typeName) VALUES
('Grass'),
('Fire'),
('Water'),
('Lightning'),
('Psychic'),
('Fighting'),
('Darkness'),
('Metal'),
('Colorless'),
('Fairy'),
('Dragon');

-- ============================
-- Seed Table_stage
-- ============================
INSERT INTO Table_stage (stageName) VALUES
('Basic'),
('Stage 1'),
('Stage 2');

-- ============================
-- Seed Table_cards (20 cartas do Base Set)
-- ============================
INSERT INTO Table_cards (hp, name, info, attack, damage, weak, resis, retreat,
    CardNumberInCollection, collection_id, type_id, stage_id)
VALUES
(80, 'Alakazam', 'Psi Pokémon', 'Confuse Ray', '30', 'Psychic', 'None', '3', 1, 1, 5, 3),
(100, 'Blastoise', 'Shellfish Pokémon', 'Hydro Pump', '40+', 'Lightning', 'None', '3', 2, 1, 3, 3),
(120, 'Chansey', 'Egg Pokémon', 'Double-Edge', '80', 'Fighting', 'Psychic', '1', 3, 1, 9, 1),
(120, 'Charizard', 'Flame Pokémon', 'Fire Spin', '100', 'Water', 'None', '3', 4, 1, 2, 3),
(40, 'Clefairy', 'Fairy Pokémon', 'Sing', 'None', 'Fighting', 'None', '1', 5, 1, 10, 1),
(100, 'Gyarados', 'Atrocious Pokémon', 'Dragon Rage', '50', 'Grass', 'None', '3', 6, 1, 3, 3),
(70, 'Hitmonchan', 'Punching Pokémon', 'Special Punch', '40', 'Psychic', 'None', '2', 7, 1, 6, 1),
(80, 'Machamp', 'Superpower Pokémon', 'Seismic Toss', '60', 'Psychic', 'None', '3', 8, 1, 6, 3),
(60, 'Magneton', 'Magnet Pokémon', 'Thunder Wave', '30', 'Fighting', 'None', '2', 9, 1, 4, 2),
(60, 'Mewtwo', 'Genetic Pokémon', 'Psychic', '10+', 'Psychic', 'None', '3', 10, 1, 5, 1),
(90, 'Nidoking', 'Drill Pokémon', 'Thrash', '30+', 'Psychic', 'None', '3', 11, 1, 6, 3),
(80, 'Ninetales', 'Fox Pokémon', 'Fire Blast', '80', 'Water', 'None', '1', 12, 1, 2, 2),
(90, 'Poliwrath', 'Tadpole Pokémon', 'Water Gun', '30+', 'Grass', 'None', '3', 13, 1, 3, 3),
(80, 'Raichu', 'Mouse Pokémon', 'Thunder', '60', 'Fighting', 'None', '2', 14, 1, 4, 2),
(100, 'Venusaur', 'Seed Pokémon', 'Solarbeam', '60', 'Fire', 'None', '2', 15, 1, 1, 3),
(90, 'Zapdos', 'Electric Pokémon', 'Thunderstorm', '40', 'Grass', 'Fighting', '3', 16, 1, 4, 1),
(80, 'Beedrill', 'Poison Bee Pokémon', 'Twineedle', '30x', 'Fire', 'Fighting', '1', 17, 1, 1, 3),
(80, 'Dragonair', 'Dragon Pokémon', 'Slam', '30x', 'Colorless', 'None', '2', 18, 1, 11, 2),
(70, 'Dugtrio', 'Mole Pokémon', 'Earthquake', '70', 'Grass', 'None', '2', 19, 1, 6, 2),
(70, 'Electabuzz', 'Electric Pokémon', 'Thunderpunch', '30+', 'Fighting', 'None', '2', 20, 1, 4, 1);
