
-- drop tables and ready for reset
DROP TABLE IF EXISTS breadan.item;
DROP TABLE IF EXISTS breadan.purchase;
DROP TABLE IF EXISTS breadan.delivery;
DROP TABLE IF EXISTS breadan.customer;
DROP TABLE IF EXISTS breadan.special;
DROP TABLE IF EXISTS breadan.offer;
DROP TABLE IF EXISTS breadan.product;
DROP TABLE IF EXISTS breadan.category;
DROP TABLE IF EXISTS breadan.restaurant;

-- create table

CREATE TABLE breadan.restaurant(
    id INT NOT NULL AUTO_INCREMENT,
    short_code VARCHAR(4) NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    postal_code VARCHAR(25) NOT NULL,
    start_at TIME NOT NULL DEFAULT '11:00:00',
    end_at TIME  NOT NULL DEFAULT '23:00:00',
    PRIMARY KEY (id)
);


CREATE TABLE breadan.category(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    UNIQUE(name),
    PRIMARY KEY (id)
);

CREATE TABLE breadan.product(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    weight INT NOT NULL,
    price DECIMAL(4,2) NOT NULL,
    description VARCHAR(1000),
    image VARCHAR(255),
    UNIQUE(name),
    PRIMARY KEY (id),
    CONSTRAINT product_chk_weight CHECK (weight >= 0),
    CONSTRAINT product_chk_price CHECK (price >= 0),
    CONSTRAINT product_fk_category FOREIGN KEY (category_id)
    REFERENCES category(id)
);


CREATE TABLE breadan.offer(
    id INT NOT NULL AUTO_INCREMENT,
    category_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    description VARCHAR(1000),
    image VARCHAR(255),
    UNIQUE(name),
    PRIMARY KEY (id),
    CONSTRAINT offer_chk_price CHECK (price >= 0),
    CONSTRAINT offer_fk_category FOREIGN KEY (category_id)
    REFERENCES category(id)
);

CREATE TABLE breadan.special(
    id INT NOT NULL AUTO_INCREMENT,
    offer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT special_chk_quantity CHECK (quantity >= 0),
    CONSTRAINT special_fk_offer FOREIGN KEY (offer_id)
    REFERENCES offer(id),
    CONSTRAINT special_fk_product FOREIGN KEY (product_id)
    REFERENCES product(id)
);


CREATE TABLE breadan.delivery(
    id INT NOT NULL AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    postal_code VARCHAR(25) NOT NULL,
    apartment VARCHAR(25),
    PRIMARY KEY (id)
);


CREATE TABLE breadan.customer(
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(25),
    UNIQUE(email, phone),
    PRIMARY KEY (id)
);


CREATE TABLE breadan.purchase(
    id INT NOT NULL AUTO_INCREMENT,
    purchase_ref VARCHAR(255) NOT NULL,
    customer_id INT NOT NULL,
    subtotal DECIMAL(8,2) NOT NULL,
    restaurant_id INT NOT NULL,
    pickup BOOLEAN NOT NULL DEFAULT FALSE,
    delivery_id INT,
    duration TIME DEFAULT '00:45:00',
    create_date TIMESTAMP DEFAULT current_timestamp,
    UNIQUE(purchase_ref),
    PRIMARY KEY (id),
    CONSTRAINT purchase_chk_price CHECK (subtotal >= 0),
    CONSTRAINT purchase_fk_customer FOREIGN KEY (customer_id)
    REFERENCES customer(id),
    CONSTRAINT purchase_fk_restaurant FOREIGN KEY (restaurant_id)
    REFERENCES restaurant(id),
    CONSTRAINT purchase_fk_delivery FOREIGN KEY (delivery_id)
    REFERENCES delivery(id)
);


CREATE TABLE breadan.item(
    id INT NOT NULL AUTO_INCREMENT,
    category_id INT,
    purchase_id INT,
    product_id INT,
    offer_id INT,
    quantity INT,
    PRIMARY KEY (id),
    CONSTRAINT item_chk_quantity CHECK (quantity >= 0),
    CONSTRAINT item_fk_category FOREIGN KEY (category_id)
    REFERENCES category(id),
    CONSTRAINT item_fk_purchase FOREIGN KEY (purchase_id)
    REFERENCES purchase(id),
    CONSTRAINT item_fk_product FOREIGN KEY (product_id)
    REFERENCES product(id),
    CONSTRAINT item_fk_offer FOREIGN KEY (offer_id)
    REFERENCES offer(id)
);


