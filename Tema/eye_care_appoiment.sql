CREATE DATABASE eye_care;
USE eye_care;

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

CREATE TABLE patient(
    id INT PRIMARY KEY ,
    id_permission INT,
    name VARCHAR(50),
    email VARCHAR(50),
    address VARCHAR(150),
    password VARCHAR(80),
    modile VARCHAR(100),
    FOREIGN KEY (id_permission) REFERENCES permissions(id)
);

CREATE TABLE doctors(
    id INT PRIMARY KEY,
    id_permission INT,
    name VARCHAR(100),
    address VARCHAR(500),
    email VARCHAR(50),
    password VARCHAR(500),
    mobile VARCHAR(100),
    FOREIGN KEY (id_permission) REFERENCES permissions(id)
);

CREATE TABLE test(
    id INT PRIMARY KEY ,
    id_permission INT,
    name VARCHAR(50),
    type VARCHAR(50),
    cost VARCHAR(50),
    description VARCHAR(500),
    FOREIGN KEY (id_permission) REFERENCES permissions(id)
);

CREATE TABLE spactacles(
    id INT PRIMARY KEY ,
    id_patient INT,
    id_permission INT,
    type VARCHAR(50),
    number VARCHAR(500),
    cost INT,
    FOREIGN KEY (id_permission) REFERENCES permissions(id),
    FOREIGN KEY (id_patient) REFERENCES patient(id)
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


INSERT INTO role VALUES (1,'addusre','asd');
INSERT INTO role VALUES (2,'editspactacle','asd');
INSERT INTO role VALUES (3,'deletespactacle','asd');
INSERT INTO role VALUES (4,'addpatient','asd');
INSERT INTO role VALUES (5,'editpatient','asd');
INSERT INTO role VALUES (6,'adddocttor','asd');
INSERT INTO role VALUES (7,'editdoctor','asd');

INSERT INTO permissions VALUES (1,7,'Edit User','asd','asdfd');
INSERT INTO permissions VALUES (2,6,'Add Customer','asd','asdfd');
INSERT INTO permissions VALUES (3,5,'Edit Spactacle','asd','asdfd');
INSERT INTO permissions VALUES (4,4,'Add Spactacle','asd','asdfd');
INSERT INTO permissions VALUES (5,3,'Delete Spactacle','asd','asdfd');
INSERT INTO permissions VALUES (6,2,'Edit Paticent','asd','asdfd');
INSERT INTO permissions VALUES (7,1,'Add Doctor','asd','asdfd');

INSERT INTO user VALUES (1,7,'gabi','gabi@g.com','2024-03-10','sadu');
INSERT INTO user VALUES (2,7,'alex','ale@g.com','2024-03-10','sbiu');
INSERT INTO user VALUES (3,7,'dan','dan@g.com','2024-03-10','sadu');
INSERT INTO user VALUES (4,7,'filip','fil@g.com','2024-03-10','sibiu');
INSERT INTO user VALUES (5,7,'ana','ana@g.com','2024-03-10','sadu');

INSERT INTO patient VALUES (1,5,'Maria','maria@gamil.com','sibiu','maria124','077777777');
INSERT INTO patient VALUES (2,5,'Alex','alex@gamil.com','sibiu','1234','077777977');
INSERT INTO patient VALUES (3,5,'Radu','radu@gamil.com','sibiu','1234','077778777');
INSERT INTO patient VALUES (4,5,'Dan','dan@gamil.com','sibiu','1234','077777577');
INSERT INTO patient VALUES (5,5,'Flip','filip@gamil.com','sibiu','12345','077777677');

INSERT INTO spactacles VALUES (1,5,4,'asd','1235',300);
INSERT INTO spactacles VALUES (2,5,4,'asd','12345',3000);
INSERT INTO spactacles VALUES (3,4,4,'assd','135',100);
INSERT INTO spactacles VALUES (4,3,4,'asdd','12',50);
INSERT INTO spactacles VALUES (5,1,4,'asfd','1',250);
INSERT INTO spactacles VALUES (6,1,5,'sdasfd','23',150);

INSERT INTO test VALUES (1,2,'clean','sad','100 lei','asdasd');
INSERT INTO test VALUES (2,2,'cleanvip','sad','250 lei','asdasd');
INSERT INTO test VALUES (3,2,'asd','sad','150 lei','asdasd');
INSERT INTO test VALUES (4,2,'clewfean','sad','500 lei','asdasd');

INSERT INTO doctors VALUES (1,3,'Alex','sibiu','alex@mail.com','1234','0786456765');
INSERT INTO doctors VALUES (2,3,'Ana','sibiu','ana@mail.com','1234','0754456765');
INSERT INTO doctors VALUES (3,3,'Maria','sibiu','maria@mail.com','1234','078669765');

/*CUSTOMER*/
/*All doctors a-z*/
SELECT name, address, email, mobile FROM doctors
ORDER BY name;

/*All doctors a-z*/
SELECT name, address, email, mobile FROM doctors
ORDER BY name DESC;

/*All tests a-z*/
SELECT name, cost FROM test
ORDER BY name;

/*All tests a-z*/
SELECT name, cost FROM test
ORDER BY name DESC;

/*all spactacles by pacient 5*/
SELECT spactacles.number, spactacles.type, p.name FROM spactacles
JOIN patient p on p.id = spactacles.id_patient WHERE p.id = 5;

/*the best selling service*/
SELECT spactacles.type, COUNT(spactacles.type) AS 'Count' FROM spactacles
JOIN patient p on p.id = spactacles.id_patient
GROUP BY spactacles.type, p.name
LIMIT 3;

/*the most expensive services*/
SELECT * FROM test
order by cost desc
LIMIT 1;

/*the cheapest services*/
SELECT * FROM test
order by cost
LIMIT 1;

/*All spactacles LOW- HIGHT NUMBER*/
SELECT * FROM spactacles
ORDER BY number;

/*All spactacles HIGHT-LOW NUMBER*/
SELECT * FROM spactacles
ORDER BY number DESC;

/*all spactacles by pacient 5 LOW-HIGHT*/
SELECT spactacles.number, spactacles.type, p.name FROM spactacles
JOIN patient p on p.id = spactacles.id_patient WHERE p.id = 5
ORDER BY cost;

/*all spactacles by pacient 5 HIGHT-LOW*/
SELECT spactacles.number, spactacles.type, p.name FROM spactacles
JOIN patient p on p.id = spactacles.id_patient WHERE p.id = 5
ORDER BY cost DESC;

/*permission by patient 1*/
SELECT permissions.tile FROM permissions
JOIN patient p on permissions.id = p.id_permission WHERE p.id = 1;

/*the most common spactacle*/
SELECT spactacles.type,COUNT(spactacles.type) FROM spactacles
GROUP BY type
ORDER BY COUNT(spactacles.type) DESC
LIMIT 1;

/*the most uncommon spactacle*/
SELECT spactacles.type,COUNT(spactacles.type) FROM spactacles
GROUP BY type
ORDER BY COUNT(spactacles.type)
LIMIT 1;


/*ADMIN*/
/*All permissions*/
SELECT * FROM permissions;

/*the most used permission*/
SELECT tile,COUNT(permissions.id) FROM permissions
JOIN spactacles s on permissions.id = s.id_permission
GROUP BY tile
LIMIT 1;

/*the most unused permission*/
SELECT tile,COUNT(permissions.id) FROM permissions
JOIN spactacles s on permissions.id = s.id_permission
GROUP BY tile
ORDER BY COUNT(permissions.id)
LIMIT 1;

/*All patient a-z*/
SELECT * FROM patient
ORDER BY name;

/*the most loyal patients*/
SELECT spactacles.type, p.name, COUNT(p.id) AS 'Count' FROM spactacles
JOIN patient p on p.id = spactacles.id_patient
GROUP BY spactacles.type, p.name
LIMIT 3;

/*the most unloyal patients*/
SELECT spactacles.type, p.name, COUNT(p.id) AS 'Count' FROM spactacles
JOIN patient p on p.id = spactacles.id_patient
GROUP BY spactacles.type, p.name
ORDER BY COUNT(p.id)
LIMIT 1;

/*20% dicount cost on spactacls*/
UPDATE spactacles SET cost = cost * 0.8
WHERE id = 1;

/*+20% cost on spactacls*/
UPDATE spactacles SET cost = cost *1.2
WHERE id = 1;

/*All users*/
SELECT * FROM user;

/*Add role*/
INSERT INTO role VALUES (10,'WED','QWEF');

/*Delete a client*/
DELETE FROM patient
WHERE id = 1;

/*Delete a spactacle*/
DELETE FROM spactacles
WHERE id = 2;

/*Delete a DOCTOR*/
DELETE FROM doctors
WHERE id = 1;

/*Update a client*/
UPDATE patient SET modile = '03959353'
WHERE id = 1;

/*Update cost on spactacls*/
UPDATE spactacles SET cost = cost + 50
WHERE id = 1;


