USE sqlDB
GO

--���̺� ��ġ��UNION  p.320
SELECT s.Region,s.StdID FROM stdTbl AS s
 UNION
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c

--������ Ÿ���� ���ƾ� UNION����
SELECT CAST(r.ID AS VARCHAR), CAST(r.RegDate AS VARCHAR) FROM reginfoTbl AS r
 UNION
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c

--UNION�� �ߺ� ���� , UNION ALL�� �ߺ� ���
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c
 UNION
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c

SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c
 UNION ALL
SELECT c.ClubName,c.ClubRoom FROM clubTbl AS c

--EXCEPT
SELECT name, CONCAT(mobile1,mobile2) FROM userTbl
EXCEPT -- (-)�� �ǹ� 
SELECT name, CONCAT(mobile1,mobile2) FROM userTbl
 WHERE mobile1 IS NULL;

--INTERSECT
SELECT name, CONCAT(mobile1,mobile2) FROM userTbl
INTERSECT -- �����ϴ� �����͸� �߷�����.
SELECT name, CONCAT(mobile1,mobile2) FROM userTbl
 WHERE mobile1 IS NOT NULL;