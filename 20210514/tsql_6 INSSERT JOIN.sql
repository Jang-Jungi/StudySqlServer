--JOIN 2�� �̻��� ���̺��� ���ļ� �۾��ϴ� ��p.303
SELECT * FROM buyTbl;
SELECT * FROM userTbl;

--�� ���̺��� ���� ������ ���̺��� ������ش�.
SELECT u.userID
     , u.name
     , CONCAT(u.mobile1, u.mobile2)AS [��ȭ��ȣ]
     , u.addr
     , b.num
     , b.prodName
     , b.price
     , b.amount
  FROM userTbl AS u  -- userTbl�� u�� ������ �θ��ڴ�~~
 INNER JOIN buyTbl AS b
    ON u.userID = b.userID
 WHERE u.userID = 'JYP';