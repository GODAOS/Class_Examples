SELECT table_name FROM user_tables;

DESC employees;

SELECT * FROM employees;

--��� ���̺��� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees;

--����鿡 ���� ���, �̸�, ��, �μ� �ڵ�, �Ի� ����, ���� �ڵ�, �޿� ��ȸ
SELECT employee_id,
        first_name,
        last_name,
        department_id,
        hire_date,
        job_id,
        salary
FROM employees;

--80�� �μ��� ����� ���, ��, �޿�, �� �ص��� ���� �޿�(����) ��ȸ
SELECT employee_id, last_name, salary, salary*12
FROM employees
WHERE department_id = 80;

--������ 150000 �̻��� ������� ���, �̸�, ��, ���� �ڵ�, �޿�, ���� ��ȸ
SELECT employee_id, first_name, last_name, job_id, salary*12,
        salary*12 as annual_salary, --alias(����) �ִ� �� : as ��ɾ� ���
        salary*12 annual_salary,    --��ǥ ���� ��ĭ �� �� �׳� ����
        salary*12 "annual_salary"   --�� ĭ ��� �ֵ���ǥ�� ���� (alias �̸��� ������ ������ �ֵ���ǥ�� ������� ��)
FROM employees
WHERE salary*12 >= 150000;
--WHERE annual_salary >= 150000; -- alias�� �������� ����� �� ����.

--�� �� ���� ���� �޿��� 120000�� ����� ���, ��, ���� ��ȸ
SELECT employee_id, last_name, salary*12 annual_salary
FROM employees
WHERE salary*12 = 120000;

--����� 101���� ����� ���, ��, �̸��� ��ȸ
--�̸��� ���� ���ؼ� �������� ����Ѵ�. (���� ������ || ���)
SELECT employee_id, first_name ||' '|| last_name
FROM employees
WHERE employee_id = 101;

--������ StevenKing�� ����� ���, ����, ���� �ڵ�, �޿�, �μ� �ڵ� ��ȸ
--������ �̸��� ���� ���ؼ� ����Ѵ�.
SELECT employee_id, first_name ||' '|| last_name, job_id, salary, department_id
FROM employees
--WHERE first_name || last_name = 'StevenKing';
WHERE LOWER(first_name || last_name) = 'stevenking';

--������ StevenKing�� ����� ���, ����, ���� �ڵ�, �޿�, �μ� �ڵ�(dept_id�� ALIAS) ��ȸ
--������ �̸��� ���� ���ؼ� ���(name���� ALIAS)�Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, job_id, salary, department_id AS dept_id
FROM employees
WHERE LOWER(first_name || last_name) = 'stevenking';

--����� 101���� ����� ����� �� �� ���� ���� �޿��� ��ȸ�Ѵ�.
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
--������ 'annual salary'�� �����Ѵ�.
SELECT first_name ||' '|| last_name AS name, salary * 12 AS "annual salary"
FROM employees
WHERE employee_id = 101;

--3. �� ������ : =, !=, <>, ^=, >, <, >=, <=
--����. �޿��� 3000 ������ ����� ���, ��, �޿�, �μ� ��ȣ, ���� �ڵ带 ��ȸ�Ѵ�.
SELECT employee_id, last_name, salary, department_id, job_id
FROM employees
WHERE salary <= 3000;

--�μ� �ڵ尡 80 �ʰ��� ����� ���, ��, �޿�, �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id > 80;

--�μ� �ڵ尡 90�� �μ��� ���� ������� ���, �̸�, ��, �μ� �ڵ�, ���� �ڵ� ��ȸ
SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
--WHERE department_id = 90;
WHERE department_id IN(90);

--�޿��� 17000�� ������� ���, �̸�, ��, �μ� �ڵ�, �޿� ��ȸ
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE salary = 17000;

--�޿��� 3000 ������ ������� ���, �̸�, ��, ���� �ڵ�, �޿�, �Ի� ���� ��ȸ
SELECT employee_id, first_name, last_name, job_id, salary, hire_date
FROM employees
WHERE salary <= 3000;

--�޿��� 15000 �̻��� ������� ���, �̸�, ��, ���� �ڵ�, �޿� ��ȸ
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE salary >= 15000;

--���� King�� ������� ���, �̸�, ��, �μ� �ڵ� ����
SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'king';