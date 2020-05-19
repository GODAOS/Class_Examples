* DDL(Data Definition Language) - �� AUTO COMMIT;
  - CREATE, ALTER, DROP, TRUNCATE, RENAME
  
*������Ÿ�� : ����, ����, ��¥
- ���� : CHAR, VARCHAR2
    CHAR(n)  - �������� : ������ �����ŭ �޸𸮸� Ȯ���Ѵ�.
    CHAR(10) - ����� abcd ���ڸ� ���� -> abcd______ 
             �� �޸𸮸� 10����Ʈ Ȯ���� �� �����Ѵ�.
    VARCHAR2(n)  - �������� �� �����͸� �����Ҷ� �޸𸮸� Ȯ���Ѵ�. 
                         �ִ� 4000 ����Ʈ
    VARCHAR2(30) - ����� abcd ���ڸ� ���� -> abcd

������ ����� �������� : �ֹι�ȣ�� ���� ��� CHAR
    CLOB : ����� ū ���� ������ ������� Ÿ��
    BLOB : �̹����� ���� ���̳ʸ� ������ ������� Ÿ��
    
- ���� : NUMBER
    NUMBER(n)   - ����������
    NUMBER(8)   - 99999999����
    NUMBER(n,p) - �ε��Ҽ���������
    NUMBER(8,2) - 999999.99
      
- ��¥ : DATE

1. ���̺����
CREATE TABLE ���̺�� (
�÷���1 ������Ÿ��,
�÷���2 ������Ÿ��,
...
);

CREATE TABLE temp (
id NUMBER(4),
name VARCHAR2(30)
);

DESC temp;

temp ���̺� ������ ���� ���� 
id�� 100, name�� ȫ�浿
INSERT INTO temp
VALUES (100, 'ȫ�浿');

SELECT * 
FROM temp;

id�� 101, name�� �̼���
INSERT INTO temp
VALUES (101, '�̼���');

COMMIT;

SELECT * 
FROM temp;

temp ���̺��� �ڵ尡 101 ���� �̸��� 'ȫ��'�� �����Ѵ�.
UPDATE temp 
SET name = 'ȫ��'
WHERE id = 101;

COMMIT;

SELECT * 
FROM temp;

  ID NAME                          
---------- -------
 100 ȫ�浿                        
 101 ȫ�� 


�� �ٸ� ���̺��� ������ �����ؼ� ���̺� ���� �� CTAS
CTAS( Create Table As Select ) : ****NOT NULL �̿��� ��������(Primary Ű ��)�� ������� �ʴ´�.

CREATE TABLE ���̺�� AS ��ȸ������(SELECT ��);
employees ���̺��� 60�� �μ��� ���, ��, �̸�, �޿�, �Ի����ڸ� �����ؼ� 
emp60 ���̺� �����ϱ�

CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE department_id = 60;

DESC emp60;

SELECT * FROM emp60;

�� ������ �����ϰ� ���������� �����ؿ��� ���� ���·� ���̺� �����ϱ�(������ ����)
CREATE TABLE emp40 AS
SELECT employee_id emp_id, last_name, first_name, salary, hire_date
FROM employees
--WHERE 'a' = 'b';  --���� ��ġ�� �� ���� ����
WHERE 1 = 2;

DESC emp40;

SELECT * 
FROM emp40; --������ �����Ͽ� �����ʹ� �������� ����

2. ���̺� ���� ���� - ALTER
1) �÷� �߰�
ALTER TABLE ���̺�� 
ADD ( �÷���1 ������Ÿ��, �÷���2 ������Ÿ��, ... );
***

temp ���̺� ���� 8�ڸ��� ���� salary �÷��� �߰�����
DESC temp;

ALTER TABLE temp
ADD ( salary NUMBER(8) ); --Default�� null
***

DESC temp;

SELECT * 
FROM temp;

101�� �ڵ��� �޿��� 3000 ���� �����Ѵ�.
UPDATE temp 
SET salary = 3000 
WHERE id = 101;

SELECT * 
FROM temp;

2) ������Ÿ�� ũ�� ����
ALTER TABLE ���̺�� 
MODIFY ( �÷��� ������Ÿ��(������ũ��) );

temp ���̺��� salary �÷��� ����� ���� 10 ���� �����Ѵ�.
DESC temp;

ALTER TABLE temp
MODIFY ( salary NUMBER(10) );

DESC temp;

3) �÷� ����
ALTER TABLE ���̺��
DROP COLUMN �÷��� ;

temp ���̺��� salary �÷� �����Ѵ�.

DESC temp;

ALTER TABLE temp
DROP COLUMN salary;

DESC temp;

4) �÷��� ����
ALTER TABLE ���̺�� 
RENAME COLUMN �����÷��� TO ���÷���;

temp ���̺��� id �÷����� temp_id �� �����Ѵ�.

DESC temp;

ALTER TABLE temp
RENAME COLUMN id TO temp_id;

DESC temp;

3. �������� ���� - TRUNCATE - ������ ��� �Ұ�

TRUNCATE TABLE ���̺��; --��, ������ ����� �������� ��� ����

SELECT * 
FROM temp;

DELETE FROM temp;

SELECT * 
FROM temp;
--------------
���õ� �� ����

ROLLBACK; --DML�� ROLLBACK ����

SELECT * 
FROM temp;

   TEMP_ID NAME                          
---------- ------------------------------
       100 ȫ�浿                        
       101 ȫ��
       
TRUNCATE TABLE temp; --������ ����� �������� ��� ����

SELECT * 
FROM temp;
���õ� �� ����

ROLLBACK; --DDL�� AUTO COMMIT�� ����ǹǷ� ROLLBACK �Ұ��� 

SELECT * 
FROM temp;
���õ� �� ����

4. ���̺� ���� - DROP
DROP TABLE ���̺��;

DROP TABLE temp;

CREATE TABLE temp (
id NUMBER(4),
name VARCHAR2(30)
);
-----------------------------------------------------------------------------------------------
�� DELETE, TRUNCATE, DROP ��ɾ��� ������

- DELETE ��ɾ�� �����ʹ� ���������� ���̺� �뷮�� �پ� ���� �ʴ´�. 
  ���ϴ� �����͸� ���� �� �ִ�. ���� �� �߸� ������ ���� �ǵ��� �� �ִ�.
- TRUNCATE ��ɾ�� �뷮�� �پ� ���, �ε��� � ��� ���� �ȴ�. 
  ���̺��� ���������� �ʰ�, �����͸� �����Ѵ�. 
  �Ѳ����� �� ������ �Ѵ�. ���� �� ���� �ǵ��� �� ����.
- DROP ��ɾ�� ���̺� ��ü�� ����, ����, ��ü�� �����Ѵ�. 
  ���� �� ���� �ǵ��� �� ����.
  
[�� ���̺�] [����]       [DELETE ��]             [TRUNCATE ��]         [DROP ��]
�̸�      �ּ�  ����ó     �̸�   �ּ�  ����ó     �̸�   �ּ�  ����ó   ������
ȫ�浿    ����  1111       |   |  |   | |    |
ȫ���    õ��  2222       |   |  |   | |    |
�̼���    �λ�  3333       |   |  |   | |    |
                           �����͸� ��������,      �뷮�� �پ���,      ���̺� ��ü ����
                           �뷮�� �״��           ���̺��� ���� �ȵǰ�,
                                                   �ε��� �� ��� ����
                                                   
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
�� ������ ���̺� �����뿡�� Ȯ��
SELECT * FROM RECYCLEBIN;

�� ������ ���̺� ����
FLASHBACK TABLE ���̺�� TO BEFORE DROP;

FLASHBACK TABLE temp TO BEFORE DROP;

�� ������ ����
PURGE RECYCLEBIN;
-----------------------------------------------------------------------------------------------

5. ���̺���� - RENAME
RENAME �������̺�� TO �����̺��;

temp ���̺���� test �� �����Ѵ�.

RENAME temp TO test;

DESC test;

