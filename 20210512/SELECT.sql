USE sqlDB;
GO

SELECT * FROM userTbl
 WHERE userID = 'KKH';

 --����� ���̺��� ����⵵ 1970~1980 ���� , Ű 180CM�̻� ��ȸ
 SELECT * FROM userTbl
  WHERE birthYear >1970 AND birthYear<1980
    AND height >= 180;

--����⵵�� 1970���� �̰ų� Ű�� 182�̻��� ��� ��ȸ
SELECT * FROM userTbl
 WHERE birthYear >=1970 OR height>=182;

--BETWEEN __AND �����
SELECT * FROM userTbl
 WHERE birthYear BETWEEN 1970 AND 1980
   AND height>=182;

--����� �߿� �泲, ����, ����� ��� ��ȸ
SELECT name,userID, addr FROM userTbl
 WHERE addr = '�泲'OR addr = '����'OR addr ='���';

--OR���� ȥ���� �����ϱ� ������ WHERE+ IN���� �ذ��ϴ� ��
 SELECT name,userID, addr FROM userTbl
 WHERE addr IN ('�泲','����','���');

 --LIKE��(���ڿ����� ���ϴ� ���ڿ��� �ִ� ���� ã�� �� ���)
 SELECT name, height, addr FROM userTbl
  WHERE name LIKE '��%';

--����ٸ� ����ؼ� ã�� ���� ���ڼ��� ����� ���´�.
SELECT name, height, addr FROM userTbl
 WHERE name LIKE '_��Ŵ';

--���ʿ� % %�� ���� ��� �̸��� �� �����͸� ã���ش�.
SELECT name, height, addr FROM userTbl
 WHERE name LIKE '%��%';

--Ű�� 175�ʰ��ڸ� ��ȸ
SELECT * FROM userTbl
 WHERE height> 177

--���ȣ���� Ű�� ū����� ��ȸ SubQuery
SELECT * FROM userTbl
 WHERE height >(SELECT height FROM userTbl WHERE name = '���ȣ');

--SubQuery ���� �ΰ� /�泲�� ��� ����麸�� Ű�� ū ����� ��ȸ -->ANY���
SELECT * FROM userTbl
 WHERE height >= ANY(SELECT height FROM userTbl WHERE addr = '�泲');

-- (=ANY�� IN) �� ������������ ���� ����� ��ġ�ϴ� ����� ��ȸ
SELECT * FROM userTbl
 WHERE height IN(SELECT height FROM userTbl WHERE addr = '�泲');
 SELECT * FROM userTbl
 WHERE height = ANY(SELECT height FROM userTbl WHERE addr = '�泲');

--ORDER BY DESC �������� ����
SELECT * FROM userTbl
 ORDER BY userID DESC;

--ORDER BY (ASC) �������� ����
SELECT * FROM userTbl
 ORDER BY name --(ASC) ;

--ORDER BY 1���ǿ��� ���� ���� ������ ��� 2�������� �迭
SELECT * FROM userTbl
 ORDER BY height, name;

--ORDER BY 1���ǿ��� ���� ���� ������ ��� 2�������� �迭
SELECT mobile1, mobile2 FROM userTbl
 ORDER BY mobile1, mobile2 ;

--userTbl�� ��� ������(���ڵ�)�� �ִ��� Ȯ��//�ǹ����� ���� ���� ����ϴ� �ڵ�
SELECT COUNT(*) FROM userTbl
SELECT COUNT(*) FROM buyTbl

--DISTINCT (�ߺ�����)
SELECT  addr FROM userTbl
SELECT DISTINCT addr FROM userTbl

--TOP
USE AdventureWorksLT2019;
GO

SELECT 
* FROM SalesLT.Customer;--������ 841��

SELECT TOP 10 *
  FROM SalesLT.Customer;--������ 841�� �� �� ���� 10����

SELECT TOP 10 * 
  FROM SalesLT.Customer 
 ORDER BY CustomerID

SELECT TOP 1 PERCENT *  -- ��ü ������ ���� ( )�ۼ�Ʈ��
  FROM SalesLT.Customer
 ORDER BY CustomerID DESC;

--10�ۼ�Ʈ ������ ������ �����Ѵ�.(�Ⱦ�)
 SELECT * FROM SalesLT.Customer
 TABLESAMPLE (10 PERCENT);

--OFFSET( )��ŭ �ǳʶٰ� ��� (�Ⱦ�)
SELECT * FROM SalesLT.Customer
 ORDER BY FirstName
OFFSET 5 ROW;
FETCH NEXT 3 ROWS ONLY; -- �̰� �� ������?
