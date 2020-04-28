--���� ��(���� ��) �Լ�(�׷� �Լ�) : ���� �����κ��� �ϳ��� ��� ���� ��ȯ�Ѵ�.
--GROUP �Լ� : ��ü �����͸� �׷� ���� �����Ͽ� ������� ����� ���ϱ� ���ؼ� ����ϴ� �Լ�

--GROUP �Լ� ����
--1. COUNT  : �ԷµǴ� �������� �� �Ǽ��� ���
--2. SUM    : �ԷµǴ� �������� �հ谪 ���ؼ� ���
--3. AVG    : �ԷµǴ� �������� ��հ� ���ؼ� ���
--4. MAX    : �ԷµǴ� ������ �� ���� ū ���� ���
--5. MIN    : �ԷµǴ� ������ �� ���� ���� ���� ���
--6. STDDEV : �ԷµǴ� �������� ������ ǥ������ �� ���



--17. ���������Լ�


--* ������ �ۼ� ����
--1. ��ȸ�ؾ��� �����͸� �ľ��� �� SELECT���� Į�� ����� �ۼ��Ѵ�.
--2. SELECT ���� ������ Į���� �ľ��� ��
--3. Ư�� ���ǿ� �´� ���������� ��ȸ�ؾ� �Ѵٸ�

--5.


--DISTINCT�� SELECT * �ٷ� ������ ���� �ߺ��� ������ ����� �����ش�.
--�ڿ� ������ Į���� �ߺ��� �����ϰ� ��ȸ�ϰ��� �ϴ� ��ǥ���� ǥ���ϴ� ����

--�����ʹ� �ߺ��� ������ ���� ��ȸ�ȴ�.
--�ߺ��� �����ϰ� ��ǥ���� ��ȸ�ϱ� ���� Ű���� : DISTINCT �� NULL���� �����Ѵ�.
--������ �࿡ ���� DISTINCT(�ߺ� ����)�Ѵ�.

--�츮 ȸ�� ������� �Ҽӵ� �μ��� �ľ��ϰ��� �Ѵ�.
--52 ~ 61����


--NULL�� ���������� ���� �켱������ ���´�. (NULL ���� ����)
--���������� �� ������ ������ ���´�.
--���������� �� NULL�� ù��° ������������ ��ȸ�Ϸ��� NULLS FIRST
--���������� �� NULL�� ������ ������������ ��ȸ�Ϸ��� DESC NULLS LAST

--�츮ȸ�� ������� �Ҽӵ� �μ����� �ľ��ϰ��� �Ѵ�.
--������� �Ҽӵ� �μ� �ڵ带 ��ȸ
SELECT DISTINCT department_id
FROM employees
ORDER BY 1 DESC NULLS PAST;

SELECT DISTINCT department_id
FROM employees
ORDER BY 1 NULLS FIRST;

--�츮 ȸ�� �μ� �ڵ� 10, 20, 30, 40, 60�� �μ��� ���� �������
--� ������ �ϴ��� �ľ��ϰ��� �Ѵ�.
--�ش� �μ��� ���� ������� �ϴ� ���� �ڵ带 ��ȸ
SELECT DISTINCT(job_id)
FROM employees
WHERE department_id IN (10, 20, 30, 40, 60);

--DISTINCT�� SELECT ����� ��� Į���� ���� ����ȴ�.
SELECT DISTINCT employee_id, departMent_id
FROM employees
ORDER BY 1 DESC;

[���� ���� 4 - 1]
--�츮 ȸ�翡 �Ŵ������ִ� ������� �������� �ľ��ϰ��� �Ѵ�.
--�Ŵ��� ID�� �ִ� ������� �������ȸ

SELECT DISTINCT manager_id
FROM employees
WHERE manager_id IS NOT NULL;

--�׷� �Լ�
--���� �����κ��� �ϳ��� ����� ��ȯ�ϴ� ������ �Լ� : �׷� �Լ� �� NULL�� �����Ѵ�.
--1. ������ ���� ������ ���� ��ȯ�ϴ� �Լ� : COUNT(��� ǥ��), COUNT(*)

--�츮 ȸ�� ��� ��, �μ� ��ġ ���� ��� ��, �μ� ��, Ŀ�̼� �޴� ��� �� ��ȸ
SELECT COUNT(*) everyone,
       COUNT(department_id) dept,
       COUNT(DISTINCT department_id) dept_distinct, -- DISTINCT �� NULL���� ����, �׷� �Լ� : NULL�� ����
       COUNT(commission_pct) commission
FROM employees;

--�츮 ȸ�� �μ� ��ġ ���� ��� �� ��ȸ
SELECT COUNT(*) cnt
FROM employees
WHERE department_id IS NOT NULL;

--�츮 ȸ�� ����� �� �μ� �ڵ� 60�� �μ��� ���� ������� ���� �ľ��ϰ��� �Ѵ�.
SELECT COUNT(*) cnt
FROM employees
WHERE department_id = 60;

--�츮 ȸ�� ����� �� clerk ������ ������ �ϴ� ������� ���� �ľ��ϰ��� �Ѵ�.
SELECT COUNT(*) cnt
FROM employees
WHERE LOWER(job_id) LIKE'%clerk%';

--2. ������ ���� ���Ͽ� ��ȯ�ϴ� �Լ� : SUM(��� ǥ��) - ���ڿ��� ��� ����
--�츮 ȸ�� ��� ������� �޿��� ���� ����� ��ȸ
SELECT SUM(salary) sum_sal
FROM employees;

--�츮 ȸ�� �μ� �ڵ� 60�� �μ��� ���� ������� �޿��� ��ȸ
SELECT SUM(salary) sum_sal
FROM employees
WHERE department_id = 60;

--�츮 ȸ�� account ������ �ϴ� ������� �޿��� ���� ����� ��ȸ
SELECT TO_CHAR(SUM(salary), '999,999,999') AS sum_sal
FROM employees
WHERE LOWER(job_id) LIKE '%account%';

--3. �����Ͱ� �� ���� ū/���� ���� ��ȯ�ϴ� �Լ� : MAX/MIN(��� ǥ��)
--����, ����, ��¥�� ��� ����
SELECT MAX(salary) max_sal, MIN(salary) min_sal
FROM employees;

--�츮 ȸ�� ����� �� ���� ����/���߿� ���� ���� ��ȸ
SELECT MIN(last_name) min_name, MAX(last_name) max_name
FROM employees;

--�츮 ȸ�� ����� �� ���� ����/���߿� �Ի��� ����� �Ի� ���� ��ȸ
SELECT MIN(hire_date) min_hire_date, MAX(hire_date) max_hgire_date
FROM employees;

--�츮 ȸ�� �μ� �ڵ� 60���� �μ��� ���� ����� �� ���� ���� �޿�, ���� �޿� ��ȸ
SELECT MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
WHERE department_id = 60;

--�츮 ȸ�� clerk ������ ������ �ϴ� ������� �Ի� ������ �ľ��ϰ��� �Ѵ�.
--clerk ������ ������ �ϴ� ����� ��
--���� ���� �Ի��� �Ի� ����, ���� �ֱ� �Ի��� �Ի� ���� ��ȸ
SELECT MIN(hire_date) AS min_hire_date, MAX(hire_date) AS max_hire_date
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%';

--4. AVG(��� ǥ��) : ������ ���� ����� ��ȯ - ���ڸ� ����
--�츮 ȸ�� ������� �޿� ��� ��ȸ
SELECT ROUND(AVG(salary), 2) AS avg_sal
FROM employees;

--�츮 ȸ�� �μ� �ڵ� 60�� �μ��� ���� ������� �޿� ��� ��ȸ
--�޿� ����� �Ҽ� ��°�ڸ����� �ݿø��ؼ� ǥ��
SELECT ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE department_id = 60;

--�츮 ȸ�� ����� �� clerk ������ ������ �ϴ� ������� �޿� ��� ��ȸ
--�޿� ����� �Ҽ� ��°�ڸ����� �ݿø��ؼ� ǥ��
SELECT ROUND(AVG(salary) ,2) AS avg_sal
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%';

--[���� ���� 4 - 2]
--1. ���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ��� ������� �ľ��ϰ��� �Ѵ�.
--���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ���� ��ȸ�Ͻÿ�.
SELECT COUNT(*) AS cnt
FROM employees
WHERE LOWER(first_name) LIKE '%z%';

--2. �츮ȸ�� ����� �ְ�޿��� �����޿� �� �޿����� �ľ��ϰ��� �Ѵ�.
--�츮ȸ�� �ְ�޿��� �����޿��� �޿����� ��ȸ�Ͻÿ�.
SELECT MAX(salary) - MIN(salary) AS "max-min_sal"
FROM employees;

--3. �츮ȸ�翡 �Ŵ����� �ִ� ������� ���� �ľ��ϰ��� �Ѵ�.
--�츮ȸ�� �Ŵ����� ������� ���� ��ȸ�Ͻÿ�.
SELECT COUNT(DISTINCT manager_id) cnt1,
       COUNT(DISTINCT(manager_id)) cnt2
FROM employees;

--4. �츮ȸ�� account ������ �ϴ� ������� �޿� ����� ��ȸ�Ͻÿ�.
SELECT ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE LOWER(job_id) LIKE '%account%';

--5. �츮ȸ�� ����� �� Ŀ�̼��� �޴� ������� ��� ������� �ľ��ϰ��� �Ѵ�.
--Ŀ�̼��� �޴� ����� ���� ��ȸ
SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT COUNT(commission_pct)
FROM employees;

--6. �츮ȸ�� ����� �� ���� ����/���߿� �Ի��� ����� �Ի����� ��ȸ
SELECT MIN(hire_date) AS min_hire_date, MAX(hire_date) AS max_hire_date
FROM employees;

--7. �츮ȸ�� �μ��ڵ� 90���� �μ��� ���� ������� �޿���� ��ȸ
--��, �޿���վ��� �Ҽ� ��°�ڸ����� �ݿø� ǥ��
SELECT ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE department_id = 90;

--��ü ������ ���� �ϳ��� �׷����� ���� �׷� �Լ��� �����͸� ��ȸ
--Ư�� ������ �ξ� �������� �׷��� ���� �׷캰�� �ϳ��� ����� ��ȸ�ϰ��� �Ҷ� GROUP BY ���� ����Ѵ�.

--�μ� �ڵ� 50�� �μ��� ���� �������
--�μ� �ڵ�, ���� �ڵ�, �޿� ��� ��ȸ
SELECT department_id, job_id, ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id = 50
GROUP BY department_id, job_id;

--�츮 ȸ�� �� �μ��� �μ� �ڵ�, �޿� �հ�, �޿� ���, �μ������� ��ȸ�Ͻÿ�.
SELECT department_id,
       SUM(salary) AS sum_sal,
       ROUND(AVG(salary), 2) AS avg_sal,
       COUNT(DISTINCT employee_id) AS cnt_employee,
       COUNT(*) AS cnt -- �μ����̹Ƿ� ��ü�� count �ϴ��� �μ��� �ο��� ��ȸ�ȴ�.
FROM employees
GROUP BY department_id
ORDER BY department_id;

--�� �μ� ��, ���� ���� �μ� �ڵ�, ���� �ڵ�, �޿� ��� ��ȸ
SELECT department_id, job_id, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department_id , job_id
ORDER BY 1, 2;

--�� �μ� ��, ���� ���� �޿� �հ�, �޿� ���, ��� ���� ��ȸ
SELECT department_id,
       job_id,
       SUM(salary) AS sum_sal,
       ROUND(AVG(salary), 2) AS avg_sal,
       COUNT(*) cnt
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

--�츮 ȸ�� �μ� �ڵ� 10, 20, 30, 40, 60�� �μ��� ���� ������� ������ �ľ��ϰ��� �Ѵ�.
--�ش� �μ� ���� �μ� �ڵ�, �μ�����, �μ� �޿� ��� ��ȸ
SELECT department_id, COUNT(*) AS cnt, ROUND(AVG(salary), 2)
FROM employees
WHERE department_id IN (10, 20, 30, 40, 60)
GROUP BY department_id
ORDER BY department_id;

--�츮 ȸ�� clerk ������ ������ �ϴ� ������� ������ �ľ��ϰ��� �Ѵ�.
--clerk ������ ���� ���� ���� �ڵ�, �����, ����� �޿� ��� ��ȸ
SELECT department_id, COUNT(*) AS cnt, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%'
GROUP BY department_id
ORDER BY 1;

--HAVING�� : GROUP BY�� ��� �࿡ ���� Ư�� ���ǿ� �´� ������ ���� ��ȸ�ϱ� ���� ������
--WHERE������ ����ϴ� ������ HAVING���� ����� ���� ������,
--�׷� �Լ��� ���Ե� ������ HAVING�������� ����Ҽ� �ִ�.
--WHERE : �Ϲ� ���Ǹ� ����, �׷� �Լ� ���Ե� ������ �ȵ�
--HAVING : �Ϲ� ����, �׷� �Լ� ���� ���� ��� ����

--80�� �μ��� �μ��� �޿� ����� ��ȸ
SELECT department_id, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE department_id = 80
GROUP BY department_id;

SELECT department_id, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department_id
HAVING department_id = 80;

--�� �μ����� �Ҽӵ� ����� ���� 5�� ������ �μ��� �� ���� ��ȸ
SELECT department_id,
       COUNT(*)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING COUNT(*) <= 5
ORDER BY 1;

--�� �μ��� ����� ���� ������ �ľ��ϰ��� �Ѵ�.
--��� ���� 10�� �̻��� �μ���
--�μ� �ڵ�, ��� ��, �޿� ���, �ִ� �޿�, ���� �޿� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 10
ORDER BY department_id;

--[�������� 4 - 3]
--1. ��� ���̺��� �Ȱ��� �̸�(first_name)�� �� �̻� �ִ� �̸��� �� �̸��� ��� �� �������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT first_name, COUNT(*)
FROM employees
GROUP BY first_name
HAVING COUNT(*) >= 2
ORDER BY first_name;

--2. �μ� ��ȣ, �� �μ� �� �޿� �Ѿװ� �޿� ����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--��, �μ� �޿� ����� 8000 �̻��� �μ��� ��ȸ�ǵ��� �Ѵ�.
SELECT department_id, SUM(salary) sum_sal, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
HAVING ROUND(AVG(salary), 2) >= 8000
ORDER BY department_id;

--3. �⵵, �⵵���� �Ի��� ��� ���� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--��, �⵵�� 2014�� ���·� ǥ��ǵ��� �Ѵ�.
SELECT TO_CHAR(hire_date, 'YYYY') AS hire_year, COUNT(*) cnt
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY hire_year;