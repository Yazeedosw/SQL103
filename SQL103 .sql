

-- Establishing a relationship between the tables of teachers and students (as the teacher teaches more than one student, and the student is taught by more than one teacher)
create table students_teachers (
studentID int , 
teacherID int , 
primary key (studentID , teacherID),
foreign key (studentID) references students(studentID),
foreign key (teacherID) references teachers(teacherID));

-- Establishing a relationship between subject tables and teachers (since the teacher teaches only one subject, and the subject is taught by more than one teacher).
ALTER TABLE teachers
ADD COLUMN subjectID INT,
ADD FOREIGN KEY (subjectID) REFERENCES subjects(subjectID);



--  Display teacher that teach one subject and subject is taught by many teachers (many to one )

SELECT teachers.teacher_name, subjects.subject_name
FROM teachers
JOIN subjects ON teachers.subjectID = subjects.subjectID;

-- Establishing a relationship between subject tables and students (as the student studies more than one subject, and the subject is studied by more than one student).
CREATE TABLE student_subject(
    studentID INT,
    subjectID INT,
    PRIMARY KEY (studentID, subjectID),
    FOREIGN KEY (studentID) REFERENCES students(studentID),
    FOREIGN KEY (subjectID) REFERENCES subjects(subjectID)
);

select * from student_subject ;
select * from subjects ;
-- Insert Data into the Junction Table 

INSERT INTO student_subject(studentID, subjectID)
SELECT students.studentID, subjects.subjectID
FROM students, subjects;

-- Create a Procedure named student_info that displays the names of students and subjects and contains all the data shared between the Subjects and Students tables

DELIMITER //
CREATE PROCEDURE student_info()
BEGIN
    SELECT students.student_name, subjects.subject_name, students.birth_date, students.gender, students.Joining_Date, students.email, students.Educational_level, students.Track, students.GPA, students.PercentageGPA, students.age
    FROM students
    JOIN student_subject ON students.studentID = student_subject.studentID
    JOIN subjects ON student_subject.subjectID = subjects.subjectID;
END //

-- call the procedure
call student_info ; 

-- Create a view named teacher_info containing the teacher's name, office number, and the name of the subject being taught.

CREATE VIEW teacher_info AS
SELECT teachers.teacher_name, teachers.office_number, subjects.subject_name
FROM teachers
JOIN subjects ON teachers.subjectID = subjects.subjectID;

-- Display the view result 
select * from teacher_info;

--
CREATE INDEX idx_student_name ON students (student_name);


-- Display index.
SHOW INDEX FROM students;

-- Drop the inddex 

drop index idx_student_name on students ; 

