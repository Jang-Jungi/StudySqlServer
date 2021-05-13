SELECT * FROM userTbl;

--데이터 조회 필터링
SELECT * FROM userTbl
 WHERE name ='바비킴';

 --들어가는 단어 찾기
SELECT * FROM userTbl
 WHERE name LIKE  '%용%';

SELECT * FROM userTbl
 WHERE name LIKE  '%용%';

SELECT userID FROM userTbl
 WHERE name LIKE  '%용%';

--특정 테이블 레코드(데이터) 갯수확인
SELECT COUNT(*) FROM userTbl;

--키가 180 이상이고 출생년도가 1970이후에 태어난 사람 조회
SELECT * FROM userTbl
 WHERE height>180 AND birthYear>1970;

--사용자 테이블에서 키가 180이상이고
--출생년도가 1970년 이후에 태어난 사람의
--아이디와 이름, 키를 조회하세요
SELECT name, height, userID FROM userTbl
 WHERE height >180 AND birthYear>1970;

--출생년도를 오름차순으로 정렬하라
SELECT * FROM userTbl
 ORDER BY birthYear ASC;
 --내림차순
SELECT * FROM userTbl
 ORDER BY birthYear DESC;

 ----------------------------------------------------------------------------------------------
--5/13일 추가 내용 

--1.데이터 복사와 백업 SELECT INTO

--SELECT INTO  --> 테이블 복사에 주로 사용된다.
SELECT * INTO userTbl_New FROM userTbl;  --userTbl의 내용을 userTbl_New 테이블을 새로 만들면서 복사한다. (백업할 때 많이 사용된다.)
--PK는 복사 X
SELECT * FROM userTbl_New

--원하는 정보만 골라서 백업
SELECT userID,name,addr INTO userTbl_Backup FROM userTbl
SELECT * FROM userTbl_Backup;

SELECT userID,name,addr INTO userTbl_Backup2 FROM userTbl
 WHERE addr = '서울'; -- addr가 서울인 사람만 ID, name, addr추출
SELECT * FROM userTbl_Backup2;

