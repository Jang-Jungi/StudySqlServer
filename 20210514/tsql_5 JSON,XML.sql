--JSON ������ p.300
--Java Script Object Notation

SELECT RANK() OVER(ORDER BY SUM(price*amount)) AS '���� ����'
     , TRIM(userID) AS userID, SUM(price*amount) AS '����ں� ���űݾ�'
  FROM buyTbl
 GROUP BY userID
   FOR JSON AUTO; 

SELECT RANK() OVER(ORDER BY SUM(price*amount)) AS '���� ����'
     , TRIM(userID) AS userID, SUM(price*amount) AS '����ں� ���űݾ�'
  FROM buyTbl
 GROUP BY userID
   FOR XML AUTO; 
