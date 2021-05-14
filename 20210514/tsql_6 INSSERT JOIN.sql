--JOIN 2개 이상의 테이블을 합쳐서 작업하는 것p.303
SELECT * FROM buyTbl;
SELECT * FROM userTbl;

--두 테이블을 묶은 가상의 테이블을 만들어준다.
SELECT u.userID
     , u.name
     , CONCAT(u.mobile1, u.mobile2)AS [전화번호]
     , u.addr
     , b.num
     , b.prodName
     , b.price
     , b.amount
  FROM userTbl AS u  -- userTbl을 u로 간단히 부르겠다~~
 INNER JOIN buyTbl AS b
    ON u.userID = b.userID
 WHERE u.userID = 'JYP';