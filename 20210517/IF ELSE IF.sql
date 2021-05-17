USE sqlDB
GO
--SQL Programming

DECLARE @var1 INT -- INT형 변수 선언
SET @var1 = 170;                  

IF(@var1 < 100)
BEGIN  ---{
	PRINT '기준값이 작습니다.'
END	---}
ELSE
BEGIN
	SELECT* FROM userTbl WHERE height>@var1
END

--ELSE IF

IF(@var1 < 100)
BEGIN  
	PRINT '기준값이 작습니다.'
END	
ELSE IF ( @var1 = 180)
BEGIN
	SELECT* FROM userTbl WHERE height>@var1
END
BEGIN
	SELECT* FROM userTbl WHERE height>@var1
END