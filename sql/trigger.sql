CREATE TRIGGER after_purchased_insert
AFTER INSERT
ON purchases FOR EACH ROW
BEGIN
    IF NEW.deliveryid IS NULL THEN
        UPDATE purchases SET pickup = TRUE, duration = '00:20:00'
        WHERE id = NEW.id;
    END IF;
END;

CREATE TRIGGER after_purchased_update
AFTER UPDATE
ON purchases FOR EACH ROW
BEGIN
    IF NEW.deliveryid IS NULL THEN
        UPDATE purchases SET pickup = TRUE, duration = '00:20:00'
        WHERE id = NEW.id;
    END IF;
END;