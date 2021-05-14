--WITH,CTE P.234
WITH cte_summary(GRP,SUMM,DIV)
AS
(
	SELECT groupName AS GRP --영어면 '' [] 필요없음
		 , SUM(price*amount)AS SUMM
		 , GROUPING_ID(groupName)AS DIV
	  FROM buyTbl
	 GROUP BY ROLLUP(groupName)
)

SELECT  -- SELECT 심화 내용 언급
	   IIF(DIV=0,GRP,'총합계')AS [상품그룹1] -- IIF문을 사용하면 아래 3줄을 1줄로 나타낼 수 있다.
     , CASE DIV 
	   WHEN 0 THEN GRP 
	   WHEN 1 THEN '총합계' END AS [상품그룹]  -- 이런식으로 많이 작업한다
     , SUMM AS [그룹별 구매금액]
	 --, DIV 
  FROM cte_summary;