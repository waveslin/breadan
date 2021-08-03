DELIMITER $$
CREATE TRIGGER after_purchased_insert
AFTER INSERT
ON breadan.purchase FOR EACH ROW
BEGIN
    IF NEW.delivery_id IS NULL THEN
        UPDATE breadan.purchase SET pickup = TRUE, duration = '00:20:00'
        WHERE id = NEW.id;
    END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER after_purchased_update
AFTER UPDATE
ON breadan.purchase FOR EACH ROW
BEGIN
    IF NEW.delivery_id IS NULL THEN
        UPDATE breadan.purchase SET pickup = TRUE, duration = '00:20:00'
        WHERE id = NEW.id;
    END IF;
END$$
DELIMITER ;