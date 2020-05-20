�� ���Ἲ ��������(INTEGRITY CONSTRAINT) - ��Ȯ��, ���ռ�, ���Ἲ�� �����ϱ� ���� ��.
���̺� �߸��� �������� �Է��� �������� ������ ��Ģ�� �����ϴ� ��

NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY 5���� ����
���������� ���̺� �����ÿ� ������ �� �ְ�, ���̺� ���� �� �߰��� ���� ����.

- NOT NULL : NULL�� �Է� ����
- UNIQUE : �ߺ��� �Է� ���� (NULL���� �ߺ��Է� ����)
- PRIMARY KEY : NOT NULL + UNIQUE
- FOREIGN KEY : �ٸ� ���̺��� �÷��� ��ȸ�ؼ� ���Ἲ �˻�
- CHECK : �������� ������ ���� �Է� ���


1. NOT NULL : ������ ���� �ݵ�� ��� �־�߸� �ϴ� ����
NOT NULL : �÷� ���� ���� ������θ� ����

- ���̺� ������ NOT NULL ����(�÷� ���� ���� ������θ� ����)
DESC emp;

DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8)
);

DESC emp;

�̸�     ��?       ����           
------ -------- ------------ 
ID     NOT NULL NUMBER(4)    
NAME   NOT NULL VARCHAR2(30) 
SALARY          NUMBER(8)


���� ��������
SELECT * 
FROM emp;

INSERT INTO emp 
VALUES (100, 'ȫ�浿', NULL);

COMMIT;

SELECT * 
FROM emp;

INSERT INTO emp 
VALUES (101, '', NULL); --�� NOT NULL �� NULL �����ϹǷ� ����
------------------
cannot insert NULL

===============================================================================================
-----------------------------------------------------------------------------------------------
������������ Ȯ�� ���� ���̺� - USER_CONSTRAINTS, USER_CONS_COLUMNS ���̺�
-----------------------------------------------------------------------------------------------
���������� �ִ� �÷���(COLUMN_NAME) Ȯ�����̺� : USER_CONS_COLUMNS ���̺�
-----------------------------------------------------------------------------------------------
�������Ǹ� : CONSTRAINT_NAME, �÷��� : COLUMN_NAME
-----------------------------------------------------------------------------------------------

***�������� ��ȸ : USER_CONSTRAINTS ���̺��� ��ȸ
-----------------------------------------------------------------------------------------------
DESC USER_CONSTRAINTS;

�̸�                ��?       ����            
----------------- -------- ------------- 
OWNER                      VARCHAR2(120) 
CONSTRAINT_NAME   NOT NULL VARCHAR2(30)  
CONSTRAINT_TYPE            VARCHAR2(1)   
TABLE_NAME        NOT NULL VARCHAR2(30)  
SEARCH_CONDITION           LONG          
R_OWNER                    VARCHAR2(120) 
R_CONSTRAINT_NAME          VARCHAR2(30)  
DELETE_RULE                VARCHAR2(9)   
STATUS                     VARCHAR2(8)   
DEFERRABLE                 VARCHAR2(14)  
DEFERRED                   VARCHAR2(9)   
VALIDATED                  VARCHAR2(13)  
GENERATED                  VARCHAR2(14)  
BAD                        VARCHAR2(3)   
RELY                       VARCHAR2(4)   
LAST_CHANGE                DATE          
INDEX_OWNER                VARCHAR2(30)  
INDEX_NAME                 VARCHAR2(30)  
INVALID                    VARCHAR2(7)   
VIEW_RELATED               VARCHAR2(14) 
-----------------------------------------------------------------------------------------------
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; --���̺���� �빮�ڸ� ����

OWNER   CONSTRAINT_NAME CONSTRAINT_TYPE TABLE_NAME  SEARCH_CONDITION   R_OWNER R_CONSTRAINT_NAME DELETE_RULE STATUS  DEFERRABLE     DEFERRED  VALIDATED GENERATED      BAD    RELY   LAST_CHANGE INDEX_OWNER  INDEX_NAME INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- -------- ------------------------------ ------------------------------ ------- --------------
HR	    SYS_C007560	    C	            EMP	        "ID" IS NOT NULL   (null)  (null) ENABLED	 (null)      (null)  NOT DEFERRABLE	IMMEDIATE VALIDATED	GENERATED NAME (null) (null) 20/05/19	 (null)       (null)     (null)  (null) 			
HR	    SYS_C007561	    C	            EMP	        "NAME" IS NOT NULL (null)  (null) ENABLED	 (null)      (null)  NOT DEFERRABLE	IMMEDIATE VALIDATED	GENERATED NAME (null) (null) 20/05/19	 (null)		  (null)	 (null)  (null)

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE LOWER(TABLE_NAME) = 'emp'; 

CONSTRAINT_NAME          CONSTRAINT_TYPE    SEARCH_CONDITION
-------------------------------------------------------------
SYS_C007117              C                  "ID" IS NOT NULL
SYS_C007118              C                  "NAME" IS NOT NULL

DESC USER_CONS_COLUMNS;

�̸�              ��?       ����             
--------------- -------- -------------- 
OWNER           NOT NULL VARCHAR2(30)   
CONSTRAINT_NAME NOT NULL VARCHAR2(30)   
TABLE_NAME      NOT NULL VARCHAR2(30)   
COLUMN_NAME              VARCHAR2(4000) 
POSITION                 NUMBER 

SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'EMP'; 

OWNER    CONSTRAINT_NAME    TABLE_NAME   COLUMN_NAME  POSITION
--------------------------------------------------------------
HR	     SYS_C007560	    EMP	         ID	           (nulll)
HR	     SYS_C007561	    EMP	         NAME	       (nulll)


����Ŭ CONSTRAINT_TYPE
    C  :  �˻�Ű   CHECK - Ư�� ���ǿ� �´� ���� �����ϴ� ���� ���� - NULL ���
    P  :  �⺻Ű
    R  :  �ܷ�Ű
    U  :  ����Ű

SELECT CONSTRAINT_NAME, COLUMN_NAME
FROM USER_CONS_COLUMNS
WHERE LOWER(TABLE_NAME)='emp';

CONSTRAINT_NAME  COLUMN_NAME
-----------------------------
SYS_C007117	     ID
SYS_C007118	     NAME

USER_CONS_COLUMNS ���̺��� EMP ���̺���
�������Ǹ�, �÷���, ������������(CONSTRAINT_TYPE) ��ȸ
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM USER_CONSTRAINTS
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM USER_CONS_COLUMNS c
WHERE LOWER(TABLE_NAME) = 'emp'; --�̵��� �Ұ�

DESC emp;

�̸�   ��?         ����           
------ -------- ------------ 
ID     NOT NULL     NUMBER(4)    
NAME   NOT NULL     VARCHAR2(30) 
SALARY              NUMBER(8)    
===============================================================================================


- ���̺� ���� �� NOT NULL ����
***ALTER TABLE ��ɹ��� ����Ѵ�.
�÷��� NULL �����Ͱ� ���� ��� NOT NULL �� �߰��� �� �ִ�.
��, �����Ͱ� �־�� NOT NULL �߰�

NULL ���� �ִ� �÷��� UPDATE ������ NULL �� �����ְ� 
ALTER TABLE �� ����

salary �� NULL -> NOT NULL �� ����
name �� ������ NOT NULL -> NULL �� ����

SELECT * 
FROM emp;

ID  NAME     SALARY
---- --------- ----------
100 ȫ�浿	 (null)	              

UPDATE emp 
SET salary = 1000
WHERE ID = 100;

SELECT * 
FROM emp;

DESC emp;

-------------------------------------------------
ALTER TABLE emp
MODIFY (salary NOT NULL, name NULL);
-------------------------------------------------

DESC emp;

�̸�          ��?      ����           
------ -------- ------------ 
ID          NOT NULL    NUMBER(4)    
NAME                    VARCHAR2(30) 
SALARY      NOT NULL    NUMBER(8)    

-----------------------------------------------------------------------------------------------
*�������ǿ� �̸� �����ϱ�
�̸��� �������� ������ �ڵ����� �����Ǵµ� 
���߿� ���������� ��Ȱ��ȭ�ϰų� �����ϴ� ���� ������ ���ؼ��� 
�������ǿ� �̸��� �������ִ� ���� ����. 
-----------------------------------------------------------------------------------------------

�������Ǽ��� - COLUMN ����, TABLE ����

1. �÷������� �������� ��� ���
-----------------------------------------------------------------------------------------------
�÷��� Ÿ�� CONSTRAINT �������ǰ�(���̺��_�÷�_���) ��������

CREATE TABLE ���̺��
�÷��� Ÿ�� CONSTRAINT �������Ǹ�(���̺��_�÷�_���) ��������,
....
....
);
-----------------------------------------------------------------------------------------------
DROP TABLE emp09

CREATE TABLE emp09(
empno  NUMBER(4)    CONSTRAINT EMP09_EMPNO_PK   PRIMARY KEY,
ename  VARCHAR2(15) CONSTRAINT EMP09_ENAME_NN   NOT NULL,
job    VARCHAR2(15) CONSTRAINT EMP09_JOB_UN     UNIQUE,
deptno NUMBER(2)    CONSTRAINT EMP09_DEPTNO_FK  REFERENCES dept(deptno),
gender VARCHAR2(1)  CONSTRAINT EMP09_GENDER_CK  CHECK( gender IN('M','F') )
);
-----------------------------------------------------------------------------------------------
2. ���̺� ������ �������� ������
-----------------------------------------------------------------------------------------------
����Ű ������ �� ���� �ݵ�� ���̺� ������ ���������� �����ؾ� �Ѵ�.
***���������� �߰��� ���� ���̺� ������ ���������� �����ؾ� �Ѵ�.
-----------------------------------------------------------------------------------------------
CONSTRAINT �������ǰ�(���̺��_�÷�_���) ��������

CREATE TABLE ���̺��
�÷��� Ÿ��,
....
CONSTRAINT �������Ǹ�(���̺��_�÷�_���) ��������,
....
);
-----------------------------------------------------------------------------------------------
DROP TABLE emp09;
 
CREATE TABLE emp09(
empno  NUMBER(4),
ename  VARCHAR2(15) CONSTRAINT EMP09_ENAME_NN  NOT NULL,
job    VARCHAR2(15),
deptno NUMBER(2),
gender VARCHAR2(1),
CONSTRAINT EMP09_EMPNO_PK  PRIMARY KEY(empno),
CONSTRAINT EMP09_JOB_UN    UNIQUE(job),
CONSTRAINT EMP09_DEPTNO_FK FOREIGN KEY(deptno) REFERENCES dept(deptno),
CONSTRAINT EMP09_GENDER_CK CHECK( gender IN('M','F') )
); 
-----------------------------------------------------------------------------------------------

2. CHECK - Ư�� ���ǿ� �´� ���� �����ϴ� ���� ���� - NULL ���

- ���̺� ���� �� CHECK ����
DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3),
CONSTRAINT emp_gender_ck CHECK( gender IN ('��','��') )
);

DESC emp;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

SELECT * 
FROM emp;

INSERT INTO emp 
VALUES(100, 'ȫ�浿', 5000, '��');

INSERT INTO emp 
VALUES(101, 'ȫ���', 5000, '��'); -- ����Ұ�
--check constraint (HR.EMP_GENDER_CK) violated �� �����ϴ�, ����

SELECT * 
FROM emp;

***�������Ǹ�(CONSTRAINT_NAME)�� gender�� salary �� ����
-----------------------------------------------------------------------------------------------
DROP TABLE test;

CREATE TABLE test (
  name VARCHAR2(10) NOT NULL,
  gender VARCHAR2(10) NOT NULL CHECK ( gender IN ('����','����') ),
  salary number(8),
  dept_id number(4),
  CONSTRAINT test_salary_ck CHECK ( salary > 2000 )   
);

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TEST'; 
-----------------------------------------------------------------------------------------------

�� ���̺� ���� �� CHECK ���� �� �߰��� ���̺� ������ ����
-----------------------------------------------------------------------------------------------
�޿��� ���� 3000 �̻� 5000 ���ϸ� ������ �� �ֵ��� CHECK ���������� �����Ѵ�.
ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 );
-----------------------------------------------------------------------------------------------

USER_CONS_COLUMNS ���̺��� EMP ���̺���
�������Ǹ�, �÷���, ������������(CONSTRAINT_TYPE) ��ȸ
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM USER_CONSTRAINTS
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM USER_CONS_COLUMNS c
WHERE LOWER(TABLE_NAME) = 'emp';

SELECT * 
FROM emp;

UPDATE emp
SET salary = 5500   -- ������Ʈ �Ұ� (salary BETWEEN 3000 AND 5000�̹Ƿ�)
WHERE name = 'ȫ�浿'; 

CHECK CONSTRAINT (HR.EMP_GENDER_CK) violated

-----------------------------------------------------------------------------------------------
�� �������� ���� --���������� ���� �Ұ���. �߰��ϰų� ������ ����!!
ALTER TABLE ���̺��
DROP CONSTRAINT �������Ǹ�;

ALTER TABLE emp
DROP CONSTRAINT emp_salary_ck;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 6000 );
-----------------------------------------------------------------------------------------------
�� �������� �̸� ����
ALTER TABLE ���̺��
RENAME CONSTRAINT �����������Ǹ� TO �ٲ��������Ǹ�;

ALTER TABLE emp
RENAME CONSTRAINT EMP_GENDER_CK TO EMP_GENDER_CK2;
-----------------------------------------------------------------------------------------------

3. UNIQUE - �����Ͱ� �ߺ����� �ʵ��� ���ϼ��� �����ϴ� ���� - NULL ���
�÷� ����, ���̺� �������� �����ϰ� ����Ű ������ �� �ִ�.
�������� �÷��� ���� �ϳ��� ���������� ������ �� �ִ� : ����Ű

- ���̺� ���� �� UNIQUE ����

DROP TABLE emp purge;

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50) /* CONSTRAINT emp_email_uk UNIQUE 
                      employees ���̺��� email �÷���
                      emp_email_uk �̹� �����ؼ� �ߺ� �Ұ�*/ , 
CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 ),
CONSTRAINT emp_gender_ck CHECK( gender IN ('��','��') ),
CONSTRAINT emp_email2_uk UNIQUE( email ),
CONSTRAINT emp_email3_uk UNIQUE( name, email ) --����Ű
);

SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE LOWER(CONSTRAINT_NAME) = 'emp_email_uk'; --employees ���̺� ������

DESC USER_CONSTRAINTS;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

�������� �÷��� ���� �ϳ��� ���������� ������ �� �ִ� : ����Ű
å ���� : 83������

4. PRIMARY KEY : ������ ���� ��ǥ�ϵ��� �����ϰ� �ĺ��ϱ� ���� ���� ����
- NOT NULL + UNIQUE �� ����
- PK , ��Ű, �⺻Ű, �ĺ��� - ���̺�� �� ���� ���� ����
- �ֹι�ȣ, ���, �й�,...
- �÷� ����, ���̺� �������� �����ϰ� ����Ű�� ������ �� �ִ�.
-----------------------------------------------------------------------------------------------
- �÷� ���� ����
�÷��� ������Ÿ�� PRIMARY KEY
�÷��� ������Ÿ�� CONSTRAINT �������Ǹ� PRIMARY KEY

- ���̺� ���� ����
CONSTRAINT �������Ǹ� PRIMARY KEY ( �÷��� )
-----------------------------------------------------------------------------------------------
DESC emp;

DROP TABLE emp;

- ���̺� ���� �� PRIMARY KEY ����
CREATE TABLE emp (
id NUMBER(4) /* CONSTRAINT emp_id_pk PRIMARY KEY */,
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50) /* CONSTRAINT emp_email2_uk UNIQUE */ 
                      /* CONSTRAINT emp_email_uk UNIQUE 
                      employees ���̺��� email �÷���
                      emp_email_uk �̹� �����ؼ� �ߺ� �Ұ�*/, 
CONSTRAINT emp_id_pk     PRIMARY KEY( id ),
CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 ),
CONSTRAINT emp_gender_ck CHECK( gender IN ('��','��') ),
CONSTRAINT emp_email2_uk UNIQUE( email ),
CONSTRAINT emp_email3_uk UNIQUE( name, email ) --����Ű
);

DESC emp;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

5. FOREIGN KEY : �θ����̺��� �÷��� �����ϴ� �ڽ����̺��� �÷�, NULL ���
- FK, �ܷ�Ű, ����Ű
�÷� ����, ���̺� �������� �����ϰ� ����Ű�� ������ �� �ִ�.
-----------------------------------------------------------------------------------------------
- �÷� ���� ����
�÷��� ������Ÿ�� REFERENCES �θ����̺� ( �����Ǵ��÷��� )
�÷��� ������Ÿ�� CONSTRAINT �������Ǹ� REFERENCES �θ����̺� ( �����Ǵ��÷��� )

- ���̺� ���� ����
CONSTRAINT �������Ǹ� FOREIGN KEY( �����ϴ� �÷��� ) 
                      REFERENCES �θ����̺� ( �����Ǵ� �÷��� )

-----------------------------------------------------------------------------------------------
- ���̺� ���� �� FOREIGN KEY ����

DROP TABLE emp;

CREATE TABLE emp (
id NUMBER(4) /* CONSTRAINT emp_id_pk PRIMARY KEY */,
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3) ,
email VARCHAR2(50) /* CONSTRAINT emp_email_uk UNIQUE */ , 
dept_id NUMBER(4) /* CONSTRAINT emp_dept_id_fk 
                     REFERENCES departments(department_id) */ ,
CONSTRAINT emp_id_pk      PRIMARY KEY( id ),
CONSTRAINT emp_salary_ck  CHECK( salary BETWEEN 3000 AND 5000 ),
CONSTRAINT emp_gender_ck  CHECK( gender IN ('��','��') ),
CONSTRAINT emp_email2_uk  UNIQUE( email ),
CONSTRAINT emp_email3_uk  UNIQUE( name, email ), --����Ű
CONSTRAINT emp_dept_id_fk FOREIGN KEY( dept_id )
                          REFERENCES departments( department_id )
);
FK �� ����  ���̺� �θ� - �ڽ� ���谡 �����ȴ�
FK �� �����ϴ� ���̺��� �ڽ� ���̺��̰�
FK �� ���� �����Ǵ� ���̺��� �θ� ���̺�
employees(�ڽ�) - departments(�θ�)
���� �Ǿ��� �θ����̺��� �÷��� �ݵ�� PK �� ������ �� �ִ�.

DESC emp;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; 

* USER_CONS_COLUMNS ���̺��� EMPLOYEES ���̺�� DEPARTMENTS ���̺���
���̺��, �������Ǹ�, �÷���, ������������(CONSTRAINT_TYPE) ��ȸ
-----------------------------------------------------------------------------------------------
SELECT TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                                   FROM USER_CONSTRAINTS
                                                   WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM USER_CONS_COLUMNS c
WHERE LOWER(TABLE_NAME) IN ('employees', 'departments');

SELECT *
FROM USER_CONSTRAINTS
WHERE LOWER(TABLE_NAME) IN ('employees', 'departments');
-----------------------------------------------------------------------------------------------
�� ���̺� ���� �� FOREIGN KEY ����
ALTER TABLE emp
ADD ( dept_id NUMBER(4) 
      CONSTRAINT emp_dept_id_fk REFERENCES departments(department_id) );
-----------------------------------------------------------------------------------------------

SELECT * 
FROM emp;

INSERT INTO emp
VALUES (100, 'ȫ�浿', 3000,  '��', '', '');

UPDATE emp 
SET dept_id = 15 
WHERE id = 100; 
--integrity constraint (HR.EMP_DEPT_ID_PK) violated - parent key not found

SELECT * 
FROM emp;

-----------------------------------------------------------------------------------------------
DDL
1. ���� CREATE
CREATE TABLE ���̺��(
�÷���1 ������Ÿ�� NOT NULL,
�÷���2 ������Ÿ�� CONSTRAINT �������Ǹ� CHECK (�÷���2 ���ǽ�),
�÷���3 ������Ÿ�� CONSTRAINT �������Ǹ� UNIQUE,
�÷���4 ������Ÿ�� CONSTRAINT �������Ǹ� PRIMARY KEY,
�÷���5 ������Ÿ�� CONSTRAINT �������Ǹ� REFERENCES �θ����̺�(PK���÷�),
CONSTRAINT �������Ǹ� CHECK (�÷���2 ���ǽ�),
CONSTRAINT �������Ǹ� UNIQUE (�÷���3),
CONSTRAINT �������Ǹ� PRIMARY KEY (�÷���4),
CONSTRAINT �������Ǹ� FOREIGN KEY (�÷���5) REFERENCES �θ����̺�(PK���÷�)
);

2. �������� ALTER
��������
1. NOT NULL - ���� ���� �����͸� �������� �ʵ���
ALTER TABLE ���̺�� 
MODIFY ( �÷��� NOT NULL );

2. CHECK �߰� - Ư�� ���ǿ� ���� �ʴ� �����͸� �������� �ʵ���, NULL ���
ALTER TABLE ���̺��
ADD CONSTRAINT �������Ǹ� CHECK ( �÷��� ���ǽ� );

3. UNIQUE �߰� - ���ϼ��� ������� ���� �����ʹ� �������� �ʵ���, NULL ���
ALTER TABLE ���̺��
ADD CONSTRAINT �������Ǹ� UNIQUE ( �÷��� );

4. PRIMARY KEY �߰� - �ĺ���, �⺻Ű, ��Ű, PK : NOT NULL + UNIQUE
ALTER TABLE ���̺�� 
ADD CONSTRAINT �������Ǹ� PRIMARY KEY ( �÷��� );

5. FOREIGN KEY �߰� - �ܷ�Ű, ����Ű, FK : NULL ���, �θ����̺��� PK �� �÷��� ����
ALTER TABLE ���̺��
ADD CONSTRAINT �������Ǹ� FOREIGN KEY ( �÷��� ) 
    REFERENCES �θ����̺� ( PK���÷� );

DESC emp;
SELECT * FROM emp;

������ ��������
INSERT INTO emp(id, name, salary, gender, email, dept_id)
VALUES (101, '����ġ', 3000, '��', NULL, DEFAULT);
SELECT * FROM emp;

INSERT INTO emp(id, name, salary)
VALUES (102, '��û', 5000);
SELECT * FROM emp;

������ �����͸� �������� ������ �⺻������ '��' �� ����ǰ� �ϰ��� �Ѵ�.
�÷��� ���� DEFAULT ����
ALTER TABLE emp
MODIFY (gender DEFAULT '��');

INSERT INTO emp(id, name, salary)
VALUES (103, '�ڹ���', 4000);

SELECT * FROM emp;

�Ի����� �߰�
ALTER TABLE emp 
--ADD ( hire_date date DEFAULT SYSDATE NOT NULL );
ADD ( hire_date date DEFAULT SYSDATE );

INSERT INTO emp(id, name, salary)
VALUES (104, '�̸���', 5000);
SELECT * FROM emp;

-----------------------------------------------------------------------------------------------


�� VIEW (��)
- ������ �����Ͱ� �����ϴ� ��ü�� �ƴϴ�
- ���̺��� �����͸� �並 ���� �����Ѵ�.
  1. ���� - ���� ����
  2. ������ �������� �ܼ��� ���������� ����� �� �ִ�.
  
�並 ����ϸ� ���̺�ó�� ��밡���ϸ� SELECT �������� ���� ����.
INSERT, DELETE, UPDATE �� �Ұ��� �ϴ�.


�� �����
CREATE VIEW ��� AS �� CVAS
������;

60�� �μ��� ���� ��ȸ

SELECT * FROM vu_60; --���� �������� �ʾ� ���� �߻�

CREATE OR REPLACE VIEW vu_60 AS
  SELECT employee_id, first_name || ' '|| last_name name,
         department_id, job_id, hire_date, email 
  FROM employees 
  WHERE department_id = 60;

SELECT * FROM vu_60; --�� ���� �Ǿ� ���� ����

----------------------------------------------------------------
�� �����
DROP VIEW ���;
DROP VIEW vu_60;
----------------------------------------------------------------

SELECT * FROM vu_60; --���� �Ǿ� ���� �߻�

�� �������� ���ڸ� ������ִ� ����� ���� ��ü
: SEQUENCE

�� ������ ����
CREATE SEQUENCE �������� 
START WITH ���۰�
INCREMENT BY ����ġ
MAXVALUE �ִ밪 (10�� 26��)
MINVALUE �ּҰ� 
CACHE ����
NOCYCLE / CYCLE ;

SELECT * 
FROM emp;

CREATE SEQUENCE emp_seq
START WITH 200
INCREMENT BY 1;

���������� ���� : CURRVAL, NEXTVAL
SELECT emp_seq.NEXTVAL FROM dual;
SELECT emp_seq.NEXTVAL FROM dual;
SELECT emp_seq.NEXTVAL FROM dual;
SELECT emp_seq.NEXTVAL FROM dual;

SELECT emp_seq.CURRVAL FROM dual;



emp ���̺��� pk�� id �÷��� �������� �����Ͽ� ���������� ���������Ѵ�.
INSERT INTO emp (id, name)
VALUES ( emp_seq.NEXTVAL, '�̼���' );
SELECT * FROM emp;

---------------------------------------------------------------------
�� ������ ����
DROP SEQUENCE �������� ;
DROP SEQUENCE emp_seq;
---------------------------------------------------------------------




PL/SQL( Procedural L. extension SQL)
: SQL + ���α׷��� ����� ���·� ���յ� ���

�⺻����
����� : ����/������� 
����� : ���Թ�, ���ǹ�, �ݺ���

�׽�Ʈ�� pl/sql : �͸� ��
declare 
�����
begin
����ó���� : exception
end;
/


5 * 6 �� ����� ����ϴ� ���α׷�

declare
    res  number(5);
begin
    res := 5 / 0 ;
    dbms_output.put_line( '5 / 0 = ' ||  res  );
    exception 
        --when zero_divide then
        when others then
            dbms_output.put_line( sqlerrm ); 
            --dbms_output.put_line('0���� ������ ����'); 
end;
/


class Circle{
    int radius;
    Circle( int radius ) throws Exception {
        if( radius<=0 ) throw new Exception("�������� 0���� Ŀ�� ��");
        this.radius = radius;
    }
    double getAround(){
        return 2 * 3.14 * radius;
    }
}

class CircleMain{
    public static void main(String a[]){
        try{
            Circle c = new Circle(-5);
            System.out.print( c.getAround());        
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
    }
}


declare
    radius  number := -5;
    around  number;
    invalid_radius exception;
begin
    if( radius <=0 ) then
        raise invalid_radius;
    else
        around := 2 * 3.14 * radius;
    end if;
    dbms_output.put_line(
        '������ ' || radius || ' �� ���ѷ��� ' || around );
    exception when invalid_radius then
        dbms_output.put_line('�������� 0���� Ŀ�� ��');
end;
/

������ ���� ����
90���̻� A, 80���̻� B, 70���̻� C, 60���̻� D, �� �� F
declare
    test number := 73;
    grade varchar2(1);
begin
    if test>=90 then grade := 'A';
    elsif test>=80 then grade := 'B';
    elsif test>=70 then grade := 'C';
    elsif test>=60 then grade := 'D';
    else                grade := 'F';
    end if;
    dbms_output.put_line('����:' || test  || ' ' || grade || '����' );
end;
/

�������Ͽ� �ϳ��� ��ü�� �����صΰ� �ʿ��Ҷ��� ȣ���ؼ� ����� 
�̸��� ���� �� : PL/SQL �������α׷�
procedure / function
������: 1. �Ķ���ͺ����� ������Ÿ�� ������ ���� �Ұ�
       2. �Ķ���Ͱ� ������ () ���� �Ұ�

���ν���: �����͸� ����DML ó���� �ַ� ���
CREATE or replace procedure ���ν�����( �Ķ���ͺ��� ������Ÿ��, ... ) is
�����
begin
end;
/

Ư�� ����� ����� ���� ������ %��ŭ �λ�� �޿��� �޿��� �����ϴ� ó���� �� ���ν���
CREATE or replace procedure 
            pro_emp_salary_update(emp_id number, pct number) is
begin
    update employees set salary = round(salary * ( 1 + pct*0.01 ))
    where employee_id = emp_id;
end;
/

���ν�������: execute/exec ���ν�����
100�� ����� �޿��� 10% �λ�� �޿��� ���������Ѵ�.
exec pro_emp_salary_update(100, 10);

SELECT employee_id, salary
FROM employees where employee_id = 100;

������ 100�� ����� �޿��� 5000���� ���������ϴ� ���ν���
CREATE or replace procedure pro_emp_100_update is
begin
    update employees set salary = 5000
    where employee_id = 100;
end;
/

SELECT employee_id, salary
FROM employees where employee_id = 100;
exec pro_emp_100_update;


�μ����̺� ���ο� �μ��� ����ϴ� ���ν���
CREATE or replace procedure 
        pro_depart_regist(dept_id number, dept_name varchar2) is
    cnt number;
begin
    SELECT count(*) into cnt FROM departments
    where department_id = dept_id;

    if cnt=0 then    
        INSERT INTO departments(department_id, department_name)
        VALUES (  dept_id, dept_name );
    else
        update departments set department_name = dept_name
        where department_id = dept_id;
    end if;
end;
/

SELECT * FROM departments;

exec pro_depart_regist(300, '������');
exec pro_depart_regist(310, 'A/S');
exec pro_depart_regist(320, '���ߺ�');

String add( int n1, int n2 ){
    return "���� ����� " + n1 + n2;
}

function : �����ϴ� �����Ͱ� �ִ� �޼ҵ��� ����� �ȴ�.
CREATE or replace function �Լ���(�Ķ���ͺ����� ������Ÿ��, ...)
    return ���ϵ������� ������Ÿ�� is
begin
    return ��ȯ������;
end;
/

����� �Ҽӵ� �μ��� �μ����� ��ȯ�ϴ� �Լ�
CREATE or replace function fn_dept_name(id number) 
return varchar2 is
    dept_name varchar2(50);
begin
    SELECT (SELECT department_name FROM departments
            where department_id = e.department_id) into dept_name
    FROM employees e
    where employee_id=id;
    return dept_name;
end;
/

��� ����� ���, ����, �μ��ڵ�, �μ��� ��ȸ
SELECT employee_id, last_name||' '||first_name name, department_id
       , fn_dept_name(employee_id) department_name
FROM employees;       


100 �� ����� �μ��� ��ȸ
SELECT fn_dept_name(200) FROM dual;

SELECT (SELECT department_name FROM departments
        where department_id = e.department_id) department_name
FROM employees e
where employee_id=100;

SELECT department_name
FROM employees e, departments d
where employee_id=100
and e.department_id = d.department_id(+);









