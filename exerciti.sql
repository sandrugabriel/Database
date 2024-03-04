CREATE TABLE users(
    user_id INT PRIMARY KEY,
    name_user VARCHAR(20),
    age_user INT,
    email_user VARCHAR(50),
    birthday_user DATETIME,

);

create  database test_db;
use test_db;


INSERT INTO users VALUES(1,'Alin',23,'alin@gmail.com','2001-01-01');
INSERT INTO users VALUES(2,'Alina',16,'alina@gmail.com','2007-08-24');
INSERT INTO users VALUES(3,'Ana',24,'ana@gmail.com','2000-01-13');
INSERT INTO users VALUES(4,'Maria',17,'maria@gmail.com','2006-11-05');
INSERT INTO users VALUES(5,'Alex',17,'alex@gmail.com',null);

INSERT INTO users (user_id, name_user) VALUES (6,'Dan');

/*Adaugam mai multi de odata*/
INSERT INTO users VALUES(1,'Alin',23,'alin@gmail.com','2001-01-01'),
                        (2,'Alina',16,'alina@gmail.com','2007-08-24'),
                        (3,'Ana',24,'ana@gmail.com','2000-01-13');

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

/*Actualizam toate liniile*/
UPDATE users SET age_user = 20;

/*Actualizam toate liniile care indeplineste conditia*/
UPDATE users SET age_user = 20
WHERE name_user = 'Dan';

/*Stergem toate liniile din tabel*/
DELETE FROM users;

/*Stergem toate liniile din tabel care indeplineste conditia*/
DELETE FROM users
where age_user<18;

/*Inceperea tranzactiei*/
BEGIN;

/*Salveaza toate informatiile dupa ce tranzactia a inceput*/
COMMIT;

/*Reseteaza informatiile inainte de inceperea tranzactiei*/
ROLLBACK;



