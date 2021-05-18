--�Է��� ����⵵ ���Ŀ� ����߿��� ���ŵ�޿� ���� ����� ��ȯ�϶�
CREATE OR ALTER FUNCTION ufn_userGrade(@bYear INT)
	RETURNS @retTable TABLE
	(
		userID CHAR(8), 
		name NCHAR(10), 
		grade NVARCHAR(5)
	)
AS
BEGIN
	DECLARE @rowCnt INT;
	SELECT @rowCnt = COUNT(*) FROM userTbl WHERE birthYear>@bYear;
	
	IF @rowCnt <=0
	BEGIN
		INSERT INTO @retTable VALUES('����','����','����');
		RETURN;
	END;

		INSERT INTO @retTable
		SELECT u.userID,u.name,
			   CASE 
				   WHEN SUM(b.amount*b.price)>= 1500 THEN '�ֿ��'
				   WHEN SUM(b.amount*b.price)>= 1000 THEN '���'
				   WHEN SUM(b.amount*b.price)>= 1 THEN '�Ϲ�'
			   ELSE '����'
			   END
		  FROM userTbl AS u
		  LEFT OUTER JOIN buyTbl AS b
		    ON u.userID= b.userID
		 GROUP BY u.userID, u.name;
		RETURN;
END;

--�Լ� ������� ��ȸ ���
SELECT * FROM dbo.ufn_userGrade (1980);

SELECT userID, birthYear, dbo.ufn_userGrade(birthYear)
  FROM userTbl

--���� ���ν���
EXEC usp users1 '���ð�'