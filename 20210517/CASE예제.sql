--������ �ݾ׿� ���� �ֿ��, ���, �Ϲ� ������ �з��ϴ�
--������ �ۼ��϶�

WITH cet_custlevel([����� ���̵�],[ȸ����],[�� ���űݾ�] ,[���з�])
AS
(
SELECT u.userID AS[����� ���̵�]
     , u.name AS[ȸ����]
	 , IIF(SUM(b.price*b.amount) IS NULL, 0
	 , SUM(b.price*b.amount))  AS [�� ���űݾ�] 
	 , CASE 
		WHEN SUM(b.price*b.amount)>1500 THEN '�� �����'
		WHEN SUM(b.price*b.amount)>1000 THEN '�����'
		WHEN SUM(b.price*b.amount)>1 THEN '�Ϲݰ�'
		ELSE '���ɰ�'
	   END AS [���з�]
  FROM userTbl AS u
  LEFT OUTER JOIN buyTbl AS b
    ON u.USERID = b. userID
 GROUP BY u.userID, u.name --- �����Լ��� GROUP BY �ʼ� , userID, name�� GROUP BY ������Ѵ�.
 --ORDER BY [�� ���űݾ�] DESC -- cte ���ο��� ���Ұ�
 )
 SELECT [����� ���̵�],[ȸ����] 
      , FORMAT([�� ���űݾ�], 'C4') AS [�� ���űݾ�] -- '#,#' 1000�������� ���� ����� 'C4' ��ȭ ǥ�� + 1000���� ǥ��
	  , [���з�]
   FROM cet_custlevel
  ORDER BY [�� ���űݾ�] DESC;