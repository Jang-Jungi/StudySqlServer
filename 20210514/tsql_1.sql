--���α׷��� ���� p.275
USE sqlDB
GO

DECLARE @myVar1 INT;
DECLARE @myVar2 DECIMAL(5,2); --����3, �Ҽ��� 2
DECLARE @myVar3 SMALLINT;
DECLARE @myVar4 NCHAR(20);
DECLARE @inchUnit DECIMAL(4,3); --����1 ,�Ҽ��� 3

SET @myVar1 =5;
SET @myVar2=3.14;
SET @myVar3=3;
SET @myVar4='���� �̸� ==>';
SET @inchUnit=0.393;

--SELECT @myVar1 AS INT , @myVar2 AS DECIMAL ,@myVar3 AS SMALLINT, @myVar4 AS NCHAR

--SELECT @myVar4 AS string , name FROM userTbl
-- WHERE height > 180;

SELECT name, height * @inchUnit AS 'Ű(inch)' FROM userTbl;