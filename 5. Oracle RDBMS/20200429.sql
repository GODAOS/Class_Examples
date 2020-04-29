--1. �츮ȸ�� ������� ��������(�����ڵ�)�� ��� ���� �ľ��ϰ��� �Ѵ�.
--��������(�����ڵ�), ����� ��ȸ
SELECT job_id, COUNT(*) cnt
FROM employees
GROUP BY job_id;

--2. �μ��� �޿� ������ �ľ��ϰ��� �Ѵ�.
--�μ��ڵ�, �޿���� ��ȸ- �޿������ ���� �μ����� �����ϰ�
--�޿���մ� �ݿø��Ͽ� �Ҽ� ��°�ڸ����� ǥ��.
SELECT department_id, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
ORDER BY avg_sal DESC;

--3. �μ���, ������ �޿��հ踦 �ľ��ϰ��� �Ѵ�.
--�μ��ڵ�, �����ڵ�, �޿��հ� ��ȸ
SELECT department_id, job_id, SUM(salary) sum_sal
FROM employees
GROUP BY department_id, job_id
ORDER BY 1, 2;

--4. �μ��ڵ� 60�� �μ��� ���� ������� ��� ���� �ľ��ϰ��� �Ѵ�.
--60 �� �μ��� ���� ������� ��� ���� ��ȸ(HAVING �� ���)
SELECT department_id, COUNT(*) cnt
FROM employees
GROUP BY department_id
HAVING department_id = 60;

--5. �μ��� �޿������ 10000 �̻��� �μ��� �ľ��ϰ��� �Ѵ�.
--�μ��� �޿������ 10000�̻��� �μ��ڵ�, �޿���ո� ��ȸ
--�޿���մ� �ݿø��Ͽ� �Ҽ� ��°�ڸ����� ǥ��.
SELECT department_id, ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 10000;

--6. �� �μ��� �μ��ڵ�, �μ�����, �μ��޿���� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
ORDER BY 1;

--7. 100�� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
--100�� �μ��� �μ��ڵ�, �μ�����, �μ��޿���� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
HAVING department_id = 100;

--8. �� �μ��� ������ �ľ��ϰ��� �Ѵ�.
--�� �μ��� �μ������� 15�� �̻��� �μ��� ���� �μ��ڵ�, �μ�����, �μ��޿���� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 15;

--9. �� �μ��� �μ��޿������ 8000 �̻��� �μ��� ����
--�μ��ڵ�, �μ�����, �μ��޿���� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 8000;

--10. �� �μ��� �ִ�޿��� �ľ��ϰ��� �Ѵ�. 
-- �� �μ��� �ִ�޿��� 10000 �̻��� �μ��ڵ�, �ִ�޿��� ��ȸ. 
SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

--11. �� �� �̻� �ִ� ���� � �͵��� �ֳ� �ľ��ϰ��� �Ѵ�. 
--�� �� �̻� �ִ� ����, ���� ��ȸ
SELECT first_name, COUNT(*) cnt
FROM employees
GROUP BY first_name
HAVING COUNT(*) >= 2;

--12. �⵵��(��������)�� �Ի��� ��� ���� �ľ��ϰ��� �Ѵ�. 
--�⵵, ��� �� ��ȸ - �⵵�� 2020�� ���·� ǥ��
SELECT TO_CHAR(hire_date, 'YYYY') hire_year, COUNT(*) cnt
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

--13. �� �μ����� ������ �ľ��ϰ��� �Ѵ�.
--�� �μ��� �μ��ڵ�, �μ�����, �μ��޿����, �μ��ְ�޿�, �μ������޿� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY department_id
ORDER BY 1;

--14. �� �������� ������ �ľ��ϰ��� �Ѵ�.
--�� ������ �����ڵ�, �����ϴ»����, �����޿����, �����ְ�޿�, ���������޿� ��ȸ
SELECT job_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY job_id;

--15. �� �μ��� �μ��� �������� �μ��ڵ�, �����ڵ�, �����, �޿���� ��ȸ
SELECT department_id, job_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id, job_id
ORDER BY 1;

--ROLLUP : GROUP BY ���� ROLLUP �Լ��� ����Ͽ� GROUP BY ������ ���� ����� �Բ� �ܰ躰 �Ұ�, �Ѱ� ������ ����
--�μ��� ��� ���� �޿� �հ�, �Ѱ踦 ��ȸ�Ѵ�.
SELECT department_id, COUNT(*) cnt, SUM(salary) sum_sal
FROM employees
WHERE department_id IS NOT NULL
GROUP BY ROLLUP(department_id)
ORDER BY department_id;

--�μ� �� ������ ��� ���� �޿� �հ�, �μ��� �Ұ�, �Ѱ踦 ��ȸ�Ѵ�.
SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id, job_id;

--CUBE : GROUP BY ���� CUBE �Լ��� ����Ͽ� GROUP BY ������ ���� ����� ��� ����� ���տ� ���� �Ұ�, �Ѱ� ������ ���� �� �ִ�.
SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id, job_id;

--PK : ���̺��� ���ڵ带 ������ �� �ִ� �ּ��� Į��(UNIQUE, NOT NULL)
--FK : �ٸ� ���̺��� PK�� �����ϴ� Į��
--PK - FK : �θ�� �ڽ� ����� �� �� �ִ�.
--PK�� �ַ� �й�, �ֹι�ȣ, ��� ��ȣ �� ������ ���� ������ Į���� �ַ� PK�� ����� �ȴ�.
--��) �й�, �а�, �̸�, ��ȭ��ȣ�� ������ ���̺��� ��� �й��� �л� �������� ������ �� �ִ� Į������ �����ϱ⿡ PK�� �ȴ�.