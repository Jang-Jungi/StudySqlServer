--1��
SELECT LOWER(m.Email) AS email
	 , m.Mobile AS mobile
	 , m.Names AS names
	 , m.Addr AS addr
  FROM membertbl AS m
 ORDER BY names DESC;
 
--2��
SELECT b.Names AS names, b.Author AS author
     , b.ReleaseDate AS realeseDate
     , b.Price AS price
  FROM bookstbl AS b;
  
--3��
SELECT b.Idx, CONCAT('���� : ',b.Names) AS Names
	 , CONCAT('���� > ',b.Author) AS Author
     , CONVERT(DATE,b.ReleaseDate) AS '������'  
	 -- �� �� �Ϸ� ǥ���ϴ� ����� �𸣰ڽ��ϴ�.
	 , b.ISBN 
     , CONCAT(b.Price,'��') AS '����'
  FROM bookstbl AS b
 ORDER BY b.Idx DESC;
 
 --4�� 
BEGIN TRAN
UPDATE rentaltbl SET rentalDate=NULL WHERE memberIdx=10
COMMIT TRAN
ROLLBACK

SELECT m.Names ,m.Levels, m.Addr, r.rentalDate
 FROM rentaltbl AS r
 RIGHT JOIN membertbl AS m	ON m.Idx=r.Idx
 WHERE r.rentalDate IS NULL 

--5�� �������� �� �հ�
--NULL���� �����ִ°� �ذ�X
SELECT DISTINCT d.Names AS names
	 , CONCAT((SELECT FORMAT(SUM(b.Price),'#,#')),'��') AS [�� �հ�ݾ�]
  FROM divtbl AS d
 INNER JOIN bookstbl AS b
    ON d.Division = b.Division
 GROUP BY d.Names,d.Division
 WITH ROLLUP

