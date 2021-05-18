CREATE OR ALTER PROC usp_zodiac
	@userName NVARCHAR(10)
AS
	DECLARE @bYear INT
	DECLARE @Zodiac NVARCHAR(3)
	SELECT @bYear=birthYear FROM userTbl
	 WHERE name = @userName;

	 SET @Zodiac =
				CASE
					WHEN(@bYear%12 =0) THEN 'ø¯º˛¿Ã'
					WHEN(@bYear%12 =1) THEN '¥ﬂ'
					WHEN(@bYear%12 =2) THEN '∞≥'
					WHEN(@bYear%12 =3) THEN 'µ≈¡ˆ'
					WHEN(@bYear%12 =4) THEN '¡„'
					WHEN(@bYear%12 =5) THEN 'º“'
					WHEN(@bYear%12 =6) THEN '»£∂˚¿Ã'
					WHEN(@bYear%12 =7) THEN '≈‰≥¢'
					WHEN(@bYear%12 =8) THEN 'øÎ'
					WHEN(@bYear%12 =9) THEN 'πÏ'
					WHEN(@bYear%12 =10) THEN '∏ª'
					ELSE 'æÁ'
				END
	PRINT CONCAT (@bYear,'≥‚ª˝ ', @userName , '¥‘¿« ∂Ï ==> ' , @Zodiac, '∂Ï ¿‘¥œ¥Ÿ');
GO

EXEC usp_zodiac 'æ∆¿Ã¿Ø';
