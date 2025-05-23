

--------------------------------------LAB-5------------------------------


-- Creating PersonInfo Table 
CREATE TABLE PersonInfo ( 
PersonID INT PRIMARY KEY, 
PersonName VARCHAR(100) NOT NULL, 
Salary DECIMAL(8,2) NOT NULL, 
JoiningDate DATETIME NULL, 
City VARCHAR(100) NOT NULL, 
Age INT NULL, 
BirthDate DATETIME NOT NULL 
); 

INSERT INTO PERSONINFO VALUES
(1,'NIHAR',200000,'2020-05-04','AHMEDABAD',10,'2010-09-13')

DROP TABLE PersonInfo
-- Creating PersonLog Table 
CREATE TABLE PersonLog ( 
PLogID INT PRIMARY KEY IDENTITY(1,1), 
PersonID INT NOT NULL, 
PersonName VARCHAR(250) NOT NULL, 
Operation VARCHAR(50) NOT NULL, 
UpdateDate DATETIME NOT NULL, 
);


--------------------------------------Part � A------------------------------ 
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display 
--a message �Record is Affected.� 

CREATE OR ALTER TRIGGER TR_DISPLAY_MSG
ON PersonInfo
AFTER INSERT , UPDATE , DELETE
AS
BEGIN
	PRINT('Record is Affected.')
END

DROP TRIGGER TR_DISPLAY_MSG

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, 
--log all operations performed on the person table into PersonLog. 

CREATE OR ALTER TRIGGER TR_LOG_OP_INSERT
ON PERSONINFO
AFTER INSERT
AS
BEGIN
	DECLARE @PID INT;
	DECLARE @PNAME VARCHAR(50)

	SELECT @PID=PERSONID FROM INSERTED
	SELECT @PNAME =PERSONNAME FROM inserted

	INSERT INTO PersonLog (PersonID,PERSONNAME,OPERATION,UPDATEDATE)
	VALUES
	(@PID,@PNAME,'INSERT',GETDATE())
END

DROP TRIGGER TR_LOG_OP_INSERT


CREATE OR ALTER TRIGGER TR_LOG_OP_UPDATE
ON PERSONINFO
AFTER UPDATE
AS
BEGIN
	DECLARE @PID INT;
	DECLARE @PNAME VARCHAR(50)

	SELECT @PID=PERSONID FROM INSERTED
	SELECT @PNAME =PERSONNAME FROM inserted

	INSERT INTO PersonLog (PersonID,PERSONNAME,OPERATION,UPDATEDATE)
	VALUES
	(@PID,@PNAME,'UPDATE',GETDATE())
END
	
CREATE OR ALTER TRIGGER TR_LOG_OP_DELETE
ON PERSONINFO
AFTER DELETE
AS
BEGIN
	DECLARE @PID INT;
	DECLARE @PNAME VARCHAR(50)

	SELECT @PID=PERSONID FROM deleted
	SELECT @PNAME =PERSONNAME FROM deleted

	INSERT INTO PersonLog (PersonID,PERSONNAME,OPERATION,UPDATEDATE)
	VALUES
	(@PID,@PNAME,'DELETE',GETDATE())
END

INSERT INTO PERSONINFO VALUES
(1,'MANSI',200000,'2019-04-23','RAJKOT',18,'2006-01-17')

SELECT * FROM PERSONLOG

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo 
--table. For that, log all operations performed on the person table into PersonLog. 

CREATE OR ALTER TRIGGER TR_INSTEAD_INSERTT
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @PID INT;
	DECLARE @PNAME VARCHAR(50)

	SELECT @PID=PERSONID FROM INSERTED
	SELECT @PNAME =PERSONNAME FROM inserted

	INSERT INTO PersonLog (PersonID,PERSONNAME,OPERATION,UPDATEDATE)
	VALUES
	(@PID,@PNAME,'TRY TO INSERT',GETDATE())
END

DROP TRIGGER TR_INSTEAD_INSERTT
CREATE OR ALTER TRIGGER TR_INSTEADT_UPDATE
ON PERSONINFO
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @PID INT;
	DECLARE @PNAME VARCHAR(50)

	SELECT @PID=PERSONID FROM INSERTED
	SELECT @PNAME =PERSONNAME FROM inserted

	INSERT INTO PersonLog (PersonID,PERSONNAME,OPERATION,UPDATEDATE)
	VALUES
	(@PID,@PNAME,'TRY TO UPDATE',GETDATE())
END



CREATE OR ALTER TRIGGER TR_INSTEAD_DELETE
ON PERSONINFO
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @PID INT;
	DECLARE @PNAME VARCHAR(50)

	SELECT @PID=PERSONID FROM DELETED
	SELECT @PNAME =PERSONNAME FROM DELETED

	INSERT INTO PersonLog (PersonID,PERSONNAME,OPERATION,UPDATEDATE)
	VALUES
	(@PID,@PNAME,'TRY TO DELETE',GETDATE())
END


--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into 
--uppercase whenever the record is inserted. 

CREATE OR ALTER TRIGGER TR_UPPER_NAME
ON PERSONINFO
AFTER INSERT
AS
BEGIN
	DECLARE @PID INT;
	DECLARE @PNAME VARCHAR(50)

	SELECT @PID=PERSONID FROM INSERTED
	SELECT @PNAME =PERSONNAME FROM INSERTED

	UPDATE PERSONINFO
	SET PERSONNAME=UPPER(@PNAME)
	WHERE PersonID=@PID
END

DROP TRIGGER TR_UPPER_NAME

INSERT INTO PERSONINFO VALUES
(1,'mansi',200000,'2019-04-23','RAJKOT',16,'2006-01-17')


INSERT INTO PERSONINFO VALUES
(1,'tanisha',200000,'2019-04-23','RAJKOT',18,'2006-01-17')

select * from personinfo

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.

CREATE OR ALTER TRIGGER TR_PREVENT_DUPLICAT
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO PERSONINFO(PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
	SELECT
		PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate
	FROM INSERTED
	WHERE PERSONNAME NOT IN (SELECT PERSONNAME FROM PERSONINFO);
END

drop trigger TR_PREVENT_DUPLICAT

--6. Create trigger that prevent Age below 18 years. 


CREATE OR ALTER TRIGGER TR_PREVENT_AGE
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO PERSONINFO(PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
	SELECT PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate
	FROM INSERTED
	WHERE AGE>=18
END


DROP TRIGGER TR_PREVENT_AGE

INSERT INTO PERSONINFO VALUES
(6,'NIHAR',200000,'2024-05-21','RAJKOT',5,'2010-09-13')

SELECT * FROM PERSONINFO

--------------Part � B ------------------------

--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update 
--that age in Person table. 
CREATE OR ALTER TRIGGER TR_UPDATE_AGE
ON PERSONINFO
AFTER INSERT
AS
BEGIN
	declare @AGE INT
	DECLARE @BOD DATETIME
	DECLARE @PID INT
	select @pid=personid from inserted
	SELECT @BOD=BIRTHDATE FROM inserted
	SET @AGE=DATEDIFF(YEAR,@BOD,GETDATE())

	UPDATE PERSONINFO
	SET AGE=@AGE
	WHERE PERSONID=@PID
END

DROP TRIGGER TR_UPDATE_AGE

--8. Create a Trigger to Limit Salary Decrease by a 10%. 
CREATE OR ALTER TRIGGER TR_SALARY_LIMIT
ON PERSONINFO
AFTER INSERT
AS
BEGIN
	DECLARE @SAL DECIMAL(8,2)
	DECLARE @PID INT

	SELECT @PID=PERSONID FROM inserted
	SELECT @SAL=SALARY FROM inserted
	SET @SAL=@SAL-@SAL*0.1

	UPDATE PERSONINFO
	SET SALARY=@SAL
	WHERE PERSONID=@PID
END

INSERT INTO PERSONINFO VALUES
(8,'MIHIR',20000,'2024-05-21','RAJKOT',5,'2010-09-13')


SELECT * FROM PERSONINFO

--Part � C  
--9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL 
--during an INSERT. 

CREATE OR ALTER TRIGGER TR_UPDATE_DATE
ON PERSONINFO
AFTER INSERT
AS
BEGIN
	DECLARE @PID INT
	DECLARE @DATE DATETIME

	SELECT @PID=PERSONID FROM inserted
	SELECT @DATE=JoiningDate FROM INSERTED

	UPDATE PERSONINFO
	SET @DATE=GETDATE()
	WHERE PERSONID=@PID AND @DATE IS NULL
END


DROP TRIGGER TR_UPDATE_DATE

INSERT INTO PERSONINFO VALUES
(13,'ALICE',20000,NULL,'RAJKOT',5,'2010-09-13')

--10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints 
--�Record deleted successfully from PersonLog�.

CREATE OR ALTER TRIGGER TR_DELETE_LOG
ON PERSONLOG
AFTER DELETE
AS
BEGIN
	PRINT('rECORD DELETED SUCCESSFULLY FROM PERSONLOG')
END

SELECT * FROM PERSONLOG
SELECT * FROM PERSONINFO

DELETE PERSONLOG
WHERE PLogID=12