USE sqlDB
GO

--외부 JOIN
--우리 쇼핑몰에서 물건을 한번도 구매하지 않은 회원들을 조회
SELECT u.userID, u.name
      , u.addr, CONCAT(u.mobile1,u.mobile2)AS mobile
	  ,b.prodName
  FROM userTbl AS u
  LEFT OUTER JOIN buyTbl AS b  -- INNER JOIN은 구매를 한 사람만 나오지만, OUTER JOIN은 구매를 하지 않은 사람은 NULL로 나온다.
    ON u.userID = b.userID 
 WHERE b.prodName IS NULL
 ORDER BY u.userID;


 --RIGHT OUTER JOIN
 SELECT u.userID, u.name
      , u.addr, CONCAT(u.mobile1,u.mobile2)AS mobile
	  ,b.prodName
  FROM userTbl AS u
  RIGHT OUTER JOIN buyTbl AS b  
    ON u.userID = b.userID 
 WHERE b.prodName IS NULL
 ORDER BY u.userID;

 --학생/동아리/가입정보 테이블로 
 -- OUTER JOIN
 SELECT s.StdID ,s.Region
      , s.StuName,r.ClubName
	  , r.RegDate ,c.ClubRoom
   FROM stdTbl AS s
   LEFT OUTER JOIN reginfoTbl AS r
     ON s.StdID= r.StdID
  INNER JOIN clubTbl AS c
     ON r.ClubName = c.ClubName

SELECT s.StdID ,s.Region
     , s.StuName
	 , c.ClubName, c.ClubRoom
     , r.RegDate 
  FROM stdTbl AS s
  LEFT OUTER JOIN reginfoTbl AS r
    ON s.StdID= r.StdID
  LEFT OUTER JOIN clubTbl AS c
    ON r.ClubName = c.ClubName

SELECT s.StdID ,s.Region
     , s.StuName,r.ClubName
     , r.RegDate ,c.ClubRoom
  FROM stdTbl AS s
  LEFT OUTER JOIN reginfoTbl AS r -- LEFT OUTER 앞의 TABLE이 기준
    ON s.StdID= r.StdID
 RIGHT OUTER JOIN clubTbl AS c -- RIGHT OUTER 뒤의 TABLE이 기준
    ON r.ClubName = c.ClubName

SELECT s.StdID ,s.Region
     , s.StuName,r.ClubName -- r.ClubName이냐 c.ClubName이냐에 따라서 표 값도 달라진다.
     , r.RegDate ,c.ClubRoom
  FROM stdTbl AS s
  FULL OUTER JOIN reginfoTbl AS r
    ON s.StdID= r.StdID
  FULL OUTER JOIN clubTbl AS c
    ON r.ClubName = c.ClubName