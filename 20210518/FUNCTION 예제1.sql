CREATE OR ALTER FUNCTION ufn_getAge(@bYear INT)
	RETURNS INT
	AS
	BEGIN
		DECLARE @age INT
		SET @age = YEAR(GETDATE()) - @bYear+1
		RETURN(@age)
	END
GO

SELECT userID,name
	 , birthYear, dbo.ufn_getAge(birthYear)AS [�ѱ��� ����]
	 , height
	 , addr 
  FROM userTbl;