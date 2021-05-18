CREATE OR ALTER FUNCTION ufn_getInch(@height INT)
RETURNS INT
AS
BEGIN
	DECLARE @val INT
	SET @val= @height*0.393
	RETURN (@val)
END
GO

SELECT userID, name
	 , height, dbo.ufn_getInch(height) AS [Ű(INCH)]
  FROM userTbl