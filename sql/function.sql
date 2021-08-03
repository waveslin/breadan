USE breadan

DELIMITER $$

CREATE FUNCTION SET_LOC_CODE(id INT) RETURNS VARCHAR(4)
DETERMINISTIC
BEGIN
    DECLARE short_code VARCHAR(4);
    DECLARE short_number INT;
    DECLARE init_code VARCHAR(1);
    DECLARE init_list VARCHAR (30) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    SELECT id + 1001 INTO short_number;

    SET init_code :=  SUBSTRING(init_list, FLOOR(short_number/1000) ,1);
    SET short_code := CONCAT(init_code,RIGHT(CONVERT(short_number,CHAR),3));

    RETURN (short_code);

END$$

DELIMITER ;



DELIMITER $$
CREATE FUNCTION INSERT_ONCE_SET_LOC_CODE() RETURNS VARCHAR(4)
DETERMINISTIC
BEGIN
    DECLARE short_code VARCHAR(4);
    DECLARE short_number INT;
    DECLARE init_code VARCHAR(1);
    DECLARE init_list VARCHAR (30) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    SELECT SUM(id) + 1001 INTO short_number FROM restaurants;

    SET init_code :=  SUBSTRING(init_list, FLOOR(short_number/1000) ,1);
    SET short_code := CONCAT(init_code,RIGHT(CONVERT(short_number,CHAR),3));

    RETURN (short_code);

END$$

DELIMITER ;



DELIMITER $$
CREATE FUNCTION GET_PURCHASE_REF(
    email VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    short_code VARCHAR(4)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE referrence VARCHAR(20);

    DECLARE payload1 VARCHAR(255) DEFAULT CONVERT(CURRENT_DATE(), CHAR);
    DECLARE payload2 VARCHAR(255) DEFAULT CONVERT(CURRENT_TIME(), CHAR);

    DECLARE param1 VARCHAR(1);
    DECLARE param2 VARCHAR(1);
    DECLARE param3 VARCHAR(1);

    IF email IS NOT NULL THEN
        SET param1 := LEFT(email,1);

    IF frist_name IS NOT NULL THEN
        SET param1 := LEFT(first_name,1);

    IF last_name IS NOT NULL THEN
        SET param1 := LEFT(last_name,1);

    SET referrence := CONCAT(param1,param2,payload1,param3,payload2,short_code);

RETURN (referrence);

END$$

DELIMITER ;


