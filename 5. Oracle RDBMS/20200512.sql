--���� ����(Sub Query)
--SQL ���� �ȿ� �����ϴ� �� �ٸ� SQL ������ ���� ������ �Ѵ�.
--���� ������ ��ȣ�� ���� ����ϰ� ���� ������ ���Ե� �������� ���� ������ �Ѵ�.

--�� ���� ������ ��ġ�� ���� ��Ī
--SELECT ���� �ִ� ���� ���� : ��Į�� ���� ����, SQL���� ���� ���� ��Į�� ���̶� ��,
--Scalar : �ϳ�(ũ��), Vector : ũ��� ����
--SELECT ���� ���� ������ ����Ͽ� �ϳ��� Į��ó�� ����ϱ� ���� ����(ǥ�� �뵵)
--����(Join)�� ��ü ǥ�������ε� ���� ���

--FROM ���� �ִ� ���� ���� : �ζ��� ��
--SELECT ���� ����� FROM������ �ϳ��� ���̺�ó�� ��� (���̺� ��ü �뵵)
--�ζ��� �� ���� ������ ORDER BY ���� �� �� ����.
--(�� ��� �뵵�� �ƴ� ���̺�ó��, ��� �뵵�̹Ƿ� ���� ������ �ʿ䰡 ����.)
--���ζ��� �� ���� �������� �׷��Լ��� �ݵ�� alias �����ؾ� �ԡ�

--WHERE ���� �ִ� ���� ���� : �Ϲ� ���� ����
--�� SELECT ���� ����� �ϳ��� ����(���)ó�� ���
--(�������� ���� ������ ����� ���� �޶���)

--�޿��� ��� �޿����� �� ���� �޿��� �޴� �����
--���, �̸�, �� ������ ��ȸ�Ѵ�.
SELECT employee_id, first_name, last_name
FROM employees
--WHERE salary < AVG(salary); -- �׷� �Լ��� WHERE������ ����� �� �����Ƿ� ���� �߻�
--WHERE salary < 6461.83;
WHERE salary < (SELECT AVG(salary) FROM employees); -- ���� ����

SELECT AVG(salary) FROM employees; -- ��� �޿� 6461.83

--���� ���� �޿��� �޴� �����
--���, ��, ��, �޿� ��ȸ
SELECT employee_id, last_name, first_name, salary
FROM employees
--WHERE salary = MAX(salary); -- �׷� �Լ��� WHERE������ ����� �� �����Ƿ� ���� �߻�
WHERE salary = (SELECT MAX(salary) FROM employees);

--���� ���� : ���� ������ �ȿ� �ִ� �� �ٸ� ������
--���� ����� ���� ���� : ���� ���� ����ϴ� ���� ������ ��� ���� ���� ���� ���
--���� ����� ���� ���� : ���� ���� ����ϴ� ���� ������ ��� ���� ���� ���� ���
--���� Į�� ���� ���� : ���� ���� ����ϴ� ���� ������ ��� Į���� ���� Į���� ���

--4. Scalar ���� ���� : SELECT ���� ����ϴ� ���� ����
--5. ��ȣ ���� ���� ���� : ���� ������ Į���� ���� ������ ���� ���� ���Ǵ� ���
--6. �ζ��� �� ���� ���� - FROM ���� ����ϴ� ���� ����

--01. �츮 ȸ�� ������� �޿� ������ �ľ��ϰ��� �Ѵ�.
--�޿��� �츮 ȸ�� �޿��� ��պ��� �� ���� �޴� �������
--���, ��, ���� �ڵ�, �޿� ��ȸ
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

--02. ��� 150�� ������� �� ���� �޿��� �޴� �������
--���, ��, �μ� �ڵ�, ���� �ڵ�, �޿� ��ȸ
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 150);
                
--03. ���޿��� ���� ���� �����
--���, �̸�, ��, ���� ���� ������ ��ȸ
SELECT e.employee_id, e.first_name, e.last_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.salary = (SELECT MAX(salary)
                FROM employees);
                
--04. ������� �޿��� �츮 ȸ�� ��� �޿� �̻� �ִ� �޿� ���Ͽ� �ش��ϴ�
--������� ���, ��, �޿� ��ȸ
SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN (SELECT AVG(salarY)
                      FROM employees)
AND (SELECT MAX(salary)
     FROM employees);
     
--05. �츮ȸ�翡�� ���� ���� �޿��� �޴� ����� 
--���, ��, �����ڵ�, �μ��ڵ�, �μ���, �޿� ��ȸ
SELECT e.employee_id, e.last_name, e.job_id, d.department_id, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.salary = (SELECT MIN(salary) FROM employees);

--06. �μ����� Marketing �� �μ��� ���� ������� 
--���, ����, �μ��ڵ�, �����ڵ� ��ȸ
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, d.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
--AND d.department_name = 'Marketing';
AND d.department_name = (SELECT department_name
                         FROM departments
                         WHERE department_name ='Marketing');

--07. �츮ȸ�� ����Ժ��� ���� �Ի��� ������� 
--���, ����, �Ի����� ��ȸ
--������ �׸� �����ϴ� �Ŵ����� ���� ����� ���Ѵ�
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, e.hire_date
FROM employees e
WHERE e.hire_date < (SELECT hire_date
                   FROM employees
                   WHERE manager_id IS NULL);
------------------------------------------------------------------------------------------
--2. ���� ����� ���� ���� - ���� ���� ����� ���� ������ ��� ���� ���� ���� ���
--������ : IN, NOT IN(��, '='�� IN���� ��ü)
--���� ����� �� �� �̻��� ��Һ� �Ұ�, �׷��� IN ������ ���
--���� ������ ����� ���� ���� ��� '=', '<', '>'�� ���� ��Һ񱳰� �Ұ�
--WHERE ������ �׷��Լ� MIN, MAX ��� �Ұ�
--WHERE ���� �ƴ� ���� ������ �׷� �Լ� MIN, MAX ����ص� ���� ����

--Į��ǥ�� IN / NOT Į��ǥ�� IN / Į��ǥ�� NOT IN

--���� 01. �μ��� ��ġ �ڵ尡 1700��/1700�� �ƴ� �μ��� ���� �������
--���, ����, �μ� �ڵ�, ���� �ڵ�, ��ġ �ڵ� ��ȸ (�Ϲ� ����)
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, d.department_id, e.job_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
--AND d.location_id = 1700;
AND d.location_id IN (1700);

SELECT employee_id, first_name || ' ' || last_name name, department_id, job_id
FROM employees 
WHERE department_id IN ( SELECT department_id 
                  --NOT IN (SELECT department_id 
                         FROM departments                
                         WHERE location_id = 1700 );
--WHERE e.department_id = (��ġ�ڵ尡 1700 �� �μ�);

--���� 02. �츮 ȸ�翡�� mgr �����������ϴ� ������ ���� �μ��� ���� �������
--���, ��, ���� �ڵ� ��ȸ
SELECT employee_id, last_name, job_id
FROM employees
WHERE LOWER(job_id) LIKE '%mgr%';

SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id IN(SELECT department_id FROM employees WHERE LOWER(job_id) LIKE '%mgr%');

--���� 03. �� �μ��� �ּ� �޿��� 40�� �μ��� �ּ� �޿����� �� ���� �μ� �ڵ�, �ּ� �޿� ��ȸ
SELECT department_id, MIN(salary) min_sal
FROM employees
GROUP BY department_id
HAVING MIN(salary) >= (SELECT MIN(salary) FROM employees WHERE department_id = 40);

--���� 04. �ٹ����� ���� �ڵ尡 UK�� ���� �ִ� �μ���
--�μ� �ڵ�, ��ġ �ڵ�, �μ��� ��ȸ
SELECT  d.department_id,
        l.location_id, d.department_name
FROM    departments d, locations l
WHERE d.location_id = l.location_id
AND LOWER(l.country_id) = 'uk';

SELECT department_id, location_id, department_name
FROM departments
WHERE location_id IN(SELECT location_id FROM locations WHERE LOWER(country_id) = 'uk');

--���� 01. ���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������ ���� �μ��� ����
--������� ���, ����, �μ� �ڵ�, ���� �ڵ� ��ȸ
SELECT employee_id, first_name ||' '|| last_name name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE LOWER(last_name) LIKE '%z%');