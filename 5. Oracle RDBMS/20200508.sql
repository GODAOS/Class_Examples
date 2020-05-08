--5.6 ANSI JOIN
--ANSI JOIN�� ��� DBMS���� ���������� ����� �� �ִ� ���� ǥ�� JOIN �����̴�.

--1. INNER JOIN (����Ŭ�� EQUI JOIN), ������
--��FROM �� �ȿ� INNER JOIN�� ����Ͽ� ���̺� �� ���� ����
--JOIN ������ ON ��, USING ���� ����Ѵ�.
--FROM ���̺��1 INNER JOIN ���̺��2
--ON ���� ���ǽ� WHERE �Ϲ� ����
--(�Ǵ�) USING (���� Į����) �� USING ���� ���� Į���� ���ؼ��� ���̺�� ����� ����ؼ��� �ȵȴ�.

--���� ������ :
--ON �� - ���� ���ǽ�(���̺��.Į���� = ���̺��.Į����)
--        �����ϴ� Į�� ���� �����ϸ� �ݵ�� ���̺���� ����ؾ߸� �Ѵ�.
--USING �� - (���� Į����) ��ȣ�ȿ� Į���� ���´�.

--�μ� �ڵ尡 60���� ���, ��, �μ� �ڵ�, �μ��� ��ȸ
--����Ŭ ����
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE d.department_id = 60
AND e.department_id = d.department_id;

--ANSI ����
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id = 60;

SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE department_id = 60;

--���, ��, ���� �ڵ�, ���� ���� ��ȸ
--����Ŭ ����
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

--ANSI ����
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e INNER JOIN jobs j
USING (job_id);

--ON, USING �� ������ WHERE ���� ����� �Ϲ� ������ ǥ���Ѵ�.
--���� �ڵ尡 clerk ���� ���� ���¸� �ϴ� ���, ��, ���� �ڵ�, ���� ���� ��ȸ
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND LOWER(j.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(j.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e JOIN jobs j
USING (job_id)
WHERE LOWER(job_id) LIKE '%clerk%'
ORDER BY 1;

--�츮 ȸ�� �μ� ������ �ľ��ϰ��� �Ѵ�.
--�μ� �ڵ�, �μ���, ��ġ �ڵ�, ���� ��ȸ
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id
ORDER BY 1;

SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d JOIN locations l
ON d.location_id = l.location_id
ORDER BY 1;

SELECT d.department_id, d.department_name, location_id, l.city
FROM departments d JOIN locations l
USING(location_id)
ORDER BY 1;

--�Ŵ����� �μ��� 60 �̻��� �μ��� ���� �������
--���, ��, �Ŵ��� ���, �Ŵ��� �� ��ȸ --SELF JOIN
SELECT e.employee_id, e.last_name, m.employee_id manager_employee_id, m.last_name manager_last_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND m.department_id >= 60
ORDER BY 1;

SELECT e.employee_id, e.last_name, m.employee_id manager_employee_id, m.last_name manager_last_name
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.department_id > = 60
ORDER BY 1;

--JOIN�� ����ϴ� ���̺��� 3�� �̻��� ���,
--ù ��° JOIN�� ����� �� ��° JOIN�� �߰��ϴ� ���·� JOIN������ ����Ѵ�.
--�μ��ڵ� 10, 20, 40, 60�� �μ��� ���� �������
--���, ��, �μ� �ڵ�, �μ���, ���� �ڵ�, ���� ���� ��ȸ
SELECT e.employee_id, d.department_id, d.department_name, j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id(+)
AND d.department_id IN (10, 20, 40, 60);

SELECT e.employee_id, d.department_id, d.department_name, j.job_id, j.job_title
FROM employees e JOIN departments d 
ON e.department_id = d.department_id(+)
JOIN jobs j ON e.job_id = j.job_id
WHERE d.department_id IN (10, 20, 40, 60);

SELECT e.employee_id, department_id, d.department_name, job_id, j.job_title
FROM employees e JOIN departments d
USING (department_id)
JOIN jobs j USING (job_id)
WHERE department_id IN (10, 20, 40, 60);