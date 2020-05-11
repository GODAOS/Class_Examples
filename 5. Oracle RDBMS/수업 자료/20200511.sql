�ǽ� ANSI JOIN ���� --INNER ���θ�
01. ���, ��, �μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
02. ����� 110, 130, 150 �� ������� ���, ��, �μ��� ��ȸ�ϴ� ANSI��������
03. ���, ����, �����ڻ��, ������ ����, �����ھ����ڵ� ��ȸ�ϴ� ANSI ����
04. ���� king �� ����� ���, ����, �μ��ڵ�, �μ��� ANSI ����
05. ������ ����� 149 ���� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ
06. ��ġ�ڵ� 1400�� ���ø�, �μ��� ��ȸ
07. ��ġ�ڵ� 1800�� �ٹ��ϴ� ������� ���, ��, �����ڵ�, �μ���, ��ġ�ڵ� ��ȸ
08. ���� ��ҹ��� �����ϰ� z�� �ִ� ������� ���, ��, �μ��� ��ȸ
09. �����ں��� ���� �Ի��� ����� ���, ��, �Ի�����, 
    �����ڻ��, �����ڼ�, �������Ի����� ��ȸ
10. �����ڵ尡 clerk������ ���������� ������� ���, ��, �μ���, �������� ��ȸ
11. toronto �� �ٹ��ϴ� ���, ��, �μ��ڵ�, �μ���, ���ø� ��ȸ

01. ���, ��, �μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        l.location_id, l.city
FROM  employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        l.location_id, l.city
FROM  employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l  
ON d.location_id = l.location_id;

SELECT  e.employee_id, e.last_name, 
        department_id, d.department_name,
        location_id, l.city
FROM  employees e INNER JOIN departments d
USING (department_id)
INNER JOIN locations l  
USING (location_id);

02. ����� 110, 130, 150 �� �������
���, ��, �μ��� ��ȸ�ϴ� ANSI��������
SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND employee_id IN (110, 130, 150);

SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE employee_id IN (110, 130, 150);

SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE employee_id IN (110, 130, 150);

03. ���, ����, �����ڻ��, �����ڼ���, �����ھ����ڵ� ��ȸ�ϴ� ANSI ����
SELECT e.employee_id, e.first_name || ' '|| e.last_name name, 
       e.manager_id, 
       m.first_name || ' ' || m.last_name manager_name, 
       m.job_id 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

SELECT e.employee_id, e.first_name || ' '|| e.last_name name, 
       e.manager_id, 
       m.first_name || ' ' || m.last_name manager_name, 
       m.job_id
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id;

04. ���� king �� ����� 
���, ����, �μ��ڵ�, �μ��� ANSI ����
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) = 'king';

SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE LOWER(last_name) = 'king';

SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE LOWER(last_name) = 'king';

05. ������ ����� 149 ���� ����� 
���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.manager_id = 149;

SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE e.manager_id = 149;

06. ��ġ�ڵ� 1400�� ���ø�, �μ��� ��ȸ
SELECT l.city, d.department_name
FROM locations l, departments d
WHERE d.location_id = l.location_id
AND d.location_id = 1400;

SELECT l.city, d.department_name
FROM locations l INNER JOIN departments d
ON d.location_id = l.location_id
WHERE d.location_id = 1400;

SELECT l.city, d.department_name
FROM locations l INNER JOIN departments d
USING (location_id)
WHERE location_id = 1400;

07. ��ġ�ڵ� 1800�� �ٹ��ϴ� ������� 
���, ��, �����ڵ�, �μ���, ��ġ�ڵ� ��ȸ
SELECT e.employee_id, e.last_name, e.job_id, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND location_id = 1800;

SELECT e.employee_id, e.last_name, e.job_id, d.department_name, d.location_id
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE location_id = 1800;

SELECT e.employee_id, e.last_name, e.job_id, d.department_name, d.location_id
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE location_id = 1800;

08. ���� ��ҹ��� �����ϰ� z�� �ִ� ������� 
���, ��, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) LIKE '%z%';

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE LOWER(last_name) LIKE '%z%';

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE LOWER(last_name) LIKE '%z%';

09. �����ں��� ���� �Ի��� ����� 
���, ��, �Ի�����, �����ڻ��, �����ڼ�, �������Ի����� ��ȸ
SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id, 
       m.last_name, m.hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;

SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id, 
       m.last_name, m.hire_date
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;

10. �����ڵ尡 clerk ������ ���������� �������
���, ��, �μ���, �������� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM  employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e INNER JOIN departments d
USING (department_id)--ON e.department_id=d.department_id
INNER JOIN jobs j 
USING (job_id)--ON j.job_id=e.job_id
WHERE LOWER(job_id) LIKE '%clerk%'
ORDER BY 1;

--USING ���� ON�� ��� �ᵵ �������. 

ON ���� ����� ������ �̸��� �÷��� ���ؼ��� �ݵ�� ���̺���� ����Ѵ�.
USING ���� ����� �÷��� ���ؼ��� ����� ���̺���� ����ϸ� �ȵȴ�.

11. toronto �� �ٹ��ϴ�
���, ��, �μ��ڵ�, �μ���, ���ø� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';

SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON d.location_id = l.location_id
WHERE LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';

SELECT e.employee_id, e.last_name, department_id, d.department_name, l.city
FROM employees e INNER JOIN departments d
USING (department_id)
INNER JOIN locations l
USING (location_id)
WHERE LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';

SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
USING (location_id)--d.location_id=l.location_id
WHERE LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';
-----------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------
2. OUTER JOIN : ����Ŭ���� ��ȣ (+)�� ����ϴ� OUTER JOIN, ������
FROM ���� LEFT OUTER JOIN / RIGHT OUTER JOIN �� ����ϰ� 
JOIN ������ ON ���� ����Ѵ�. 
OUTER JOIN -> LEFT/RIGHT OUTER JOIN : ������ �Ǵ� ���̺� �������� �����Ѵ�.
LEFT  OUTER JOIN : ��  �� ���̺� �������� NULL �����Ͽ� ��� ���(��ȣ�� �����ʿ� (+)�� ����)
RIGHT OUTER JOIN : ������ ���̺� �������� NULL �����Ͽ� ��� ���(��ȣ�� ��  �ʿ� (+)�� ����) 

����Ŭ ����
01. ��� ������� ���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY 1;

ANSI  OUTER JOIN
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e LEFT JOIN departments d
--FROM departments d RIGHT JOIN employees e
ON e.department_id = d.department_id
ORDER BY 1;

02. ��� ������� ���, ��, �μ��ڵ�, �μ���, ���� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name, 
        l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
ORDER BY 1;

SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name, 
        l.city
FROM employees e LEFT OUTER JOIN departments d
--FROM departments d RIGHT OUTER JOIN employees e 
ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
ORDER BY 1;

03. ��� ������� ���, ��, �Ŵ������, �Ŵ����� ��ȸ - ����Ŭ����, ANSI���� ON��
SELECT  e.employee_id, e.last_name, e.manager_id,
        m.employee_id, m.last_name manager_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY 1;

SELECT  e.employee_id, e.last_name, e.manager_id,
        m.employee_id, m.last_name manager_name
FROM employees e LEFT OUTER JOIN employees m
ON e.manager_id = m.employee_id
ORDER BY 1;

-----------------------------------------------------------------------------------------------
�ǽ�
01. ��� ����� ���, ��, �μ��� ��ȸ --LEFT JOIN, RIHGT JOIN 2����
02. ��� ����� ���, ��, �μ���, ������ ��ȸ
03. ��� ����� ���, ��, �μ���, ���ø� ��ȸ
04. �����ڻ���� 149���� ��� ����� ���, ��, �μ��� ��ȸ
05. Ŀ�̼��� �޴� ��� ������� ���, ��, �μ���, ���ø� ��ȸ
06. ��� �μ��� ���� �μ��ڵ�, �μ���, ���ø�, ������, ����� ��ȸ
07. ������� �ٹ��ϴ� �μ��� �� �μ��� ����� �� ���̳� �ֳ� �ľ��ϰ��� �Ѵ�.
    �μ��ڵ�, �μ���, ����� ��ȸ
    
[�������� 5-2]
01. ����� 110, 130, 150 �� �������
    ���, �̸�, �μ��� ��ȸ�ϴ� ����Ŭ ���� �� ANSI��������


02. ������� ���, ��, �μ��ڵ�, �����ڵ�, �������� ��ȸ, ��������� ����    
-----------------------------------------------------------------------------------------------

�ǽ�
01. ��� ����� ���, ��, �μ��� ��ȸ --LEFT JOIN, RIHGT JOIN 2����
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, d.department_name
FROM departments d RIGHT OUTER JOIN employees e
ON e.department_id = d.department_id;

02. ��� ����� ���, ��, �μ���, ������ ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e LEFT OUTER JOIN departments d
--FROM departments d RIGHT OUTER JOIN employees e
ON e.department_id = d.department_id
LEFT OUTER JOIN jobs j
ON e.job_id = j.job_id;

03. ��� ����� ���, ��, �μ���, ���ø� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT OUTER JOIN departments d 
ON d.department_id = e.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id;

04. �����ڻ���� 149���� ��� ����� ���, ��, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

05. Ŀ�̼��� �޴� ��� ������� ���, ��, �μ���, ���ø� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
WHERE commission_pct IS NOT NULL;

06. ��� �μ��� ���� �μ��ڵ�, �μ���, ���ø�, ������, ����� ��ȸ
SELECT d.department_id, d.department_name, l.city, c.country_name, r.region_name
FROM departments d LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
LEFT OUTER JOIN countries c
ON l.country_id = c.country_id
LEFT OUTER JOIN regions r
ON c.region_id = r.region_id;
--USING (region_id);

07. ������� �ٹ��ϴ� �μ��� �� �μ��� ����� �� ���̳� �ֳ� �ľ��ϰ��� �Ѵ�.
�μ��ڵ�, �μ���, ����� ��ȸ
SELECT e.department_id, d.department_name, COUNT(*) cnt
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
GROUP BY e.department_id, d.department_name
ORDER BY 1;

SELECT department_id, d.department_name, COUNT(*) cnt
FROM employees e LEFT JOIN departments d
USING (department_id) --ON e.department_id = d.department_id
GROUP BY department_id, department_name
ORDER BY 1;

-----------------------------------------------------------------------------------------------
[�������� 5-2]
01. ����� 110, 130, 150 �� �������
���, �̸�, �μ��� ��ȸ�ϴ� ����Ŭ ���� �� ANSI��������
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.employee_id IN (110, 130, 150);

SELECT e.employee_id, e.first_name, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id IN (110, 130, 150);

SELECT e.employee_id, e.first_name, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE e.employee_id IN (110, 130, 150);

SELECT e.employee_id, e.first_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id IN (110, 130, 150);

SELECT e.employee_id, e.first_name, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE e.employee_id IN (110, 130, 150);

02. ������� ���, ��, �μ��ڵ�, �����ڵ�, �������� ��ȸ, ��������� ����
SELECT e.employee_id, e.last_name, e.department_id, j.job_id, j.job_title
FROM employees e, jobs j 
WHERE e.job_id = j.job_id
ORDER BY 1;

SELECT e.employee_id, e.last_name, e.department_id, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j 
ON e.job_id = j.job_id
ORDER BY 1;

SELECT e.employee_id, e.last_name, e.department_id, job_id, j.job_title
FROM employees e INNER JOIN jobs j 
USING (job_id)
ORDER BY 1;


SELECT e.employee_id, e.last_name, e.department_id, j.job_id, j.job_title
FROM employees e LEFT JOIN jobs j 
ON e.job_id = j.job_id
ORDER BY 1;

SELECT e.employee_id, e.last_name, e.department_id, job_id, j.job_title
FROM employees e LEFT JOIN jobs j 
USING (job_id)
ORDER BY 1;
-----------------------------------------------------------------------------------------------


