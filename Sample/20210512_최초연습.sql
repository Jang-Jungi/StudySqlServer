--조회 명령문
SELECT memberID,memberName
  FROM memberTBL
  WHERE memberID = 'Sang' ;

--입력 명령문
SELECT productName, cost, company FROM productTBL;
INSERT INTO memberTBL
VALUES('Bang', '방문식', '부산시 진구');