--GROUP BY
--ID별로 물건을 몇개 구매했는지 조회  -- * 대신 내가 조회하고 싶은 데이터를 전부 넣어주어야한다.
SELECT userID,SUM(amount) AS '총구매갯수' --AS '총구매갯수'라고 적으면 열의 이름을 바꿀 수 있다.
  FROM buyTbl 
 GROUP BY userID,amount;
 
 
--이용자들이 얼마를 사용했는지 조회 // 내림차순으로
SELECT userID, SUM(amount * price) AS'총 구매금액'
  FROM buyTbl
 GROUP BY userID
 ORDER BY'총 구매금액'DESC;
 
 --직계함수는 GROUP BY 없이 쓸 수 있다.
 
SELECT SUM(amount * price) AS'총 구매금액'
  FROM buyTbl;

SELECT AVG(price) AS'평균 구매금액'
  FROM buyTbl;

--사용자 테이블에서 키가 가장 큰사람과 가장 작은 사람을 조회
SELECT name, MIN(height), MAX(height) 
  FROM userTbl
 GROUP BY name; -- 전원 다 나온다 X
--SUB QUERY와 결합
SELECT name AS'이름 ',height AS'키' FROM userTbl --열 이름 바꾸는 방법
 WHERE height = (SELECT MIN(height)FROM userTbl) 
    OR height = (SELECT MAX(height)FROM userTbl);

--GROUP BY 와 같이 사용하는 HAVING 절
SELECT userID AS'사용자 아이디'
     , SUM(price*amount) AS'사용 가격'
  FROM buyTbl
--WHERE SUM(price*amount) >1000 // 절대 불가하다 WHERE 절에는 직계함수가 못들어간다. >>HAVING 사용
 GROUP BY userID
 HAVING SUM(price*amount) >=1000 --여기는 '사용 가격'이 int값으로 변환 안된다고 나옴 
 ORDER BY SUM(price*amount) DESC

 --통계
 --제품 그룹별로 사용자가 얼마만큼 구매를 했는지 조회
SELECT userID 
	 , groupName
     , SUM(price*amount) AS'사용 가격'
  FROM buyTbl
 GROUP BY userID, groupName

SELECT groupName 
	 , userID
     , SUM(price*amount) AS'사용 가격'
  FROM buyTbl
 GROUP BY ROLLUP (groupName,userID);


--GROUPING_ID 사용방법 
SELECT groupName 
     , SUM(price*amount) AS'사용 가격'
	 , GROUPING_ID(groupName)AS'SUM'
  FROM buyTbl
 GROUP BY CUBE (groupName);