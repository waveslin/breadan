
-- drop tables and ready for reset
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS specials;
DROP TABLE IF EXISTS offers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS restaurants;

-- create table

CREATE TABLE restaurants(
    id INT NOT NULL AUTO_INCREMENT=10000,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    postal VARCHAR(255) NOT NULL,
    start_at TIME NOT NULL DEFAULT '11:00:00',
    end_at TIME  NOT NULL DEFAULT '23:00:00',
    PRIMARY KEY (id)
);


CREATE TABLE categories(
    id INT NOT NULL AUTO_INCREMENT=20000,,
    name VARCHAR(255) NOT NULL,
    UNIQUE(name),
    PRIMARY KEY (id)
);

CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT=30000,
    name VARCHAR(255) NOT NULL,
    categoryid INT NOT NULL,
    weight INT NOT NULL,
    price DECIMAL(4,2) NOT NULL,
    description VARCHAR(1000),
    UNIQUE(name),
    PRIMARY KEY (id),
    CONSTRAINT chk_weight CHECK (weight >= 0),
    CONSTRAINT chk_price CHECK (price >= 0),
    CONSTRAINT fk_category FOREIGN KEY (categoryid)
    REFERENCES categories(id)
);


CREATE TABLE offers(
    id INT NOT NULL AUTO_INCREMENT=40000,
    categoryid INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    description VARCHAR(1000),
    UNIQUE(name),
    PRIMARY KEY (id),
    CONSTRAINT chk_price CHECK (price >= 0),
    CONSTRAINT fk_category FOREIGN KEY (categoryid)
    REFERENCES categories(id)
);

CREATE TABLE specials(
    id INT NOT NULL AUTO_INCREMENT=50000,
    offerid INT NOT NULL,
    productid INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT chk_quantity CHECK (quantity >= 0),
    CONSTRAINT fk_offer FOREIGN KEY (offerid)
    REFERENCES offers(id),
    CONSTRAINT fk_product FOREIGN KEY (productid)
    REFERENCES products(id)
);


CREATE TABLE deliveries(
    id INT NOT NULL AUTO_INCREMENT=60000,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    postal VARCHAR(255) NOT NULL,
    apartment VARCHAR(25),
    PRIMARY KEY (id)
);


CREATE TABLE customers(
    id INT NOT NULL AUTO_INCREMENT=70000,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(25),
    UNIQUE(email, phone),
    PRIMARY KEY (id)
);



CREATE TABLE purchases(
    id INT NOT NULL AUTO_INCREMENT=80000,
    purchase_ref VARCHAR NOT NULL,
    customerid INT NOT NULL,
    subtotal DECIMAL(8,2) NOT NULL,
    restaurantid INT NOT NULL,
    pickup BOOLEAN NOT NULL DEFAULT FALSE,
    deliveryid INT,
    duration TIME DEFAULT '00:45:00',
    create_date TIMESTAMP DEFAULT current_timestamp,
    UNIQUE(purchase_ref),
    PRIMARY KEY (id),
    CONSTRAINT chk_price CHECK (subtotal >= 0),
    CONSTRAINT fk_customer FOREIGN KEY (customerid)
    REFERENCES customers(id),
    CONSTRAINT fk_restaurant FOREIGN KEY (restaurantid)
    REFERENCES drestaurants(id),
    CONSTRAINT fk_delivery FOREIGN KEY (deliveryid)
    REFERENCES deliveries(id)
);


CREATE TABLE items(
    id INT NOT NULL AUTO_INCREMENT=90000,
    categoryid INT,
    purchaseid INT,
    productid INT,
    offerid INT,
    quantity INT,
    PRIMARY KEY (id),
    CONSTRAINT chk_quantity CHECK (quantity >= 0),
    CONSTRAINT fk_category FOREIGN KEY (categoryid)
    REFERENCES categories(id),
    CONSTRAINT fk_purchase FOREIGN KEY (purchaseid)
    REFERENCES purchases(id),
    CONSTRAINT fk_product FOREIGN KEY (productid)
    REFERENCES products(id),
    CONSTRAINT fk_offer FOREIGN KEY (offerid)
    REFERENCES offers(id)
);

