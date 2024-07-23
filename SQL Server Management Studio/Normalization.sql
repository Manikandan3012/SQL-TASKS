-- Create the database
CREATE DATABASE NORMALIZATION;
USE NORMALIZATION;

-- ------------------ FIRST NORMALIZATION (1NF) ------------------

-- Unnormalized table structure for demonstration purposes
CREATE TABLE StudentCourses_Unnormalized (
    StudentID INT,
    Name VARCHAR(50),
    Courses VARCHAR(100)  -- Comma-separated course names
);

-- Example data insertion
INSERT INTO StudentCourses_Unnormalized (StudentID, Name, Courses) VALUES (1, 'John Doe', 'Math, Science');
INSERT INTO StudentCourses_Unnormalized (StudentID, Name, Courses) VALUES (2, 'Jane Smith', 'English, History');

-- Select data from unnormalized table
SELECT * FROM StudentCourses_Unnormalized;

-- Drop unnormalized table
DROP TABLE IF EXISTS StudentCourses_Unnormalized;

-- Create normalized table (1NF)
CREATE TABLE StudentCourses_1NF (
    StudentID INT,
    Name VARCHAR(50),
    Course VARCHAR(50)
);

-- Insert data into normalized table (1NF)
INSERT INTO StudentCourses_1NF (StudentID, Name, Course) VALUES (1, 'John Doe', 'Math');
INSERT INTO StudentCourses_1NF (StudentID, Name, Course) VALUES (1, 'John Doe', 'Science');
INSERT INTO StudentCourses_1NF (StudentID, Name, Course) VALUES (2, 'Jane Smith', 'English');
INSERT INTO StudentCourses_1NF (StudentID, Name, Course) VALUES (2, 'Jane Smith', 'History');

-- Select data from normalized table (1NF)
SELECT * FROM StudentCourses_1NF;

-- ------------------ SECOND NORMALIZATION (2NF) ------------------

-- Drop 1NF table if it exists
DROP TABLE IF EXISTS StudentCourses_1NF;

-- Create table in 1NF that violates 2NF
CREATE TABLE StudentCourses_2NF (
    StudentID INT,
    Name VARCHAR(50),
    Course VARCHAR(50),
    Instructor VARCHAR(50)
);

-- Example data insertion
INSERT INTO StudentCourses_2NF (StudentID, Name, Course, Instructor) VALUES (1, 'John Doe', 'Math', 'Dr. Smith');
INSERT INTO StudentCourses_2NF (StudentID, Name, Course, Instructor) VALUES (1, 'John Doe', 'Science', 'Dr. Johnson');
INSERT INTO StudentCourses_2NF (StudentID, Name, Course, Instructor) VALUES (2, 'Jane Smith', 'English', 'Dr. Lee');
INSERT INTO StudentCourses_2NF (StudentID, Name, Course, Instructor) VALUES (2, 'Jane Smith', 'History', 'Dr. Anderson');

-- Select data from 2NF table
SELECT * FROM StudentCourses_2NF;

-- Drop previous table if it exists
DROP TABLE IF EXISTS StudentCourses_2NF;

-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Course VARCHAR(50),
    Instructor VARCHAR(50)
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert data into Students table
INSERT INTO Students (StudentID, Name) VALUES (1, 'John Doe');
INSERT INTO Students (StudentID, Name) VALUES (2, 'Jane Smith');

-- Insert data into Courses table
INSERT INTO Courses (CourseID, Course, Instructor) VALUES (1, 'Math', 'Dr. Smith');
INSERT INTO Courses (CourseID, Course, Instructor) VALUES (2, 'Science', 'Dr. Johnson');
INSERT INTO Courses (CourseID, Course, Instructor) VALUES (3, 'English', 'Dr. Lee');
INSERT INTO Courses (CourseID, Course, Instructor) VALUES (4, 'History', 'Dr. Anderson');

-- Insert data into Enrollments table
INSERT INTO Enrollments (StudentID, CourseID) VALUES (1, 1);
INSERT INTO Enrollments (StudentID, CourseID) VALUES (1, 2);
INSERT INTO Enrollments (StudentID, CourseID) VALUES (2, 3);
INSERT INTO Enrollments (StudentID, CourseID) VALUES (2, 4);

-- Select data from normalized tables
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

-- ------------------ THIRD NORMALIZATION (3NF) ------------------

-- Drop previous tables if they exist
DROP TABLE IF EXISTS StudentCourses_2NF;

-- Create table in 2NF that violates 3NF
CREATE TABLE StudentCourses_3NF (
    StudentID INT,
    CourseID INT,
    Instructor VARCHAR(50),
    PRIMARY KEY (StudentID, CourseID)
);

-- Example data insertion
INSERT INTO StudentCourses_3NF (StudentID, CourseID, Instructor) VALUES (1, 1, 'Dr. Smith');
INSERT INTO StudentCourses_3NF (StudentID, CourseID, Instructor) VALUES (1, 2, 'Dr. Johnson');
INSERT INTO StudentCourses_3NF (StudentID, CourseID, Instructor) VALUES (2, 3, 'Dr. Lee');
INSERT INTO StudentCourses_3NF (StudentID, CourseID, Instructor) VALUES (2, 4, 'Dr. Anderson');

-- Create Instructors table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    Instructor VARCHAR(50)
);

-- Insert data into Instructors table
INSERT INTO Instructors (InstructorID, Instructor) VALUES (1, 'Dr. Smith');
INSERT INTO Instructors (InstructorID, Instructor) VALUES (2, 'Dr. Johnson');
INSERT INTO Instructors (InstructorID, Instructor) VALUES (3, 'Dr. Lee');
INSERT INTO Instructors (InstructorID, Instructor) VALUES (4, 'Dr. Anderson');

-- Modify Courses table to include InstructorID
ALTER TABLE Courses ADD InstructorID INT;

-- Update Courses table with InstructorID
UPDATE Courses SET InstructorID = 1 WHERE CourseID = 1;
UPDATE Courses SET InstructorID = 2 WHERE CourseID = 2;
UPDATE Courses SET InstructorID = 3 WHERE CourseID = 3;
UPDATE Courses SET InstructorID = 4 WHERE CourseID = 4;

-- Remove Instructor column from Courses table
ALTER TABLE Courses DROP COLUMN Instructor;

-- Modify Enrollments table to include InstructorID
ALTER TABLE Enrollments ADD InstructorID INT;

-- Update Enrollments table with InstructorID
UPDATE Enrollments SET InstructorID = 1 WHERE CourseID = 1;
UPDATE Enrollments SET InstructorID = 2 WHERE CourseID = 2;
UPDATE Enrollments SET InstructorID = 3 WHERE CourseID = 3;
UPDATE Enrollments SET InstructorID = 4 WHERE CourseID = 4;

-- Select data from normalized tables
SELECT * FROM Instructors;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

-- ------------------ BOYCE-CODD NORMAL FORM (BCNF) ------------------

-- Drop previous tables if they exist
DROP TABLE IF EXISTS StudentCourses_3NF;

-- Create table in 3NF that violates BCNF
CREATE TABLE StudentCourses_BCNF (
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    PRIMARY KEY (StudentID, CourseID, InstructorID)
);

-- Example data insertion
INSERT INTO StudentCourses_BCNF (StudentID, CourseID, InstructorID) VALUES (1, 1, 1);
INSERT INTO StudentCourses_BCNF (StudentID, CourseID, InstructorID) VALUES (1, 2, 2);
INSERT INTO StudentCourses_BCNF (StudentID, CourseID, InstructorID) VALUES (2, 3, 3);
INSERT INTO StudentCourses_BCNF (StudentID, CourseID, InstructorID) VALUES (2, 4, 4);

-- Ensure InstructorID is in Courses table only
UPDATE Courses SET InstructorID = (SELECT InstructorID FROM Instructors WHERE Courses.CourseID = Enrollments.CourseID);

-- Remove redundant data from Enrollments table
ALTER TABLE Enrollments DROP COLUMN InstructorID;

-- Select data from final normalized tables
SELECT * FROM StudentCourses_BCNF;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Instructors;
