CREATE TABLE students (
  student_id integer,
  first_name text,
  last_name text
);

CREATE TABLE classes (
  class_id integer,
  name varchar,
  semester varchar
);

CREATE TABLE enrollments(
  enrollment_id integer,
  student_id integer,
  class_id integer,
  final_grade character(1)
);

INSERT INTO students (student_id, first_name, last_name) VALUES
(1, 'John', 'Li'),
(2, 'Mary', 'Wu'),
(3, 'Jane', 'Cho'),
(4, 'Sunghoon', 'Johnson'),
(5, 'Xiaohong', 'Masterson'),
(6, 'Ivan', 'Sham-Luo');

INSERT INTO classes (class_id, name, semester) VALUES
(1, 'Physics 101', 'Fall 2017'),
(2, 'Fundamentals of Speech', 'Spring 2017'),
(3, 'Hermeneutics', 'Fall 2017'),
(4, 'German History II', 'Spring 2017'),
(5, 'Javascript', 'Spring 2018');

INSERT INTO enrollments (enrollment_id, student_id, class_id, final_grade) VALUES
(1, 1, 1, 'A'),
(2, 2, 2, 'B'),
(3, 3, 3, 'C'),
(4, 4, 4, 'D'),
(5, 5, 5, 'A'),
(6, 6, 1, 'B'),
(7, 1, 2, 'C'),
(8, 2, 3, 'F'),
(9, 3, 4, 'A'),
(10, 4, 5, 'B'),
(11, 5, 1, 'C'),
(12, 6, 2, 'D'),
(13, 1, 3, 'A'),
(14, 2, 4, 'B'),
(15, 3, 5, 'C'),
(16, 4, 1, 'F'),
(17, 5, 2, 'A'),
(18, 6, 3, 'B'),
(19, 1, 4, 'C'),
(20, 2, 5, 'D');
