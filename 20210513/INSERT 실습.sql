--데이터 변경
INSERT INTO testTbl VALUES ('홍길동', '서울');
INSERT INTO testTbl (userNAME, addr )VALUES ('설현', '서울');
INSERT INTO testTbl (userNAME) VALUES('아이유');
INSERT INTO testTbl (addr,userNAME) VALUES('세종','강형욱');
INSERT INTO testTbl (userNAME) VALUES('홍길순');


SELECT * FROM testTbl;

--DELETE FROM testTbl;

INSERT INTO userTbl ( userID,name,birthYear,addr)
VALUES ('IU','어른유',1993,'서울');

SELECT * FROM userTbl WHERE userID = 'IU'

INSERT INTO userTbl ( userID, name,birthYear,addr,height)
VALUES ('JJH','주지훈',1982,'신안',187 );

SELECT *FROM userTbl;