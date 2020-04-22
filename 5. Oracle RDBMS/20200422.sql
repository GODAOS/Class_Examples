SELECT *
FROM v$nls_parameters;

SELECT VALUE
FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_FORMAT';

--���� ��¥ ��ȸ, dual : ���� ������, ��¥ ������
SELECT SYSDATE
FROM dual;

--��¥ ������ ����Ͽ� ����ڰ� ���ϴ� ������ ���ڷ� �ٲ� ��ȯ
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH/DD')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
        TO_CHAR(SYSDATE, 'YYYY/MONTH/DD'),
        TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS'),
        TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')
FROM dual;

--�⺻ ������ ���� ����
--ALTER SESSION SET NLS_DATE_FORMAT = [������ ����];
--����Ŭ �⺻ ������ ���� ���� �� ���� ���ǿ��� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
SELECT SYSDATE
FROM dual;

--����. �Ի����� 2004�� 1�� 1�� ������ ����� ��� �ڵ�, ��, �Ի� ���ڸ� ��ȸ �ڽ��� ������
SELECT employee_id, last_name, hire_date
FROM employees
--WHERE hire_date < '2004-01-01';   -- �⺻
--WHERE hire_date < '2004/01/01';   -- ��¥ ���� / ��� ����
--WHERE hire_date < '04-01-01';     -- ���� �տ� 2�ڸ� ���� ��� ����
WHERE TO_CHAR(hire_date, 'YYYY') < 2004;

--4. �� ������
--����. 30�� �μ� ��� �� �޿��� 10000 ������ ����� ��� �ڵ�, ����, �޿�, �μ� �ڵ带 ��ȸ
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, department_id
FROM employees
WHERE department_id = 30
AND salary <= 10000;

--����. 30�� �μ����� �޿��� 10000 �����̸鼭 2005�� ����(2004�����)�� �Ի��� �����
--��� ��ȣ, ����, �޿�, �μ� �ڵ�, �Ի� ���ڸ� ��ȸ�Ѵ�.
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, department_id, hire_date
FROM employees
WHERE department_id = 30
AND salary <= 10000
--AND hire_date <= '2004-12-31';
AND TO_CHAR(hire_date, 'YYYY') <= 2004;

--����. �μ� �ڵ尡 10 �̻� 30������ ������� ���, ����, �μ� �ڵ� ��ȸ
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, department_id
FROM employees
WHERE department_id >= 10
AND department_id <= 30;

--����. �޿��� 10000 �̻� 15000 ������ �������
--���, ����, �޿�, ���� �ڵ� ��ȸ
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, job_id
FROM employees
WHERE salary <= 15000
AND salary >= 10000;

--����. �μ��� 60�� �μ����� �޿��� 5000 �̻��� �������
--���, ����, �μ� �ڵ�, �޿� ��ȸ
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, department_id, salary
FROM employees
WHERE department_id = 60
AND salary >= 5000;

--����/��¥ ������ ǥ�� : ''
--����. �μ� �ڵ尡 60 �����̸鼭 2003�� 6�� 17�� ������ �Ի��� �������
--���, ����, �Ի� ���� ��ȸ
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
SELECT employee_id, first_name ||' '|| last_name AS name, hire_date
FROM employees
WHERE department_id <= 60
AND hire_date <= '2003-06-17';

-- 4.2 OR �����ڴ� ���� �� �ϳ��� TRUE�� TURE�� ��ȯ�Ѵ�.
-- ���� 1. 30�� �μ��� 60�� �μ��� ���� ����� ����, �޿�, �μ� �ڵ带 ��ȸ�Ѵ�.
SELECT first_name ||' '|| last_name, salary, department_id
FROM employees
WHERE department_id = 30
OR department_id = 60;

--���� 1. �μ� �ڵ尡 10, 20, 30�� �μ��� ���� �������
--���, ����, �μ� �ڵ�, ���� �ڵ� ��ȸ
SELECT employee_id, first_name ||' '|| last_name, department_id, job_id
FROM employees
WHERE department_id = 10
OR department_id = 20
OR department_id = 30;

--���� 2. ����� 150, 170, 190�� �������
--���, ����, �μ� �ڵ�, ���� �ڵ�, �Ի� ���� ��ȸ
SELECT employee_id, first_name ||' '|| last_name, job_id, hire_date
FROM employees
WHERE employee_id = 150
OR employee_id = 170
OR employee_id = 190;

--4.3 AND �����ڿ� OR �����ڸ� ȥ���Ͽ� ������ �ۼ��Ѵ�.
--���� 1. 30�� �μ��� �޿��� 10000 �̸��� ����� 60�� �μ��� �޿��� 5000 �̻��� ��� ������ ��ȸ
SELECT first_name ||' '|| last_name AS name, salary, department_id AS dept
FROM employees
WHERE (department_id = 30 AND salary < 10000)
OR (department_id = 60 AND salary >= 5000);
-- ��ȣ�� �ȴݾ��൵ ����� ������ ���� ������ ��ȣ�� �־� �ش�.

--�����ڿ��� �켱 ������ �ִ�.
--��� ������ ��� : *, / �� +, -
--�� ������ ��� : AND : ���� �� OR : ����
--7 + (7 / 7) + (7 * 7) - 7 = 7 + 1 + 49 - 7 = 50

--5. ���� ���� ������ BETWEEN
--'BETWEEN ���۰� AND ��������'�� ���۰� �̻� �������� ���� �� ����.
--�� BETWEEN �̳� ���� �����ڷ� ���Ҽ� �ִ� ���� ���� ������, ���� ������, ��¥ ������
--A �̻� B ���� : Į���� BETWEEN A AND B
--A �̸� B �ʰ� : Į���� NOT BETWEEN A AND B
--               NOT Į���� BETWEEN A AND B
--NOT �����ڴ� BETWEEN ������ �ٷ� ���̳� Į���� �տ� �ٿ� ����� �� ������,
--�� ��� ��� ���� ����� ��ȸ�ȴ�.

--���� 1. ��� 110������ 120�������� ��� ��ȣ, ����, �޿�, �μ� �ڵ带 ��ȸ�Ѵ�.
SELECT employee_id, first_name ||' '|| last_name, department_id
FROM employees
--WHERE employee_id >= 110 AND employee_id <= 120;
WHERE employee_id BETWEEN 110 AND 120;

--���� 2. ����� 110�� �̸� 120�� �ʰ��� ����� ��� ��ȣ, ����, �޿�, �μ� �ڵ带 ��ȸ�Ѵ�.
SELECT employee_id AS emp_id, first_name ||' '|| last_name AS name,
        salary, department_id AS dept_id
FROM employees 
--WHERE employee_id < 110 OR employee_id > 120;
WHERE NOT employee_id BETWEEN 110 AND 120;

--���� 1. �� �����ڸ� ����� �μ� �ڵ尡 10 �̸� 40 �ʰ��� ������� ���, ����, �μ� �ڵ� ��ȸ
SELECT employee_id, first_name ||' '|| last_name, department_id
FROM employees
WHERE department_id NOT BETWEEN 10 AND 40;

--���� 2. ����� 110���� 120�� ��� �߿��� �޿��� 5000���� 10000 ������
--��� ��ȣ, ����, �޿�, �μ� �ڵ带 ��ȸ�Ѵ�.
SELECT employee_id, first_name ||' '|| last_name, salary, department_id
FROM employees
WHERE (employee_id BETWEEN 110 AND 120)
AND (salary BETWEEN 5000 AND 10000);

--���� 3. 2005�� 1�� 1�� ���ĺ��� 2007�� 12�� 31�� ���̿� �Ի��� ��� ������ ��ȸ�Ѵ�.
SELECT employee_id AS emp_id, first_name ||' '|| last_name AS name, salary, hire_date
FROM employees
--WHERE hire_date BETWEEN '2005-01-01' AND '2007-12-31';
WHERE hire_date BETWEEN TO_DATE('2005-01-01') AND TO_DATE('2007-12-31');

--DATE Ÿ���� HIRE_DATE�� ���� ���� ������ ����������
--�������� ����� ������ ������ ����Ŭ SQL ������ �ڵ����� ������ ����ȯ�� �߱� �����̴�.
--������ ������ ��������� ����ȯ�ϴ� ���� �ٶ����ϴ�.
--����� ����ȯ �Լ��� TO_DATE() �̴�.

--���� 3. �Ի� ���ڰ� 2003�� 8�� 1�Ϻ��� 2005�� 7�� 31�Ͽ� �ش��ϴ� �������
--���, ����, �Ի� ���� ��ȸ
SELECT employee_id, first_name ||' '|| last_name, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('2003-08-01') AND TO_DATE('2005-07-31');

--6. IN ���� ������
--���� ���� �� �߿� ��ġ�ϴ� ���� �ִ��� ���� ���� IN (��1, ��2, ��3 ...)�� ���·� ���ϴ� ���� ����� �����Ѵ�.
--������ Į�� ǥ���� ���� ���� ���� ������ ���ǽ��� OR�� ������ ����
--      Į�� ǥ�� IN (���� ���� ������ �� ���) ��
--      Į�� ǥ�� NOT IN (���� ���� ������ �� ���)
--      NOT ī��ǥ�� IN (���� ���� ������ �� ���)
--���� 1. �μ� �ڵ尡 20, 30, 40, 60, 100, 110�� �μ��� ���� ������� ���, ����, �μ� �ڵ� ��ȸ
SELECT employee_id, first_name ||' '|| last_name, department_id
FROM employees
WHERE department_id IN (20, 30, 40, 60, 100, 110);
--WHERE department_id = 20
--OR department_id = 30
--OR department_id = 40
--OR department_id = 60
--OR department_id = 100
--OR department_id = 110;

--���� 2. 30�� �μ��� �Ǵ� 60�� �μ��� �Ǵ� 90�� �μ����� ���, ����, �޿�, �μ� �ڵ带 ��ȸ�Ѵ�.
SELECT employee_id, first_name ||' '|| last_name, salary, department_id
FROM employees
WHERE department_id IN(30, 60, 90);

--���� 1. 30�� �μ�, 60�� �μ�, 90�� �μ� �̿��� �μ��� ���� ����� ���, ����, �޿�, �μ� �ڵ� ������ ��ȸ�Ѵ�.
SELECT employee_id, first_name ||' '|| last_name, salary, department_id
FROM employees
WHERE department_id NOT IN (30, 60, 90);

--7. �˻��� �ش��ϴ� ������ : �ʵ�� LIKE ���� ������(�����ϴ�)
--                       : �ʵ�� NOT LIKE ���� ������(�������� �ʴ�)
--Į�� ���� �߿� Ư�� ���Ͽ� ���ϴ� ���� ��ȸ�ϰ��� �� �� LIKE �����ڸ� ����Ѵ�.
--'%' : ���� ���� ���ڿ�, � ���ڰ� ��� ������ ������
--'_' : �ϳ��� ����, �ϳ��� ���ڰ� � ���ڰ� ������ ������

--Į�� ǥ�� LIKE �˻� ���� + %
--% : � ���ڰ� ��� ������ ������
--���� LIKE 'ȫ%' �� ȫ���� �����ϴ� ���� : ȫ�浿, ȫ��, ȫ�� ��
--���� LIKE '%ȫ' �� ȫ���� ������ ���� : Ȳ��ȫ, ��ȫ, ��ȫ ��
--���� LIKE '%ȫ%' �� ȫ�� �����ϴ� ���� : ȫ�浿, ȫ��, ȫ��, Ȳ����, ��ȫ, ��ȫ, ��ȫ�� ��

--���� 1. �̸��� K�� �����ϴ� ����� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE 'K%';

--���� 1. �̸��� s�� ������ ����� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees 
WHERE first_name LIKE '%s';

--���� 2. ���� z�� ���Ե� ����� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%';

--���� 3. ���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%'
OR last_name LIKE '%Z%';

--���� 4. ���� ��ҹ��� �����ϰ� z�� ���Ե� ������ ���� ������� ���, ���� ��ȸ
SELECT employee_id, first_name ||' '|| last_name AS name
FROM employees
WHERE (first_name || last_name) LIKE '%z%'
OR (first_name || last_name) LIKE '%Z%';

-- ���� 2. ���� �ҹ��� z�� 2��°�� ��ġ�� �ִ� ���� ���� ������� ���, ���� ��ȸ
SELECT employee_id, first_name ||' '|| last_name
FROM employees
WHERE last_name LIKE '_z%';

-- ���� 5. ���� �ҹ��� z�� 5��°�� ��ġ�� �ִ� ���� ���� ������� ���, ���� ��ȸ
SELECT employee_id, first_name ||' '|| last_name
FROM employees
WHERE last_name LIKE '____z%';

--���� 3. ���� �ҹ��� z�� �ڿ������� 5��°�� ��ġ�� �ִ� �������� ������� ���, ���� ��ȸ
SELECT employee_id, first_name ||' '|| last_name
FROM employees
WHERE last_name LIKE '%z____';

--���� 6. ��ȭ��ȣ�� 6���� ���۵��� �ʴ� ����� ���, ����, �޿�, �޴���ȭ ������ ��ȸ
SELECT employee_id, first_name ||' '|| last_name, salary, phone_number
FROM employees
WHERE phone_number NOT LIKE '6%';

--���� 7. �Ի� ���ڰ� 12���� �Ի��� ������� ���, ��, �Ի� ���� ��ȸ
SELECT employee_id, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___12___';            -- ���� �ۼ��� ����
--WHERE TO_CHAR(hire_date, 'MM') = 12;      -- �� ��
--WHERE hire_date LIKE '___12___';          -- �� ��
--WHERE hire_date LIKE '___%12%___';        -- �� ��
--WHERE hire_date LIKE '__/12/__';          -- �� ��

--7. LIKE �����ڿ� �Բ� ���� %, _ �� ���� ��ü�� �����ǰ� �Ϸ���
--%, _ �տ� ��ȣ ���ڸ� ���̰� escape �ɼ��� �����Ѵ�.
--Į�� ǥ�� LIKE Ư������ '\_' escape '\'
--Ư�� ���� �� ~, !, @, #, $, ^, & ��

--���� 1. ������� ���� ����(���� �ڵ�)�� �ľ��ϰ��� �Ѵ�.
--���� �ڵ尡 _A �� ������� ���, ��, ���� �ڵ带 ��ȸ
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%\_A%' escape '\';

--8. ������ ���� ���� ������ ǥ�� : NULL - �� �Ұ�, ��� ���� �Ұ�
--�׷���, Į�� ǥ�� IS NULL/IS NOT NULL�� �Ǵ� �� NULL ���� �ƴ��� �ľ�

SELECT *
FROM locations
--WHERE state_province LIKE '%';
WHERE state_province IS NOT NULL;

--���� 1. �μ� �ڵ尡 NULL�� �μ� ��ġ ���� ���� ������� ���, ��, �μ� �ڵ�, ���� �ڵ�, �޿� ��ȸ
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE department_id IS NULL;        -- �μ� ��ġ�� ���� ����
--WHERE department_id IS NOT NULL;  -- �μ� ��ġ�� ����

--���� 1. Ŀ�̼��� �޴� ������� ���, ��, �μ� �ڵ�, Ŀ�̼� ���� ��ȸ
SELECT employee_id, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--2.4 �������� ���� - ORDER BY �� : �������� ���� �������� ��ġ
-- ORDER BY ���ı���ǥ�� + ��������(default) ASC / �������� DESC
-- ���ı���ǥ�� : Į�� ǥ�� �״��, ALIAS, SELECT ��Ͽ����� ��ġ(Į�� ��ȣ)
-- SELECT ��
-- FROM ��
-- WHERE ��
-- ORDER BY ��;
-- ���α׷� �󿡼��� ���� �� ����(��, DB������ �����ؼ� ���α׷����� �ѱ�)

--���� 1. 80�� �μ��� ���, ��, �޿�, �μ� �ڵ忡 ���� ���� ��������/������������ �����Ѵ�.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id = 80
ORDER BY last_name ASC;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id = 80
ORDER BY last_name DESC;

--ORDER BY ���� ALIAS�� ����Ͽ� ������ �� �ִ�.
--���� 2. 60�� �μ��� ���, ��, ������ ���� ������ ������������ �����Ѵ�.
--������ annual_salary�� ALIAS�Ѵ�.
SELECT employee_id, last_name, salary*12 AS annual_salary
FROM employees
WHERE department_id = 60
--ORDER BY salary*12;
ORDER BY annual_salary;

--���� 3. ��� ���̺��� ���, ��, �޿�, �μ� �ڵ带 ��ȸ�ϴµ�
--�μ��� ��������, ���޿��� �������� �����Ͽ� ��� ������ ��ȸ�Ѵ�.
--department_id�� dept_id�� ALIAS
SELECT employee_id, last_name, salary, department_id AS dept_id
FROM employees
--WHERE
--ORDER BY dept_id ASC, salary DESC;
ORDER BY 4 ASC, 3 DESC;

--���� 4. ���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ, �� ������������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
--WHERE
ORDER BY last_name DESC;

--���� 1, ���, ��, �μ� �ڵ�, �޿�, �Ի� ���� ��ȸ
--�μ��ڵ� ��, �޿� ������������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id ASC, salary DESC;