--����
BEGIN TRAN;

SELECT * FROM testTBL;

--������ �Է�
INSERT INTO testTBL
VALUES ('�ֿ��','ĳ��')

--������ ����
UPDATE testTBL
   SET userName = '������'
     , addr = '����'
 WHERE ID = 8;

 --������ ����
 DELETE FROM testTBL
  WHERE userName= 'ȫ�浿'


COMMIT;
ROLLBACK;