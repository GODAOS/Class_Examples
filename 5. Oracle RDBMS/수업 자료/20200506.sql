5. ����(JOIN)
�ϳ��� ���̺�κ��� �����͸� ��ȸ�� �� ���� ���
�������� ���̺�κ��� �����͸� ��ȸ�ϴ� ����� JOIN�̶�� �Ѵ�.

�μ������� ������  �ִ� ���̺�: departments
SELECT * 
FROM departments; --27��

��������� ������ �ִ� ���̺�: employees
SELECT * 
FROM employees;  --107��

���������� ������ �ִ� ���̺� : jobs
SELECT * 
FROM jobs;  --19��
------------------------------------------------------------------
1. CARTESIAN PRODUCT
�� WHERE ���� JOIN ������ ������� �ʾ� �߸��� ���������� ����� ���� �Ǵ� ����: 
cartesian product, cross join, SQL���� ���̴� ��찡 ����

���, ��, �μ��� ��ȸ
SELECT employee_id, last_name, department_name
FROM employees, departments;

employees: 107 *departments : 27 = 2889
107 * 27 = 2889 => cartesian product

�����ڵ�, ������, �μ��ڵ�, �μ���
SELECT job_id, job_title, department_id, department_name
FROM jobs, departments;

jobs: 19 *  departments : 27 = 513
19 * 27 = 513 => cartesian product

------------------------------------------------------------------
2. EQUI JOIN(ANSI������ INNER JOIN)
: WHERE ���� ���� ������ (=)�� ����ϴ� JOIN �����̴�.
�ڡڡڡڡ���, ���̺�� ���� �������� �����Ǵ� ���� ���� ����� ����� ��ȯ

�� JOIN ���� �� �÷��� ���� ���� �÷��� ���� �������ǽ� ����(�����̺��.�÷��� = ���̺��.�÷��� �� ���)

Table = Entity
���̺��� ���赵: Entity Relationship Diagram(ERD)

��Ȯ��, ���ռ�, ���Ἲ ����

������̺�                  �μ����̺�
����        �μ���ȣ        �μ���ȣ �μ���
ȫ�浿      10              10        ������
��û        20              20        ���ߺ�
����ġ      10                    


�� ���̺����� ����
1. FROM ���� ���̺� ����� �����ϸ�, ���̺�� ALIAS �� �����Ѵ�.
    (�ڵ� ������ ���̰� �������� ���̱� ����)
2. ���������� WHERE ���� �ۼ��Ѵ�.

-----------------------------------------------------------------------------------
�� ������ �ۼ�����

1. ��ȸ�� �����͸� �ľ��� �� SELECT���� �ۼ��Ѵ�. 
   SELECT �÷���1, ...
2. SELECT ���� ������ �÷������ � ���̺� �ִ��� �ľ��� �� FROM ���� �ۼ��Ѵ�.
   FROM ���̺��
 - ���� ���� ���̺�κ��� �����͸� ��ȸ�ؾ� �Ѵٸ� FROM ���� �ĸ�(,)�� ����
   FROM ���̺��1, ���̺��2
3. Ư�����ǿ� �´� ���������� ��ȸ�ؾ��ϴ� ��� WHERE ���� �ۼ��Ѵ�.
   WHERE ���ǽ�
 - FROM ���� ���̺��� ���� ���� ��� ���̺����������� �ۼ��Ѵ�.
   WHERE �������ǽ� --�����̺��.�÷��� = ���̺��.�÷���
 - �Ϲ����� ���ǽİ� ���̺����� ���ǽ��� ��� �ʿ��� ��� 
   WHERE �������ǽ� 
   AND �Ϲ� ���ǽ�
4. SELECT ���� �׷��Լ�(COUNT, SUM, AVG, MAX, MIN) �� ����� �÷�ǥ���� �ִµ� 
   �׷��Լ��� ������� ���� �÷�ǥ���� �Բ� �ִٸ� GROUP BY ���� �ۼ��Ѵ�.
 - �׷��Լ��� ������� ���� �÷�ǥ���� ���� ��� GROUP BY �������� ���
   GROUP BY �׷���������ǥ��
 GROUP BY ���� ����� ��� GROUP BY �� ���� ���� ����������࿡ ���� 
 - Ư�����ǿ� �´� ���������� ��ȸ�ؾ��ϴ� ���
   HAVING ���ǽ�- ���ǽ�: �⺻���� ���ǽ�, �׷��Լ�ǥ��  
   --��WHERE ������������ �׷��Լ�ǥ�� ��� �� ��! 
6. ��ȸ�� ����������࿡ ���� �����ؾ��ϴ� ��� ORDER BY ���� �ۼ��Ѵ�.
   ORDER BY ���ı���ǥ�� ����/��������

���� �ؼ� ����
SELECT
1.FROM 
2.WHERE
3.GROUP BY
4.HAVING 
6.ORDER BY;

-----------------------------------------------------------------------------------
employees, departments ���̺��� ����Ͽ� 
���, ��, �μ��� ������ ��ȸ
SELECT employee_id, last_name, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id  -- ������̺��� �μ��ڵ� = �μ����̺��� �μ��ڵ�;
ORDER BY 3 ;

employees, departments ���̺��� ����Ͽ� 
������� ���, ��, �μ��ڵ�, �μ��� ������ ��ȸ     
SELECT employee_id, last_name,
       e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id   --������̺��� �μ��ڵ� = �μ����̺��� �μ��ڵ�;
ORDER BY 1;

employees, jobs ���̺��� ����Ͽ� 
���, ��, �����ڵ�, �������� ������ ��ȸ
SELECT employee_id, last_name, e.job_id, job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id --������̺��� �����ڵ� = �������̺��� �����ڵ�
ORDER BY 1;

JOIN �ϴ� ��� ���̺��� �߰��Ǹ� JOIN ������ �߰�
WHERE ���� JOIN ���ǰ� �Ϲ� ������ �Բ� ���

WHERE �������ǽĿ��� 
�Ϲ����� ���ǽİ� ���̺��������ǽ��� ��� �ʿ��� ��� 
�� WHERE �������ǽ� AND �Ϲ� ���ǽ�

employees, departments, jobs ���̺��� ����Ͽ� 
���, ��, �μ���, ���������� ��ȸ    --���������� table���� -1 ��ŭ �ʿ�!!
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

employees, departments, jobs ���̺��� ����Ͽ� 
���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ
SELECT employee_id, last_name, e.department_id,
       department_name, e.job_id, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id=d.department_id
AND e.job_id = j.job_id
ORDER BY 1  ;

employees, departments, jobs ���̺��� ����Ͽ� 
����� 101���� ����� ���, �̸�, �μ���, �������� ������ ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND e.employee_id = 101;

employees, departments ���̺��� ����Ͽ� 
����� 100, 120, 130, 140�� �������
���, ��, �μ��ڵ�, �μ���
SELECT employee_id, last_name, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND employee_id IN (100,120,130,140);


�Ŵ����� ���� ����� ���, �̸�, ���������� ��ȸ�Ѵ�.
SELECT e.employee_id, e.first_name, j.job_title
FROM employees e, jobs j
WHERE manager_id IS NULL
AND e.job_id = j.job_id;


-----------------------------------------------------------
�ǽ�

���� ��ҹ��� �����ϰ� z�� �ִ� ���� ���� ������� 
���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT employee_id, last_name, d.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) LIKE '%z%'; --���� ��ҹ��� �����ϰ� z�� �ִ� ��;
     
Ŀ�̼��� �޴� ������� 
���, ��, �޿�, Ŀ�̼ǿ���, �������� ��ȸ
SELECT employee_id, last_name, salary, commission_pct com, job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND commission_pct IS NOT NULL; --Ŀ�̼��� �޴� �����

Ŀ�̼��� �޴� ������� 
���, ��, �޿�, Ŀ�̼Ǳݾ�, �μ��� ��ȸ
SELECT employee_id, last_name, salary, 
       salary*commission_pct com, department_name 
FROM employees e, departments d
WHERE e.department_id =  d.department_id 
AND commission_pct IS NOT NULL;

�� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
�� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø� ��ȸ
SELECT department_id, department_name, l.location_id, city
FROM departments d, locations l
WHERE d.location_id = l.location_id
ORDER BY 1;

���, ��, �μ��ڵ�, �μ���, �ٹ������ø�, �ּ� ��ȸ
SELECT employee_id, last_name, e.department_id, 
       department_name, city, street_address
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id 
AND d.location_id =  l.location_id;

���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ  --���������� table���� -1 ��ŭ �ʿ�!!
SELECT employee_id, last_name, 
       e.department_id, department_name, j.job_id, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id 
AND e.job_id = j.job_id 
ORDER BY 1;

�� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø�, �����ڵ�, ������, ����� ��ȸ 
-- �� �μ��� ���ض�� �����Ƿ� employees ���̺� �ʿ����
SELECT department_id, department_name, d.location_id, city, 
       l.country_id, country_name, region_name
FROM departments d, locations l, countries c, regions r 
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id
ORDER BY 1;

------------------------------------------------------------------
3. NON-EQUI JOIN
: �񱳿�����(<=, >=, <, >), ����������(BETWEEN), IN ������ ���� 
���� ������ (=) �̿��� �����ڸ� ����ϴ� JOIN �����̴�.
JOIN �ϴ� �÷��� ��ġ���� �ʰ� ����ϴ� JOIN �������� ���� ������� �ʴ´�.

employees, jobs ���̺��� �̿��Ͽ� --JOBS���̺� Ȯ��
�޿��� �ְ����� �޿� ���� ���� �ִ� 10�� �μ����� 
���, �̸�, �޿�, ���������� ��ȸ�Ѵ�.
SELECT employee_id, last_name, salary, job_title
FROM employees, jobs
WHERE salary BETWEEN min_salary AND max_salary
AND department_id = 10;

SELECT e.employee_id, e.last_name, e.salary, j.job_title
FROM employees e, jobs j
WHERE e.salary BETWEEN j.min_salary AND j.max_salary
AND department_id = 10;

-----------------------------------------------------------------
4. OUTER JOIN : NULL ���� �����Ǵ� ������ �����ؼ� ǥ���ϱ� ���� ���� 
EQUI JOIN�� �������ǿ� ����񱳿����ڷ� ���� ����, 
��, ���̺�� ���� �������� �����Ǵ� ���� ���� ����� ����� ��ȯ

������ OUTER JOIN �������� �����Ǵ� ���� ���� ����� ������� ��ȯ�Ѵ�.
�����Ǵ� ���� ���� ���̺� �÷��� (+) ��ȣ�� ǥ���Ѵ�.
��, ���������� ������ �߻����� �ʵ��� �ϱ� ���� ���α��
:��  (+)��ȣ�� ���������� ������ ���������ʿ� �ٿ��ش�.

������̺��� �μ���ġ ���� ���� ��� ��������(NULL)�� �ְ�
�μ����̺��� �μ��ڵ尡 NULL �ΰͿ� ���� ���������� �����Ƿ�
(�����Ͱ� ���� ���� �ִ� �� JOIN �÷��� (+)�� �߰�)
�μ����̺��� �μ��ڵ� �ʿ� OUTER ��ȣ�� ���δ�.

��ȣ�� �����ʿ� (+)�� ������ ������ ���̺� null�� ���Ǿ� LEFT OUTER JOIN
��ȣ�� ���ʿ� (+)�� ������ ���� ���̺� null�� ���Ǿ� RIGHT OUTER JOIN


---------------------------------------------------------------------------
������̺�        �μ����̺�(departments(+))       ��ġ���̺�(locations(+))
��� �μ��ڵ�     �μ��ڵ�   �μ���    ��ġ�ڵ�    ��ġ�ڵ� �μ���ġ
100  10           10         ������    1600        1600     Seattle
101  20           20         �ѹ���    1700        1700     Paris
178  NULL         NULL       NULL      NULL     
---------------------------------------------------------------------------

��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT employee_id, last_name, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY 1; 

SELECT COUNT(job_id)
FROM jobs; --19

SELECT COUNT(DISTINCT job_id)
FROM employees; --19

��� ����� ���, ��, �����ڵ�, �������� ��ȸ
SELECT employee_id, last_name, j.job_id, job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1; 

���, ��, �μ���, �������� ��ȸ
SELECT employee_id, last_name, department_name, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id =j.job_id
ORDER BY 1; 