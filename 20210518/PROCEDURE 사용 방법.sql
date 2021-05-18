--저장 PROCEDURE
--파라미터가 늘어가는 프로시저
CREATE PROC usp_users1
	@userName NVARCHAR(10) --변수 생성
AS
	--로직 생성
	SELECT userID,name,birthYear FROM userTbl
	 WHERE name = @userName
GO

--VIEW를 사용하는 것보다 간단하게 사용할 수 있다.
--PROC에서 원하는 값을 검색하는 방법
EXEC usp_users1 '성시경';
--VIEW에서 원하는 값을 검색하는 방법

SELECT * FROM v_userbuyInfo1 WHERE name = '성시경';

--생성 방법은 생략
CREATE VIEW v_userbuyInfo1
AS
	SELECT userID,birthYear,addr,name FROM userTbl
GO
