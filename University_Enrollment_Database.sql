CREATE DATABASE UNIVERSITY_ENROLLMENT;
USE UNIVERSITY_ENROLLMENT;

CREATE TABLE DEPARTMENT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE PROFESSOR (
    ProfessorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Office VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID)
);

CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DateOfBirth DATE
);

CREATE TABLE COURSE (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0),
    ProfessorID INT,
    DepartmentID INT,
    FOREIGN KEY (ProfessorID) REFERENCES PROFESSOR(ProfessorID),
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID)
);

CREATE TABLE ENROLLMENT (
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    Semester VARCHAR(20),
    PRIMARY KEY (StudentID, CourseID, Semester),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
);

INSERT INTO DEPARTMENT (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');

INSERT INTO PROFESSOR (ProfessorID, FirstName, LastName, Office, DepartmentID) VALUES
(101, 'Alan', 'Turing', 'CS201', 1),
(102, 'Ada', 'Lovelace', 'MATH105', 2),
(103, 'Marie', 'Curie', 'PHY301', 3),
(104, 'Isaac', 'Newton', 'PHY305', 3),
(105, 'Grace', 'Hopper', 'CS204', 1),
(106, 'Carl', 'Gauss', 'MATH210', 2),
(107, 'Niels', 'Bohr', 'PHY307', 3),
(108, 'Tim', 'Berners-Lee', 'CS205', 1),
(109, 'Sophie', 'Germain', 'MATH215', 2),
(110, 'Richard', 'Feynman', 'PHY310', 3);

INSERT INTO STUDENT (StudentID, FirstName, LastName, Email, DateOfBirth) VALUES
(1001, 'John', 'Doe', 'john.doe@sainpet.com', '2002-05-15'),
(1002, 'Jane', 'Smith', 'jane.smith@sainpet.com', '2001-09-20'),
(1003, 'Emily', 'Chen', 'emily.chen@sainpet.com', '2003-01-12'),
(1004, 'Michael', 'Brown', 'michael.brown@sainpet.com', '2002-11-30'),
(1005, 'Sarah', 'Johnson', 'sarah.johnson@sainpet.com', '2001-07-25'),
(1006, 'David', 'Lee', 'david.lee@sainpet.com', '2003-03-18'),
(1007, 'Olivia', 'Garcia', 'olivia.garcia@sainpet.com', '2002-10-05'),
(1008, 'James', 'Anderson', 'james.anderson@sainpet.com', '2001-12-17'),
(1009, 'Sophia', 'Martinez', 'sophia.martinez@sainpet.com', '2003-06-22'),
(1010, 'Daniel', 'Wilson', 'daniel.wilson@sainpet.com', '2002-08-14');

INSERT INTO COURSE (CourseID, Title, Credits, ProfessorID, DepartmentID) VALUES
(201, 'Intro to Programming', 4, 101, 1),
(202, 'Data Structures', 4, 105, 1),
(203, 'Web Development', 3, 108, 1),
(204, 'Calculus I', 4, 102, 2),
(205, 'Linear Algebra', 3, 106, 2),
(206, 'Abstract Algebra', 3, 109, 2),
(207, 'Classical Mechanics', 4, 104, 3),
(208, 'Quantum Physics', 4, 103, 3),
(209, 'Thermodynamics', 3, 107, 3),
(210, 'Electromagnetism', 3, 110, 3);

INSERT INTO ENROLLMENT (StudentID, CourseID, Grade, Semester) VALUES
(1001, 201, 'A', 'Fall 2024'),
(1001, 204, 'B+', 'Fall 2024'),
(1002, 202, 'A-', 'Fall 2024'),
(1002, 208, 'B', 'Spring 2025'),
(1003, 201, 'A', 'Fall 2024'),
(1003, 203, 'A-', 'Spring 2025'),
(1004, 205, 'B+', 'Fall 2024'),
(1004, 207, 'A', 'Fall 2024'),
(1005, 204, 'A', 'Spring 2025'),
(1005, 209, 'B-', 'Spring 2025'),
(1006, 202, 'B+', 'Fall 2024'),
(1006, 210, 'A', 'Spring 2025'),
(1007, 206, 'A-', 'Fall 2024'),
(1008, 208, 'B', 'Spring 2025'),
(1009, 209, 'B+', 'Fall 2024'),
(1010, 210, 'A', 'Spring 2025');

## Query 1 List all students with 'Intro to Programming' course
SELECT 
    S.StudentID,
    S.FirstName,
    S.LastName,
    C.Title AS CourseTitle,
    E.Semester,
    E.Grade
FROM 
    STUDENT S
JOIN ENROLLMENT E ON S.StudentID = E.StudentID
JOIN COURSE C ON E.CourseID = C.CourseID
WHERE 
    C.Title = 'Intro to Programming';
    
## Query 2 List all courses taught by Professor Sophie Germain

SELECT 
    C.CourseID,
    C.Title,
    C.Credits,
    D.DepartmentName
FROM 
    COURSE C
JOIN PROFESSOR P ON C.ProfessorID = P.ProfessorID
JOIN DEPARTMENT D ON C.DepartmentID = D.DepartmentID
WHERE 
    P.FirstName = 'Sophie' AND P.LastName = 'Germain';
    
    ## Query 3 Average grade per course
    
    SELECT 
    C.Title,
    ROUND(AVG(
        CASE E.Grade
            WHEN 'A' THEN 4.0
            WHEN 'A-' THEN 3.7
            WHEN 'B+' THEN 3.3
            WHEN 'B' THEN 3.0
            WHEN 'B-' THEN 2.7
            WHEN 'C+' THEN 2.3
            WHEN 'C' THEN 2.0
            WHEN 'C-' THEN 1.7
            WHEN 'D' THEN 1.0
            WHEN 'F' THEN 0.0
            ELSE NULL
        END
    ), 2) AS AverageGPA
FROM 
    ENROLLMENT E
JOIN COURSE C ON E.CourseID = C.CourseID
GROUP BY 
    C.Title;





