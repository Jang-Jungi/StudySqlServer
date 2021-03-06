BEGIN TRAN
UPDATE userTBL SET addr = '제주' WHERE userID = 'KBS'
COMMIT

BEGIN TRAN
UPDATE userTBL SET addr = '미국' WHERE userID = 'KKH'
ROLLBACK

BEGIN TRAN
UPDATE userTBL SET addr = '호주' WHERE userID = 'JYP'
COMMIT

USE sampleDB
GO

CREATE TABLE testTbl (num INT);
GO
INSERT INTO testTbl VALUES (1),(3),(5)

BEGIN TRAN 
UPDATE testTbl SET num= 11 WHERE num=1;
UPDATE testTbl SET num= 33 WHERE num=3;
UPDATE testTbl SET num= 44 WHERE num=5;
COMMIT
ROLLBACK

SELECT *FROM testTBL;

SELECT @@TRANCOUNT;