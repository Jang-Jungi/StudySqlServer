USE sampleDB
GO

CREATE TABLE userTBL
(
	userID CHAR(8) NOT NULL PRIMARY KEY,
	name NVARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	height SMALLINT
);

CREATE TABLE buyTBL
(
	num INT NOT NULL PRIMARY KEY,
	userID CHAR(8) NOT NULL
	 FOREIGN KEY REFERENCES userTBL(userID), --외래키, Relational 
	prodName NCHAR(6) NOT NULL,
	price INT NOT NULL
);
GO

--DDL 한개이상 컬럼 PK로 지정하면서 테이블 생성
CREATE TABLE prodTbL
(
	prodCode NCHAR(3) NOT NULL,
	prodID NCHAR NOT NULL,
	prodDATE DATETIME NOT NULL,
	prodCur NCHAR(10) NULL,
	CONSTRAINT PK_prodTbl_prodCode_prodID PRIMARY KEY(prodCode,prodID)
);
GO

--userTBL에 email(유니크 제약조건) 추가
ALTER TABLE userTBL
 ADD email VARCHAR(50) NOT NULL UNIQUE ;

 --CHECK 
 ALTER TABLE userTBL
   ADD CONSTRAINT CK_birthYear
   CHECK (birthYear >= 1900 AND birthYear<=YEAR(GETDATE())) -- 2022년 부터 불가 객체지향 SET과 비슷
