USE sqlDB;
GO
--PROCEDURE 생성
CREATE PROC usp_users --PROCEDURE --> PROC으로 줄여서 사용
AS
	SELECT userID,birthYear,addr FROM userTbl
GO

EXEC usp_users;

--VIEW 생성
CREATE VIEW v_users
AS
	SELECT userID,birthYear,addr FROM userTbl
GO

SELECT * FROM v_users

--수정 ALTER PROCEDURE
--삭제는 DROP 

CREATE PROC usp_users2
	@userBirthYear INT,
	@userHeight INT
AS
	SELECT userID,name,birthYear,height, mDate FROM userTbl
	 WHERE birthYear>@userBirthYear
	   AND height>@userHeight;
GO

--VOID type의 메소드 처럼 사용
EXEC usp_users2 1970,178;


--PROCEDURE나 사용자 정의 함수를 코딩할 때는 CREATE OR ALTER로 작업하는 것이 가장 편하다.
CREATE OR ALTER PROC usp_users3   
	@lastName NVARCHAR(2),
	@outCount INT OUTPUT -- 결과를 돌려받기 OUTPUT//RETURN 받는 값.
AS 
	SELECT @outCount =COUNT(*) FROM userTbl WHERE name LIKE @lastName +'%';
GO

DECLARE @myValue INT;
EXEC usp_users3 '김', @myValue OUTPUT;
PRINT CONCAT('김씨 성을 가진 사용자 수는 ', @myValue);