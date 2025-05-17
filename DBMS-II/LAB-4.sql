---------------------------lab-4------------------------------

------------------------------------Part – A----------------------------- 
--1. Write a function to print "hello world". 
CREATE OR ALTER FUNCTION FN_HELLO()
RETURNS VARCHAR(50)
AS 
BEGIN
	RETURN 'HELLO WORLD'
END

SELECT dbo.FN_HELLO()

--2. Write a function which returns addition of two numbers. 
CREATE OR ALTER FUNCTION FN_ADDNUM(
	@NUM1 INT,
	@NUM2 INT
)
RETURNS INT
AS 
BEGIN
	DECLARE @SUM INT
	SET @SUM=@NUM1+@NUM2
	RETURN @SUM
END

SELECT dbo.FN_ADDNUM(5,6)


--3. Write a function to check whether the given number is ODD or EVEN. 
CREATE OR ALTER FUNCTION FN_ODDEVEN(
	@NUM INT
)
RETURNS VARCHAR(50)
AS 
BEGIN
	IF @NUM%2=0
		RETURN 'EVEN'
	ELSE
		RETURN 'ODD'
	RETURN NULL
END

SELECT DBO.FN_ODDEVEN(2)
SELECT DBO.FN_ODDEVEN(1)

--4. Write a function which returns a table with details of a person whose first name starts with B. 
CREATE OR ALTER FUNCTION FN_PERSON_DETAILS()
RETURNS TABLE
AS
RETURN(
	SELECT * FROM Person
	WHERE FirstName LIKE 'B%'
)

SELECT * FROM DBO.FN_PERSON_DETAILS()

--5. Write a function which returns a table with unique first names from the person table. 
CREATE OR ALTER FUNCTION FN_UNIQUE_PERSON()
RETURNS TABLE
AS
RETURN(
	SELECT DISTINCT FIRSTNAME FROM Person
)

SELECT * FROM DBO.FN_UNIQUE_PERSON()

--6. Write a function to print number from 1 to N. (Using while loop) 
CREATE OR ALTER FUNCTION FN_1TON(
	@N INT
)
RETURNS VARCHAR(50)
AS 
BEGIN
	DECLARE @I int,@NUM VARCHAR(50)
	SET @I=1 
	SET @NUM =''
	WHILE(@I<=@N)
	BEGIN
		SET @NUM=@NUM+' '+CAST(@I AS VARCHAR(50)) 
		SET @I=@I+1
	END
	RETURN @NUM
END

SELECT DBO.FN_1TON(5)

--7. Write a function to find the factorial of a given integer. 

CREATE OR ALTER FUNCTION FN_FACTORIAL(
@NUM INT
)
RETURNS INT
AS
BEGIN
	DECLARE @FACT INT,@I INT
	SET @I=1
	SET @FACT=1
	WHILE @I<=@NUM
	BEGIN
		SET @FACT=@FACT*@I
		SET @I=@I+1
	END
	RETURN @FACT
END

SELECT DBO.FN_FACTORIAL(5)

----------Part – B ------------------------------

---8. Write a function to compare two integers and return the comparison result. (Using Case statement) 
CREATE OR ALTER FUNCTION FN_COMPARE(
@NUM1 INT,
@NUM2 INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN CASE
			WHEN @NUM1>@NUM2 THEN 'NUM1 IS BIGGER'
			WHEN @NUM1<@NUM2 THEN 'NUM2 IS BIGGER'
			ELSE 'BOTH ARE EQUAL'
		END;
END

SELECT DBO.FN_COMPARE(2,5)

--9. Write a function to print the sum of even numbers between 1 to 20. 

CREATE OR ALTER FUNCTION FN_SUM_OF_EVEN()
RETURNS INT
AS
BEGIN
	DECLARE @SUM INT,@I INT=1
	SET @SUM=0
	WHILE @I<=20
	BEGIN
		IF @I%2=0
			SET @SUM=@SUM+@I
		SET @I=@I+1
	END
	RETURN @SUM
END

SELECT DBO.FN_SUM_OF_EVEN()

--10. Write a function that checks if a given string is a palindrome 
CREATE OR ALTER FUNCTION FN_PALINDROME(
@STR VARCHAR(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @ANS VARCHAR(50)
	SET @ANS=''
	SET @ANS=REVERSE(@STR)
	IF @ANS=@STR
		RETURN 'given string is a palindrome'
	ELSE
		RETURN 'given string is not a palindrome'
	RETURN NULL
END

SELECT DBO.FN_PALINDROME('ABBA')
SELECT DBO.FN_PALINDROME('TANISHA')

--Part – C 
--11. Write a function to check whether a given number is prime or not. 
CREATE OR ALTER FUNCTION FN_PRIME(
@NUM INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @ANS INT,@A INT
	SET @A=@NUM 
	SET @ANS=0
	WHILE @A!=0
	BEGIN
		SET @ANS=@ANS+(@A%10)
		SET @A=@A/10
	END
	IF @NUM=@ANS
	RETURN 'NUMBER IS PRIME'
	ELSE
	RETURN 'NUMBER IS NOT PRIME'
	RETURN NULL
END

SELECT DBO.FN_PRIME(7)
SELECT DBO.FN_PRIME(70)


--12. Write a function which accepts two parameters start date & end date, and returns a difference in days. 
CREATE OR ALTER FUNCTION FN_DIFFERENCE_IN_DAYS(
@DATE1 DATE,
@DATE2 DATE
)
RETURNS INT
AS
BEGIN
	DECLARE @DAY INT
	SET @DAY=DATEDIFF(DAY,@DATE1,@DATE2)
	RETURN @DAY
END

SELECT DBO.FN_DIFFERENCE_IN_DAYS('2023-04-01','2023-05-01')
	
--13. Write a function which accepts two parameters year & month in integer and returns total days each year. 

CREATE OR ALTER FUNCTION FN_TotalDaysInMonth(
@YEAR INT,@MONTH INT
)
RETURNS INT
AS
BEGIN
	DECLARE @ANS VARCHAR(50),@DATE DATE,@DAY INT
	SET @ANS=CAST(@YEAR AS VARCHAR(50)) + '-' + CAST(@MONTH AS VARCHAR(50))+'-1'
	SET @DATE=CAST(@ANS AS DATE)

	SET @DAY=DAY(EOMONTH(@DATE))

	RETURN @DAY
END

SELECT DBO.FN_TotalDaysInMonth(2012,2)

--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons. 
CREATE OR ALTER FUNCTION FN_DEPT_PERSONDETAILS(
@DEPTID INT
)
RETURNS TABLE
AS
	RETURN( SELECT P.FirstName,P.LastName,P.Salary,D.DepartmentName,P.JoiningDate FROM PERSON P
	JOIN Department D
	ON P.DepartmentID=D.DepartmentID
	WHERE D.DepartmentID=@DEPTID)


SELECT * FROM DBO.FN_DEPT_PERSONDETAILS(2)

--15. Write a function that returns a table with details of all persons who joined after 1-1-1991. 
CREATE OR ALTER FUNCTION FN_PERSON_AFTER_DATE()
RETURNS TABLE
AS
RETURN (
	SELECT * FROM PERSON
	WHERE JoiningDate > '1991-01-01'
)

SELECT * FROM DBO.FN_PERSON_AFTER_DATE()