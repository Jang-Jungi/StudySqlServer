--��Ű�� p.404
-->������ �޶����� �����͸� �����ͼ� ����� �� �ִ�.
SELECT * FROM sampleDB.dbo.userTBL;
SELECT * FROM sampleDB.dbo.buyTBL;

USE sampleDB;
GO

--�� p.408
--������ ���̺��� ����� ��
CREATE VIEW v_userTBL
AS
	SELECT userID, name, addr FROM userTBL;
GO

SELECT userID, name, addr FROM v_userTBL -- ���̺��� �ƴ� �� ��ü�̴�.



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

SELECT * FROM v_userbuyInfo -- ���� ������ �ٽ� �Ⱦ��� ������ ���ٷ� ǥ������