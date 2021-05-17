USE sqlDB
GO

--테이블 합치기UNION  p.320
SELECT s.Region,s.StdID FROM stdTbl AS s
 UNION
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c

--데이터 타입이 같아야 UNION가능
SELECT CAST(r.ID AS VARCHAR), CAST(r.RegDate AS VARCHAR) FROM reginfoTbl AS r
 UNION
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c

--UNION은 중복 제거 , UNION ALL은 중복 허용
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c
 UNION
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c

SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c
 UNION ALL
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c

--EXCEPT
SELECT name, CONCAT(mobile1,mobile2) FROM userTbl
EXCEPT -- (-)를 의미 
SELECT name, CONCAT(mobile1,mobile2) FROM userTbl
 WHERE mobile1 IS NULL;

--INTERSECT
SELECT name, CONCAT(mobile1,mobile2) FROM userTbl
INTERSECT -- 만족하는 데이터만 추려낸다.
SELECT name, CONCAT(mobile1,mobile2) FROM userTbl
 WHERE mobile1 IS NOT NULL;