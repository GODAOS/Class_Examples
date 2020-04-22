--�⺻ ��¥ ������ ���� ��ȸ
�ý����� ���� ��¥�� ��ȯ�ϴ� �Լ� - SYSDATE
�ٸ� �Լ��ʹ� �޸� �Ķ���Ͱ� ���� ()�� ������� ����.

SELECT * 
FROM v$nls_parameters;

SELECT VALUE 
FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT';

--���� ��¥ ��ȸ, dual : ���� ������, ��¥ ������
SELECT SYSDATE 
FROM dual;

--��¥ ������ ����Ͽ� ����ڰ� ���ϴ� ������ ���ڷ� �ٲ� ��ȯ
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH/DD')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') 
FROM dual;

--�⺻ ������ ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = [������ ����];
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
�� ����Ŭ �⺻ ������ ���� ���� �� ���� ���ǿ��� ����

SELECT SYSDATE 
FROM dual; --20/10/06

ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT SYSDATE 
FROM dual;

�Ի����� 2004�� 1�� 1�� ������ ����� ����ڵ�, ��, �Ի����ڸ� ��ȸ
SELECT employee_id, last_name, hire_date 
FROM employees
WHERE hire_date < '2004-01-01';
--WHERE hire_date < '2004/01/01';
--WHERE hire_date < '04-01-01';
--WHERE TO_CHAR(hire_date,'YYYY') < 2004;

4. �������� : 
4.1 AND ������ : ������ ��� TRUE �� ���� TRUE �� ��ȯ�Ѵ�.

30�� �μ� ��� �� �޿��� 10000 ������ ����� ����ڵ�, ����, �޿�, �μ��ڵ带 ��ȸ�Ѵ�.
������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
SELECT employee_id, first_name||' '||last_name name, salary, department_id 
FROM employees
WHERE department_id = 30 
AND salary <= 10000;

30�� �μ����� �޿��� 10000 �����̸鼭 2005�� ����(2004�����)�� �Ի��� ����� 
�����ȣ, ����, �޿�, �μ��ڵ�, �Ի����ڸ� ��ȸ�Ѵ�.
������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
SELECT employee_id, first_name||' '||last_name name, salary, department_id, hire_date  
FROM employees
WHERE department_id = 30 
AND salary <= 10000
--AND hire_date < '05-01-01';
--AND hire_date <= '05-12-31';
AND TO_CHAR(hire_date,'YYYY') <= 2004;

�μ��ڵ尡 10 �̻� 30 ������ �������
���, ����, �μ��ڵ� ��ȸ
������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
SELECT employee_id, first_name||' '||last_name name, department_id
FROM employees
WHERE department_id >=10 
AND  department_id <= 30 ;--�μ��ڵ尡 10 �̻� 30 ����;

�޿��� 10000 �̻� 15000 ������ �������
���, ����, �޿�, �����ڵ� ��ȸ
������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
SELECT employee_id, first_name||' '||last_name name, salary, job_id
FROM employees
WHERE salary>=10000 
AND salary<=15000; --�޿��� 10000 �̻� 15000 ����

�μ��� 60�� �μ����� �޿��� 5000 �̻��� �������
���, ����, �μ��ڵ�, �޿� ��ȸ
������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
SELECT employee_id, first_name||' '||last_name name, department_id, salary
FROM employees
WHERE department_id = 60 
AND salary>= 5000;--�μ��� 60�� �μ� �޿��� 5000 �̻�

����/��¥ ������ǥ��: ''
�μ��ڵ尡 60 �����̸鼭 2003�� 6�� 17�� ������ �Ի��� ������� 
���, ����, �Ի����� ��ȸ
������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
SELECT employee_id, first_name||' '||last_name name, hire_date
FROM employees
WHERE hire_date <= '2003-06-17'  -- 2003�� 6�� 17�� ������ �Ի���;
AND department_id <= 60; --�μ��ڵ尡 60 ����

4.2 OR �����ڴ� ���� �� �ϳ��� TRUE �̸� TRUE �� ��ȯ�Ѵ�.

30�� �μ��� 60�� �μ��� ���� ����� ����, �޿�, �μ��ڵ带 ��ȸ�Ѵ�
SELECT first_name||' '||last_name name, salary, department_id dept_id 
FROM employees
WHERE department_id = 30
OR department_id = 60;

�μ��ڵ尡 10, 20, 30�� �μ��� ���� �������
���, ����, �μ��ڵ�, �����ڵ� ��ȸ
SELECT employee_id, first_name||' '||last_name name, department_id, job_id
FROM employees
WHERE department_id = 10 
OR department_id = 20
OR department_id = 30; --�μ��ڵ尡 10,20,30;

����� 150, 170, 190 �� �������
���, ����, �μ��ڵ�, �����ڵ�, �Ի����� ��ȸ
SELECT employee_id, first_name||' '||last_name name, department_id, job_id, hire_date
FROM employees
WHERE employee_id = 150 
OR employee_id = 170 
OR employee_id = 190 ; --����� 150, 170, 190 ;  

4.3 AND �����ڿ� OR �����ڸ� ȥ���Ͽ� ������ �ۼ��Ѵ�.

30�� �μ��� �޿��� 10000�̸��� ����� 60�� �μ��� �޿��� 5000�̻��� �����
����, �޿�, �μ��ڵ� ������ ��ȸ�Ѵ�.
SELECT first_name ||' ' ||last_name name, salary, department_id dept_id 
FROM employees
WHERE department_id = 30 AND salary < 10000 
OR department_id = 60 AND salary >= 5000;

������ ���� AND�� OR ������ ȥ�յǾ� ���Ǵ� ��� �������� ���� ��ȣ�� �ٿ��ִ� ���� ����.
SELECT first_name||' '||last_name name, salary, department_id dept_id 
FROM employees
WHERE ( department_id = 30 AND salary < 10000 ) 
OR ( department_id = 60 AND salary >= 5000 );

�μ��ڵ尡 30�� �μ��� �޿� 10000 �̸��� ������
�μ��ڵ尡 60�� �μ��� �޿� 5000 �̻��� ������� ���, ����, �μ��ڵ�, �޿� ��ȸ
SELECT employee_id, first_name||' '||last_name name, department_id, salary
FROM employees
WHERE (department_id=30 AND salary<10000) 
OR (department_id=60 AND salary>=5000);
--department_id=30 AND salary<10000 --�μ��ڵ尡 30�� �μ��� �޿� 10000 �̸�
--OR department_id=60 AND salary>=5000; --�μ��ڵ尡 60�� �μ��� �޿� 5000 �̻�

�����ڿ��� �켱������ �ִ�
��������� ���: *,/ -> +,-
�������� ���: AND : ���� -> OR : ����
7+(7/7)+(7*7)-7

5. ���� ���� ������  BETWEEN
BETWEEN ���۰� AND �������� �� ���۰� �̻� �������� ���� �� ����.
�� BETWEEN �̳� ���迬���ڷ� ���� �� �ִ� ���� ���ڵ�����, ���ڵ�����, ��¥������
A�̻� B����: �÷��� BETWEEN A AND B
A�̸� B�ʰ�: �÷��� NOT BETWEEN A AND B
             NOT �÷��� BETWEEN A AND B
NOT �����ڴ� BETWEEN ������ �ٷ� ���̳� �÷��� �տ� �ٿ� ����� �� ������, �� ��� ��� ���� ����� ��ȸ�ȴ�.
            
��� 110�� ���� 120�� ������ �����ȣ, ����, �޿�, �μ��ڵ带 ��ȸ�Ѵ�.
SELECT employee_id emp_id, first_name ||' ' ||last_name name, 
       salary, department_id dept_id 
FROM employees
WHERE employee_id >= 110 AND employee_id <= 120;
--WHERE employee_id BETWEEN 110 AND 120;

����� 110�� �̸� 120�� �ʰ��� ����� �����ȣ, ����, �޿�, �μ��ڵ带 ��ȸ�Ѵ�.
SELECT employee_id emp_id, first_name ||' ' ||last_name name, 
       salary, department_id dept_id 
FROM employees
WHERE employee_id < 110 OR employee_id > 120;
--WHERE NOT employee_id BETWEEN 110 AND 120;

�������ڸ� �����
�μ��ڵ尡 10 �̸� 40 �ʰ��� ������� ���, ����, �μ��ڵ� ��ȸ
SELECT employee_id, first_name||' '||last_name name, department_id
FROM employees
WHERE department_id<10 OR department_id>40;
--WHERE NOT department_id BETWEEN 10 AND 40;
--WHERE department_id NOT BETWEEN 10 AND 40;
--WHERE NOT (department_id>=10 AND department_id<=40); --�μ��ڵ尡 10 �̸� 40 �ʰ�

����� 110���� 120�� ��� �� �޿��� 5000���� 10000������ 
�����ȣ, ����, �޿�, �μ��ڵ带 ��ȸ�Ѵ�.
SELECT employee_id emp_id, first_name||' '||last_name name, 
       salary, department_id dept_id 
FROM employees
WHERE employee_id BETWEEN 110 AND 120
AND salary BETWEEN 5000 AND 10000;

2005�� 1�� 1�� ���ĺ��� 2007�� 12�� 31�� ���̿� �Ի��� �����
���, ����, �޿�, �Ի����� ������ ��ȸ�Ѵ�.
SELECT employee_id emp_id, first_name||' '||last_name name, salary, hire_date
FROM employees
WHERE hire_date BETWEEN '05-01-01' AND '07-12-31';

DATE Ÿ���� HIRE_DATE �� ���� ���ڰ����� ���������� 
�������� ����� ������ ������ ����Ŭ SQL ������ �ڵ����� ������ ����ȯ�� �߱� �����̴�.
������ ������ ��������� ����ȯ�ϴ� ���� �ٶ����ϴ�.
����� ����ȯ �Լ��� TO_DATE() �̴�.

SELECT employee_id emp_id, first_name||' '||last_name name, salary, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('05-01-01') AND TO_DATE('07-12-31');

�Ի����ڰ� 2003�� 8�� 1�� ���� 2005�� 7�� 31�� �� �ش��ϴ� �������
���, ����, �Ի����� ��ȸ
SELECT employee_id, first_name||' '||last_name name, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('03-08-01') AND TO_DATE('05-07-31');
--�Ի����ڰ� 2003�� 8�� 1�� ���� 2005�� 7�� 31��;

�μ��ڵ尡 20,30,40,60,100,110 �� �μ��� ���� ������� ���, ����, �μ��ڵ� ��ȸ
SELECT employee_id, first_name||' '||last_name name, department_id
FROM employees
WHERE department_id=20 
OR department_id=30 
OR department_id=40 
OR department_id=60 
OR department_id=100 
OR department_id=110; --�μ��ڵ尡 20,30,40,60,100 

6. IN ���� ������
���� ���� �� �߿� ��ġ�ϴ� ���� �ִ��� ���� ���� IN (��1, ��2, ��3 ...) �� ���·�
���ϴ� ���� ����� �����Ѵ�.
������ �÷�ǥ���� ���� ���� ���� ������ ���ǽ��� OR �� ������ ����
       �÷�ǥ�� IN (���� ���� �����Ͱ� ���)
 <-> �÷�ǥ�� NOT IN (���� ���� �����Ͱ� ���)
     NOT �÷�ǥ�� IN (���� ���� �����Ͱ� ���)

IN �����ڴ� OR �����ڿ� ������ ����� ����
���� ������ ���� �� OR �����ڸ� ����ϸ� SQL ������ ��� ���������µ� 
IN �����ڸ� ����ϸ� ������ ��������� �������� ��������.
IN ������ �ٷ� ���̳� �÷��� �տ� NOT �����ڸ� �ξ� �ݴ�Ǵ� ������ �����.

30�� �μ��� �Ǵ� 60�� �μ��� �Ǵ� 90�� �μ����� ���, ����, �޿�, �μ��ڵ带 ��ȸ�Ѵ�.
SELECT employee_id emp_id, first_name ||' ' ||last_name name, 
       salary, department_id dept_id
FROM employees
WHERE department_id = 30 
OR department_id = 60 
OR department_id = 90;

SELECT employee_id emp_id, first_name ||' ' ||last_name name, 
       salary, department_id dept_id
FROM employees
WHERE department_id IN (30, 60, 90);
--department_id NOT IN (30, 60, 90);
--NOT department_id IN (30, 60, 90);

30�� �μ�, 60�� �μ�, 90�� �μ� �̿��� �μ��� ���� ����� ���, ����, �޿�, �μ��ڵ������� ��ȸ�Ѵ�.
SELECT employee_id emp_id, first_name||' '||last_name name, 
       salary, department_id dept_id
FROM employees
WHERE department_id NOT IN (30, 60, 90);

7. �˻��� �ش��ϴ� ������ : �ʵ�� LIKE ���� ������(�����ϴ�)
                          : �ʵ�� NOT LIKE ���� ������(�������� �ʴ�) 
�÷����� �߿� Ư�� ���Ͽ� ���ϴ� ���� ��ȸ�ϰ��� �� �� LIKE �����ڸ� ����Ѵ�.
% : ���� ���� ���ڿ�, ����ڰ� ��� ������ ������
_ : �ϳ��� ����, �ϳ��� ���ڰ� ����ڰ� ������ ������

�÷�ǥ�� LIKE �˻����� + %
% : ����ڰ� ��� ������ ������
���� LIKE 'ȫ%'  �� ȫ���� �����ϴ� ���� : ȫ�浿, ȫ��, ȫ��, ȫ, ȫ���Ϲ�...
���� LIKE '%ȫ'  �� ȫ���� �� �� �� ���� : Ȳ��ȫ, ��ȫ, ��ȫ, ȫ, ����Ϲ�...ȫ
���� LIKE '%ȫ%' �� ȫ��   �����ϴ� ���� : ȫ�浿, ȫ��, ȫ��, ȫ, ȫ���Ϲ�, 
                   Ȳ��ȫ, ��ȫ, ��ȫ, ȫ, ����Ϲ�...ȫ, ��ȫ��, ...

�̸��� K�� ���۵Ǵ� ����� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name||' '||last_name name
FROM employees
WHERE first_name LIKE 'K%';

�̸��� s�� ������ �̸��� ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name||' '||last_name name
FROM employees
WHERE first_name LIKE '%s';

���� �ҹ��� z �� ���Ե� ���� ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name||' '||last_name name
FROM employees
WHERE last_name LIKE '%z%'; --���� z �� ���Ե�

���� ��ҹ��� �����ϰ� z �� ���Ե� ���� ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name||' '||last_name name
FROM employees
WHERE last_name LIKE '%z%' 
OR last_name LIKE '%Z%'; 
--���� ��ҹ��� �����ϰ� z �� ���Ե�

���� ��ҹ��� �����ϰ� z�� ���Ե� ������ ���� ������� ���, ���� ��ȸ
SELECT employee_id, first_name||' '||last_name name
FROM employees
WHERE last_name||first_name LIKE '%z%' 
OR last_name||first_name LIKE '%Z%';
--���� ��ҹ��� �����ϰ� z�� ���Ե�

���� �ҹ��� z�� 2��°�� ��ġ�� �ִ� ���� ���� ������� ���, ���� ��ȸ
SELECT employee_id, first_name||' '||last_name name
FROM employees
WHERE last_name LIKE '_z%'; --���� �ҹ��� z�� 2��°�� ��ġ�� �ִ�

���� �ҹ��� z�� 5��°�� ��ġ�� �ִ� ���� ���� ������� ���, ���� ��ȸ
SELECT employee_id, first_name||' '||last_name name
FROM employees
WHERE last_name LIKE '____z%'; --���� �ҹ��� z�� 5��°�� ��ġ�� �ִ�

���� �ҹ��� z�� �ڿ������� 5��°�� ��ġ�� �ִ� ���� ���� ������� ���, ���� ��ȸ
SELECT employee_id, first_name||' '||last_name name
FROM employees
WHERE last_name LIKE '%z____'; 

�� LIKE ���� BETWEEN �̳� IN �� ���� NOT �����ڿ� �Բ� ����� �� �ִ�.

��ȭ��ȣ�� 6���� ���۵��� �ʴ� ����� ���, ����, �޿�, �޴���ȭ ������ ��ȸ
SELECT employee_id emp_id, first_name||' '||last_name name,
       salary, phone_number phone
FROM employees
WHERE phone_number NOT LIKE '6%';

�� �Ի����ڰ� 12���� �Ի��� ������� ���, ��, �Ի����� ��ȸ
SELECT employee_id, last_name, hire_date
FROM employees
--WHERE TO_CHAR(hire_date, 'MM') = 12;
--WHERE hire_date LIKE '___12___';
WHERE hire_date LIKE '__%12%__';
WHERE hire_date LIKE '%12%'; --XXX

LIKE �����ڿ� �Բ� ���� %, _ �� ���� ��ü�� �����ǰ� �Ϸ���
%, _ �տ� ��ȣ���ڸ� ���̰� escape �ɼ��� �����Ѵ�.
�÷�ǥ�� LIKE Ư������ '\_' escape '\'
Ư������ �� ~, !, @, #, $, ^, &, *, -, ?, \

������� ��������(�����ڵ�)�� �ľ��ϰ��� �Ѵ�.
�����ڵ尡 _A �� ������� ���, ��, �����ڵ带 ��ȸ
: ���� ���, FI_ACCOUNT, AD_ASST, AC_ACCOUNT
SELECT employee_id, last_name, job_id
FROM employees
--WHERE job_id LIKE '%_A%'; --A�տ� �ѱ��� �ִ� ����
WHERE job_id LIKE '%@_A%' escape '@'; --�����ڵ尡 _A ��

--WHERE job_id LIKE '%@__A%' escape '@'; --_�� �����ϰ� A�տ� �ѱ��ڰ� �ִ� 

8. ������ ���� ���� ������ ǥ�� : NULL - �񱳺Ұ�, �������Ұ�
�׷���, �÷�ǥ�� IS NULL/IS NOT NULL �� �Ǵ� �� NULL ���� �ƴ��� �ľ�

SELECT *
FROM locations;

SELECT *
FROM locations
WHERE state_province LIKE '%';

--�Ʒ��� ����
SELECT *
FROM locations
WHERE state_province IS NOT NULL;

�μ��ڵ尡 NULL �� 
�μ���ġ ���� ���� ������� ���, ��, �μ��ڵ�, �����ڵ�, �޿� ��ȸ
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE department_id IS NULL;--�μ��ڵ尡 NULL;
--WHERE department_id IS NOT NULL;--�μ��ڵ尡 NULL �� �ƴ�;

SELECT commission_pct
FROM employees;

Ŀ�̼��� �޴� ������� ���, ��, �μ��ڵ�, Ŀ�̼ǿ��� ��ȸ
SELECT employee_id, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL; --Ŀ�̼��� �޴�

2.4 �������� ���� - ORDER BY �� : �������� ���� �������� ��ġ
ORDER BY ���ı���ǥ�� + ��������(default) ASC /�������� DESC
���ı���ǥ�� : �÷�ǥ�� �״��, ALIAS, SELECT��Ͽ����� ��ġ(�÷���ȣ)
SELECT �� 
FROM ��
WHERE ��
ORDER BY ��;

���α׷��󿡼��� ���� �� ����(��, DB������ �����ؼ� ���α׷����� �ѱ�)

80�� �μ��� ���, ��, �޿�, �μ��ڵ庸�� ���� ���� ��������/������������ �����Ѵ�.
SELECT employee_id, last_name, salary, department_id dept_id
FROM employees 
WHERE department_id = 80
ORDER BY last_name ASC;
--ORDER BY last_name DESC;

ORDER BY ���� ALIAS�� ����Ͽ� ������ �� �ִ�.

60�� �μ��� ���, ��, ��޿�(����)�� ���� ��޿��� ������������ �����Ѵ�.
������ annual_salary�� ALIAS�Ѵ�.
SELECT employee_id, last_name, salary*12 annual_salary 
FROM employees 
WHERE department_id = 60 
ORDER BY annual_salary; --ALIAS ����

ORDER BY ���� �÷��� ��ġ(��, ���� ��ȣ)�� ����Ͽ� ������ �� �ִ�.

������̺��� ���, ��, �޿�, �μ��ڵ带 ��ȸ�ϴµ� 
�μ��� ��������, ���޿��� �������� �����Ͽ� ��������� ��ȸ�Ѵ�.
department_id�� dept_id�� ALIAS
SELECT employee_id, last_name, salary, department_id dept_id
FROM  employees 
ORDER BY dept_id, 3 DESC;

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ, �� ������������ �����Ѵ�.
SELECT employee_id, last_name name, department_id, salary, hire_date
FROM employees
ORDER BY 2 DESC;
--ORDER BY last_name DESC;
--ORDER BY name DESC;

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ, 
�μ� ������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id ASC;

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
�Ի����� ������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY 5;
--ORDER BY hire_date;

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
�޿� ������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY salary;

�� ORDER BY ���ı���1 ����/����, ���ı���2 ����/����, ...

���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
�μ��ڵ� ��, �޿� ������������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id, 4 DESC;

