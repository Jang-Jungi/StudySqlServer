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
	 FOREIGN KEY REFERENCES userTBL(userID), --�ܷ�Ű, Relational 
	prodName NCHAR(6) NOT NULL,
	price INT NOT NULL
);
GO

--DDL �Ѱ��̻� �÷� PK�� �����ϸ鼭 ���̺� ����
CREATE TABLE prodTbL
(
	prodCode NCHAR(3) NOT NULL,
	prodID NCHAR NOT NULL,
	prodDATE DATETIME NOT NULL,
	prodCur NCHAR(10) NULL,
	CONSTRAINT PK_prodTbl_prodCode_prodID PRIMARY KEY(prodCode,prodID)
);
GO

--userTBL�� email(����ũ ��������) �߰�
ALTER TABLE userTBL
 ADD email VARCHAR(50) NOT NULL UNIQUE ;

 --CHECK 
 ALTER TABLE userTBL
   ADD CONSTRAINT CK_birthYear
   CHECK (birthYear >= 1900 AND birthYear<=YEAR(GETDATE())) -- 2022�� ���� �Ұ� ��ü���� SET�� ���
