CREATE DATABASE bus_ticket;
USE bus_ticket;

DROP DATABASE bus_ticket;

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

CREATE TABLE bus(
    id INT PRIMARY KEY,
    id_permission INT,
    name VARCHAR(100),
    number INT,
    type VARCHAR(50),
    description VARCHAR(500),
    ticket VARCHAR(100),
    FOREIGN KEY (id_permission) REFERENCES permissions(id)
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

CREATE TABLE seat(
    id INT PRIMARY KEY ,
    bus_id INT,
    customer_id INT,
    number VARCHAR(5),
    type VARCHAR(50),
    description VARCHAR(500),
    FOREIGN KEY (bus_id) REFERENCES bus(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE ticket_booking(
    id INT PRIMARY KEY ,
    id_permission INT,
    type VARCHAR(50),
    description VARCHAR(500),
    date DATETIME,
    FOREIGN KEY (id_permission) REFERENCES permissions(id)
);

CREATE TABLE booking(
    id INT PRIMARY KEY ,
    id_permission INT,
    tile INT,
    type VARCHAR(50),
    description VARCHAR(500),
    ticket VARCHAR(50),
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


INSERT INTO role VALUES (1,'addbus','asd');
INSERT INTO role VALUES (2,'editbus','asd');
INSERT INTO role VALUES (3,'deletebus','asd');
INSERT INTO role VALUES (4,'addseat','asd');
INSERT INTO role VALUES (5,'editseat','asd');
INSERT INTO role VALUES (6,'addcustomer','asd');
INSERT INTO role VALUES (7,'edituser','asd');

INSERT INTO permissions VALUES (1,7,'Edit User','asd','asdfd');
INSERT INTO permissions VALUES (2,6,'Add Customer','asd','asdfd');
INSERT INTO permissions VALUES (3,5,'Edit Seat','asd','asdfd');
INSERT INTO permissions VALUES (4,4,'Add Seat','asd','asdfd');
INSERT INTO permissions VALUES (5,3,'Delete Bus','asd','asdfd');
INSERT INTO permissions VALUES (6,2,'Edit Bus','asd','asdfd');
INSERT INTO permissions VALUES (7,1,'Add Bus','asd','asdfd');

INSERT INTO bus VALUES (1,2,'Gara',2,'electric','asd','5 lei');
INSERT INTO bus VALUES (2,3,'Gara',13,'electric lux','asd','10 lei');
INSERT INTO bus VALUES (3,1,'Gara',18,'electric','asd','6 lei');
INSERT INTO bus VALUES (4,2,'Gara',17,'electric','asd','3 lei');
INSERT INTO bus VALUES (5,3,'Gara',11,'electric','asd','4 lei');
INSERT INTO bus VALUES (6,1,'Gara',14,'electric','asd','6 lei');

INSERT INTO booking VALUES (1,5,2,'electric','asd','5 lei','2024-03-10');
INSERT INTO booking VALUES (2,5,13,'electric lux','asd','10 lei','2024-03-10');
INSERT INTO booking VALUES (3,5,11,'electric','asd','5 lei','2024-03-10');

INSERT INTO customer VALUES (1,6,'Maria','maria@gamil.com','sibiu','maria124','maria1');
INSERT INTO customer VALUES (2,6,'Alex','alex@gamil.com','sibiu','1234','alex');
INSERT INTO customer VALUES (3,6,'Radu','radu@gamil.com','sibiu','1234','radu');
INSERT INTO customer VALUES (4,6,'Dan','dan@gamil.com','sibiu','1234','dan');
INSERT INTO customer VALUES (5,6,'Flip','filip@gamil.com','sibiu','12345','filp');

INSERT INTO seat VALUES (1,6,2,'2B','electric','asd');
INSERT INTO seat VALUES (2,6,3,'1B','electric','asd');
INSERT INTO seat VALUES (3,6,4,'5B','electric','asd');
INSERT INTO seat VALUES (4,2,2,'2C','electric','asd');
INSERT INTO seat VALUES (5,4,3,'4C','electric','asd');
INSERT INTO seat VALUES (6,1,5,'21C','electric','asd');

INSERT INTO ticket_booking VALUES (1,2,'electric','asd','2024-03-10');
INSERT INTO ticket_booking VALUES (2,2,'electric lux ','asd','2024-03-10');
INSERT INTO ticket_booking VALUES (3,2,'electric','asd','2024-03-09');
INSERT INTO ticket_booking VALUES (4,2,'electric','asd','2024-03-12');
INSERT INTO ticket_booking VALUES (5,2,'electric','asd','2024-03-04');

INSERT INTO user VALUES (1,7,'gabi','gabi@g.com','2024-03-10','sadu');
INSERT INTO user VALUES (2,7,'alex','ale@g.com','2024-03-10','sbiu');
INSERT INTO user VALUES (3,7,'dan','dan@g.com','2024-03-10','sadu');
INSERT INTO user VALUES (4,7,'filip','fil@g.com','2024-03-10','sibiu');
INSERT INTO user VALUES (5,7,'ana','ana@g.com','2024-03-10','sadu');

/*All buses*/
SELECT bus.name,bus.number,bus.type FROM bus;

/*All busses LOW - HIGHT Number*/
SELECT bus.name,bus.number,bus.type,bus.ticket FROM bus
ORDER BY number;

/*All busses Hight - Low Number*/
SELECT bus.name,bus.number,bus.type,bus.ticket FROM bus
ORDER BY number DESC;

/*All customers from bus 1*/
SELECT customer.name,customer.email FROM customer
JOIN bus_ticket.seat _seats ON _seats.customer_id = customer.id
JOIN bus_ticket.bus b on b.id = _seats.bus_id WHERE b.id = 6;
