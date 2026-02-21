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
-- Seed Table_cards (50 cartas do Base Set)
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
(70, 'Electabuzz', 'Electric Pokémon', 'Thunderpunch', '30+', 'Fighting', 'None', '2', 20, 1, 4, 1),
(80, 'Electrode', 'Ball Pokémon', 'Electric Shock', '50', 'Fighting', 'None', '1', 21, 1, 4, 2),
(60, 'Pidgeotto', 'Bird Pokémon', 'Mirror Move', 'None', 'Lightning', 'Fighting', '1', 22, 1, 9, 2),
(100, 'Arcanine', 'Legendary Pokémon', 'Flamethrower', '50', 'Water', 'None', '3', 23, 1, 2, 2),
(80, 'Charmeleon', 'Flame Pokémon', 'Flamethrower', '50', 'Water', 'None', '1', 24, 1, 2, 2),
(80, 'Dewgong', 'Sea Lion Pokémon', 'Ice Beam', '30', 'Lightning', 'None', '3', 25, 1, 3, 2),
(50, 'Dratini', 'Dragon Pokémon', 'Pound', '10', 'None', 'None', '1', 26, 1, 9, 1),
(50, 'Farfetch''d', 'Wild Duck Pokémon', 'Leek Slap', '30', 'Lightning', 'Fighting', '1', 27, 1, 9, 1),
(60, 'Growlithe', 'Puppy Pokémon', 'Flare', '20', 'Water', 'None', '1', 28, 1, 2, 1),
(50, 'Haunter', 'Gas Pokémon', 'Dream Eater', '50', 'None', 'Fighting', '1', 29, 1, 5, 2),
(60, 'Ivysaur', 'Seed Pokémon', 'Vine Whip', '30', 'Fire', 'None', '1', 30, 1, 1, 2),
(70, 'Jynx', 'Human Shape Pokémon', 'Doubleslap', '20x', 'Psychic', 'None', '2', 31, 1, 5, 1),
(60, 'Kadabra', 'Psi Pokémon', 'Super Psy', '50', 'Psychic', 'None', '3', 32, 1, 5, 2),
(80, 'Kakuna', 'Cocoon Pokémon', 'Poisonpowder', '20', 'Fire', 'None', '2', 33, 1, 1, 2),
(80, 'Machoke', 'Superpower Pokémon', 'Karate Chop', '50', 'Psychic', 'None', '3', 34, 1, 6, 2),
(30, 'Magikarp', 'Fish Pokémon', 'Tackle', '10', 'Lightning', 'None', '1', 35, 1, 3, 1),
(50, 'Magmar', 'Spitfire Pokémon', 'Fire Punch', '30', 'Water', 'None', '2', 36, 1, 2, 1),
(60, 'Nidorino', 'Poison Horn Pokémon', 'Horn Drill', '50', 'Psychic', 'None', '1', 37, 1, 1, 2),
(60, 'Poliwhirl', 'Tadpole Pokémon', 'Doubleslap', '30x', 'Grass', 'None', '1', 38, 1, 3, 2),
(30, 'Porygon', 'Virtual Pokémon', 'Conversion 2', 'None', 'Fighting', 'Psychic', '1', 39, 1, 9, 1),
(60, 'Raticate', 'Mouse Pokémon', 'Super Fang', '?', 'Fighting', 'Psychic', '1', 40, 1, 9, 2),
(60, 'Seel', 'Sea Lion Pokémon', 'Headbutt', '10', 'Lightning', 'None', '1', 41, 1, 3, 1),
(70, 'Wartortle', 'Turtle Pokémon', 'Bite', '20', 'Lightning', 'None', '1', 42, 1, 3, 2),
(30, 'Abra', 'Psi Pokémon', 'Psyshock', '10', 'Psychic', 'None', '0', 43, 1, 5, 1),
(40, 'Bulbasaur', 'Seed Pokémon', 'Leech Seed', '20', 'Fire', 'None', '1', 44, 1, 1, 1),
(40, 'Caterpie', 'Worm Pokémon', 'String Shot', '10', 'Fire', 'None', '1', 45, 1, 1, 1),
(50, 'Charmander', 'Lizard Pokémon', 'Scratch', '10', 'Water', 'None', '1', 46, 1, 2, 1),
(30, 'Diglett', 'Mole Pokémon', 'Mud Slap', '30', 'Grass', 'Lightning', '0', 47, 1, 6, 1),
(50, 'Doduo', 'Twin Bird Pokémon', 'Fury Attack', '10x', 'Lightning', 'Fighting', '0', 48, 1, 9, 1),
(50, 'Drowzee', 'Hypnosis Pokémon', 'Pound', '10', 'Psychic', 'None', '1', 49, 1, 5, 1),
(50, 'Gastly', 'Gas Pokémon', 'Sleeping Gas', 'None', 'None', 'Fighting', '0', 50, 1, 5, 1);