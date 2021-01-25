
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
    short_code VARCHAR(3) NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    postal_code VARCHAR(25) NOT NULL,
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
    category_id INT NOT NULL,
    weight INT NOT NULL,
    price DECIMAL(4,2) NOT NULL,
    description VARCHAR(1000),
    image VARCHAR(255),

    UNIQUE(name),
    PRIMARY KEY (id),
    CONSTRAINT chk_weight CHECK (weight >= 0),
    CONSTRAINT chk_price CHECK (price >= 0),
    CONSTRAINT fk_category FOREIGN KEY (category_id)
    REFERENCES categories(id)
);


CREATE TABLE offers(
    id INT NOT NULL AUTO_INCREMENT=40000,
    category_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    description VARCHAR(1000),
    image VARCHAR(255),
    UNIQUE(name),
    PRIMARY KEY (id),
    CONSTRAINT chk_price CHECK (price >= 0),
    CONSTRAINT fk_category FOREIGN KEY (category_id)
    REFERENCES categories(id)
);

CREATE TABLE specials(
    id INT NOT NULL AUTO_INCREMENT=50000,
    offer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT chk_quantity CHECK (quantity >= 0),
    CONSTRAINT fk_offer FOREIGN KEY (offer_id)
    REFERENCES offers(id),
    CONSTRAINT fk_product FOREIGN KEY (product_id)
    REFERENCES products(id)
);


CREATE TABLE deliveries(
    id INT NOT NULL AUTO_INCREMENT=60000,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    postal_code VARCHAR(25) NOT NULL,
    apartment VARCHAR(25),
    PRIMARY KEY (id)
);


CREATE TABLE customers(
    id INT NOT NULL AUTO_INCREMENT=70000,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(25),
    UNIQUE(email, phone),
    PRIMARY KEY (id)
);


CREATE TABLE purchases(
    id INT NOT NULL AUTO_INCREMENT=80000,
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
    CONSTRAINT chk_price CHECK (subtotal >= 0),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
    REFERENCES customers(id),
    CONSTRAINT fk_restaurant FOREIGN KEY (restaurant_id)
    REFERENCES drestaurants(id),
    CONSTRAINT fk_delivery FOREIGN KEY (delivery_id)
    REFERENCES deliveries(id)
);


CREATE TABLE items(
    id INT NOT NULL AUTO_INCREMENT=90000,
    category_id INT,
    purchase_id INT,
    product_id INT,
    offer_id INT,
    quantity INT,
    PRIMARY KEY (id),
    CONSTRAINT chk_quantity CHECK (quantity >= 0),
    CONSTRAINT fk_category FOREIGN KEY (category_id)
    REFERENCES categories(id),
    CONSTRAINT fk_purchase FOREIGN KEY (purchase_id)
    REFERENCES purchases(id),
    CONSTRAINT fk_product FOREIGN KEY (product_id)
    REFERENCES products(id),
    CONSTRAINT fk_offer FOREIGN KEY (offer_id)
    REFERENCES offers(id)
);


