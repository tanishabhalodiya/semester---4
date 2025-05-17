 b------------------------LAB-3-----------------------------

--CREATE TABLE DEPARTMENT

CREATE TABLE Departments ( 
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL UNIQUE, 
ManagerID INT NOT NULL, 
Location VARCHAR(100) NOT NULL 
); 

--CREATE TABLE EMPLOYEE

CREATE TABLE Employee ( 
EmployeeID INT PRIMARY KEY, 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
DoB DATETIME NOT NULL, 
Gender VARCHAR(50) NOT NULL, 
HireDate DATETIME NOT NULL, 
DepartmentID INT NOT NULL, 
Salary DECIMAL(10, 2) NOT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 

-- Create Projects Table 

CREATE TABLE Projects ( 
ProjectID INT PRIMARY KEY, 
ProjectName VARCHAR(100) NOT NULL, 
StartDate DATETIME NOT NULL, 
EndDate DATETIME NOT NULL, 
DepartmentID INT NOT NULL, 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
); 

--INSERT -------------------------
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location) 
VALUES  
(1, 'IT', 101, 'New York'), 
(2, 'HR', 102, 'San Francisco'), 
(3, 'Finance', 103, 'Los Angeles'), 
(4, 'Admin', 104, 'Chicago'), 
(5, 'Marketing', 105, 'Miami'); 


INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID, 
Salary) 
VALUES  
(101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00), 
(102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00), 
(103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00), 
(104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00), 
(105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00); 


INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID) 
VALUES  
(201, 'Project Alpha', '2022-01-01', '2022-12-31', 1), 
(202, 'Project Beta', '2023-03-15', '2024-03-14', 2), 
(203, 'Project Gamma', '2021-06-01', '2022-05-31', 3), 
(204, 'Project Delta', '2020-10-10', '2021-10-09', 4), 
(205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);

------------------------PART-A------------------------------------
--1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based 
--on this you must give EmployeeID, DOB, Gender & Hiredate. 

CREATE OR ALTER PROCEDURE PR_EMPLOYEE_DETAIL
	@FIRSTNAME VARCHAR(50)=null,
	@LASTNAME VARCHAR(50)=null
AS
BEGIN 
	SELECT EMPLOYEEID,DOB,GENDER,HIREDATE
	FROM EMPLOYEE 
	WHERE FIRSTNAME=@FIRSTNAME OR LASTNAME=@LASTNAME
END

EXEC PR_EMPLOYEE_DETAIL 'JOHN'
EXEC PR_EMPLOYEE_DETAIL @LASTNAME='DOE'
EXEC PR_EMPLOYEE_DETAIL NULL,'BROWN'

--2. Create a Procedure that will accept Department Name and based on that gives employees list who 
--belongs to that department.  

CREATE OR ALTER PROCEDURE PR_EMPLYEE_DEPT_WISE
	@DEPTNAME VARCHAR(50)
AS
BEGIN
	SELECT E.FIRSTNAME,E.LASTNAME
	FROM EMPLOYEE E
	JOIN DEPARTMENT D
	ON E.DepartmentID=D.DepartmentID
	WHERE D.DepartmentName=@DEPTNAME
END

EXEC PR_EMPLYEE_DEPT_WISE 'IT'
EXEC PR_EMPLYEE_DEPT_WISE 'HR'

--3.  Create a Procedure that accepts Project Name & Department Name and based on that you must give 
--all the project related details.  

CREATE OR ALTER PROCEDURE PR_PROJECT_DETAIL 
	@PROJECTNAME VARCHAR(50),@DEPTNAME VARCHAR(50)
AS
BEGIN
	SELECT P.PROJECTID,
			P.PROJECTNAME,
			P.STARTDATE,
			P.ENDDATE,
			P.DEPARTMENTID,
			D.DEPARTMENTNAME
	FROM PROJECTS P 
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID=D.DEPARTMENTID
	WHERE P.ProjectNAME=@PROJECTNAME AND D.DepartmentName=@DEPTNAME
END

EXEC PR_PROJECT_DETAIL 'PROJECT BETA','IT'

--4. Create a procedure that will accepts any integer and if salary is between provided integer, then those 
--employee list comes in output.  

CREATE OR ALTER PROCEDURE PR_EMPLYEE_SALARY
	@MIN INT,
	@MAX INT
AS
BEGIN
	SELECT EMPLOYEEID,
			FIRSTNAME,
			LASTNAME,
			SALARY
	FROM EMPLOYEE
	WHERE SALARY <= @MAX AND SALARY >=@MIN 
END

EXEC PR_EMPLYEE_SALARY 70000,82000

--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date.

CREATE OR ALTER PROCEDURE PR_EMPLOYEE_ONDATE
	@DATE DATETIME
AS
BEGIN
	SELECT	EMPLOYEEID,
			FIRSTNAME,
			LASTNAME
	FROM EMPLOYEE
	WHERE HireDate=@DATE
END

EXEC PR_EMPLOYEE_ONDATE '2010-06-15'


--------------------PART-B---------------------------
--6. Create a Procedure that accepts Gender’s first letter only and based on that employee details will be 
--served.

CREATE OR ALTER PROCEDURE PR_EMPLOYEE_GENDER
	@GENDER CHAR(50)
AS
BEGIN
	SELECT EMPLOYEEID,
			FIRSTNAME,
			LASTNAME,
			DOB,
			HIREDATE,
			DepartmentID,
			SALARY
	FROM EMPLOYEE
	WHERE LEFT(GENDER,1) = @GENDER
	--where gender like @gender+'%'
END

EXEC PR_EMPLOYEE_GENDER 'M'
EXEC PR_EMPLOYEE_GENDER 'F'

--7. Create a Procedure that accepts First Name or Department Name as input and based on that employee 
--data will come. 

CREATE OR ALTER PROCEDURE PR_EMPLOYEE_FIRST_DEPT
	@FIRSTNAME VARCHAR(50),@DEPTNAME VARCHAR(50)
AS
BEGIN
	SELECT E.EMPLOYEEID,
			E.FIRSTNAME,
			E.LASTNAME,
			E.DOB,
			E.HIREDATE,
			E.DepartmentID,
			E.SALARY
	FROM EMPLOYEE E
	JOIN DEPARTMENT D
	ON E.DepartmentID=D.DepartmentID
	WHERE E.FIRSTNAME=@FIRSTNAME OR D.DepartmentName=@DEPTNAME
END

EXEC PR_EMPLOYEE_FIRST_DEPT 'JOHN',NULL

--8. Create a procedure that will accepts location, if user enters a location any characters, then he/she will 
--get all the departments with all data.  

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_LOCTION
	@LOCATION VARCHAR(50)
AS
BEGIN
	SELECT DEPARTMENTID,
		DEPARTMENTNAME,
		MANAGERID,
		LOCATION
	FROM DepartmentS
	WHERE LOCATION LIKE CONCAT('%',@LOCATION,'%')
END

EXEC PR_DEPARTMENT_LOCTION 'A'


-------------------PART-C-------------------------------


--9. Create a procedure that will accepts From Date & To Date and based on that he/she will retrieve Project 
--related data. 
CREATE OR ALTER PROCEDURE PR_PROJECT_FROM_DATE_TO_DATE
	@STARTDATE DATETIME,@ENDDATE VARCHAR(50)
AS
BEGIN
	SELECT PROJECTID,
			PROJECTNAME,
			DEPARTMENTID
	FROM PROJECTS
	WHERE StartDate=@STARTDATE AND ENDDATE=@ENDDATE
END

EXEC PR_PROJECT_FROM_DATE_TO_DATE '2022-1-01' , '2022-12-31'

--10. Create a procedure in which user will enter project name & location and based on that you must 
--provide all data with Department Name, Manager Name with Project Name & Starting Ending Dates. 
CREATE OR ALTER PROCEDURE PR_DETAILS_PRNAME_LOC
	@PROJECTNAME VARCHAR(50),
	@LOCATION VARCHAR(50)
AS
BEGIN
	SELECT D.DEPARTMENTNAME,
			D.MANAGERID,
			P.PROJECTNAME,
			P.STARTDATE,
			P.ENDDATE
	FROM Projects P 
	JOIN DepartmentS D
	ON P.DepartmentID=D.DepartmentID
	WHERE P.ProjectName=@PROJECTNAME AND D.LOCATION = @LOCATION
END

EXEC PR_DETAILS_PRNAME_LOC 'PROJECT ALPHA','NEW YORK'
			