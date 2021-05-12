USE sqlDB;
GO

SELECT * FROM userTbl
 WHERE userID = 'KKH';

 --사용자 테이블에서 출생년도 1970~1980 사이 , 키 180CM이상 조회
 SELECT * FROM userTbl
  WHERE birthYear >1970 AND birthYear<1980
    AND height >= 180;

--출생년도가 1970이후 이거나 키가 182이상인 사람 조회
SELECT * FROM userTbl
 WHERE birthYear >=1970 OR height>=182;

--BETWEEN __AND 사용방법
SELECT * FROM userTbl
 WHERE birthYear BETWEEN 1970 AND 1980
   AND height>=182;

--사용자 중에 경남, 전남, 경북인 사람 조회
SELECT name,userID, addr FROM userTbl
 WHERE addr = '경남'OR addr = '전남'OR addr ='경북';

--OR절은 혼란을 유발하기 때문에 WHERE+ IN으로 해결하는 것
 SELECT name,userID, addr FROM userTbl
 WHERE addr IN ('경남','전남','경북');

 --LIKE절(문자열에서 속하는 문자열이 있는 것을 찾을 때 사용)
 SELECT name, height, addr FROM userTbl
  WHERE name LIKE '김%';

--언더바를 사용해서 찾을 때는 글자수를 맞춰야 나온다.
SELECT name, height, addr FROM userTbl
 WHERE name LIKE '_비킴';

--양쪽에 % %를 쓰면 가운데 이름이 들어간 데이터를 찾아준다.
SELECT name, height, addr FROM userTbl
 WHERE name LIKE '%용%';

--키가 175초과자를 조회
SELECT * FROM userTbl
 WHERE height> 177

--김경호보다 키가 큰사람을 조회 SubQuery
SELECT * FROM userTbl
 WHERE height >(SELECT height FROM userTbl WHERE name = '김경호');

--SubQuery 조건 두개 /경남에 사는 사람들보다 키가 큰 사람들 조회 -->ANY사용
SELECT * FROM userTbl
 WHERE height >= ANY(SELECT height FROM userTbl WHERE addr = '경남');

-- (=ANY와 IN) 은 서브쿼리에서 나온 결과와 일치하는 결과만 조회
SELECT * FROM userTbl
 WHERE height IN(SELECT height FROM userTbl WHERE addr = '경남');
 SELECT * FROM userTbl
 WHERE height = ANY(SELECT height FROM userTbl WHERE addr = '경남');

--ORDER BY DESC 내림차순 정렬
SELECT * FROM userTbl
 ORDER BY userID DESC;

--ORDER BY (ASC) 오름차순 정렬
SELECT * FROM userTbl
 ORDER BY name --(ASC) ;

--ORDER BY 1조건에서 동일 값이 나왔을 경우 2조건으로 배열
SELECT * FROM userTbl
 ORDER BY height, name;

--ORDER BY 1조건에서 동일 값이 나왔을 경우 2조건으로 배열
SELECT mobile1, mobile2 FROM userTbl
 ORDER BY mobile1, mobile2 ;

--userTbl에 몇개의 데이터(레코드)가 있는지 확인//실무에서 정말 많이 사용하는 코드
SELECT COUNT(*) FROM userTbl
SELECT COUNT(*) FROM buyTbl

--DISTINCT (중복제거)
SELECT  addr FROM userTbl
SELECT DISTINCT addr FROM userTbl

--TOP
USE AdventureWorksLT2019;
GO

SELECT 
* FROM SalesLT.Customer;--데이터 841개

SELECT TOP 10 *
  FROM SalesLT.Customer;--데이터 841개 중 맨 위에 10개만

SELECT TOP 10 * 
  FROM SalesLT.Customer 
 ORDER BY CustomerID

SELECT TOP 1 PERCENT *  -- 전체 데이터 수의 ( )퍼센트만
  FROM SalesLT.Customer
 ORDER BY CustomerID DESC;

--10퍼센트 내에서 샘플을 추출한다.(안씀)
 SELECT * FROM SalesLT.Customer
 TABLESAMPLE (10 PERCENT);

--OFFSET( )만큼 건너뛰고 출력 (안씀)
SELECT * FROM SalesLT.Customer
 ORDER BY FirstName
OFFSET 5 ROW;
FETCH NEXT 3 ROWS ONLY; -- 이거 왜 오류남?
