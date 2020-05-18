Query LANGUAGE : DML + TCL
DML(Data Manipulation Language) - INSERT, UPDATE, DELETE 
+ TCL(Transaction Control Language)�� �Բ� ��� :  COMMIT(�۾�Ȯ��) / ROLLBACK(�۾����)

1. �������� : INSERT 
1.1. INSERT INTO ���̺�� 
     VALUES ( ���̺� ���� ������ �´� �����Ͱ� ��� );
1.2. INSERT INTO ���̺��(�÷����� ����)   
     VALUES ( ������ �÷� ������ �´� �����Ͱ� ��� );
1.3. INSERT INTO ���̺�� 
     ��ȸ������( SELECT �� ); 
     �� ITAS : VALUE �� ���� SELECT �� ����� ���������� ���̺�κ��� ���� ������ ���� ���� ����
     INSERT ���� ������ �÷� ��ϰ� SELECT ���� �÷� ��� ������ ���ƾ� ��.
    
�������� ���� �÷����� �ڵ����� NULL �� ����
��¥ �����ʹ� ��¥ ���� ������ ����ؼ� ������ �� ����.

NULL�� ǥ�� : NULL, ''

DESC departments;
�̸�            ��?      ����           
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)  

1.1.  
INSERT INTO ���̺�� 
VALUES ( ���̺� ���� ������ �´� �����Ͱ� ��� );

�μ����̺� ���ο� �μ��� ����Ѵ�.
�μ��ڵ� : 300, �μ��� : ������, �μ����� : NULL, ��ġ�ڵ� : NULL

INSERT INTO departments
VALUES (300, '������', NULL, NULL);

SELECT * 
FROM departments 
ORDER BY 1 DESC;

COMMIT;

�μ����̺� ���ο� �μ��� ����Ѵ�.
INSERT INTO departments
VALUES (310, '���ߺ�', NULL, '' );

��� �������� �⺻ ��(DEFAULT)�� NULL
INSERT INTO departments
VALUES (320,'������', DEFAULT, DEFAULT);

ROLLBACK;

SELECT * 
FROM departments
ORDER BY 1 DESC;

1.2. 
INSERT INTO ���̺�� ( �÷���1, �÷���2, ... )
VALUES ( ������ �÷��� ��Ī�� �����Ͱ��� ��� );

INSERT INTO ���̺�� ( �����̺������� NOT NULL �� �÷� + �߰��÷���� )
VALUES ( ��õ� �÷��� ������� ��Ī�� �����͸�� );

DESC departments;

�μ����̺� ���ο� �μ��� ����Ѵ�.
INSERT INTO departments(department_id, department_name)
VALUES (310, '���ߺ�');

SELECT * 
FROM departments 
ORDER BY 1 DESC;

������̺� ���ο� ����� ��������.

DESC employees;

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, 
                     --************             ********** *****  **********
                       job_id, salary, department_id)
                     --******
VALUES (301,'�浿','ȫ','GILDONG','10/10/10','MK_REP',3000,300);

COMMIT;

SELECT * 
FROM employees 
ORDER BY 1 DESC;

��� �������� �⺻�� DEFAULT �� NULL �̴�.
���̺� ���������� NOT NULL �÷����� �ݵ�� ���� ��ƾ� ������ ���� ����ȴ�.

DESC departments;

INSERT INTO departments (department_id)
VALUES (330);  --�� ����Ұ�
���� ���� -
ORA-01400: cannot insert NULL into ("HR"."DEPARTMENTS"."DEPARTMENT_NAME")

1.3. �� ITAS
INSERT INTO ���̺�� 
��ȸ������( SELECT �� ); �� ITAS
�������� �ѹ��� ���� ���� : �׽�Ʈ�� ������

�μ����̺� ���ο� �μ�(�μ��ڵ忡 1 ���Ͽ�)�� �μ������� �����Ͽ� ���� ��������.
INSERT INTO departments
SELECT department_id+1, department_name, manager_id, location_id
FROM departments;

SELECT * FROM departments;
ROLLBACK;
SELECT * FROM departments;

-----------------------------------------------------------------------------------------------
�� ������ ���̺� �����뿡�� Ȯ��
SELECT * FROM RECYCLEBIN;

�� ������ ���̺� ����
FLASHBACK TABLE ���̺�� TO BEFORE DROP;

FLASHBACK TABLE temp TO BEFORE DROP;

�� ������ ����
PURGE RECYCLEBIN;
-----------------------------------------------------------------------------------------------
�� CTAS
CREATE TABLE emp AS --****NOT NULL �̿��� ��������(Primary Ű ��)�� ������� �ʴ´�.
SELECT employee_id id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE 1 = 2; --���͸� ���� �༭ ���̺� ������ ����

SELECT * FROM emp;

DESC employees;

�̸�             ��?       ����           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4)

DESC emp;

�̸�         ��?       ����           
---------- -------- ------------ 
ID                  NUMBER(6)    
LAST_NAME  NOT NULL VARCHAR2(25) 
FIRST_NAME          VARCHAR2(20) 
HIRE_DATE  NOT NULL DATE         
JOB_ID     NOT NULL VARCHAR2(10) 
DEPT_ID             NUMBER(4)

SELECT employee_id id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE department_id IN (10,20); --employees ���̺��� 10��, 20�� �μ����� ����

SELECT * FROM emp;

emp ���̺� ���������� ���������Ѵ�.
employees ���̺��� 10��, 20�� �μ������� ������ �����Ͽ� 
emp ���̺� ���������Ѵ�.

DESC emp;

INSERT INTO emp(id, last_name, first_name, hire_date, job_id, dept_id)
SELECT employee_id, last_name, first_name, hire_date, job_id, department_id
FROM employees
WHERE department_id IN (10,20);

SELECT * FROM emp;

COMMIT;

2. �������� - UPDATE : �������� �������� �ʵ��� �����Ѵ�.

UPDATE ���̺��
SET �÷���1 = �����Ͱ�1, �÷���2 = �����Ͱ�2,  ...
WHERE ������;
   
SELECT employee_id, last_name, department_id, salary
FROM employees;

SELECT * FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 MK_REP             20
                                                                   *******            **
emp ���̺��� id�� 202�� ����� �μ��ڵ带 30����, �����ڵ带 programmer�� �����Ѵ�.
UPDATE emp
SET dept_id = 30, job_id = 'progammer'
WHERE id = 202;

SELECT * FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 progammer          30 --�� *****

COMMIT;

emp ���̺��� id�� 202�� ����� �����ڵ带 PU_CLERK �� �����Ѵ�.

UPDATE emp
SET job_id = 'PU_CLERK' 
WHERE id = 202; 

COMMIT;

SELECT * FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 PU_CLERK           30

UPDATE emp
SET dept_id = '' --�μ��ڵ带 NULL ������ ����
WHERE id = 202;

SELECT * FROM emp;

COMMIT;

-----------------------------------------------------------------------------------------------
***���������� �������� ����
emp ���̺��� �μ���ġ ���� ���� ������� 
�μ��ڵ带 employees ���̺��� �����ڵ尡 AD_PRES �� ����� �μ��ڵ�� �����Ѵ�.

employees ���̺��� �����ڵ尡 AD_PRES �� ����� �μ��ڵ�
SELECT department_id    --90
FROM employees
WHERE job_id ='AD_PRES';

UPDATE emp
SET dept_id = ( SELECT department_id 
                FROM employees 
                WHERE job_id ='AD_PRES' )
WHERE dept_id IS NULL;

SELECT * FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 PU_CLERK           90

COMMIT;

employees ���̺���
301�� ����� �޿��� 4000����, �̸��� ��ġ, ���� �� ���� �����Ѵ�.

301����� �޿�, �̸�, ��
SELECT salary, first_name, last_name
FROM employees
WHERE employee_id = 301;

UPDATE employees
SET salary = 4000, first_name = '��ġ', last_name = '��'
WHERE employee_id = 301;

SELECT salary, first_name, last_name
FROM employees
WHERE employee_id = 301;

300�� �μ��� ���� ������� �޿��� 5000 ���� ���� ���� ����
SELECT employee_id, department_id, salary
FROM employees
WHERE department_id = 300;

UPDATE employees
SET salary = 5000
WHERE department_id = 300;

���ο� ��������� ������������
300������ ����� �����ϰ� �޿��� 60�� �μ��� ��ձ޿��� ��������.
( ��, employee_id, last_name, email, hire_date, job_id, salary
300, ȫ, hong@naver.com, ���ó�¥, IT_PROG, 60�� �μ��� ��� �޿� )

DESC employees;

�̸�             ��?       ����           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4) 

SELECT *
FROM employees;

INSERT INTO employees(employee_id, last_name, email, hire_date, job_id, salary)
VALUES (300, 'ȫ', 'hong@naver.com', SYSDATE, 'IT_PROG',
         ( SELECT ROUND(AVG(salary)) --5760
           FROM employees 
           WHERE department_id = 60 ) );

COMMIT;

300�� ����� �޿�
SELECT salary --5760
FROM employees
WHERE employee_id = 300; 



300�� ����� �޿��� �츮ȸ�� �ְ�޿���, ��ȭ��ȣ�� 062.1234.5678 �� ������������

DESC employees;

SELECT salary, phone_number
FROM employees
WHERE employee_id = 300;

    SALARY PHONE_NUMBER        
---------- --------------------
      5760                     

UPDATE employees
SET salary = ( SELECT MAX(salary) FROM employees ), 
    phone_number = '062.1234.5678'
WHERE employee_id = 300;

SELECT salary, phone_number
FROM employees
WHERE employee_id = 300;

    SALARY PHONE_NUMBER        
---------- --------------------
     24000 062.1234.5678       
     
COMMIT;

-----------------------------------------------------------------------------------------------
�ǽ�
1.emp ���̺��� 202�� ����� �Ի����ڸ� 
���÷κ��� 6������ ��¥�� �����Ѵ�.

SELECT * FROM emp;

UPDATE emp
SET hire_date = ADD_MONTHS(SYSDATE,-6)
WHERE id = 202;

SELECT * FROM emp;



2. emp ���̺��� 200�� ����� ���� 
employees ���̺��� 60�� �μ����� �� �ֱ� �Ի��� ����� �Ի����ڷ� �����Ѵ�.
UPDATE emp
SET hire_date = ( SELECT MAX(hire_date) 
                  FROM employees 
                  WHERE department_id = 60 ) --07/05/21
WHERE id = 200; 

SELECT * FROM emp;

COMMIT;

3. �������� ���� : DELETE - �������� �������� �ʵ��� �����Ѵ�.
DELETE FROM ���̺��
WHERE ������;

������̺��� 300�� ����ڵ带 ��������

SELECT * FROM employees;   

DELETE FROM employees
WHERE employee_id = 300;

COMMIT;

SELECT * FROM employees; 

�μ����̺��� 300�� �μ��� ��������

SELECT * FROM departments; 

DELETE FROM departments
WHERE department_id = 300;   
    --integrity constraint violated - child record found
    --���Ἲ ���� ���� ���� 
    
SELECT *
FROM employees
ORDER BY department_id DESC;

    
�׷���, ������̺��� 300�� �μ��� ��������
DELETE FROM employees
WHERE department_id = 300;

�׸��� ����, �μ����̺��� 300�� �μ��� ��������
DELETE FROM departments
WHERE department_id = 300; 
COMMIT;

SELECT * FROM departments; 

emp ���̺��� 20�� �μ������� ������ �����Ѵ�.
SELECT * FROM emp;

DELETE FROM emp
WHERE dept_id = 20;

SELECT * FROM emp;

COMMIT;
-----------------------------------------------------------------------------------------------

