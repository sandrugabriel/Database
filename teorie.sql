CREATE TABLE users(
    user_id INT PRIMARY KEY,
    name_user VARCHAR(20),
    age_user INT,
    email_user VARCHAR(50),
    birthday_user DATETIME,
    drive_license BOOLEAN
);

create  database test_db;
use test_db;

/*Adaugam date in tabel*/
INSERT INTO users VALUES(1,'Alin',23,'alin@gmail.com','2001-01-01',TRUE);
INSERT INTO users VALUES(2,'Alina',16,'alina@gmail.com','2007-08-24',FALSE);
INSERT INTO users VALUES(3,'Ana',24,'ana@gmail.com','2000-01-13',TRUE);
INSERT INTO users VALUES(4,'Maria',17,'maria@gmail.com','2006-11-05',FALSE);
INSERT INTO users VALUES(5,'Alex',17,'alex@gmail.com',null,FALSE);

/*Adaugam doar id,name,email*/
INSERT INTO users(user_id, name_user, email_user) VALUES(6,'Robert','robert@gmail.com');

/*Adaugam mai multi useri*/
INSERT INTO users VALUES (6,'Mario',26,'mario@gmail.com','1998-04-14',TRUE),
                         (7,'David',24,'david@gmail.com','2000-01-13',TRUE);

DROP TABLE users;

/*Afisam toti useri din tabelul users*/
SELECT * FROM users;

/*Afisam doar numele useri-lor*/
SELECT users.name_user FROM users;

/*Afisam doar numele useri-lor si varsta*/
SELECT users.name_user,users.age_user FROM users;

/*Afisam doar numele useri-lor si schimbam numele coloanei*/
SELECT users.name_user AS 'Nume Useri' FROM users;

/*Afisam doar useri care indeplineste conditia/conditiile*/
SELECT users.name_user FROM users
WHERE age_user > 17;

SELECT users.name_user FROM users
WHERE name_user != 'Alin';

SELECT * FROM users
WHERE  age_user >= 20 AND name_user!='Alin';

/*Afisam doar daca se regaseste in In(..,..,...)*/
SELECT * FROM users
WHERE age_user IN (16,17,18);

/*Afisam doar daca NU se regaseste in NOT In(..,..,...)*/
SELECT * FROM users
WHERE age_user NOT IN (16,17,18);

/*Afisam doar daca se regaseste INTRE anumite valori*/
SELECT * FROM users
WHERE age_user BETWEEN 16 AND 19;

/*Afisam doar daca potriveste paternul*/
SELECT * FROM users
WHERE name_user LIKE '%Alin';
/*Atunci cand pun '%Alin' o sa imi afiseze doar Alin, iar atunci cand pun '%Alin%' o sa imi afiseze Alin si Alina*/

/*Afisem cele care sunt nule*/
SELECT * FROM users
WHERE birthday_user IS NULL;

/*Afisem cele care NU sunt nule*/
SELECT * FROM users
WHERE birthday_user IS NOT NULL;


/*Actualizam TOATE liniile din tabel*/
UPDATE users
SET drive_license = TRUE;

UPDATE users
SET drive_license = TRUE, age_user = 20;

/*Actualizam pe liniile unde se indeplinesc conditiile*/
UPDATE users SET drive_license = TRUE
WHERE age_user >= 18;

/*Stergem tot din tabel*/
DELETE FROM users;

/*STERGEM o liniile in care se indeplinesc conditiile*/
DELETE FROM users
WHERE age_user <= 17;

/*TRANZACTII*/
/*Incepeti o tranzactie*/
BEGIN;

/*Pentru a salva toate rezultatele pe disc dupa inceperea tranzactiei*/
COMMIT;

/*Pentru a reseta starea bazei de date inainte de inceperea tranzactiei*/
ROLLBACK;

