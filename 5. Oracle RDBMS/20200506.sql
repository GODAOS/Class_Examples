--5. ����(JOIN) : �����ϴ�, �մ�, ��������, �����ϴ�
--�ϳ��� ���̺�κ��� �����͸� ��ȸ�� �� ���� ���
--���� ���� ���̺�κ��� �����͸� ��ȸ�ϴ� ����� JOIN�̶�� �Ѵ�.

SELECT * FROM departments;  --�μ� ����, 27��
SELECT * FROM employees;    --��� ����, 107��
SELECT * FROM jobs;         --���� ����, 19��

--1. CARTESIAN PRODUCT
--�� WHERE ���� JOIN ������ ������� �ʾ� �߸��� ������ ���� ����� ���� �Ǵ� ����
--cartesian product, cross join, SQL���� ���̴� ��찡 ����
--���, ��, �μ��� ��ȸ
SELECT employee_id, last_name, department_name
FROM employees, departments;
--2889���� ��� (107 * 27 = 2889 �� cartesian product)

--2. EQUI JOIN(ANSI������ INNER JOIN)
--WHERE ���� ���� ������ (=)�� ����ϴ� JOIN �����̴�.
--�� ��, ���̺� ���� �������� �����Ǵ� ���� ���� ����� ����� ��ȯ
--�� JOIN ���� �� Į���� ���� ���� Į���� ���� ���� ���ǽ� ���� (�� ���̺��.Į���� = ���̺��.Į����)

--Table = Entity
--���̺� ���� ���赵 : Entity Relationship Diagram(ERD)

--�� ���̺� ���� ����
--1. FROM ���� ���̺� ����� �����ϸ�, ���̺� �� ALIAS�� �����Ѵ�. (�ڵ� ������ ���̰� �������� ���̱� ����)
--2. ���� ������ WHERE ���� �ۼ��Ѵ�.

--------------------------------------------------------------------------------------------------------------------
--�� ������ �ۼ� ����
--1. ��ȸ�� �����͸� �ľ��� �� SELECT ���� �ۼ��Ѵ�.
--SELECT Į����1, ...
--2. SELECT ���� ������ Į������� � ���̺� �ִ��� �ľ��� �� FROM ���� �ۼ��Ѵ�.
--FROM ���̺� ��
-- - ���� ���� ���̺�κ��� �����͸� ��ȸ�ؾ� �Ѵٸ� FROM ���� �ĸ�(,)�� ����
--3. Ư�� ���ǿ� �´� ���������� ��ȸ�ؾ� �ϴ� ��� WHERE ���� �ۼ��Ѵ�.
--WHERE ���ǽ�
-- - FROM ���� ���Ը��� ���� ���� ��� ���̺� ���� ������ �ۼ��Ѵ�.
-- - WHERE ���� ���ǽ� �� ���̺��.Į���� = ���̺��.Į����
--WHERE �������ǽ�
--AND �Ϲ����ǽ�
--4. SELECT ���� �׷��Լ�(COUNT, SUM, AVG, MIN, MAX)�� ����� Į�� ǥ���� �ִµ�
--�׷� �Լ��� ������� ���� Į�� ǥ���� �Բ� �ִٸ� GROUP BY ���� �ۼ��Ѵ�.
-- - �׷� �Լ��� ������� ���� Į�� ǥ���� ���� ��� GROUP BY �������� ���
--  GROUP BY �׷� ���� ���� ǥ��
--GROUP BY ���� ����� ��� GROUP BY�� ���� ���� ��� �������࿡ ����
-- - Ư�� ���ǿ� �´� ���������� ��ȸ�ؾ��ϴ� ��� ORDER BY�� ����Ѵ�.
-- ORDER BY ���� ����ǥ�� ����/��������
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY
------------------------------------------------------------------
--���� 1. employees, departments ���̺��� ����Ͽ�
--���, ��, �μ��� ������ ��ȸ
--SELECT e.employee_id, e.last_name, d.department_name -- ��Ȯ�ϰ� �ۼ��ϸ� �̷��� �ǳ�, �ϳ� ���� Į���� ��� �̸��� ���൵ �ȴ�.
SELECT employee_id, last_name, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--���� 2. employees, departments ���̺��� ����Ͽ�
--������� ���, ��, �μ� �ڵ�, �μ��� ������ ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--���� 3. employees, jobs ���̺��� ����Ͽ�
--���, ��, ���� �ڵ�, ���� ���� ������ ��ȸ
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

--JOIN �ϴ� ��� ���̺��� �߰� �Ǹ� JOIN ������ �߰�
--WHERE ���� JOIN ���ǰ� �Ϲ� ������ �Բ� ���

--WHERE ���� ���ǽĿ���
--�Ϲ����� ���ǽİ� ���̺� ���� ���ǽ��� ��� �ʿ��� ���
-- - WHERE ���� ���ǽ� AND �Ϲ� ���ǽ�

--employees, departments, jobs ���̺��� ����Ͽ�
--���, ��, �μ���, ���� ������ ��ȸ --���� ������ table ���� -1 ��ŭ �ʿ�!
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.job_id = j.job_id
AND e.department_id = d.department_id;

--employees, departments, jobs ���̺��� ����Ͽ�
--����� 101���� ����� ���, �̸�, �μ���, ���� ���� ������ ��ȸ
SELECT e.employee_id, e.first_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND e.employee_id = 101;

--employees, departments ���̺��� ����Ͽ�
--����� 100, 120, 130, 140�� �������
--���, ��, �μ� �ڵ�, �μ���
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.employee_id IN (100, 120, 130, 140)
ORDER BY 1;

--�Ŵ����� ���� ����� ���, �̸�, ���� ������ ��ȸ�Ѵ�.
SELECT e.employee_id, e.first_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.manager_id IS NULL;

--[���� ����]
--1. ���� ��ҹ��� �����ϰ� z�� �ִ� ���� ���� �������
--���, ��, �μ� �ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(e.last_name) LIKE '%z%';

--2. Ŀ�̼��� �޴� �������
--���, ��, �޿�, Ŀ�̼� ����, ���� ���� ��ȸ
SELECT e.employee_id, e.last_name, e.salary, e.commission_pct, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL
ORDER BY 1;

--3. Ŀ�̼��� �޴� �������
--���, ��, �޿�, Ŀ�̼� �ݾ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, e.salary, ROUND(e.salary * e.commission_pct, 2) AS comm, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL
ORDER BY 1;

--4. �� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
--�� �μ��� �μ� �ڵ�, �μ���, ��ġ �ڵ�, ���ø� ��ȸ
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM countries c, departments d, locations l
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
ORDER BY 1;

--5. ���, ��, �μ� �ڵ�, �μ���, �ٹ��� ���ø�, �ּ� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city, l.street_address
FROM employees e, departments d, locations l, countries c
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
ORDER BY 1;

--6. ���, ��, �μ� �ڵ�, �μ���, ���� �ڵ�, ���� ���� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
ORDER BY 1;

--7. �� �μ��� �μ� �ڵ�, �μ���, ��ġ �ڵ�, ���ø�, ���� �ڵ�, ������, ����� ��ȸ
SELECT d.department_id, d.department_name, l.location_id, l.city, c.country_id, c.country_name, r.region_name
FROM departments d, locations l, countries c, regions r
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id
ORDER BY 1;
---------------------------------------------------------------------------
--3. NON-EQUI JOIN
--�� ������(<=, >=, <, >), ���� ������(BETWEEN), IN ������ ����
--���� ������(=) �̿��� �����ڸ� ����ϴ� JOIN �����̴�.
--JOIN �ϴ� Į���� ��ġ���� �ʰ� ����ϴ� JOIN �������� ���� ������� �ʴ´�.

--employees, jobs ���̺��� �̿��Ͽ�
--�޿��� �ְ� ���� �޿� ���� ���� �ִ� 10�� �μ�����
--���, �̸�, �޿�, ���� ������ ��ȸ�Ѵ�.
SELECT e.employee_id, e.first_name, e.salary, j.job_title
FROM employees e, jobs j
WHERE e.salary BETWEEN j.min_salary AND j.max_salary
AND e.department_id = 10;

------------------------------------------------------------------------------------------
--4. OUTER JOIN : NULL ���� �����Ǵ� ������ �l���ؼ� ǥ���ϱ� ���� ����
--EQUI JOIN�� ���� ���ǿ� ����񱳿����ڷ� ���� ����,
--��, ���̺�� ���� �������� �����Ǵ� ���� ���� ����� ����� ��ȯ

--������ OUTER JOIN �������� �����Ǵ� ���� ���� ����� ������� ��ȯ�Ѵ�.
--�����Ǵ� ���� ���� ���̺� Į���� (+)��ȣ�� ǥ���Ѵ�.
--��, ���������� ������ �߻����� �ʵ��� �ϱ� ���� ���� ���
--�� (+)��ȣ�� ���������� ������ ���� �����ʿ� �ٿ��ش�.

--��� ���̺��� �μ���ġ ���� ���� ��� ��������(NULL)�� �ְ�
--�μ� ���̺��� �μ� �ڵ尡 NULL�� �Ϳ� ���� ���������� �����Ƿ�
--�μ� ���̺��� �μ� �ڵ� �ʿ� OUTER ��ȣ�� ���δ�.
--(�����Ͱ� ���� ���� �ִ� �� JOIN Į���� (+)�� �߰�)

--��ȣ�� �����ʿ� (+)�� ������ ������ ���̺� null�� ���Ǿ� LEFT OUTER JOIN
--��ȣ�� ���ʿ� (+)�� ������ ���� ���̺� null�� ���Ǿ� RIGHT OUTER JOIN

--��� �����, ���, ��, �μ� �ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
--WHERE e.department_id = d.department_id; -- 107���� �μ� �ڵ尡 ���� 1���� ���ܵǾ� 106�� ǥ�õȴ�.
WHERE e.department_id = d.department_id(+);

SELECT COUNT(job_id) FROM jobs; -- 19, �׷� �Լ� NULL ����
SELECT COUNT(DISTINCT job_id) FROM employees; -- 19, DISTINCT NULL ���
--��� ����� ���, ��, ���� �ڵ�, ���� ���� ��ȸ
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1;

--���, ��, �μ���, ���� ���� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id;