SELECT * FROM userTbl;

--������ ��ȸ ���͸�
SELECT * FROM userTbl
 WHERE name ='�ٺ�Ŵ';

 --���� �ܾ� ã��
SELECT * FROM userTbl
 WHERE name LIKE  '%��%';

SELECT * FROM userTbl
 WHERE name LIKE  '%��%';

SELECT userID FROM userTbl
 WHERE name LIKE  '%��%';

--Ư�� ���̺� ���ڵ�(������) ����Ȯ��
SELECT COUNT(*) FROM userTbl;

--Ű�� 180 �̻��̰� ����⵵�� 1970���Ŀ� �¾ ��� ��ȸ
SELECT * FROM userTbl
 WHERE height>180 AND birthYear>1970;

 --����� ���̺��� Ű�� 180�̻��̰�
 --����⵵�� 1970�� ���Ŀ� �¾ �����
 --���̵�� �̸�, Ű�� ��ȸ�ϼ���
SELECT name, height, userID FROM userTbl
 WHERE height >180 AND birthYear>1970;