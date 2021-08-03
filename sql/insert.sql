-- select database
USE breadan;


-- insert restaurants
-- won't be insert new or update frequently

INSERT INTO restaurant(short_code, street, city, province, country, postal_code)
VALUES 
(SET_LOC_CODE(1), '4500 Rue Kenane', 'Montreal', 'Quebec', 'Canada', 'H3H 1K9'),
(SET_LOC_CODE(2), '2100 Rue Matheau', 'Montreal', 'Quebec', 'Canada','H1E 2P2'),
(SET_LOC_CODE(3), '3060 Rue Bommeu', 'Montreal', 'Quebec', 'Canada', 'H1A 0R4'),
(SET_LOC_CODE(4), '4500 Rue Kenane', 'Toronto', 'Ontario', 'Canada', 'M5S 7S1'),
(SET_LOC_CODE(5), '4500 Rue Kenane', 'Toronto', 'Ontario', 'Canada', 'M4J 2N1'),
(SET_LOC_CODE(6), '4500 Rue Kenane', 'Toronto', 'Ontario', 'Canada', 'M4W 6T7'),
(SET_LOC_CODE(10), '4500 Rue Kenane', 'Ottawa', 'Ontario', 'Canada', 'K0S 3P0'),
(SET_LOC_CODE(7), '4500 Rue Kenane', 'vancouver', 'British Columbia', 'Canada', 'V5K 0A8'),
(SET_LOC_CODE(8), '4500 Rue Kenane', 'vancouver', 'British Columbia', 'Canada', 'V5K 1B1'),
(SET_LOC_CODE(9), '4500 Rue Kenane', 'vancouver', 'British Columbia', 'Canada', 'V5J 1B6');



-- insert category 
-- won't be insert new or update frequently
INSERT INTO category(name)
VALUES
('Drinks'),
('Sandwich'),
('Salads'),
('Sides'),
('Shakes'),
('Sweets');


