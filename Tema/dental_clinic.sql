CREATE DATABASE dental_clinic;
USE dental_clinic;

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

CREATE TABLE problems(
    id INT PRIMARY KEY ,
    id_permission INT,
    name VARCHAR(50),
    type VARCHAR(50),
    description VARCHAR(500),
    FOREIGN KEY (id_permission) REFERENCES permissions(id)
);

CREATE TABLE medicines(
    id INT PRIMARY KEY ,
    id_permission INT,
    type VARCHAR(50),
    company VARCHAR(500),
    cost VARCHAR(10),
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

CREATE TABLE nurse(
    id INT PRIMARY KEY ,
    doctors_id INT,
    name VARCHAR(50),
    mobile VARCHAR(10),
    password VARCHAR(50),
    address VARCHAR(50),
    FOREIGN KEY (doctors_id) REFERENCES doctors(id)
);


INSERT INTO role VALUES (1,'adduser','asd');
INSERT INTO role VALUES (2,'editnurse','asd');
INSERT INTO role VALUES (3,'deletenurse','asd');
INSERT INTO role VALUES (4,'addproblems','asd');
INSERT INTO role VALUES (5,'editpatient','asd');
INSERT INTO role VALUES (6,'adddocttor','asd');
INSERT INTO role VALUES (7,'editdoctor','asd');

INSERT INTO permissions VALUES (1,7,'Edit User','asd','asdfd');
INSERT INTO permissions VALUES (2,6,'Add Nurse','asd','asdfd');
INSERT INTO permissions VALUES (3,5,'Edit Nurse','asd','asdfd');
INSERT INTO permissions VALUES (4,4,'Add Problems','asd','asdfd');
INSERT INTO permissions VALUES (5,3,'Delete Problems','asd','asdfd');
INSERT INTO permissions VALUES (6,2,'Edit Paticent','asd','asdfd');
INSERT INTO permissions VALUES (7,1,'Add Doctor','asd','asdfd');

INSERT INTO user VALUES (1,7,'gabi','gabi@g.com','2024-03-14','sadu');
INSERT INTO user VALUES (2,7,'alex','ale@g.com','2024-03-14','sbiu');
INSERT INTO user VALUES (3,7,'dan','dan@g.com','2024-03-14','sadu');
INSERT INTO user VALUES (4,7,'filip','fil@g.com','2024-03-1','sibiu');
INSERT INTO user VALUES (5,7,'ana','ana@g.com','2024-03-14','sadu');

INSERT INTO patient VALUES (1,5,'Maria','maria@gamil.com','sibiu','maria124','077777777');
INSERT INTO patient VALUES (2,5,'Alex','alex@gamil.com','sibiu','1234','077777977');
INSERT INTO patient VALUES (3,5,'Radu','radu@gamil.com','sibiu','1234','077778777');
INSERT INTO patient VALUES (4,5,'Dan','dan@gamil.com','sibiu','1234','077777577');
INSERT INTO patient VALUES (5,5,'Flip','filip@gamil.com','sibiu','12345','077777677');

INSERT INTO problems VALUES (1,5,1,'asdd','asd','1235');
INSERT INTO problems VALUES (2,5,1,'asd','asd','1235');
INSERT INTO problems VALUES (3,5,1,'asdd','asd','1235');
INSERT INTO problems VALUES (4,5,3,'aDdd','asd','1235');
INSERT INTO problems VALUES (5,5,1,'DSFdd','asd','1235');

INSERT INTO medicines VALUES (1,3,'asddsf','farma',50);
INSERT INTO medicines VALUES (2,3,'gsdf','farma',150);
INSERT INTO medicines VALUES (3,3,'etdes','farma',500);
INSERT INTO medicines VALUES (4,3,'bsd','farma',30);
INSERT INTO medicines VALUES (5,3,'ste','farma',60);

INSERT INTO doctors VALUES (1,3,'Dan','sibiu','dan@mail.com','1234','0786456765');
INSERT INTO doctors VALUES (2,3,'Radu','sibiu','radu@mail.com','1234','0754456765');
INSERT INTO doctors VALUES (3,3,'Maria','sibiu','maria@mail.com','1234','078669765');

INSERT INTO nurse VALUES (1,2,'ana','03452365','1234','sibiu');
INSERT INTO nurse VALUES (2,2,'alexia','0348622','1234','sadu');
INSERT INTO nurse VALUES (3,1,'maria','02364235','1234','sibiu');
INSERT INTO nurse VALUES (4,2,'daniela','07237452','1234','sadu');
INSERT INTO nurse VALUES (5,3,'sorina','082347263','1234','sibiu');
INSERT INTO nurse VALUES (6,3,'ionela','028387565','1234','sadu');

/*all nurse from doctor RADU*/
SELECT doctors.name AS 'Doctor name',n.name AS 'Nurse name' FROM doctors
JOIN dental_clinic.nurse n on doctors.id = n.doctors_id WHERE doctors.name = 'Radu';

/*all nurse from all doctors A-Z*/
SELECT doctors.name AS 'Doctor name',n.name AS 'Nurse name' FROM doctors
JOIN dental_clinic.nurse n on doctors.id = n.doctors_id
ORDER BY doctors.name;

/*all nurse from all doctors Z-A*/
SELECT doctors.name AS 'Doctor name',n.name AS 'Nurse name' FROM doctors
JOIN dental_clinic.nurse n on doctors.id = n.doctors_id
ORDER BY doctors.name DESC;

/*All doctors a-z*/
SELECT doctors.name,doctors.mobile,doctors.email FROM doctors
ORDER BY name;

/*All doctors Z-A*/
SELECT doctors.name,doctors.mobile,doctors.email FROM doctors
ORDER BY name DESC;

/*all problemes by pacient 1*/
SELECT problems.name, problems.type, p.name FROM problems
JOIN patient p on p.id = problems.id_patient WHERE p.id = 1;

/*the most common problems*/
SELECT problems.name, COUNT(problems.name) FROM problems
GROUP BY problems.name;

/*the most uncommon problem*/
SELECT problems.name, COUNT(problems.name) FROM problems
GROUP BY problems.name
ORDER BY COUNT(problems.name),name
LIMIT 1;

/*All patient a-z*/
SELECT name, email, address, password, modile FROM patient
ORDER BY name;

/*All patient Z-A*/
SELECT name, email, address, password, modile FROM patient
ORDER BY name DESC ;

/*All medicines A-Z*/
SELECT * FROM medicines
ORDER BY type;

/*All medicines Z-A*/
SELECT * FROM medicines
ORDER BY type DESC ;

/*the most expensive medicines*/
SELECT * FROM medicines
ORDER BY cost DESC;

/*the most loyal patient*/
SELECT p.name,problems.type,COUNT(p.id_permission) FROM problems
JOIN patient p on p.id = problems.id_patient
GROUP BY p.name,problems.type
LIMIT 1;

/*the most disloyal patient*/
SELECT p.name,problems.type,COUNT(p.id_permission) FROM problems
JOIN patient p on p.id = problems.id_patient
GROUP BY p.name,problems.type
ORDER BY COUNT(p.id_permission)
LIMIT 1;

