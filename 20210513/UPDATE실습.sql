--UPDATE
--WHERE���� ������ ����! ���� �����Ͱ� ���� �ٲ� 
--Ʈ����� ����
BEGIN TRAN; -- TRANSACTION�� �� TRAN���� ���̾�

UPDATE testTbl
   SET userName = '�����'
 WHERE ID = 2;

 UPDATE testTbl
   SET userName = '�����'
     , addr ='�λ�'
 WHERE ID = 4;


SELECT * FROM testTbl;

COMMIT;
ROLLBACK;

--������ ���θ� �����ϰ� 
--INDEX ���� 1���� �ٽý��� DELETE�� INDEX �ʱ�ȭ X
TRUNCATE TABLE testTbl;

