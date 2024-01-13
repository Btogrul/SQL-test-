CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
    (1, 'Eren', 'Yeager'),
    (2, 'Mikasa', 'Ackerman'),
    (3, 'Thorfinn', 'Karlsefni');

INSERT INTO Courses VALUES
    (101, 'Titan Shifting Techniques'),
    (102, 'Viking Tactics');

INSERT INTO Courses VALUES
    (103, 'Konoha');


INSERT INTO Enrollments VALUES
    (11, 1, 101),
    (12, 2, 101),
    (13, 3, 102),
    (14, 1, 102),
    (15, 2, 102);

SELECT * FROM Enrollments;
SELECT * FROM Courses;
SELECT * FROM students;

SELECT first_name, last_name FROM Students;

SELECT course_name  FROM Courses;

SELECT COUNT(*) FROM Enrollments;

SELECT
    Students.first_name AS student_first_name,
    Students.last_name AS student_last_name,
    Courses.course_name
FROM
    Students
INNER JOIN
    Enrollments ON Students.student_id = Enrollments.student_id
INNER JOIN
    Courses ON Enrollments.course_id = Courses.course_id;


SELECT  COUNT(*) FROM Students;
SELECT
    first_name,
    last_name
FROM
    Students
ORDER BY
    last_name;

SELECT
    first_name,
    last_name,
    COUNT(enrollment_id) AS total_enrollments
FROM
    Students
LEFT JOIN
    Enrollments ON Students.student_id = Enrollments.student_id
GROUP BY
    Students.student_id, first_name, last_name;


SELECT
    first_name,
    last_name,
    COUNT(enrollment_id)
FROM
    Students
LEFT JOIN
    Enrollments ON Students.student_id = Enrollments.student_id
GROUP BY
    Students.student_id, first_name, last_name;


SELECT
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    c.course_name
FROM
    Students s
LEFT JOIN
    Enrollments e ON s.student_id = e.student_id
LEFT JOIN
    Courses c ON e.course_id = c.course_id;


SELECT
    c.course_name
FROM
    Courses c
LEFT JOIN
    Enrollments e ON c.course_id = e.course_id
WHERE
    e.course_id IS NULL;

SELECT
    AVG(enrollments_per_student) AS avg_enrollments_per_student
FROM
    (SELECT
        COUNT(enrollment_id) AS enrollments_per_student
    FROM
        Enrollments
    GROUP BY
       student_id) AS enrollments_counts;


SELECT
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    c.course_name
FROM
    Students s
JOIN
    Enrollments e ON s.student_id = e.student_id
JOIN
    Courses c ON e.course_id = c.course_id
WHERE
    s.student_id IN (
        SELECT
            student_id
        FROM
            Enrollments
        GROUP BY
            student_id
        HAVING
            COUNT(course_id) > 1
    );
