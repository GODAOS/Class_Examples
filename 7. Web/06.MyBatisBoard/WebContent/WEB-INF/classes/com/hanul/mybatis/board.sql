--Eclipse�� DB ���� ���� �߻� �� �ذ� ���
--1. Eclipse ����
--2. workspace\.metadata\.plugins\org.eclipse.datatools.sqltools.result
--3. �ش� ������ ������ ���� ��Ų �� Eclipse ����

--���̺� ����
CREATE TABLE tblBoard(
    b_num NUMBER PRIMARY KEY NOT NULL,
    b_subject VARCHAR2(50),
    b_pwd VARCHAR2(20),
    b_content VARCHAR2(2000),
    b_writer VARCHAR2(20),
    b_date VARCHAR2(20),
    b_readcount NUMBER
);

--��ü ���ڵ� �˻�
SELECT * FROM tblBoard ORDER BY b_num DESC;

--�ڵ� ������ ���� : b_num �� b_num_seq ����
CREATE SEQUENCE b_num_seq START WITH 1;
--�������� �⺻������ 20�� ������ �־�����.
--1, 2, 3�� �����ص� 4, 5���� �����ϴ� ������ �ִ�.
--���̺��� �����ص� �������� ����ְ�, �� ���̺��� ����� ���� 20���� �༭ 21������ �����Ѵ�.


--������ ���ڵ� ����
INSERT INTO tblBoard VALUES(b_num_seq.nextval, 'subject', 'pwd', 'content', 'writer', sysdate, 0);
INSERT INTO tblBoard VALUES(b_num_seq.nextval, '�����ٶ󸶹ٻ�', 'pwd', 'content', '�����ٶ󸶹ٻ�', sysdate, 0);

--��ü ���ڵ� ����
DELETE FROM tblBoard;

--���̺� ����
DROP TABLE tblBoard;

--�ڵ� ���� �� ����
DROP SEQUENCE b_num_seq;

--Ŀ��
COMMIT;