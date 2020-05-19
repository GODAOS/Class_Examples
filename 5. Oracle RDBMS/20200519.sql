--DDL(Data Definition Language)  - �� AUTO COMMIT;
--CREATE, ALERT, DROP, TRUNCATE, RENAME

--* ������ Ÿ�� : ����, ����, ��¥
--���� : CHAR, VARCHAR2
--  CHAR(n) - ���� ���� : ������ �����ŭ �޸𸮸� Ȯ��
--  CHAR(10) - �޸𸮸� 10����Ʈ Ȯ���� �� ����
--           - abcd______                
--  VARCHAR2(n) - ���� ���� �� �����͸� ������ �� �޸𸮸� Ȯ���Ѵ�. �ִ� 4000����Ʈ
--  VARCHAR2(30) - abcd

--���� : NUMBER
--  NUMBER(n) - ���� ������
--  NUMBER(n, p) - �ε� �Ҽ��� ������

--��¥ : DATE

--1. ���̺� ����
--CREATE TABLE ���̺� ����
CREATE TABLE temp (
id NUMBER(4),
name VARCHAR2(30)
);

--temp ���̺� ������ ���� ����
--id�� 100, name�� ȫ�浿
INSERT INTO temp VALUES (100, 'ȫ�浿');

--id�� 101, name�� �̼���
INSERT INTO temp VALUES (101, '�̼���');

--temp ���̺��� 101���� �̸��� ȫ���� �ٲ۴�.
UPDATE temp SET name = 'ȫ��' WHERE id = 101;

SELECT * FROM temp;

COMMIT;

--�� �ٸ� ���̺��� ������ �����ؼ� ���� �� CTAS
--CTAS(Create Table As Select) : NOT NULL �̿��� ���� ����(Primary Ű ��)�� ������� �ʴ´�.

--CREATE TABLE ���̺�� AS ��ȸ ������(SELECT ��);
--employees ���̺��� 60�� �μ��� ���, ��, �̸�, �޿�, �Ի� ���ڸ� �����ؼ� emp60 ���̺� �����ϱ�
CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE department_id = 60;

SELECT * FROM emp60;

--�� ������ �����ϰ� ���������� �����ؿ��� ���� ���·� ���̺� �����ϱ�
CREATE TABLE emp40 AS
SELECT employee_id emp_id, last_name, first_name, salary, hire_date
FROM employees
WHERE 1 = 2;

SELECT * FROM emp40;

----------------------------------------------------------------------------------------------------------------
--2. ���̺� ���� ���� - ALTER
--1) Į�� �߰�
--ALTER TABLE ���̺��
--ADD (Į����1 ������ Ÿ��, Į����2 ������ Ÿ��, ...);

--temp ���̺� ���� 8�ڸ��� ���� salary Į���� �߰�����
ALTER TABLE temp ADD (salary NUMBER(8));    -- Default�� null

DESC temp;

--101�� �ڵ��� �޿��� 3000���� �����Ѵ�.
UPDATE temp
SET salary = 3000
WHERE id = 101;

SELECT * FROM temp;

--2) ������ Ÿ�� ������ ����
--ALTER TABLE ���̺��
--MODIFY (Į���� ������ Ÿ��(�� ������));

--temp ���̺��� salary Į���� ����� ���� 10���� �����Ѵ�.
ALTER TABLE temp
MODIFY (salary NUMBER(10));

DESC temp;

--3) Į�� ����
--ALTER TABLE ���̺��
--DROP COLUMN Į����;

--temp ���̺��� salary Į�� �����Ѵ�.

ALTER TABLE temp
DROP COLUMN salary;

DESC temp;

--4) Į���� ����
--ALTER TABLE ���̺��
--RENAME COLUMN ���� Į���� TO �� Į����;

--temp ���̺��� id Į������ temp_id�� �����Ѵ�.
ALTER TABLE temp
RENAME COLUMN id TO temp_id;

DESC temp;

--3. ������ �� ���� : TRUNCATE - ������ ��� �Ұ�
--TRUNCATE TABLE ���̺� �� -- ������ ����� �������� ��� ����
DELETE FROM temp;

ROLLBACK; -- DML�� ROLLBACK ����

TRUNCATE TABLE temp;
SELECT * FROM temp;

--DELETE, TRUNCATE, DROP ������
--DELETE : ������ ����, �뷮 ���پ��, ���ϴ� �����͸� ���� ����, �ѹ� ����
--TRUNCATE : �뷮 �پ��, �ε��� �� ��� ����, ���̺��� �������ΰ� �����͸� ����, ���� �Ұ���
--DROP : ���̺� ��ü�� ����, ����, ��ü�� �����Ѵ�, ���� �Ұ���

--5. ���̺�� ���� : RENAME
--RENAME �������̺�� TO �����̺��;
--temp ���̺���� test�� �����Ѵ�.
RENAME temp TO test;
DESC test;

----------------------------------------------------------------------------------------------------------------
--�ع��Ἲ ���� ����(INTEGRITY CONSTRAINT) - ��Ȯ��, ���Ἲ�� �����ϱ� ���� ��
--NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY 5������ ����
--���� ������ ���̺� ���� �ÿ� �����Ҽ� �ְ� ���̺� ���� �� �߰��� ���� ����.

--1. NOT NULL : ������ ���� �ݵ�� ��� �־�߸� �ϴ� ����
--NOT NULL�� ���̺� ���� ���� ������� ���� ���ϰ� ���̺� ���� �� �߰��� ������
-- - ���̺� ���� �� NOT NULL ����
DROP TABLE emp PURGE;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8)
);

DESC emp;

--���� ����
INSERT INTO emp VALUES (100, 'ȫ�浿', NULL); -- ���������� ���� ��

COMMIT;

SELECT * FROM emp;

INSERT INTO emp VALUES (101, '', NULL); -- ���� �߻�

------------------------------------------------------------------------------------------------------------------------------
--���� ���� ���� Ȯ�� ���� ���̺�
--���� ������ �ִ� ���̺� ��ȸ : USER_CONS_COLUMNS
--      ���� ���� �� : constraint_name / Į���� : column_name
--���� ���� ��ȸ : USER_CONSTRAINTS
DESC USER_CONSTRAINTS;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; -- ���̺� ���� �빮�ڿ��� �۵��� �ȴ�.

------------------------------------------------------------------------------------------------------------------------------
--���̺� ���� �� NOT NULL ����
--ALTER TABLE ��ɹ��� ����Ѵ�.
--Į���� NULL �����Ͱ� ���� ��쿡�� NOT NULL �߰��� �����ϴ�.
--��, �����Ͱ� �־�� NOT NULL �߰� ����
UPDATE emp
SET salary = 1000
WHERE id = 100;

SELECT * FROM emp;

ALTER TABLE emp
MODIFY (salary NOT NULL, name NULL);

DESC emp;

--���� ���Ǽ��� - COLUMN ����, TABLE ����
--2. CHECK : Ư�� ���ǿ� �´� ���� �����ϴ� ���� ���� - NULL ���
--���̺� ���� �� CHECK ����
DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3),
CONSTRAINT emp_gender_ck CHECK (gender IN('��', '��'))    -- ���� ���� �̸��� �����ϴ� ���� ���� ����.
);

DESC emp;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP';

--INSERT INTO emp VALUES(100, 'ȫ�浿', 5000, '��'); -- ���� �߻� '��'�� ���� ���ǿ� �ɸ�
INSERT INTO emp VALUES(100, 'ȫ�浿', 5000, '��');

SELECT * FROM emp;

--* ���̺� ���� �� CHECK ����
--�޿��� ���� 3000 �̻� 5000 ���ϸ� ������ �� �ֵ��� CHECK ���������� �����Ѵ�.
ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK(salary BETWEEN 3000 AND 5000);

UPDATE emp
SET salary = 5500   -- ������Ʈ �Ұ�
WHERE name = 'ȫ�浿';

--------------------------------------------------------------------
--�� ���� ���� ���� : ���� ������ ���� �Ұ����ϰ� ������ �����ϴ�
--ALTER TABLE ���̺��
--DROP CONSTRAINT ���� ���Ǹ�;

ALTER TABLE emp
DROP CONSTRAINT emp_salary_ck;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP';

--------------------------------------------------------------------
--�� ���� ���� �̸� ����
--ALTER TABLE ���̺��
--RENAME CONSTRAINT ���� ���Ǹ�1 TO ���� ���Ǹ�2;

ALTER TABLE emp
RENAME CONSTRAINT EMP_GENDER_CK TO EMP_GENDER_CK2;
--------------------------------------------------------------------------------------------------------------------------------
--3. UNIQUE - �����Ͱ� �ߺ����� �ʵ��� ���ϼ��� �����ϴ� ����, NULL ���
-- - ���̺� ���� �� UNIQUE ����
DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50),
CONSTRAINT emp_gender_ck CHECK(gender IN('��', '��')),
CONSTRAINT emp_salary_ck CHECK(salary BETWEEN 3000 AND 5000),
CONSTRAINT emp_email2_uk UNIQUE(email),
CONSTRAINT emp_email3_uk UNIQUE (name, email) -- ����Ű (���� ���� Į���� ���� �ϳ��� ���� ������ ����)
);

SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE LOWER(CONSTRAINT_NAME) LIKE '%emp%';