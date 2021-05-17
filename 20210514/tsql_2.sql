USE sqlDB
GO
-- �ý��� �Լ�(SQL������ �⺻���� �������ִ� �Լ���)
--������ ���� ��ȯ �Լ� P.277

SELECT AVG(amount) FROM buyTbl; -- ����ȯ ����, ��°�� 2�� �Ҽ��� ǥ�� x

--float ������ ��ȯ�ϴ� ��� �� ����
SELECT AVG(CAST(amount AS float)) FROM buyTbl;
SELECT AVG(CONVERT(float, amount)) FROM buyTbl;
SELECT AVG(TRY_CONVERT(float, amount)) FROM buyTbl;
--��ȯ���� �ٽ� ��ȯ��
SELECT CAST(AVG(CAST(amount AS float))AS DECIMAL(5,4)) FROM buyTbl;
SELECT price,amount, CAST(CAST(price AS float)/amount AS DECIMAL(10,2))  AS [�ܰ�/����] FROM buyTbl;

SELECT PARSE('3.14'AS INT); -- �����߻�, ���α׷� ���ܹ߻����� �ߴ�
SELECT TRY_PARSE('3.14'AS INT); -- TRY_PARSE�� ��� NULL�� ǥ��, ���α׷��� �۵�

--height�� ���� smallint�̱� ������ cm�� �ٲٷ��� ����ȯ�� �ʿ��ϴ�.
SELECT name,CAST(height AS VARCHAR)+'cm' FROM userTbl  
 WHERE height IS NOT NULL;  -- NULL�� =���� ǥ���� �ȵȴ�. /// IS / IS NOT���� ǥ���Ѵ�.

SELECT @@SERVICENAME --SQL������ �������ִ� ������ ����

--��¥ �� �ð� �Լ�
SELECT PARSE ('2021�� 5�� 15�� 10�� 27��' AS DATETIME); -- ��Ÿ���� �ٷ� ������
SELECT PARSE ('2021-05-14 10:28:10' AS DATETIME); -- �׷��� �̷��� ����Ѵ�.
SELECT GETDATE();--������ INSERT �Ҷ� ���� ���� ���

SELECT YEAR(GETDATE()) AS '����⵵';
SELECT MONTH(GETDATE()) AS '�����';
SELECT DAY(GETDATE()) AS '���� ��¥';

--��ġ�Լ�
SELECT ABS(-100); --����
SELECT ROUND(3.141592,2); -- �Ҽ��� 2��° �ڸ����� ǥ��, 3��°���� �ݿø�
SELECT RAND();
SELECT FLOOR(RAND()*100); -- ����+����

--���Լ�
SELECT IIF(100>200,'�� ','����'); -- �ڵ����� ���̴µ� ȹ���� �� ����ؾ��Ѵ�.
