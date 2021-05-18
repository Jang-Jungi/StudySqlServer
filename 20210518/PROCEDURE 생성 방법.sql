USE sqlDB;
GO
--PROCEDURE ����
CREATE PROC usp_users --PROCEDURE --> PROC���� �ٿ��� ���
AS
	SELECT userID,birthYear,addr FROM userTbl
GO

EXEC usp_users;

--VIEW ����
CREATE VIEW v_users
AS
	SELECT userID,birthYear,addr FROM userTbl
GO

SELECT * FROM v_users

--���� ALTER PROCEDURE
--������ DROP 

CREATE PROC usp_users2
	@userBirthYear INT,
	@userHeight INT
AS
	SELECT userID,name,birthYear,height, mDate FROM userTbl
	 WHERE birthYear>@userBirthYear
	   AND height>@userHeight;
GO

--VOID type�� �޼ҵ� ó�� ���
EXEC usp_users2 1970,178;


--PROCEDURE�� ����� ���� �Լ��� �ڵ��� ���� CREATE OR ALTER�� �۾��ϴ� ���� ���� ���ϴ�.
CREATE OR ALTER PROC usp_users3   
	@lastName NVARCHAR(2),
	@outCount INT OUTPUT -- ����� �����ޱ� OUTPUT//RETURN �޴� ��.
AS 
	SELECT @outCount =COUNT(*) FROM userTbl WHERE name LIKE @lastName +'%';
GO

DECLARE @myValue INT;
EXEC usp_users3 '��', @myValue OUTPUT;
PRINT CONCAT('�达 ���� ���� ����� ���� ', @myValue);