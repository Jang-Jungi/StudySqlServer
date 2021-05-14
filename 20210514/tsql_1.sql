--프로그래밍 시작 p.275
USE sqlDB
GO

DECLARE @myVar1 INT;
DECLARE @myVar2 DECIMAL(5,2); --정수3, 소수점 2
DECLARE @myVar3 SMALLINT;
DECLARE @myVar4 NCHAR(20);
DECLARE @inchUnit DECIMAL(4,3); --정수1 ,소수점 3

SET @myVar1 =5;
SET @myVar2=3.14;
SET @myVar3=3;
SET @myVar4='가수 이름 ==>';
SET @inchUnit=0.393;

--SELECT @myVar1 AS INT , @myVar2 AS DECIMAL ,@myVar3 AS SMALLINT, @myVar4 AS NCHAR

--SELECT @myVar4 AS string , name FROM userTbl
-- WHERE height > 180;

SELECT name, height * @inchUnit AS '키(inch)' FROM userTbl;