CREATE DATABASE studentdb;
USE studentdb;
SELECT DATABASE();
SHOW TABLES;
SELECT * FROM `student_data` LIMIT 10;
SELECT * FROM `student data`;

###(where,orderby,groupby)

SELECT  *  FROM `student_data` WHERE sex = 'F';
SELECT * FROM  `student_data` where Fjob = 'teacher';
SELECT * FROM `student_data` ORDER BY G3 DESC;
SELECT * FROM `student_data` ORDER BY age;
SELECT school, AVG(G3) AS avg_G3 FROM `student_data` GROUP BY school; 
SELECT  school FROM `student_data` group by school;
USE studentdb;
CREATE TABLE schools_data (
    school VARCHAR(50) PRIMARY KEY,
    location VARCHAR(100),
    type VARCHAR(50)
    
);
INSERT INTO schools_data (school, location, type) VALUES
('GP', 'Downtown', 'Public'),
('MS', 'Uptown', 'Private'),
('AB', 'Westside', 'Public'),
('XY', 'Eastside', 'Private');
SELECT * FROM schools_data;

#### joins(inner, left, right)

SELECT 
    student_data.school,
    student_data.sex,
    student_data.age,
    schools_data.location,
    schools_data.type
FROM student_data
INNER JOIN schools_data
    ON student_data.school = schools_data.school;
    SELECT 
    student_data.school,
    student_data.sex,
    
    schools_data.location,
    schools_data.type
FROM student_data
LEFT JOIN schools_data
    ON student_data.school = schools_data.school;
    SELECT 
    student_data.school,
    student_data.sex,
    student_data.age,
    schools_data.location,
    schools_data.type
FROM student_data
RIGHT JOIN schools_data
    ON student_data.school = schools_data.school;

###  subqueries
# Find students older than the average age
SELECT address, age, school
FROM student_data
WHERE age > (SELECT AVG(age) FROM student_data);
# Find students in the school with the most students
SELECT age, school
FROM student_data
WHERE school = (
    SELECT school
    FROM student_data
    GROUP BY school
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

###  aggregate functions (SUM, AVG)
# Average grade by school
SELECT school, AVG(G3) AS avg_grade
FROM student_data
GROUP BY school;
# Total number of students per school
SELECT school, COUNT(*) AS total_students
FROM student_data
GROUP BY school;
# Sum of grades by sex
SELECT sex, SUM(G3) AS total_grade
FROM student_data
GROUP BY sex;

### .Create views for analysis
# View showing students and their school info
CREATE VIEW student_overview AS
SELECT  sex, age, school, G3
FROM student_data;
SELECT * FROM student_overview WHERE G3 > 15;

### Optimize queries with indexes
# Index on school
CREATE INDEX idx_school ON student_data(school(50));
SHOW INDEX FROM student_data;












