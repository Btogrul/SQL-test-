CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    contact_details VARCHAR(100)
);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT,
    instructor VARCHAR(50)
);

INSERT INTO students VALUES
    (1, 'Mr.a', 'x', 10, 'jsad@e.com'),
    (2, 'Mr.b', 's', 11, 'sas@e.com'),
    (3, 'Mrs.c', 'a', 20, 'sdks@e.com'),
    (4, 'Mrs.d', 'z', 1, 'emsms@e.com'),
    (5, 'Mr.f', 'w', 18, 'asd@e.com');


INSERT INTO courses VALUES
    (1,'Main course',15,'Mr.Someone'),
    (2,'some name ',10,'Mrs.Someone'),
    (3,'X course',2,'Mr X from Y'),
    (4,'Marvel course',8,'Mr. Marvel'),
    (5,'Z course',16,'Mrs. Amanda from Z course');


UPDATE students SET contact_details = 'updated@e.com' WHERE student_id = 1;
UPDATE courses SET  instructor = 'new Instructor' WHERE course_id = 3;
DELETE FROM courses WHERE course_id =5;
SELECT  * FROM courses;
SELECT  * FROM students;

SELECT first_name, last_name, age FROM students;

SELECT * FROM courses WHERE credits > 10 ORDER BY course_name;
SELECT * FROM students WHERE age > 10;

