--���� PROCEDURE
--�Ķ���Ͱ� �þ�� ���ν���
CREATE PROC usp_users1
	@userName NVARCHAR(10) --���� ����
AS
	--���� ����
	SELECT userID,name,birthYear FROM userTbl
	 WHERE name = @userName
GO

--VIEW�� ����ϴ� �ͺ��� �����ϰ� ����� �� �ִ�.
--PROC���� ���ϴ� ���� �˻��ϴ� ���
EXEC usp_users1 '���ð�';
--VIEW���� ���ϴ� ���� �˻��ϴ� ���

SELECT * FROM v_userbuyInfo1 WHERE name = '���ð�';

--���� ����� ����
CREATE VIEW v_userbuyInfo1
AS
	SELECT userID,birthYear,addr,name FROM userTbl
GO
