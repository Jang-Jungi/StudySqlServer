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

--����⵵�� ������������ �����϶�
SELECT * FROM userTbl
 ORDER BY birthYear ASC;
 --��������
SELECT * FROM userTbl
 ORDER BY birthYear DESC;

 ----------------------------------------------------------------------------------------------
--5/13�� �߰� ���� 

--1.������ ����� ��� SELECT INTO

--SELECT INTO  --> ���̺� ���翡 �ַ� ���ȴ�.
SELECT * INTO userTbl_New FROM userTbl;  --userTbl�� ������ userTbl_New ���̺��� ���� ����鼭 �����Ѵ�. (����� �� ���� ���ȴ�.)
--PK�� ���� X
SELECT * FROM userTbl_New

--���ϴ� ������ ��� ���
SELECT userID,name,addr INTO userTbl_Backup FROM userTbl
SELECT * FROM userTbl_Backup;

SELECT userID,name,addr INTO userTbl_Backup2 FROM userTbl
 WHERE addr = '����'; -- addr�� ������ ����� ID, name, addr����
SELECT * FROM userTbl_Backup2;

