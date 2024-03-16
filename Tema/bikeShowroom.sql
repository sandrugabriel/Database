CREATE DATABASE bike_shop;
USE bike_shop;

DROP DATABASE bike_shop;

CREATE TABLE role(
    id INT PRIMARY KEY ,
    tile VARCHAR(50),
    description VARCHAR(500)
);

CREATE TABLE permissions(
    id INT PRIMARY KEY ,
    role_id INT,
    tile VARCHAR(50),
    module VARCHAR(50),
    description VARCHAR(500),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE customer(
    id INT PRIMARY KEY ,
    id_permission INT,
    name VARCHAR(50),
    email VARCHAR(50),
    address VARCHAR(150),
    password VARCHAR(80),
    username VARCHAR(100),
    FOREIGN KEY (id_permission) REFERENCES permissions(id)
);

CREATE TABLE bike(
    id INT PRIMARY KEY,
    id_permission INT,
    id_customer INT,
    name VARCHAR(100),
    number INT,
    type VARCHAR(50),
    description VARCHAR(500),
    ticket VARCHAR(100),
    FOREIGN KEY (id_permission) REFERENCES permissions(id),
    FOREIGN KEY (id_customer) REFERENCES customer(id)
);

CREATE TABLE payment(
    id INT PRIMARY KEY ,
    id_customer INT,
    date DATETIME,
    bill VARCHAR(50),
    type VARCHAR(50),
    description VARCHAR(500),
    FOREIGN KEY (id_customer) REFERENCES customer(id)
);

CREATE TABLE booking(
    id INT PRIMARY KEY ,
    id_permission INT,
    type VARCHAR(50),
    description VARCHAR(500),
    date DATETIME,
    FOREIGN KEY (id_permission) REFERENCES permissions(id)
);

CREATE TABLE user(
    id INT PRIMARY KEY,
    role_id INT,
    name VARCHAR(50),
    email VARCHAR(10),
    dod DATETIME,
    address VARCHAR(100),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE insurance(
    id INT PRIMARY KEY ,
    bike_id INT,
    amount VARCHAR(5),
    type VARCHAR(50),
    date DATETIME,
    number VARCHAR(50),
    expiry VARCHAR(50),
    FOREIGN KEY (bike_id) REFERENCES bike(id)
);

INSERT INTO role VALUES (1,'addinsurance','asd');
INSERT INTO role VALUES (2,'edituser','asd');
INSERT INTO role VALUES (3,'deletepayment','asd');
INSERT INTO role VALUES (4,'addbike','asd');
INSERT INTO role VALUES (5,'editbike','asd');
INSERT INTO role VALUES (6,'addcustomer','asd');
INSERT INTO role VALUES (7,'editinsurance','asd');

INSERT INTO permissions VALUES (1,7,'Edit Insurance','asd','asdfd');
INSERT INTO permissions VALUES (2,6,'Add Customer','asd','asdfd');
INSERT INTO permissions VALUES (3,5,'Edit Bike','asd','asdfd');
INSERT INTO permissions VALUES (4,4,'Add Bike','asd','asdfd');
INSERT INTO permissions VALUES (5,3,'Delete Payment','asd','asdfd');
INSERT INTO permissions VALUES (6,2,'Edit User','asd','asdfd');
INSERT INTO permissions VALUES (7,1,'Add Insurance','asd','asdfd');

INSERT INTO user VALUES (1,7,'gabi','gabi@g.com','2024-03-14','sadu');
INSERT INTO user VALUES (2,7,'alex','ale@g.com','2024-03-14','sbiu');
INSERT INTO user VALUES (3,7,'dan','dan@g.com','2024-03-14','sadu');
INSERT INTO user VALUES (4,7,'filip','fil@g.com','2024-03-1','sibiu');
INSERT INTO user VALUES (5,7,'ana','ana@g.com','2024-03-14','sadu');

INSERT INTO customer VALUES (1,5,'Maria','maria@gamil.com','sibiu','maria124','077777777');
INSERT INTO customer VALUES (2,5,'Alex','alex@gamil.com','sibiu','1234','077777977');
INSERT INTO customer VALUES (3,5,'Radu','radu@gamil.com','sibiu','1234','077778777');
INSERT INTO customer VALUES (4,5,'Dan','dan@gamil.com','sibiu','1234','077777577');
INSERT INTO customer VALUES (5,5,'Flip','filip@gamil.com','sibiu','12345','077777677');

INSERT INTO bike VALUES (1,5,3,'asdfsdd',6000,'wedw','asdfsd','d21w');
INSERT INTO bike VALUES (2,5,5,'asdfsdd',1250,'as','adfsfsd','d2w1');
INSERT INTO bike VALUES (3,5,3,'asdfsdd',2300,'wedw','adsfgsd','1d2w');
INSERT INTO bike VALUES (4,5,3,'asdfsdd',900,'as','afssd','d2w2');
INSERT INTO bike VALUES (5,4,5,'asdfASsdd',9000,'aFGs','afsDFGHsd','d2DFw2');

INSERT INTO insurance VALUES (1,2,300,'asd','2024-03-14','1234','2025-03-14');
INSERT INTO insurance VALUES (2,3,200,'afdd','2024-03-14','12345','2025-03-14');
INSERT INTO insurance VALUES (3,1,500,'add','2024-03-14','12344','2026-03-14');
INSERT INTO insurance VALUES (4,4,600,'assd','2024-03-14','12324','2026-03-14');

INSERT INTO payment VALUES (1,2,3,'2025-03-14','sibiu','asd','rsgrdes');
INSERT INTO payment VALUES (2,2,4,'2025-03-14','sibiu s','asdasd','rsgrdes');
INSERT INTO payment VALUES (3,3,2,'2025-03-14','sibiu','assdfd','rsgrdes');
INSERT INTO payment VALUES (4,4,1,'2025-03-14','sibiu','abdsd','rsgrdes');
INSERT INTO payment VALUES (5,5,1,'2025-03-14','sibiu','asewfd','rsgrdes');

/*All bike a-z*/
SELECT * FROM bike
ORDER BY name;

/*All bike Z-A*/
SELECT * FROM bike
ORDER BY name DESC;

/*The most expensive bike*/
SELECT NAME, NUMBER, TYPE, DESCRIPTION, TICKET FROM bike
ORDER BY number DESC
LIMIT 1;

/*The most cheapest bike*/
SELECT NAME, NUMBER, TYPE, DESCRIPTION, TICKET FROM bike
ORDER BY number
LIMIT 1;

/*All customers A-Z*/
SELECT * FROM customer
ORDER BY name;

/*All customers Z-A*/
SELECT * FROM customer
ORDER BY name DESC;

/*All insurance LOW-HIGHT*/
SELECT * FROM insurance
ORDER BY number;

/*All insurance HIGHT-LOW*/
SELECT * FROM insurance
ORDER BY number DESC ;

/*All permission A-Z*/
SELECT * FROM permissions
ORDER BY tile;

/*the most used permission*/
SELECT tile,COUNT(permissions.id) FROM permissions
JOIN bike b on permissions.id = b.id_permission
GROUP BY tile
ORDER BY COUNT(permissions.id) DESC
LIMIT 1;

/*the most unused permission*/
SELECT tile,COUNT(permissions.id) FROM permissions
JOIN bike b on permissions.id = b.id_permission
GROUP BY tile
ORDER BY COUNT(permissions.id)
LIMIT 1;

/*the most disloyal patients*/
SELECT c.name,COUNT(c.id) AS 'Count' FROM payment
JOIN customer c on c.id = payment.id_customer
GROUP BY c.name
ORDER BY COUNT(c.id),name
LIMIT 1;

/*the most bought bike*/
SELECT b.name,b.number, COUNT(b.id) AS 'Count' FROM payment
JOIN bike b on b.id = payment.id_bike
GROUP BY b.name,b.number;

/*all bike bought by customers*/
SELECT c.name,b.number, COUNT(c.id) AS 'Count' FROM payment
JOIN customer c on c.id = payment.id_customer
JOIN bike b on b.id = payment.id_bike
GROUP BY c.name,b.number;

/*the most loyal patients*/
SELECT c.name,COUNT(c.id) AS 'Count' FROM payment
JOIN customer c on c.id = payment.id_customer
GROUP BY c.name
ORDER BY COUNT(c.id) DESC
LIMIT 1;


