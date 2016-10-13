CREATE TABLE Departments
(
Name varchar(20) NOT NULL ,
ID char(5) PRIMARY KEY,
Budget numeric(12,2),
Category varchar(15) Check (Category in ('Engineering','Science'))
);

CREATE TABLE Teachers
(
FirstName varchar(20) NOT NULL,
LastName varchar(30) NOT NULL ,
ID char(7),
BirthYear int,
DepartmentID char(5),
Salary numeric(7,2) Default 10000.00,
PRIMARY KEY (ID),
FOREIGN KEY (DepartmentID) REFERENCES Departments(ID),
);


CREATE TABLE Students
(
FirstName varchar(20) NOT NULL,
LastName varchar(30) NOT NULL ,
StudentNumber char(7) PRIMARY KEY,
BirthYear int,
DepartmentID char(5),
AdvisorID char(7),
FOREIGN KEY (DepartmentID) REFERENCES Departments(ID),
FOREIGN KEY (AdvisorID) REFERENCES Teachers(ID)
);


ALTER TABLE Departments
ALTER COLUMN Name varchar(50)

INSERT INTO Departments (Name, ID, Budget, Category) VALUES
('Electrical & Computer Engineering Department', 'ECE', 1200000.00 , 'Engineering')

INSERT INTO Departments (Name, ID, Budget) VALUES ('Mechanical Engineering Department', 'ME', 1000000.00)
INSERT INTO Departments (Name, ID, Category) VALUES ('Physics Department', 'P' , 'Science')

Select * from Departments

select Name , ID
from Departments

ALTER TABLE Students
ADD   passed int 

CREATE TABLE Courses
(
ID char(7) Primary key,
Title varchar(10),
Credits int,
DepartmentID char(5),
FOREIGN KEY (DepartmentID) REFERENCES Departments(ID),
);


CREATE TABLE Available_Courses
(
CourseID char(7),
Semester varchar(6) Check (Semester in ('Spring','fall')),
Year1 int,
TeacherID char(7),
FOREIGN KEY (CourseID) REFERENCES Courses(ID),
FOREIGN KEY (TeacherID) REFERENCES Teachers(ID),
);


CREATE TABLE Taken_Courses
(
StudentID char(7),
CourseID char(7),
Semester varchar(6),
Year1 int,
Grade int,
FOREIGN KEY (StudentID) REFERENCES Students(StudentNumber),
FOREIGN KEY (CourseID) REFERENCES Courses(ID),
);


CREATE TABLE Prerequisites
(
CourseId char(7),
PrereqID char(7) primary key,
FOREIGN KEY (CourseID) REFERENCES Courses(ID),
);

select DepartmentID ,avg(grade)
from

	(select DepartmentID , grade
	from Courses, Taken_Courses
	where CourseID = ID)

	as s group by DepartmentID

	select avg(grade)
	from Taken_Courses

	select DepartmentID ,StudentID  ,max(grade)
from
	(select StudentID, DepartmentID , grade
	from Courses, Taken_Courses
	where CourseID = ID) as s 
	group by s.StudentID,s.DepartmentID 