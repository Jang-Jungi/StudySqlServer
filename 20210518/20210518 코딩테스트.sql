--1번
SELECT LOWER(m.Email) AS email
	 , m.Mobile AS mobile
	 , m.Names AS names
	 , m.Addr AS addr
  FROM membertbl AS m
 ORDER BY names DESC;
 
--2번
SELECT b.Names AS names, b.Author AS author
     , b.ReleaseDate AS realeseDate
     , b.Price AS price
  FROM bookstbl AS b;
  
--3번
SELECT b.Idx, CONCAT('제목 : ',b.Names) AS Names
	 , CONCAT('저자 > ',b.Author) AS Author
     , CONVERT(DATE,b.ReleaseDate) AS '출판일'  
	 -- 년 월 일로 표현하는 방법을 모르겠습니다.
	 , b.ISBN 
     , CONCAT(b.Price,'원') AS '가격'
  FROM bookstbl AS b
 ORDER BY b.Idx DESC;
 
 --4번 
BEGIN TRAN
UPDATE rentaltbl SET rentalDate=NULL WHERE memberIdx=10
COMMIT TRAN
ROLLBACK

SELECT m.Names ,m.Levels, m.Addr, r.rentalDate
 FROM rentaltbl AS r
 RIGHT JOIN membertbl AS m	ON m.Idx=r.Idx
 WHERE r.rentalDate IS NULL 

--5번 마지막줄 총 합계
--NULL값이 위에있는거 해결X
SELECT DISTINCT d.Names AS names
	 , CONCAT((SELECT FORMAT(SUM(b.Price),'#,#')),'원') AS [총 합계금액]
  FROM divtbl AS d
 INNER JOIN bookstbl AS b
    ON d.Division = b.Division
 GROUP BY d.Names,d.Division
 WITH ROLLUP

