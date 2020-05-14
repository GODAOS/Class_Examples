--��ȣ ���� ���� ����
--1) �ܼ��� �׷� �Լ��� ��� ���� SELECT���� ��ȸ�ϰ��� �� ��
--�� ����� �޿� ������ �ľ��ϰ��� �Ѵ�.
--��� ����� ���, ��, �޿�, ȸ�� ��� �޿�, ȸ�� �ִ� �޿� ��ȸ
SELECT employee_id, last_name, salary, ROUND(AVG(salary)) avg_sal, MAX(salary) max_sal
FROM employees
GROUP BY employee_id, last_name, salary;

SELECT employee_id, last_name, salary,
       (SELECT ROUND(AVG(salary)) FROM EMPLOYEES) avg_sal,
       (SELECT MAX(salary) FROM employees) max_sal
FROM employees;

--SELECT ���� �׷� �Լ��� ���� �Ǹ� ������ �׷� �Լ� �̿��� Į����
--GROUP BY ���� ����ϰų� �׷� �Լ��� �� �� �ִ�.

--2) �ڵ强 �����͸� SELECT ���� ��ȸ�ϰ��� �� �� : ��ȣ ���� ���� ����, OUTER JOIN ����� �� ó��
--��� ����� ��� ��, �μ� �ڵ�, �μ��� ��ȸ
SELECT employee_id, last_name, department_id,
       (SELECT department_name
        FROM departments d
        WHERE d.department_id = e.department_id) department_name
FROM employees e;

--��� ����� ���, ��, �μ� �ڵ�, ���� �ڵ�, ���� ���� ��ȸ
SELECT employee_id, last_name, department_id, job_id,
       (SELECT job_title FROM jobs WHERE job_id = e.job_id) job_title
FROM employees e;

--�� �μ��� ���� �μ� �ڵ�, �μ���, ���ø� ����
SELECT department_id, department_name,
       (SELECT city FROM locations WHERE location_id = d.location_id) city
FROM departments d;

--��� ������� ���, ��, �޿�, �μ� �ڵ�, �μ���, ���� �ڵ� ��ȸ
--����Ŭ ����
SELECT employee_id, last_name, salary, d.department_id, department_name, job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

--��ȣ ���� ���� ����
SELECT employee_id, last_name, salary, department_id,
       (SELECT department_name FROM departments WHERE department_id = e.department_id) department_name,
       job_id
FROM employees e;

--ANSI ����
SELECT employee_id, last_name, salary, d.department_id, d.department_name, job_id
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;

--���� 03. �� �μ��� ���� �μ� �ڵ�, �μ���, ��ġ �ڵ�, ���ø� ��ȸ
--����Ŭ ����
SELECT department_id, department_name, l.location_id, city
FROM departments d, locations l
WHERE d.location_id = l.location_id;

--ANSI ����
SELECT department_id, department_name, l.location_id, city
FROM departments d JOIN locations l
ON d.location_id = l.location_id;

--��ȣ ���� ���� ����
SELECT department_id, department_name, location_id,
       (SELECT city FROM locations WHERE location_id = d.location_id) city
FROM departments d;

--���� 04. �� ����� ���� ����� �ҼӵȺμ��� �޿� ���� ��� ����� �޿��� �ľ��ϰ��� �Ѵ�.
--���, ��, �μ� �ڵ�, �޿�, ���� �μ��� ��� �޿� ��ȸ
SELECT employee_id, last_name, department_id, salary,
       (SELECT ROUND(AVG(salary)) FROM employees WHERE department_id = e.department_id) dept_avg_sal
FROM employees e;

--���� 05. �� �μ��� �μ� �ڵ�, �μ� ��� �޿� ��ȸ
--����Ŭ ����
SELECT department_id, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id;

--��ȣ ���� ���� ����
SELECT department_id,
       (SELECT ROUND(AVG(salary)) FROM employees WHERE department_id = e.department_id) dept_avg_sal
FROM employees e
GROUP BY department_id;

---------------------------------------------------------------------------------------------------
--6. FROM ���� ����ϴ� �ζ��κ� ���� ����
--SELECT ���� ����� FROM ������ �ϳ��� ���̺�ó�� ��� (���̺� ��ü �뵵)
--FROM ���� ����ϴ� �ζ��� �� ���� �������� �׷��Լ��� *�ݵ��* ALIAS �����ؾ� �Ѵ�!

--���� 01. �츮 ȸ�� ������� �޿� ������ ������ ���̺��� �ִٰ� �����Ѵ�.
--�������� ���, ��, ȸ�� �ִ� �޿�, ȸ�� �ּ� �޿�, ȸ�� ��� �޿�
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal
FROM employees, (SELECT MAX(salary) max_sal, MIN(salary) min_sal, ROUND(AVG(salary)) avg_sal FROM employees);

--���� 02. �� �μ����� ���� ���� �޿��� �޴� �������
--���, ��, �μ� �ڵ�, �޿� ��ȸ
--�μ����� ���帹�� �޿�
SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id;

--���� Į�� ���� ����
SELECT employee_id, last_name, department_id, salary
FROM employees
WHERE (department_id, salary)
IN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id)
ORDER BY 3;

--�ζ��� �� ���� ����
SELECT employee_id, last_name, e.department_id, salary
FROM employees e, (SELECT department_id, MAX(salary) max_sal FROM employees GROUP BY department_id) m
WHERE e.department_id = m.department_id
AND salary = max_sal;