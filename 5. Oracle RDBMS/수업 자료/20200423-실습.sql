--1. �μ��ڵ� 30, 40, 60�� �μ��� ���� �������
--���, ����, �μ��ڵ�, �޿��� ��ȸ�Ͽ� ��������� �����Ѵ�.

SELECT employee_id, first_name || ' ' || last_name, department_id dept_id, salary
FROM employees
--WHERE department_id = 30
--OR department_id = 40
--OR department_id = 60;
WHERE department_id IN (30,40,60);


--2. Ŀ�̼��� �޴� ������� ���, ����, �޿�, Ŀ�̼ǿ����� ��ȸ�Ͽ�
--Ŀ�̼ǿ����� ���� ������� ���� ��������� �����Ѵ�.

SELECT employee_id, first_name || ' ' || last_name name, salary, commission_pct
FROM EMPLOYEES
WHERE commission_pct IS NOT NULL
--ORDER BY commission_pct DESC;
ORDER BY 4 DESC;


--3. ���� ��/�ҹ��� �����ϰ� z �� �ִ� �������
--���, ���� �� ��ȸ�Ͽ� ��������� �����Ѵ�.

SELECT employee_id, first_name || ' ' || last_name name
FROM employees
--WHERE first_name || ' ' || last_name LIKE '%z%'
--OR first_name || ' ' || last_name LIKE '%Z%'

--WHERE lower(first_name || ' ' || last_name) LIKE '%z%'
WHERE upper(first_name || ' ' || last_name) LIKE '%Z%'
--ORDER BY first_name || ' ' || last_name;
--ORDER BY name;
ORDER BY 2;


--[�������� 2-1]
--1. ����� 200�� ����� ����� �μ��ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT first_name || ' ' || last_name name, department_id dept_id
FROM EMPLOYEES
WHERE employee_id = 200;

--2. �޿��� 3000���� 15000 ���̿� ���Ե��� �ʴ� ����� ���, ����, �޿� ������ ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--(��, �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���ļ� ��ȸ�Ѵ�. 
--���� ��� �̸��� John �̰� ���� Seo �̸�  John Seo �� ��ȸ�ǵ��� �Ѵ�.)
SELECT employee_id, first_name || ' ' || last_name name, salary
FROM employees
--WHERE salary NOT BETWEEN 3000 AND 15000;
WHERE salary < 3000 OR salary > 15000;

--3. �μ��ڵ� 30�� 60 �� �Ҽӵ� ����� ���, ����, �μ��ڵ�, �޿��� ��ȸ�ϴµ�, 
--������ ���ĺ������� �����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
--WHERE department_id IN (30, 60)
WHERE department_id = 30 
OR department_id = 60;
ORDER BY name;

--4. �޿��� 3000���� 15000 ���� �̸鼭, �μ��ڵ� 30�Ǵ� 60�� �Ҽӵ� ����� 
--���, ����, �޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--(��, ��ȸ�Ǵ� �÷����� �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���� name ����,
--�޿��� Monthly Salary �� ��ȸ�ǵ��� �Ѵ�.)

SELECT employee_id, first_name || ' ' || last_name name, salary AS "Monthly Salary"
FROM EMPLOYEES
WHERE salary BETWEEN 3000 AND 15000
AND department_id IN (30,60);

--5. �Ҽӵ� �μ��ڵ尡 ���� ����� ���, ����, �����ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, job_id
FROM employees
WHERE department_id IS NULL;


--6. Ŀ�̼��� �޴� ����� ���, ����, �޿�, Ŀ�̼��� ��ȸ�ϴµ�, 
--Ŀ�̼��� ���� ������� ���� ��� ������ �����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.

SELECT employee_id, first_name || ' ' || last_name name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct DESC;

--7. ���� ��ҹ��� ���о��� ���� z �Ǵ� Z �� ���Ե� ����� ����� ����(name)�� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name
FROM EMPLOYEES
WHERE lower(first_name || ' ' || last_name) LIKE '%z%';





