--���� �Լ� p.291
SELECT RANK() OVER(ORDER BY SUM(price*amount) DESC) AS [���ż���]
     , userID, SUM(price*amount) AS [����� �� ���űݾ�]
  FROM buyTbl
 GROUP BY userID; 

SELECT name,height, addr 
  FROM userTbl
 WHERE height IS NOT NULL
 ORDER BY height DESC;

--ROW_NUMBER() OVER() �����
SELECT ROW_NUMBER() OVER(ORDER BY height DESC) AS'Ű����' 
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;  --���� Ű�� ���� �� ������ �������� �ʴ´�.
 
SELECT RANK() OVER(ORDER BY height DESC) AS'Ű����' 
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;  --���� Ű�� ������ ǥ��

SELECT DENSE_RANK() OVER(ORDER BY height DESC) AS'Ű����' 
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;  --1,2,3,4...

SELECT RANK() OVER(PARTITION BY addr ORDER BY height DESC) AS'Ű����' 
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;  --�������� ������ ���� ��, PARTITION BY�� ������ �ű�//���ġ �� �� ���� ���