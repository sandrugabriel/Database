
CREATE DATABASE online_school_db;
USE online_school_db;

CREATE TABLE book(
    id INT PRIMARY KEY,
    student_id INT NOT NULL,
    book_name VARCHAR(100),
    created_at TIMESTAMP NOT NULL,
       FOREIGN KEY(student_id) REFERENCES student(id)
);
DROP TABLE book;
CREATE TABLE student(
    id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL ,
    last_name VARCHAR(30) NOT NULL ,
    email VARCHAR(50) NOT NULL ,
    age INT NOT NULL
);

CREATE TABLE student_id_card(
    id INT PRIMARY KEY,
    student_id INT,
    card_number VARCHAR(30),
    FOREIGN KEY(student_id) REFERENCES student(id)
);

CREATE TABLE enrolment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    created_at TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);
DROP TABLE enrolment;
CREATE TABLE course(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL ,
    department VARCHAR(100) NOT NULL
);
INSERT INTO student VALUES  (1,'Alin','Radu','radu@gmail.com',20),
                            (2,'Alina','Ana','ana@gmail.com',17),
                            (3,'Alin','Maria','radu@gmail.com',18),
                            (4,'Alex','Mario','radu@gmail.com',19),
                            (5,'David','Tudor','radu@gmail.com',21);

INSERT INTO book VALUES (1,1,'Ion','2024-03-04'),
                        (2,5,'Enigma Otiliei','2024-03-04'),
                        (3,2,'Ion','2024-03-04'),
                        (4,3,'Luceafarul','2024-03-04');

INSERT INTO student_id_card VALUES (100,1,'12345'),
                                   (101,2,'12346'),
                                   (102,3,'12347'),
                                   (103,4,'12348');

INSERT INTO course VALUES (10,'Mate','Matematica si Info'),
                          (11,'Info','Matematica si Info');

INSERT INTO enrolment(student_id, course_id, created_at)
VALUES (1,10,'2024-03-04'),
       (2,11,'2024-03-03'),
       (3,11,'2024-03-02'),
       (1,11,'2024-03-01');

/*INNER JOIN returneaza liniile care se potirivesc din amandoua tabelel*/
SELECT book.book_name,student.first_name FROM book
INNER JOIN student ON book.student_id = student.id;

/*INNER JOIN returneaza liniile care se potirivesc din MAI MULTE tabelel*/
SELECT enrolment.id,first_name,course.name FROM student
INNER JOIN enrolment ON student_id = student.id
INNER JOIN course ON enrolment.course_id = course.id;

/*OUTER JOIN*/
/*LEFT JOIN- returneaza tot din tabelul book, chair si cele nule si din tatelul
  student tot ce nu este null*/
SELECT book.book_name,student.first_name FROM book
LEFT OUTER JOIN student ON book.id = 2;

/*RIGHT JOIN- returneaza tot din tabelul student, chair si cele nule si din tatelul
  book tot ce nu este null*/
SELECT book.book_name,student.first_name FROM book
RIGHT OUTER JOIN student ON student.id = 2;


/*OPERATIONS*/
/*UNION- imbina 2 tabele, dar amandoua trebuie sa aiba aceeasi numar de coloane,
  ne duplicate*/
SELECT id AS 'Student id with book' FROM student WHERE id=1
UNION
SELECT book.student_id FROM book
WHERE student_id;

/*UNION ALL- imbina 2 tabele, dar amandoua trebuie sa aiba aceeasi numar de coloane,
  duplicate*/
SELECT id AS 'Student id with book' FROM student WHERE id=1
UNION ALL
SELECT book.student_id FROM book
WHERE student_id;

/*INTERSECT-*/
SELECT id AS 'Student id with book' FROM student WHERE id=1
INTERSECT
SELECT book.student_id FROM book
WHERE student_id;
