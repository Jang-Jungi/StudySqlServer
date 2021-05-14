--문자열 함수 p.287
SELECT ASCII('A'), CHAR(66);-- 사용빈도 下
SELECT UNICODE('가'),NCHAR(44033);

--문자열 연결함수
SELECT CONCAT('SQL','SERVER',2019) AS [NAME] -- 사용빈도 上
SELECT 'SQL'+'SERVER'+CAST(2019 AS VARCHAR); -- 귀찮은 방법 CONCAT 사용

--문자열 내에서 단어의 시작위치
SELECT CHARINDEX('world', 'Hello world');
--C#,JAVA,PYTHON의 문자열은 0부터 시작
--DB에서는 1부터 시작

--LEFT, RIGHT, SUBSTRING, LEN, LOWER, UPPER, LTRIM, RTRIN 
DECLARE @STR VARCHAR(20); -- 사용빈도 上上上
SET @STR ='SQL SERVER 2019'
SELECT LEFT(@STR,3) , RIGHT(@STR,4) 

SELECT SUBSTRING ('대한민국만세',5,2); -- 만세라는 단어를 추출하고 싶을 때 

SELECT LEN('Hello world'); -- 글자 길이수를 셀 때 사용
SELECT LEN('대한민국만세');

SELECT LOWER('hELLO World'); -- 소문자로 변환
SELECT UPPER('hELLO World'); -- 대문자로 변환

--여백 제거
SELECT '         SQL    ', LTRIM('         SQL    '); -- 왼쪽 여백 삭제 / 사용빈도 中
SELECT '         SQL    ', RTRIM('         SQL    '); -- 오른쪽 여백 삭제 / 사용빈도 中
SELECT '         SQL    ', TRIM('         SQL    '); --양쪽 여백 삭제 / 사용빈도 最上

--REPLACE 함수/ 사용빈도 最上
SELECT REPLACE('SQL SERVER 2019, SERVER 이름바꾸기', 'server', '서버'); -- 뉴스등 모든 내용 바꿀때

--STR / 사용빈도 下 --> CAST, CONVERT, PARSE로 작업하세요
SELECT STR (3.141592);
SELECT STR(45);

--FORMAT / 사용빈도 上
SELECT GETDATE();
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss '); --한국식
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy hh:mm:ss '); --미국식
