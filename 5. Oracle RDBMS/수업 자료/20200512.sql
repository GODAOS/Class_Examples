��������(Sub Query) :
SQL ���� �ȿ� �����ϴ� �� �ٸ� SQL ������ ���������� �Ѵ�.
���������� ��ȣ�� ���� ����ϰ� ���������� ���Ե� �������� ���������� �Ѵ�.
           �ءءءءءءءءءءءءءءءءءءء�
===============================================================================================
�� ���������� ��ġ�� ���� ��Ī 
- SELECT ���� �ִ� �������� : ��Į�� ��������, SQL���� ���ϰ��� ��Į�� ���̶� ��, 
  Scalar : �ϳ�(ũ��), Vector : ũ��� ����
  SELECT ���� ���������� ����Ͽ� �ϳ��� �÷�ó�� ����ϱ� ���� ����(ǥ�� �뵵)
  ����(Join)�� ��ü ǥ�������ε� ���� ���



   
- FROM ���� �ִ� �������� : �ζ��� ��
  SELECT ���� ����� FROM ������ �ϳ��� ���̺�ó�� ���(���̺� ��ü �뵵)
  �ζ��� �� ���������� ORDER BY ���� �� �� ����.
  (�� ��� �뵵�� �ƴ� ���̺�ó�� ��� �뵵�̹Ƿ� ���� ������ �ʿ䰡 ����.)
  �ζ��� �� ������������ �׷��Լ��� ��.��.�� alias �����ؾ� ��!!!



- WHERE ���� �ִ� �������� : �Ϲ� ��������
   �� SELECT ���� ����� �ϳ��� ����(���)ó�� ��� 
   (�������� ���������� ����� ���� �޶���)
===============================================================================================   

�޿��� ��ձ޿����� �� ���� �޿��� �޴� ����� 
���, �̸�, �� ������ ��ȸ�Ѵ�.

��� �޿�
SELECT AVG(salary) FROM employees; --6461.8

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary < 6461.8; --������� ������


SELECT employee_id, first_name, last_name 
FROM employees
WHERE salary < AVG(salary); --WHERE �������� �׷��Լ�ǥ�� ��� �� ��!

SELECT employee_id, first_name, last_name 
FROM employees
WHERE salary < ( SELECT AVG(salary) FROM employees );



�츮ȸ�翡�� ���� ���� �޿��� �޴� ����� 
���, ��, ��, �޿� ��ȸ

���� ���� �޿� ��ȸ
SELECT MAX(salary) 
FROM employees; --24000

SELECT employee_id, last_name, first_name, salary
FROM employees
--WHERE salary = ( SELECT MAX(salary) 
--                 FROM employees ); 
WHERE salary IN ( SELECT MAX(salary) 
                  FROM employees ); 
                  --�츮ȸ�翡�� ���� ���� �޿��� �޴�;



�������� - ���� �������ȿ� �ִ� �� �ٸ� ������
1. ���ϰ���� �������� - �������� ����ϴ� ���������� ������� �������� ���
2. ����(���)�� �������� - �������� ����ϴ� ���������� ������� �������� ���
3. ���� �÷� �������� - �������� ����ϴ� ���������� ����÷��� �����÷��� ���

4. scalar �������� - SELECT ���� ����ϴ� ��������
5. ��ȣ ���� �������� - ���������� �÷��� ���������� �������� ���Ǵ� ���
6. �ζ��� �� �������� - FROM ���� ����ϴ� ��������

1. ������(WHERE, HAVING)�� ����ϴ� ���ϰ���� �������� 
���ϰ���� �������� ������: =, !=, <>, <, >, <=, >= 

01. �츮ȸ�� ������� �޿������� �ľ��ϰ��� �Ѵ�.
�޿��� �츮ȸ�� �޿��� ��պ��� �� ���� �޴� ������� 
���, ��, �����ڵ�, �޿� ��ȸ
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ( SELECT AVG(salary) 
                 FROM employees );
--WHERE salary < ȸ����ձ޿�;--�츮ȸ�� �޿��� ��պ��� �� ���� �޴�

02. ��� 150�� ������� �� ���� �޿��� �޴� ������� 
���, ��, �μ��ڵ�, �����ڵ�, �޿� ��ȸ
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE salary > ( SELECT salary 
                 FROM employees 
                 WHERE employee_id = 150 );
--WHERE salary > ��� 150�� ����� �޿�;

03. ���޿��� ���� ���� ����� 
���, �̸�, ��, �������� ������ ��ȸ
SELECT e.employee_id, e.first_name, e.last_name, j.job_title 
FROM  employees e, jobs j 
WHERE  e.job_id = j.job_id
AND e.salary = ( SELECT MAX(e.salary) 
                 FROM employees e );
 
04. ������� �޿��� �츮ȸ�� ��ձ޿��̻� �ִ� �޿� ���Ͽ� �ش��ϴ�
������� ���, ��, �޿� ��ȸ
SELECT employee_id, last_name, salary
FROM employees
WHERE salary 
BETWEEN ( SELECT AVG(salary) FROM employees ) 
AND     ( SELECT MAX(salary) FROM employees );

------------------------------------------------------------------------
[�������� 6-1]
01. �츮ȸ�翡�� ���� ���� �޿��� �޴� ����� 
���, ��, �����ڵ�, �μ��ڵ�, �μ���, �޿� ��ȸ

SELECT  e.employee_id, e.last_name, e.job_id, 
        e.department_id, d.department_name, e.salary
FROM employees e, departments d 
WHERE e.department_id = d.department_id(+)
AND salary = ( SELECT MIN(e.salary) FROM employees e );
--WHERE salary = �츮ȸ�翡�� ���� ���� �޿�;

02. �μ����� Marketing �� �μ��� ���� ������� 
���, ����, �μ��ڵ�, �����ڵ� ��ȸ

����Ŭ����
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(department_name) = 'marketing';

��������
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e
WHERE e.department_id = ( SELECT d.department_id 
                          FROM departments d
                          WHERE LOWER(d.department_name) = 'marketing' );

03. �츮ȸ�� ����Ժ��� ���� �Ի��� ������� 
���, ����, �Ի����� ��ȸ
������ �׸� �����ϴ� �Ŵ����� ���� ����� ���Ѵ�.

����Ŭ����
SELECT e.employee_id, e.first_name || ' '|| e.last_name name, e.hire_date
FROM employees e, employees m
WHERE e.hire_date < m.hire_date 
AND m.manager_id IS NULL;

��������
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, e.hire_date
FROM employees e
WHERE e.hire_date < ( SELECT e.hire_date 
                      FROM employees e
                      WHERE e.manager_id IS NULL );
--WHERE hire_date < ����� �Ի�����;
------------------------------------------------------------------------


2. ����(���)�� �������� - �������� ����� ���������� ������� ���� ���� ���
- ������ : IN, NOT IN(��, '='�� IN ���� ��ü), 
  ���� ����� �� �� �̻��� ��Һ� �Ұ�, �׷���, IN ������ ���
  ���������� ����� ���� ���� ��� '=', '<', '>' �� ���� ��Һ񱳰� �Ұ�
  WHERE ������ �׷��Լ� MIN, MAX ��� �Ұ�!
  WHERE ���� �ƴ�! ���������� �׷��Լ� MIN, MAX �� ����ص� ���� ����

  
  
- �÷�ǥ�� IN, NOT �÷�ǥ�� IN, �÷�ǥ�� NOT IN

01. �μ��� ��ġ�ڵ尡 1700 ��/ (1700�� �ƴ�) �ںμ��� ���� ������� 
���, ����, �μ��ڵ�, �����ڵ�, ��ġ�ڵ� ��ȸ
�Ϲ�����  
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND d.location_id IN (1700);

--��ġ�ڵ尡 1700 �� �μ�
SELECT department_id, location_id 
FROM departments 
WHERE location_id = 1700; 

SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e 
WHERE e.department_id IN ( SELECT department_id 
                      --NOT IN (SELECT department_id 
                           FROM departments 
                           WHERE location_id = 1700 );
--WHERE e.department_id = (��ġ�ڵ尡 1700 �� �μ�);


���  �μ�        �μ�  ��ġ�ڵ�
100  10             10   1700
101  30             20   1800 
102  20             30   1700
                    40   1700

������ WHERE/HAVING 

02. �츮ȸ�翡�� mgr ������ �����ϴ� ������ ���� �μ��� ���� �������
���, ��, �����ڵ� ��ȸ

--mgr ������ �����ϴ� �μ�
SELECT department_id
FROM employees
WHERE LOWER(job_id) LIKE '%mgr%';

SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id
IN ( SELECT department_id 
     FROM employees
     WHERE LOWER(job_id) LIKE '%mgr%' );

03. �� �μ��� �ּұ޿��� 40�� �μ��� �ּұ޿����� �� ���� 
�μ��ڵ�, �ּұ޿� ��ȸ

--40�� �μ��� �ּұ޿�
SELECT MIN(salary) 
FROM employees 
WHERE department_id = 40;

SELECT department_id, MIN(salary) min_sal
FROM employees
GROUP BY department_id
HAVING MIN(salary) > ( SELECT MIN(salary) 
                       FROM employees 
                       WHERE department_id = 40 );
--HAVING �μ��ּұ޿� > 40�� �μ��ּұ޿�;


04. �ٹ����� �����ڵ尡 UK(��, country_id�� UK)�� ���� �ִ� �μ��� 
�μ��ڵ�, ��ġ�ڵ�, �μ��� ��ȸ

--�ٹ����� �����ڵ尡 UK �� ���� �ִ� �μ�
SELECT location_id
FROM locations 
WHERE LOWER(country_id) = 'uk'; --����� ������ 2400, 2500, 2600 

�Ϲ�����
SELECT d.department_id, d.location_id, d.department_name
FROM departments d, locations l
WHERE d.location_id =  l.location_id
AND LOWER(l.country_id)='uk';   

����(���)�� ��������
SELECT department_id, location_id, department_name
FROM departments
WHERE location_id IN ( SELECT location_id
                       FROM locations 
                       WHERE LOWER(country_id) = 'uk' );
--WHERE location_id  = (�ٹ����� �����ڵ尡 UK �� ���� �ִ� �μ�);