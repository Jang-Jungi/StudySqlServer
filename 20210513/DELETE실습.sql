--DELETE
BEGIN TRAN;

DELETE FROM testTbl
 WHERE ID = 7;

 DELETE FROM testTbl
 WHERE addr = '????';
SELECT * FROM testTbl;

COMMIT;
ROLLBACK;