--tblMember ���̺� ����
drop table tblMember;

--tblMember ���̺� ����
CREATE TABLE tblMember (
    num NUMBER PRIMARY KEY NOT NULL,
    name VARCHAR2(10),
    age NUMBER,
    addr VARCHAR2(50),
    tel VARCHAR2(20)
);

--������ ���ڵ� ����
INSERT INTO tblMember (num, name, age, addr, tel)
	VALUES (1, 'ȫ�浿', 30, '���ֽ� ���� �󼺵�', '010-1111-1111');
	
INSERT INTO tblMember (num, name, age, addr, tel)
	VALUES (2, '�ڹ���', 33, '���ֽ� ���� ���̵�', '010-2222-2222');
	
--��ü ���ڵ� �˻�
search * from tblMember;	

--Ŀ�� ���
commit;