USE sqlDB
GO
-- 시스템 함수(SQL서버가 기본으로 제공해주는 함수들)
--데이터 형식 변환 함수 P.277

SELECT AVG(amount) FROM buyTbl; -- 형변환 이전, 출력결과 2로 소수점 표현 x

--float 형으로 변환하는 방법 세 가지
SELECT AVG(CAST(amount AS float)) FROM buyTbl;
SELECT AVG(CONVERT(float, amount)) FROM buyTbl;
SELECT AVG(TRY_CONVERT(float, amount)) FROM buyTbl;
--변환형을 다시 변환형
SELECT CAST(AVG(CAST(amount AS float))AS DECIMAL(5,4)) FROM buyTbl;
SELECT price,amount, CAST(CAST(price AS float)/amount AS DECIMAL(10,2))  AS [단가/수량] FROM buyTbl;

SELECT PARSE('3.14'AS INT); -- 오류발생, 프로그램 예외발생으로 중단
SELECT TRY_PARSE('3.14'AS INT); -- TRY_PARSE의 경우 NULL로 표현, 프로그램은 작동

--height가 원래 smallint이기 때문에 cm로 바꾸려면 형변환이 필요하다.
SELECT name,CAST(height AS VARCHAR)+'cm' FROM userTbl  
 WHERE height IS NOT NULL;  -- NULL은 =으로 표현이 안된다. /// IS / IS NOT으로 표현한다.

SELECT @@SERVICENAME --SQL서버가 제공해주는 데이터 변수

--날짜 및 시간 함수
SELECT PARSE ('2021년 5월 15일 10시 27분' AS DATETIME); -- 오타나면 바로 오류남
SELECT PARSE ('2021-05-14 10:28:10' AS DATETIME); -- 그래서 이렇게 사용한다.
SELECT GETDATE();--데이터 INSERT 할때 정말 많이 사용

SELECT YEAR(GETDATE()) AS '현재년도';
SELECT MONTH(GETDATE()) AS '현재월';
SELECT DAY(GETDATE()) AS '현재 날짜';

--수치함수
SELECT ABS(-100); --절댓값
SELECT ROUND(3.141592,2); -- 소수점 2번째 자리까지 표현, 3번째에서 반올림
SELECT RAND();
SELECT FLOOR(RAND()*100); -- 내림+랜덤

--논리함수
SELECT IIF(100>200,'참 ','거짓'); -- 코딩량을 줄이는데 획기적 잘 사용해야한다.
