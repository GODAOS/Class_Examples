--1. ���� ��ҹ��� �����ϰ� z�� �ִ� ���� ���� ������� 
--���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(e.last_name) LIKE '%z%';

--2. Ŀ�̼��� �޴� ������� 
--���, ��, �޿�, Ŀ�̼ǿ���, �������� ��ȸ
SELECT e.employee_id, e.last_name, e.salary, e.commission_pct, j.job_title
FROM EMPLOYEES e, jobs j
WHERE e.job_id = j.job_id
AND e.commission_pct IS NOT NULL;

--3. Ŀ�̼��� �޴� ������� 
--���, ��, �޿�, Ŀ�̼Ǳݾ�, �μ��� ��ȸ
SELECT  e.employee_id, e.last_name, e.salary, 
        e.salary*e.commission_pct comm, d.department_name
FROM EMPLOYEES e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL;

--4. �� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
--�� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø� ��ȸ
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d, LOCATIONS l
WHERE d.location_id = l.location_id;


--5. ���, ��, �μ��ڵ�, �μ���, �ٹ������ø�, �ּ� ��ȸ

SELECT  e.employee_id, e.last_name, d.department_id, d.department_name
        l.city, l.street_address
FROM EMPLOYEES e, LOCATIONS l, DEPARTMENTS d
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

--6. ���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ  --���������� table���� -1 ��ŭ �ʿ�!!

SELECT  e.employee_id, e.last_name, d.department_id, d.department_name,
        j.job_id, j.job_title   
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
ORDER BY 1;


--7. �� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø�, �����ڵ�, ������, ����� ��ȸ 

SELECT  d.department_id, d.department_name,
        l.location_id, l.city,
        c.country_id, c.country_name, 
        r.region_name
FROM departments d, locations l, countries c, regions r
WHERE c.country_id = l.country_id
AND d.location_id = l.location_id
AND c.region_id = r.region_id;


