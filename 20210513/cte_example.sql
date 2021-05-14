--WITH,CTE P.234
WITH cte_summary(GRP,SUMM,DIV)
AS
(
	SELECT groupName AS GRP --����� '' [] �ʿ����
		 , SUM(price*amount)AS SUMM
		 , GROUPING_ID(groupName)AS DIV
	  FROM buyTbl
	 GROUP BY ROLLUP(groupName)
)

SELECT  -- SELECT ��ȭ ���� ���
	   IIF(DIV=0,GRP,'���հ�')AS [��ǰ�׷�1] -- IIF���� ����ϸ� �Ʒ� 3���� 1�ٷ� ��Ÿ�� �� �ִ�.
     , CASE DIV 
	   WHEN 0 THEN GRP 
	   WHEN 1 THEN '���հ�' END AS [��ǰ�׷�]  -- �̷������� ���� �۾��Ѵ�
     , SUMM AS [�׷캰 ���űݾ�]
	 --, DIV 
  FROM cte_summary;