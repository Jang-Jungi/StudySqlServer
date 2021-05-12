--조회 명령문
SELECT memberID,memberName
  FROM memberTBL
  WHERE memberID = 'Sang' ;

--SELECT productName, cost, company FROM productTBL;

--입력 명령문
INSERT INTO memberTBL
VALUES('Bung', '벙문식', '부산시 진구') ;

SELECT * FROM memberTBL;