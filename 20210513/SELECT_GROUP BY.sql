--GROUP BY
--ID���� ������ � �����ߴ��� ��ȸ  -- * ��� ���� ��ȸ�ϰ� ���� �����͸� ���� �־��־���Ѵ�.
SELECT userID,SUM(amount) AS '�ѱ��Ű���' --AS '�ѱ��Ű���'��� ������ ���� �̸��� �ٲ� �� �ִ�.
  FROM buyTbl 
 GROUP BY userID,amount;
 
 
--�̿��ڵ��� �󸶸� ����ߴ��� ��ȸ // ������������
SELECT userID, SUM(amount * price) AS'�� ���űݾ�'
  FROM buyTbl
 GROUP BY userID
 ORDER BY'�� ���űݾ�'DESC;
 
 --�����Լ��� GROUP BY ���� �� �� �ִ�.
 
SELECT SUM(amount * price) AS'�� ���űݾ�'
  FROM buyTbl;

SELECT AVG(price) AS'��� ���űݾ�'
  FROM buyTbl;

--����� ���̺��� Ű�� ���� ū����� ���� ���� ����� ��ȸ
SELECT name, MIN(height), MAX(height) 
  FROM userTbl
 GROUP BY name; -- ���� �� ���´� X
--SUB QUERY�� ����
SELECT name AS'�̸� ',height AS'Ű' FROM userTbl --�� �̸� �ٲٴ� ���
 WHERE height = (SELECT MIN(height)FROM userTbl) 
    OR height = (SELECT MAX(height)FROM userTbl);

--GROUP BY �� ���� ����ϴ� HAVING ��
SELECT userID AS'����� ���̵�'
     , SUM(price*amount) AS'��� ����'
  FROM buyTbl
--WHERE SUM(price*amount) >1000 // ���� �Ұ��ϴ� WHERE ������ �����Լ��� ������. >>HAVING ���
 GROUP BY userID
 HAVING SUM(price*amount) >=1000 --����� '��� ����'�� int������ ��ȯ �ȵȴٰ� ���� 
 ORDER BY SUM(price*amount) DESC

 --���
 --��ǰ �׷캰�� ����ڰ� �󸶸�ŭ ���Ÿ� �ߴ��� ��ȸ
SELECT userID 
	 , groupName
     , SUM(price*amount) AS'��� ����'
  FROM buyTbl
 GROUP BY userID, groupName

SELECT groupName 
	 , userID
     , SUM(price*amount) AS'��� ����'
  FROM buyTbl
 GROUP BY ROLLUP (groupName,userID);


--GROUPING_ID ����� 
SELECT groupName 
     , SUM(price*amount) AS'��� ����'
	 , GROUPING_ID(groupName)AS'SUM'
  FROM buyTbl
 GROUP BY CUBE (groupName);