CREATE DATABASE online_shop;
USE online_shop;

CREATE TABLE products(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DOUBLE,
    weight INT,
    descriptions VARCHAR(1000),
    category VARCHAR(50),
    create_date DATETIME,
    stock INT
);

CREATE TABLE options(
    id INT PRIMARY KEY,
    option_name VARCHAR(100)
);

CREATE TABLE product_options(
    id INT PRIMARY KEY,
    option_id INT,
    product_id INT,
    FOREIGN KEY (option_id) REFERENCES options(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE categories(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(1000)
);

CREATE TABLE product_categories(
    id INT PRIMARY KEY,
    product_id INT,
    category_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE customers(
    id INT PRIMARY KEY,
    email VARCHAR(100),
    password VARCHAR(50),
    full_name VARCHAR(100),
    billing_address VARCHAR(100),
    default_address VARCHAR(100),
    county VARCHAR(100),
    phone VARCHAR(10)
);

CREATE TABLE orders(
    id INT PRIMARY KEY,
    customer_id INT,
    ammount DOUBLE,
    shipping_address VARCHAR(100),
    order_date DATETIME,
    order_status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_details(
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    price DOUBLE,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products VALUES (1,'Laptop asus rog 17',5000,35,'16 gb ram,1 tb ssd','gaming','2024-03-04',15);
INSERT INTO products VALUES (2,'Laptop asus rog 18',7000,35,'132 gb ram,2 tb ssd','gaming','2024-03-04',10);
INSERT INTO products VALUES (3,'Levono 17',4500,35,'16 gb ram,1 tb ssd','gaming','2024-03-04',16);
INSERT INTO products VALUES (4,'Samsung S24',8000,12,'12 gb ram,1 tb ssd','phone','2024-03-04',17);

INSERT INTO options VALUES (1,' + 550 gb');
INSERT INTO options VALUES (2,' + 2 years warranty');
INSERT INTO options VALUES (3,' + 3 years warranty');
INSERT INTO options VALUES (4,' + 5 years warranty');

INSERT INTO product_options VALUES (1,1,1);
INSERT INTO product_options VALUES (2,4,3);
INSERT INTO product_options VALUES (3,2,4);

INSERT INTO categories VALUES (10,'gaming','for gamming');
INSERT INTO categories VALUES (20,'phone','for gamming');

INSERT INTO product_categories VALUES (11,1,10);
INSERT INTO product_categories VALUES (12,2,10);
INSERT INTO product_categories VALUES (13,3,10);
INSERT INTO product_categories VALUES (14,1,20);

INSERT INTO customers VALUES (100,'gabi@gmail.com','gabi1234','gabi gabi','sibiu sadu','sibiu sadu','Romania','07777777');
INSERT INTO customers VALUES (101,'alex@gmail.com','alex1234','alex alex','sibiu Vasie Aron','sibiu sadu','Romania','07777577');
INSERT INTO customers VALUES (102,'dan@gmail.com','dan1234','dan dan','sibiu sadu','sibiu Vasie Aron','Romania','07777747');
INSERT INTO customers VALUES (103,'radu@gmail.com','radu1234','radu gabi','sibiu sadu','sibiu sadu','Romania','07777757');


INSERT INTO orders VALUES (200,100,5000,'sibiu sadu','2024-03-04','open');
INSERT INTO orders VALUES (201,101,14000,'sibiu sadu','2024-03-04','open');
INSERT INTO orders VALUES (202,100,8000,'sibiu Vasie Aron','2024-03-04','closed');
INSERT INTO orders VALUES (203,103,4500,'sibiu sadu','2024-03-04','open');

INSERT INTO order_details VALUES (500,200,1,5000,1);
INSERT INTO order_details VALUES (501,201,2,14000,2);
INSERT INTO order_details VALUES (502,202,4,8000,1);
INSERT INTO order_details VALUES (503,203,3,4500,1);

