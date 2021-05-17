--구매한 금액에 따라 최우수, 우수, 일반 고객으로 분류하는
--쿼리를 작성하라

WITH cet_custlevel([사용자 아이디],[회원명],[총 구매금액] ,[고객분류])
AS
(
SELECT u.userID AS[사용자 아이디]
     , u.name AS[회원명]
	 , IIF(SUM(b.price*b.amount) IS NULL, 0
	 , SUM(b.price*b.amount))  AS [총 구매금액] 
	 , CASE 
		WHEN SUM(b.price*b.amount)>1500 THEN '최 우수고객'
		WHEN SUM(b.price*b.amount)>1000 THEN '우수고객'
		WHEN SUM(b.price*b.amount)>1 THEN '일반고객'
		ELSE '유령고객'
	   END AS [고객분류]
  FROM userTbl AS u
  LEFT OUTER JOIN buyTbl AS b
    ON u.USERID = b. userID
 GROUP BY u.userID, u.name --- 직계함수는 GROUP BY 필수 , userID, name도 GROUP BY 해줘야한다.
 --ORDER BY [총 구매금액] DESC -- cte 내부에서 사용불가
 )
 SELECT [사용자 아이디],[회원명] 
      , FORMAT([총 구매금액], 'C4') AS [총 구매금액] -- '#,#' 1000단위마다 점을 찍어줌 'C4' 원화 표시 + 1000단위 표시
	  , [고객분류]
   FROM cet_custlevel
  ORDER BY [총 구매금액] DESC;