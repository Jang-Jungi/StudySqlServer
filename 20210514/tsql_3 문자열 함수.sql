--���ڿ� �Լ� p.287
SELECT ASCII('A'), CHAR(66);-- ���� ��
SELECT UNICODE('��'),NCHAR(44033);

--���ڿ� �����Լ�
SELECT CONCAT('SQL','SERVER',2019) AS [NAME] -- ���� ߾
SELECT 'SQL'+'SERVER'+CAST(2019 AS VARCHAR); -- ������ ��� CONCAT ���

--���ڿ� ������ �ܾ��� ������ġ
SELECT CHARINDEX('world', 'Hello world');
--C#,JAVA,PYTHON�� ���ڿ��� 0���� ����
--DB������ 1���� ����

--LEFT, RIGHT, SUBSTRING, LEN, LOWER, UPPER, LTRIM, RTRIN 
DECLARE @STR VARCHAR(20); -- ���� ߾߾߾
SET @STR ='SQL SERVER 2019'
SELECT LEFT(@STR,3) , RIGHT(@STR,4) 

SELECT SUBSTRING ('���ѹα�����',5,2); -- ������� �ܾ �����ϰ� ���� �� 

SELECT LEN('Hello world'); -- ���� ���̼��� �� �� ���
SELECT LEN('���ѹα�����');

SELECT LOWER('hELLO World'); -- �ҹ��ڷ� ��ȯ
SELECT UPPER('hELLO World'); -- �빮�ڷ� ��ȯ

--���� ����
SELECT '         SQL    ', LTRIM('         SQL    '); -- ���� ���� ���� / ���� ��
SELECT '         SQL    ', RTRIM('         SQL    '); -- ������ ���� ���� / ���� ��
SELECT '         SQL    ', TRIM('         SQL    '); --���� ���� ���� / ���� ��߾

--REPLACE �Լ�/ ���� ��߾
SELECT REPLACE('SQL SERVER 2019, SERVER �̸��ٲٱ�', 'server', '����'); -- ������ ��� ���� �ٲܶ�

--STR / ���� �� --> CAST, CONVERT, PARSE�� �۾��ϼ���
SELECT STR (3.141592);
SELECT STR(45);

--FORMAT / ���� ߾
SELECT GETDATE();
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss '); --�ѱ���
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy hh:mm:ss '); --�̱���
