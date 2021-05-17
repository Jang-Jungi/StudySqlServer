--스키마 p.404
-->메인이 달라져도 데이터를 가져와서 사용할 수 있다.
SELECT * FROM sampleDB.dbo.userTBL;
SELECT * FROM sampleDB.dbo.buyTBL;

USE sampleDB;
GO

--뷰 p.408
--가상의 테이블을 만드는 것
CREATE VIEW v_userTBL
AS
	SELECT userID, name, addr FROM userTBL;
GO

SELECT userID, name, addr FROM v_userTBL -- 테이블이 아닌 뷰 객체이다.



USE sqlDB
GO

CREATE VIEW v_userbuyInfo
AS
SELECT u.userID, u.name 
     , b.prodName, b.price
  FROM userTBL AS u
 INNER JOIN buyTBL AS b
    ON u.userID= b.userID
GO

SELECT * FROM v_userbuyInfo -- 위의 내용을 다시 안쓰고 간단히 한줄로 표현가능