--UPDATE
--WHERE절을 빼먹지 말자! 빼면 데이터가 전부 바뀜 
--트랜잭션 시작
BEGIN TRAN; -- TRANSACTION이 길어서 TRAN으로 많이씀

UPDATE testTbl
   SET userName = '성명건'
 WHERE ID = 2;

 UPDATE testTbl
   SET userName = '성명건'
     , addr ='부산'
 WHERE ID = 4;


SELECT * FROM testTbl;

COMMIT;
ROLLBACK;

--데이터 전부를 삭제하고 
--INDEX 값도 1부터 다시시작 DELETE는 INDEX 초기화 X
TRUNCATE TABLE testTbl;

