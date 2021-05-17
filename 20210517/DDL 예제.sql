USE sampleDB
GO

--DDL 테이블 생성
CREATE TABLE ddlTbl
(
	ID INT NOT NULL PRIMARY KEY,
	name NVARCHAR(20) NOT NULL,
	regDate DATETIME
);
GO

--DDL로 테이블 수정
DROP TABLE ddlTbl
CREATE TABLE ddlTbl
(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	name NVARCHAR(20) NOT NULL,
	regDate DATETIME
);
GO