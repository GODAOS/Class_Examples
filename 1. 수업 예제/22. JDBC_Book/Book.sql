--tblBook ���̺� ����
CREATE TABLE tblBook(
    num NUMBER PRIMARY KEY NOT NULL,
    title VARCHAR2(30),
    company VARCHAR2(20),
    name VARCHAR2(10),
    cost NUMBER
);

--������ ���ڵ� ����
INSERT INTO tblBook VALUES(1, 'JAVA', '�Ѻ�', '������', 27000);
INSERT INTO tblBook VALUES(2, 'JSP', '������', '������', 30000);

--��ü ���ڵ� �˻�
SELECT * from tblBook;

--Ŀ��
COMMIT;