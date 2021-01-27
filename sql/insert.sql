
-- insert restaurants
-- won't be insert new or update frequently
INSERT INTO restaurants(short_code, street, city, province, country, postal_code)
VALUES 
(GET_LOC_CODE(1), '4500 Rue Kenane', 'Montreal', 'Quebec', 'Canada', 'H3H 1K9'),
(GET_LOC_CODE(2), '2100 Rue Matheau', 'Montreal', 'Quebec', 'Canada','H1E 2P2'),
(GET_LOC_CODE(3), '3060 Rue Bommeu', 'Montreal', 'Quebec', 'Canada', 'H1A 0R4'),
(GET_LOC_CODE(4), '4500 Rue Kenane', 'Toronto', 'Ontario', 'Canada', 'M5S 7S1'),
(GET_LOC_CODE(5), '4500 Rue Kenane', 'Toronto', 'Ontario', 'Canada', 'M4J 2N1'),
(GET_LOC_CODE(6), '4500 Rue Kenane', 'Toronto', 'Ontario', 'Canada', 'M4W 6T7'),
(GET_LOC_CODE(10), '4500 Rue Kenane', 'Ottawa', 'Ontario', 'Canada', 'K0G 3P0'),
(GET_LOC_CODE(7), '4500 Rue Kenane', 'vancouver', 'British Columbia', 'Canada', 'V5K 0A8'),
(GET_LOC_CODE(8), '4500 Rue Kenane', 'vancouver', 'British Columbia', 'Canada', 'V5K 1B1'),
(GET_LOC_CODE(9), '4500 Rue Kenane', 'vancouver', 'British Columbia', 'Canada', 'V5J 1B6');


-- insert category 
-- won't be insert new or update frequently
INSERT INTO categories(name)
VALUES
('Drinks'),
('Sandwich'),
('Salads'),
('Sides'),
('Shakes'),
('Sweets');



