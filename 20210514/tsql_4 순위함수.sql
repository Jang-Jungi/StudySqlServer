--순위 함수 p.291
SELECT RANK() OVER(ORDER BY SUM(price*amount) DESC) AS [구매순위]
     , userID, SUM(price*amount) AS [사용자 별 구매금액]
  FROM buyTbl
 GROUP BY userID; 

SELECT name,height, addr 
  FROM userTbl
 WHERE height IS NOT NULL
 ORDER BY height DESC;

--ROW_NUMBER() OVER() 사용방법
SELECT ROW_NUMBER() OVER(ORDER BY height DESC) AS'키순위' 
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;  --동일 키가 있을 때 순위를 나눠주지 않는다.
 
SELECT RANK() OVER(ORDER BY height DESC) AS'키순위' 
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;  --동일 키를 순위에 표시

SELECT DENSE_RANK() OVER(ORDER BY height DESC) AS'키순위' 
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;  --1,2,3,4...

SELECT RANK() OVER(PARTITION BY addr ORDER BY height DESC) AS'키순위' 
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;  --지역별로 순위를 나눌 때, PARTITION BY로 순위를 매김//통계치 낼 때 많이 사용