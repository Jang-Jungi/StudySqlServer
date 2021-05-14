--3개의 테이블을 INNER JOIN 
SELECT * FROM stdTbl;
SELECT * FROM clubTbl;

SELECT s.StdID
     , s.StuName
	 , r.ClubName
	 , c.ClubRoom
	 , r.RegDate
  FROM stdTbl  AS s
 INNER JOIN reginfoTbl AS r
    ON s.StdID = r.StdID
 INNER JOIN clubTbl AS c
    ON r.ClubName = c.ClubName
	;