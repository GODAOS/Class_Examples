5.6 ANSI JOIN
ANSI JOIN �� ��� DBMS���� ���������� ����� �� �ִ� ���� ǥ�� JOIN �����̴�.

1. INNER JOIN (����Ŭ�� EQUI JOIN), ������

!!! FROM �� �ȿ� INNER JOIN �� ����Ͽ� ���̺� ���� ����
JOIN ������ ON ��, USING �� �� ����Ѵ�.

�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�
FROM ���̺��1 INNER JOIN ���̺��2
ON �������ǽ� WHERE �Ϲ�����
(�Ǵ�)
USING (�����÷���)  WHERE �Ϲ����� 
        �� USING ���� ���� �÷��� ���ؼ��� ���̺�� ��.��.�� ����ؼ��� �ȵȴ�
�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�

���������� : 
ON �� - �������ǽ�(�����̺��.�÷��� = ���̺��.�÷���)
        �����ϴ� �÷����� �����ϸ� ��.��.�� ���̺���� ����ؾ߸� �Ѵ�. 
USING �� - (�����÷���) �� �߿�!!! ��ȣ�ȿ� �÷��� 
        �����ϴ� �÷����� ������ ��츸 ��� ���� 
         - �� USING ���� ���� �÷��� ���ؼ��� ���̺�� ��.��.�� ����ؼ��� �ȵȴ�.
         �ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء��߿�
���̺� �������İ� ������������ �� �����̴�.
�Ϲ����� ���������� ������ ���� ������ - WHERE ��

-----------------------------------------------------------------------------------------------
����Ŭ JOIN                        |  ANSI JOIN
-----------------------------------------------------------------------------------------------
5. SELECT  �÷���1, �÷���2        |  SELECT �÷���1, �÷���2
1. FROM ���̺��1, ���̺��2       |  FROM ���̺��1 INNER JOIN ���̺��2
2. WHERE �������ǽ� AND �Ϲ�����   |  ON �������ǽ�
                                   |  (�Ǵ�)
                                   |  USING (�����÷���)
                                   |  WHERE �Ϲ����ǽ� --ON, USING ������ WHERE ���
3. GROUP BY                        |
4. HAVING                          |
6. ORDER BY;                       |
-----------------------------------------------------------------------------------------------

�μ��ڵ尡 60���� ���, ��, �μ��ڵ�, �μ��� ��ȸ
����Ŭ ����
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.department_id = 60
ORDER BY 1;

ANSI ���� ON ���(INNER JOIN, �Ǵ� JOIN �� ����ص� ��) 
ON, USING �� ������ WHERE ���� ����� �Ϲ� ������ ǥ���Ѵ�.

SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e INNER JOIN departments d  --INNER ��������
ON e.department_id = d.department_id
WHERE e.department_id = 60
ORDER BY 1;

JOIN ���ǿ� ����ϴ� �÷����� ���� ��� ON ��� USING �� ����� �� �ִ�.
USING �� ����� ���� �÷��� ����ؾ� �Ѵ�.
��, USING ���� ���� �÷��� ���ؼ��� ���̺���� ��.��.�� ����ؼ��� �ȵȴ�.

ANSI ���� USING ���
SELECT  e.employee_id, e.last_name, 
        department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE department_id = 60
ORDER BY 1;

���, ��, �����ڵ�, �������� ��ȸ
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j 
ON e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e INNER JOIN jobs j 
USING (job_id);

ON, USING �� ������ WHERE ���� ����� �Ϲ� ������ ǥ���Ѵ�.

�����ڵ尡 clerk ���� �������¸� �ϴ� ���, ��, �����ڵ�, �������� ��ȸ
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j 
WHERE e.job_id = j.job_id
AND LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e INNER JOIN jobs j 
ON e.job_id = j.job_id
WHERE LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e INNER JOIN jobs j 
USING (job_id)
WHERE LOWER(job_id) LIKE '%clerk%'
ORDER BY 1;

�츮ȸ�� �μ������� �ľ��ϰ��� �Ѵ�.
�μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id
ORDER BY 1;

SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d INNER JOIN locations l
ON d.location_id = l.location_id
ORDER BY 1;

SELECT d.department_id, d.department_name, location_id, l.city
FROM departments d INNER JOIN locations l
USING (location_id)
ORDER BY 1;

�Ŵ����� �μ��� 60 �̻��� �μ��� ���� �������
���, ��, �Ŵ������, �Ŵ����� ��ȸ --SELF JOIN
SELECT e.employee_id, e.last_name, e.manager_id, 
       m.last_name manager_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND m.department_id >= 60
ORDER BY 1;

SELECT e.employee_id, e.last_name, e.manager_id, 
       m.last_name manager_id
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.department_id >= 60
ORDER BY 1;

JOIN �� ����ϴ� ���̺��� 3�� �̻��� ��� 
ù ��° JOIN �� ����� �� ��° JOIN �� �߰��ϴ� ���·� JOIN ������ ����Ѵ�.

�μ��ڵ� 10,20,40,60 �� �μ��� ���� �������
���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id 
AND e.job_id = j.job_id
AND e.department_id IN (10,20,40,60);
===============================================================================================
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        j.job_id, j.job_title
FROM  employees e INNER JOIN departments d 
ON e.department_id = d.department_id
INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE e.department_id IN (10,20,40,60);
===============================================================================================
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        j.job_id, j.job_title
FROM  employees e INNER JOIN jobs j
ON e.job_id = j.job_id
INNER JOIN departments d 
ON e.department_id = d.department_id
WHERE e.department_id IN (10,20,40,60);

SELECT  e.employee_id, e.last_name, 
        department_id, d.department_name,
        job_id, j.job_title
FROM employees e INNER JOIN departments d 
USING (department_id)
INNER JOIN jobs j
USING (job_id)
WHERE department_id IN (10,20,40,60);

SELECT  e.employee_id, e.last_name, 
        department_id, d.department_name,
        job_id, j.job_title
FROM employees e INNER JOIN jobs j 
USING (job_id)
INNER JOIN departments d
USING (department_id)
WHERE department_id IN (10,20,40,60);