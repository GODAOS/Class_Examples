--4. PRIMARY KEY : ������ ���� ��ǥ�ϵ��� �����ϰ� �ĺ��ϱ� ���� ���� ����
--NOT NULL + UNIQUE�� ����
--PK, ��Ű, �⺻Ű, �ĺ��� - ���̺�� �� ���� ���� ����

DROP TABLE emp;

--���̺� ���� �� PRIMARY KEY ����
CREATE TABLE emp (
id NUMBER(4),
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50),
CONSTRAINT emp_gender_ck CHECK(gender IN('��', '��')),
CONSTRAINT emp_salary_ck CHECK(salary BETWEEN 3000 AND 5000),
CONSTRAINT emp_email2_uk UNIQUE(email),
CONSTRAINT emp_email3_uk UNIQUE(name, email), --����Ű
CONSTRAINT emp_id_pk PRIMARY KEY(id)
);

--5. FOREIGN KEY : �θ� ���̺��� Į���� �����ϴ� �ڽ� ���̺��� Į��, NULL ���
--FK, �ܷ�Ű, ����Ű
--Į�� ����, ���̺� �������� �����ϰ� ����Ű�� ������ �� �ִ�.
--�����Ǵ� Į���� �� ���̺��� PK�̾�� �Ѵ�.

-- * Į�� ���� ����
--  - Į���� ������Ÿ�� REFERENCES �θ����̺� (�����Ǵ�Į����)
--  - Į���� ������Ÿ�� CONSTRAINT �������Ǹ� REFERENCES �θ����̺� (�����Ǵ�Į����)

DROP TABLE emp;

--���̺� ���� �� FOREIGN KEY ����
CREATE TABLE emp (
id NUMBER(4),
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50),
dept_id NUMBER(4),
CONSTRAINT emp_gender_ck CHECK(gender IN('��', '��')),
CONSTRAINT emp_salary_ck CHECK(salary BETWEEN 3000 AND 5000),
CONSTRAINT emp_email2_uk UNIQUE(email),
CONSTRAINT emp_email3_uk UNIQUE(name, email), --����Ű
CONSTRAINT emp_id_pk PRIMARY KEY(id),
CONSTRAINT emp_dept_id_fk FOREIGN KEY(dept_id) REFERENCES departments(department_id) -- departments ���̺��� PK
);

----------------------------------------------------------------------------------------------
--�� VIEW (��)
--  - ������ �����Ͱ� �����ϴ� ��ü�� �ƴϴ�.
--  - ���̺��� �����͸� �並 ���� �����Ѵ�.
--      1. ���� - ���� ����
--      2. ������ �������� �ܼ��� ���������� ����� �� �ִ�.

--�� �� ����
--CREATE VIEW ��� AS ������;

--60�� �μ��� ���� ��ȸ
CREATE VIEW view_60 AS
    SELECT employee_id, last_name ||' '|| first_name name, department_id, job_id, hire_date, email
    FROM employees
    WHERE department_id = 60;

SELECT * FROM view_60; -- �� �����Ǿ� ���� ����

--�� �� ����
--DROP VIEW ���;
DROP VIEW view_60;

SELECT * FROM view_60; -- view_60�� �����Ǿ� ���� �߻�
----------------------------------------------------------------------------------------------
--�� SEQUENCE : �������� ���ڸ� ������ִ� ��ü 
CREATE SEQUENCE emp_seq
START WITH 200
INCREMENT BY 1;

--������ ���� ���� : CURRVAL, NEXTVAL
SELECT emp_seq.NEXTVAL FROM dual; -- ��ȸ�Ҷ����� 1�� ����
SELECT emp_seq.CURRVAL FROM dual; -- ���� ���� ��ȸ

--emp ���̺��� pk�� id Į���� �������� �����Ͽ� ���������� ���� �����Ѵ�.
INSERT INTO emp (id, name)
VALUES (emp_seq.NEXTVAL, 'ȫ�浿');

SELECT * FROM emp;