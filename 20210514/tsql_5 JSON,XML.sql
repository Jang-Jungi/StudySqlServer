--JSON 데이터 p.300
--Java Script Object Notation

SELECT RANK() OVER(ORDER BY SUM(price*amount)) AS '구매 순위'
     , TRIM(userID) AS userID, SUM(price*amount) AS '사용자별 구매금액'
  FROM buyTbl
 GROUP BY userID
   FOR JSON AUTO; 

SELECT RANK() OVER(ORDER BY SUM(price*amount)) AS '구매 순위'
     , TRIM(userID) AS userID, SUM(price*amount) AS '사용자별 구매금액'
  FROM buyTbl
 GROUP BY userID
   FOR XML AUTO; 
