--통합
BEGIN TRAN;

SELECT * FROM testTBL;

--데이터 입력
INSERT INTO testTBL
VALUES ('최우식','캐낟')

--데이터 수정
UPDATE testTBL
   SET userName = '이지은'
     , addr = '서울'
 WHERE ID = 8;

 --데이터 삭제
 DELETE FROM testTBL
  WHERE userName= '홍길동'


COMMIT;
ROLLBACK;