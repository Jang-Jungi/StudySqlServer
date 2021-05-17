USE sqlDB
GO

--�ܺ� JOIN
--�츮 ���θ����� ������ �ѹ��� �������� ���� ȸ������ ��ȸ
SELECT u.userID, u.name
      , u.addr, CONCAT(u.mobile1,u.mobile2)AS mobile
	  ,b.prodName
  FROM userTbl AS u
  LEFT OUTER JOIN buyTbl AS b  -- INNER JOIN�� ���Ÿ� �� ����� ��������, OUTER JOIN�� ���Ÿ� ���� ���� ����� NULL�� ���´�.
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

 --�л�/���Ƹ�/�������� ���̺�� 
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
  LEFT OUTER JOIN reginfoTbl AS r -- LEFT OUTER ���� TABLE�� ����
    ON s.StdID= r.StdID
 RIGHT OUTER JOIN clubTbl AS c -- RIGHT OUTER ���� TABLE�� ����
    ON r.ClubName = c.ClubName

SELECT s.StdID ,s.Region
     , s.StuName,r.ClubName -- r.ClubName�̳� c.ClubName�̳Ŀ� ���� ǥ ���� �޶�����.
     , r.RegDate ,c.ClubRoom
  FROM stdTbl AS s
  FULL OUTER JOIN reginfoTbl AS r
    ON s.StdID= r.StdID
  FULL OUTER JOIN clubTbl AS c
    ON r.ClubName = c.ClubName