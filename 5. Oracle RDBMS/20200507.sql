--��� ����� ���, ��, �μ� �ڵ�, �μ���, ��ġ �ڵ�, ���� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);

--��� ����� ���, ��, �μ� �ڵ�, �μ���, ���� �ڵ�, ���� ���� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id;

--������ ����� 149�� �������
--���, ��, �μ� �ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id = 149;

--���� ��ҹ��� �����ϰ� a�� �ִ� ���� ���� �������
--���, ��, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(e.last_name) LIKE '%a%'
ORDER BY 2;

--Ŀ�̼��� �޴� ������� ���, ��, �μ���, ���ø� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND e.commission_pct IS NOT NULL;

--------------------------------------------------------------------------------------------------------------------
--SELECT ���� ����� ALIAS ���̳� SELECT �������� ��ġ�� ORDER BY �������� ����� �� �ִ�.
--WHERE ��, GROUP BY ��, HAVING �� (������)������ ALIAS�� Į���� ��ġ�� ����� �� ����.
--------------------------------------------------------------------------------------------------------------------
--�μ��� ������� ������ �ľ��ϰ��� �Ѵ�.
--�μ� �ڵ尡 60�� ������ �μ��� ���� �μ��� ��� �޿��� 5000 �̻��� �μ���
--�μ� �ڵ�, ��� ��, �޿� �հ�, �޿� ���, �ִ� �޿�, ���� �޿�, �ֱ� �Ի�����, ���� �Ի����� ��ȸ
SELECT department_id, count(*) cnt, SUM(salary) sum_sal, ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal, MIN(salary) min_sal, MAX(hire_date) max_hire, MIN(hire_date) min_hire
FROM employees
WHERE department_id <= 60
GROUP BY department_id
HAVING AVG(salary) >= 5000
--HAVING department_id <= 60 AND AVG(salary) >= 5000
ORDER BY 1;

--���� ���º��� ������� ������ �ľ��ϰ��� �Ѵ�.
--���� ���º��� ��� ���� 10�� �̻��� ���� ���¿� ����
--���� �ڵ�, ������ ��� ��, ������ ��� �޿�, ������ �ִ� �޿�, ������ �ּ� �޿�,
--������ �ֱ� �Ի� ����, ������ ���� �Ի� ���� ��ȸ
SELECT job_id, COUNT(*) cnt, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal,
       MAX(hire_date) max_hire, MIN(hire_date) min_hire
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 10;
--------------------------------------------------------------------------------------------------------------------
--5. SELF JOIN
--�ϳ��� ���̺��� �� �� ����Ͽ� ������ ���̺� �� ���κ��� JOIN�� ���� �����͸� ��ȸ�Ͽ� ����� ��ȯ
--��� ����� ���, �̸�, �Ŵ��� ���, �Ŵ��� �̸� ������ ��ȸ
SELECT e.employee_id, e.first_name,
       NVL(TO_CHAR(e.manager_id), '����') manager_id_1,
       NVL2(e.manager_id, TO_CHAR(e.manager_id), '����') manager_id_2,
       NVL(m.first_name, '����') manager_name_1,
       NVL2(m.first_name, m.first_name, '����') manager_name_2
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY e.employee_id;

--------------------------------------------------------------------------------------------------
--1. ��� ����� ���, ����, �����ڵ�, �Ŵ������, �Ŵ�������, �Ŵ����� �����ڵ� ��ȸ�Ͽ�
--��� ������ ���� --SELF JOIN
SELECT e.employee_id, e.first_name ||' '|| e.last_name AS name, e.job_id,
       e.manager_id, m.first_name ||' '|| m.last_name manager_name, m.job_id manager_job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
ORDER BY 1;

--2. ���� King�� ������� ���, ����, �μ��ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.last_name = 'King'
AND e.department_id = d.department_id(+);

--3. ��ġ�ڵ尡 1400 �� ���ÿ��� ��� �μ��� �ֳ� �ľ��ϰ��� �Ѵ�.
--��ġ�ڵ尡 1400 �� ���ø�, �μ��� ��ȸ
SELECT l.city, d.department_name
FROM departments d, locations l
WHERE l.location_id = 1400
AND d.location_id = l.location_id;

--4. ��ġ�ڵ� 1800 �� ���� �ٹ��ϴ� �������
--���, ����, �����ڵ�, �޿�, �μ���, ��ġ�ڵ� ��ȸ
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, e.job_id, e.salary, d.department_name, l.location_id
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.location_id = 1800;

--5. �ڽ��� �Ŵ������� ���� �Ի��� ������� 
--���, ����, �Ի�����, �Ŵ�������, �Ŵ��� �Ի����� ��ȸ --SELF JOIN
SELECT e.employee_id, e.first_name ||' '|| e.last_name name, e.hire_date,
       m.first_name ||' '|| m.last_name manager_name, m.hire_date manager_hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;

--6. toronto �� �ٹ��ϴ� �������
--���, ��, �����ڵ�, �μ��ڵ�, �μ���, ���� ��ȸ
SELECT e.employee_id, e.last_name, e.job_id, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND LOWER(l.city) = 'toronto';

--7. Ŀ�̼��� �޴� ��� ������� ��, �μ���, ��ġ�ڵ�, ���� ��ȸ
SELECT e.last_name, d.department_name, l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.commission_pct IS NOT NULL
AND e.department_id = d.department_id
AND d.location_id = l.location_id;

--8. �̸��� �ҹ��� v�� ���Ե� ��� ����� ���, �̸�, �μ����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE LOWER(e.first_name) LIKE '%v%'
AND e.department_id = d.department_id;

--9. Ŀ�̼��� �޴� ����� ���, �̸�, �޿�, Ŀ�̼� �ݾ�, �μ����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--   ��, Ŀ�̼� �ݾ��� ���޿��� ���� Ŀ�̼� �ݾ��� ��Ÿ����.
SELECT e.employee_id, e.first_name, e.salary, ROUND(e.salary * e.commission_pct) comm, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL;

--10. �� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø�, �����ڵ�, �������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT d.department_id, d.department_name, l.location_id, l.city, c.country_id, c.country_name
FROM departments d, locations l, countries c
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id;

--11. ����� ���, �̸�, �����ڵ�, �Ŵ����� ���, �Ŵ����� �̸�, �Ŵ����� �����ڵ带 ��ȸ�Ͽ� 
--����� ��� ������ �����ϴ� �������� �ۼ��Ѵ�.
SELECT e.employee_id, e.first_name, e.job_id, e.manager_id, m.first_name manager_name, m.job_id manager_job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
ORDER BY 1;

--12. ��� ����� ���, �̸�, �μ���, ����, �ּ� ������ ��ȸ�Ͽ� ��� ������ �����ϴ� �������� �ۼ��Ѵ�.
SELECT e.employee_id, e.first_name, d.department_name, l.city, l.street_address
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
ORDER BY 1;
-------------------------------------------------------------------------------------------------