
------------------------------------lab-6---------------------------------------

-----------------------------Part - A---------------------------------------------


--  Create the Products table 

CREATE TABLE Products ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
);

INSERT INTO Products (Product_id, Product_Name, Price) VALUES 
(1, 'Smartphone', 35000), 
(2, 'Laptop', 65000), 
(3, 'Headphones', 5500), 
(4, 'Television', 85000), 
(5, 'Gaming Console', 32000);

DROP TABLE Products
--  Insert data into the Products table

INSERT INTO NewProducts (Product_id, Product_Name, Price) VALUES 
(1, 'Smartphone', 35000), 
(2, 'Laptop', 65000), 
(3, 'Headphones', 5500), 
(4, 'Television', 85000), 
(5, 'Gaming Console', 32000);

SELECT * FROM NewProducts
DROP TABLE NewProducts

--1. Create a cursor Product_Cursor to fetch all the rows from a products table. 

DECLARE @PID INT,
@PNAME VARCHAR(250),
@PRICE DECIMAL(10, 2)

DECLARE CURSOR_ALL_PRODUCT CURSOR
FOR SELECT * FROM Products

OPEN CURSOR_ALL_PRODUCT

FETCH NEXT FROM CURSOR_ALL_PRODUCT
INTO @PID , @PNAME,@PRICE

WHILE @@FETCH_STATUS=0
BEGIN
	PRINT CAST(@PID AS VARCHAR(250))+' '+@PNAME+' '+CAST(@PRICE AS VARCHAR(205))
	FETCH NEXT FROM CURSOR_ALL_PRODUCT
	INTO @PID , @PNAME,@PRICE
END

CLOSE CURSOR_ALL_PRODUCT
DEALLOCATE CURSOR_ALL_PRODUCT

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. 
--(Example: 1_Smartphone) 

DECLARE @PID INT,
@PNAME VARCHAR(250)

DECLARE PRODUCT_CURSOR CURSOR
FOR SELECT Product_id,Product_Name FROM Products

OPEN PRODUCT_CURSOR

FETCH NEXT FROM PRODUCT_CURSOR
INTO @PID , @PNAME

WHILE @@FETCH_STATUS=0
BEGIN
	PRINT CAST(@PID AS VARCHAR(250))+'_'+@PNAME
	FETCH NEXT FROM PRODUCT_CURSOR
	INTO @PID , @PNAME
END

CLOSE PRODUCT_CURSOR
DEALLOCATE PRODUCT_CURSOR

--3. Create a Cursor to Find and Display Products Above Price 30,000. 


DECLARE @PID INT,@PNAME VARCHAR(250)

DECLARE CURSOR_PRODUCT_ABOVE_30000 CURSOR
FOR 
	SELECT Product_id,Product_Name FROM Products
	WHERE Price>30000


OPEN CURSOR_PRODUCT_ABOVE_30000

FETCH NEXT FROM CURSOR_PRODUCT_ABOVE_30000
INTO @PID , @PNAME

WHILE @@FETCH_STATUS=0
BEGIN
	PRINT CAST(@PID AS VARCHAR(250))+'  '+@PNAME
	FETCH NEXT FROM CURSOR_PRODUCT_ABOVE_30000
	INTO @PID , @PNAME
END

CLOSE CURSOR_PRODUCT_ABOVE_30000
DEALLOCATE CURSOR_PRODUCT_ABOVE_30000

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.


DECLARE @PID INT

DECLARE Product_CursorDelete CURSOR
FOR 
	SELECT Product_id FROM Products

OPEN Product_CursorDelete

FETCH NEXT FROM Product_CursorDelete
INTO @PID

WHILE @@FETCH_STATUS=0
BEGIN
	DELETE FROM Products
	WHERE Product_id=@PID
	PRINT 'ROW IS DELETED'
	FETCH NEXT FROM Product_CursorDelete
	INTO @PID
END

CLOSE Product_CursorDelete
DEALLOCATE Product_CursorDelete



------------------------------------Part – B-----------------------------------------

--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases 
--the price by 10%. 


DECLARE @PID INT,@PNAME VARCHAR(250),@PRICE DECIMAL(10,2)

DECLARE Product_CursorUpdate CURSOR
FOR 
	SELECT * FROM Products

OPEN Product_CursorUpdate

FETCH NEXT FROM Product_CursorUpdate
INTO @PID,@PNAME,@PRICE

WHILE @@FETCH_STATUS=0
BEGIN
	UPDATE PRODUCTS
	SET @PRICE = @PRICE + @PRICE*0.1
	WHERE Product_id=@PID
	PRINT 'THE PRICE OF '+@PNAME+' IS '+CAST(@PRICE AS VARCHAR(50)) 
	FETCH NEXT FROM Product_CursorUpdate
	INTO @PID,@PNAME,@PRICE
END

CLOSE Product_CursorUpdate
DEALLOCATE Product_CursorUpdate


--6. Create a Cursor to Rounds the price of each product to the nearest whole number.

DECLARE @PID INT,@PNAME VARCHAR(250),@PRICE DECIMAL(10,2)

DECLARE Product_CursorUpdate_Round CURSOR
FOR 
	SELECT * FROM Products

OPEN Product_CursorUpdate_Round

FETCH NEXT FROM Product_CursorUpdate_Round
INTO @PID,@PNAME,@PRICE

WHILE @@FETCH_STATUS=0
BEGIN
	UPDATE PRODUCTS
	SET @PRICE = ROUND(@PRICE,1)
	WHERE Product_id=@PID
	PRINT 'THE PRICE OF '+@PNAME+' IS '+CAST(@PRICE AS VARCHAR(50)) 
	FETCH NEXT FROM Product_CursorUpdate_Round
	INTO @PID,@PNAME,@PRICE
END

CLOSE Product_CursorUpdate_Round
DEALLOCATE Product_CursorUpdate_Round


---------------------------Part – C ----------------------------
--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” 
--(Note: Create NewProducts table first with same fields as Products table) 


CREATE TABLE NewProducts ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
);


DECLARE @PID INT,@PNAME VARCHAR(250),@PRICE DECIMAL(10,2)

DECLARE Product_CursorUpdate_Round CURSOR
FOR 
	SELECT * FROM Products
	WHERE Product_Name='LAPTOP'

OPEN Product_CursorUpdate_Round

FETCH NEXT FROM Product_CursorUpdate_Round
INTO @PID,@PNAME,@PRICE

WHILE @@FETCH_STATUS=0
BEGIN
	INSERT INTO NewProducts VALUES(
	@PID,@PNAME,@PRICE
	)
	FETCH NEXT FROM Product_CursorUpdate_Round
	INTO @PID,@PNAME,@PRICE
END

CLOSE Product_CursorUpdate_Round
DEALLOCATE Product_CursorUpdate_Round

SELECT * FROM NewProducts


--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products 
--with a price above 50000 to an archive table, removing them from the original Products table.

CREATE TABLE ArchivedProducts ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
);

DECLARE @PID INT,@PNAME VARCHAR(250),@PRICE DECIMAL(10,2)

DECLARE Product_Cursor_HIGH_PRICE CURSOR
FOR 
	SELECT * FROM Products
	WHERE PRICE > 50000

OPEN Product_Cursor_HIGH_PRICE

FETCH NEXT FROM Product_Cursor_HIGH_PRICE
INTO @PID,@PNAME,@PRICE

WHILE @@FETCH_STATUS=0
BEGIN
	INSERT INTO ArchivedProducts VALUES(
	@PID,@PNAME,@PRICE
	)
	DELETE FROM Products
	WHERE Product_id=@PID
	FETCH NEXT FROM Product_Cursor_HIGH_PRICE
	INTO @PID,@PNAME,@PRICE
END

CLOSE Product_Cursor_HIGH_PRICE
DEALLOCATE Product_Cursor_HIGH_PRICE

SELECT * FROM ArchivedProducts
