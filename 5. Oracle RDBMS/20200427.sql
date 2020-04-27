--[���� ���� 3 - 3]
--1. ��� ���̺��� 30�� �μ��� ���, ����, �޿�, �ٹ� ������, �ٹ� ����� ��ȸ
--��, �ٹ� �������� ���� ��¥�� �������� ��¥ �Լ��� ���
SELECT employee_id,
       first_name ||' ' || last_name AS name,
       salary,
       hire_date,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) AS work_months,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) AS work_years 
FROM employees
WHERE department_id = 30;

--2. �޿��� 12000 �̻��� ������� ���, ����, �޿��� ��ȸ�Ͽ� �޿������� ����
--�޿��� ���� ���� õ���� ��ȣ�� ����Ͽ� ǥ���Ѵ�.
SELECT employee_id,
       first_name ||' '|| last_name AS name,
       TO_CHAR(salary, '999,999,999') AS salary
FROM employees
WHERE salary >= 12000
ORDER BY salary;

--3. 2005�� ��(2004�����)�� �Ի��� ������� ���, ����, �Ի�����, �Ի����� ������ ��ȸ�Ͽ�
--�ֱٿ� �Ի��� ��� ������ �����Ѵ�.
SELECT employee_id,
       first_name ||' '|| last_name AS name,
       hire_date,
       TO_CHAR(hire_date, 'DAY') AS hire_day
FROM employees
--WHERE hire_date < '2005-01-01'        --TO_DATE�� ���������� ���� �Լ�, ĳ������ ���ؼ� TO_CHAR�� �������
WHERE TO_CHAR(hire_date, 'YYYY') < 2005 --�̷� ���¸� ���� ����Ѵ�.
ORDER BY hire_date DESC;


--* �Ϲ� �Լ� : NULL�� ���Ǿ��� ��� ���� NULL�� ������ �Ǿ� ����

--commission_pct Ȯ��
SELECT employee_id, last_name, salary, commission_pct
FROM employees;

--Ŀ�̼� �ݾ��� 1000 �̸��� ����� ���, �̸�, �޿�, Ŀ�̼� ����, Ŀ�̼� �ݾ��� ��ȸ
--Ŀ�̼� ������ NULL�� ���, ��, Ŀ�̼� �ݾ��� 0�� ��쿡�� ��ȸ�� ���� �ʴ� ������ �ִ�.
SELECT employee_id, first_name, salary, commission_pct, salary * commission_pct AS comm
FROM employees
--WHERE salary * commission_pct < 1000;
WHERE salary * NVL(commission_pct, 0) < 1000;

--��ȸ�� NULL ���� ġȯ�ϴ� �Լ� : NVL(Null Value)�Լ�, DECODE �Լ�
--NVL(Į��, 0) : ���� NULL�̸� 0���� ġȯ, �ƴϸ� Į���� ��
--DECODE(Į��, A, 1, B, 2, 3) : Į�� ���� A�̸� 1, B�̸� 2, �װ͵� �ƴϸ� 3

--1. NVL() : ������ ���� NUJLL�� ��� �ٸ� ������ ��ü�Ͽ� ��ȯ�ϴ� �Լ�
--NVL(���, NULL�϶� ��ȯ ǥ��) �� NULL VALUE, ����Ŭ������ ���
--NULL�� �� ��ȯ ǥ���� ������ Ÿ���� ����� ������ Ÿ�԰� ���ƾ� �Ѵ�.

--Ŀ�̼� �ݾ��� 1000 �̸��� �����
--���, ��, �޿�, Ŀ�̼� ����, Ŀ�̼� �ݾ� ��ȸ
--Ŀ�̼� �ݾ� = �޿� * Ŀ�̼� ����
SELECT employee_id,
       last_name,
       salary,
       commission_pct,
       salary * commission_pct AS comm
FROM employees
WHERE salary * commssion_pct < 1000;

--NVL ���
SELECT employee_id,
       first_name,
       salary,
       commission_pct,
       salary * NVL(commission_pct, 0) AS comm
FROM employees
WHERE salary * NVL(commission_pct, 0) < 1000;

--���� 1. ���, ��, �޿�, Ŀ�̼� ����, �ѱ޿� ��ȸ
--�ѱ޿� = �޿� + Ŀ�̼� �ݾ�
SELECT employee_id, last_name, salary, commission_pct,
--       salary + (salary * NVL(commission_pct, 0)) AS total_salary
       salary * (1 + NVL(commission_pct, 0)) AS total_salary -- �й��Ģ
FROM employees
ORDER BY total_salary DESC;

--2. NVL2() : ������ ���� NULL�� ����� ��ȯ ǥ���� NULL�� �ƴ� ����� ��ȯ ǥ���� ���� ������ �� �ִ� ������ �Լ�
--NVL2(���, NULL�� �ƴ� ����� ��ȯ ��, NULL�� ��� ��ȯ ��)
--NVL2(���, ����� ���� ���� ��� ��ȯ ��, ���� ���� ��� ��ȯ ��)
--NULL�� ����� ��ȯ ǥ���� NULL �ƴ� ����� ��ȯ ǥ���� ������ Ÿ���� ���ƾ� �Ѵ�.
--NULL�� ����� ��ȯ Ÿ�� = NULL �ƴ� ����� ��ȯ Ÿ��

--���� 1. ���, ��, �޿�, Ŀ�̼� ����, �ѱ޿� ���� ��ȸ
SELECT employee_id, last_name, salary, commission_pct,
       NVL2(commission_pct, '�޿� + Ŀ�̼� �ݾ�', '�޿�') AS type1,
       NVL2(commission_pct, 'salary + commission', 'salary') AS type2,
       NVL2(commission_pct, salary * (1 + commission_pct), salary) AS type3
FROM employees
ORDER BY type3 DESC;

--���� 1. �޿�, Ŀ�̼� ����, NVL ��� �ѱ޿�, NVL2 ��� �ѱ޿� ��ȸ
SELECT salary, commission_pct,
       salary * (1 + NVL(commission_pct, 0)) AS total_1,
       NVL2(commission_pct, salary * (1 + commission_pct), salary) AS total_2
FROM employees
ORDER BY total_2 DESC;


--3. COALESCE() : ������ ���� NULL�� ��� ��ȯ ǥ���� ���� �� ������ �� �ִ� ������ �Լ�
--COALESCE(��� ǥ��, ��ü ǥ��1, ��ü ǥ��2, ��ü ǥ��3, ...)
--* COALESCE : ��ġ��, �����ϴ�, ��ü�ϴ�, �յ��ϴ�
--NULL�� NULL�Ǵ� ''�� ǥ��

--[�������� 3 - 4]
--���, ��, �μ� �ڵ�, ���� �ڵ�, �Ի� ����, �Ŵ��� �ڵ�, �Ŵ��� ���� ����(NVL, NVL2 ���� ���) ��ȸ
--�Ŵ��� ���� ���δ� �� ����� ����
--NVL�� �Ŵ����� ������ '����'���� ��ȸ�ǰ� �ϰ�,
--NVL2�� ����� ������(�Ŵ���)�� ������ '����'����, ������ '����'���� ��ȸ�ǰ� �Ѵ�.
SELECT employee_id, last_name, department_id, job_id, hire_date, manager_id,
--     NVL(manager_id, '����') -- ������ Ÿ���� �ȸ¾Ƽ� ����
       NVL(TO_CHAR(manager_id), '����') AS manager_1,
       NVL2(manager_id, '����', '����') AS manager_2
FROM employees;


--3.6 DECODE�� CASE
--1. ���ǹ��� �ش��ϴ� �Լ�
--IF (���ǽ�1) {
--���๮1
--} ELSE IF (���ǽ�2) {
--���๮2
--} ELSE {
--���๮3
--}

--DECODE() : ���ǹ��� �ش��ϴ� �Լ�, ����Ŭ������ ���
--��� ǥ���� �� ������ ǥ���� ������ ������ ��ġ�ؾ� ��.
--DECODE(��� ǥ��, �� ������ ǥ��1, ��ȯ ������1,
--                 �� ������ ǥ��2, ��ȯ ������2,
--                 �� ������ ǥ��3, ��ȯ ������3, default ��ȯ ������)
SELECT employee_id, last_name, department_id, salary,
       DECODE(department_id, 10, salary * 0.1,
                             20, salary * 0.2,
                             30, salary * 0.3, salary * 0.05) AS bonus
FROM employees
ORDER BY department_id;

SELECT employee_id, last_name, department_id, salary,
       CASE department_id WHEN 10 THEN salary * 0.1
                          WHEN 20 THEN salary * 0.2
                          WHEN 30 THEN salary * 0.3
                          ELSE salary * 0.05
       END AS bonus
FROM employees
ORDER BY department_id;

SELECT employee_id, last_name, department_id, salary,
       CASE WHEN department_id = 10 THEN salary * 0.1
            WHEN department_id = 20 THEN salary * 0.2
            WHEN department_id = 30 THEN salary * 0.3
            ELSE salary * 0.05
       END AS bonus
FROM employees
ORDER BY department_id;

--���� 1. ������� ���, ��, ���� �ڵ�, ���� ��� ��ȸ
--���� ����� ���� �ڵ忡 ���� �з��Ѵ�.
--AD_PRES   A
--ST_MAN    B
--IT_PROG   C
--�� ��      X
SELECT employee_id, last_name, job_id,
       DECODE(job_id, 'AD_PRES', 'A',
                      'ST_MAN', 'B',
                      'IT_PROG', 'C', 'X') AS job_grade
FROM employees;

SELECT employee_id, last_name, job_id,
       CASE job_id WHEN 'AD_PRES' THEN 'A'
                   WHEN 'ST_MAN' THEN 'B'
                   WHEN 'IT_PROG' THEN 'C'
                   ELSE 'X'
       END AS job_grade
FROM employees;

SELECT employee_id, last_name, job_id,
       CASE WHEN job_id = 'AD_PRES' THEN 'A'
            WHEN job_id = 'ST_MAN' THEN 'B'
            WHEN job_id = 'IT_PROG' THEN 'C'
            ELSE 'X'
       END AS job_grade
FROM employees;

--���ǹ��� �ش��ϴ� ���� : CASE ~ END
--DECODE�� ���� �񱳸� ����������, CASE�� �پ��� �񱳰� �����ϴ�.
--���, ��, �μ� �ڵ�, �޿�, ���ʽ� ��ȸ
SELECT employee_id, last_name, department_id, salary,
       CASE WHEN department_id BETWEEN 10 AND 30 THEN salary * 0.1
            WHEN department_id BETWEEN 40 AND 60 THEN salary * 0.2
            WHEN department_id BETWEEN 70 AND 100 THEN salary * 0.3
            ELSE salary * 0.05
       END bonus1,
       CASE WHEN department_id <= 30 THEN salary * 0.1
            WHEN department_id <= 60 THEN salary * 0.2
            WHEN department_id <= 100 THEN salary * 0.3
            ELSE salary * 0.05
       END bnous2
FROM employees;

--���� 1. �μ� �ڵ尡 20 �����̸� �޿��� 30%,
--�޿��� 10000 �̻��̸� �޿��� 20%,
--���� �ڵ尡 clerk ������ �����̸� �޿��� 10%
--�׿ܴ� �޿��� 5%
--���, ��, �μ� �ڵ�, �޿�, ���� �ڵ�, ���ʽ� ��ȸ
SELECT employee_id, last_name, department_id, salary, job_id,
       CASE WHEN department_id <= 20 THEN salary * 0.3
            WHEN salary >= 10000 THEN salary * 0.2
            WHEN LOWER(job_id) LIKE '%clerk%' THEN salary * 0.1
            ELSE salary * 0.05
       END AS bonus
FROM employees;

--[���� ���� 3 - 5]
--���� 1. ����� ���, �̸�, �Ի���, �ٹ� ���, �ټ� ���¸� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--��, �ٹ� ����� ���� ��¥�� �������� ���� ���·� ǥ���Ѵ�. ��) 3.56�� 3������ ǥ���Ѵ�.
--�ټ� ���´� �ٹ� ����� 13�� �̸��̸� '13�� �̸� �ټ�', 13�� �̻� 15�� �̸��̸� '15�� �̸� �ټ�', 15�� �̻��̸� '15�� �̻� �ټ�'���� ǥ���Ѵ�.
SELECT employee_id, first_name, hire_date,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) AS work_years,
       CASE WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 < 13 THEN '13�� �̸� �ټ�'
            WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 BETWEEN 13 AND 15 THEN '13�� �̸� �ټ�'
--            WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 >= 13
--                AND MONTHS_BETWEEN(SYSDATE, hire_date)/12 < 15 THEN '15�� �̸� �ټ�'
            WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 >= 15 THEN '15�� �̻� �ټ�'
       END AS continuous_service_1,
       CASE WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 < 13 THEN '13�� �̸� �ټ�'
            WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 < 15 THEN '15�� �̸� �ټ�'
            ELSE '15�� �̻� �ټ�'
       END AS continuous_service_2
FROM employees;