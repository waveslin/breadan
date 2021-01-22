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
    PRIMARY KEY (id)
);

CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT=30000,
    name VARCHAR(255) NOT NULL,
    categoryid INT NOT NULL,
    weight INT NOT NULL,
    price DECIMAL(4,2) NOT NULL,
    description VARCHAR(1000),
    PRIMARY KEY (id),
    CONSTRAINT fk_category FOREIGN KEY (categoryid)
    REFERENCES categories(id)
);


CREATE TABLE offers(
    id INT NOT NULL AUTO_INCREMENT=40000,
    categoryid INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    description VARCHAR(1000),
    PRIMARY KEY (id),
    CONSTRAINT fk_category FOREIGN KEY (categoryid)
    REFERENCES categories(id)
);

CREATE TABLE specials(
    id INT NOT NULL AUTO_INCREMENT=50000,
    offerid INT NOT NULL,
    productid INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id),
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


CREATE TABLE purchases(
    id INT NOT NULL AUTO_INCREMENT=70000,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(25),
    subtotal DECIMAL(8,2) NOT NULL,
    restaurantid INT NOT NULL,
    pickup BOOLEAN NOT NULL,
    deliveryid INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_restaurant FOREIGN KEY (restaurantid)
    REFERENCES drestaurants(id),
    CONSTRAINT fk_delivery FOREIGN KEY (deliveryid)
    REFERENCES deliveries(id)
);


CREATE TABLE items(
    id INT NOT NULL AUTO_INCREMENT=80000,
    categoryid INT,
    purchaseid INT,
    productid INT,
    offerid INT,
    quantity INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_category FOREIGN KEY (categoryid)
    REFERENCES categories(id),
    CONSTRAINT fk_purchase FOREIGN KEY (purchaseid)
    REFERENCES purchases(id),
    CONSTRAINT fk_product FOREIGN KEY (productid)
    REFERENCES products(id),
    CONSTRAINT fk_offer FOREIGN KEY (offerid)
    REFERENCES offers(id)
    
);

