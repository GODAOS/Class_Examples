--���� 02. 60�� �μ������ ���� �޿��� �޴� �������
--���, ��, �޿�, �μ� �ڵ� ��ȸ
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE department_id = 60);

--���� 03. 60�� �μ��� ������ �����鼭
--60�� �μ������ ���� �޿��� �޴� �������
--���, ��, �޿�, �μ� �ڵ� ��ȸ
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE department_id = 60)
AND department_id != 60;
--AND department_id <> 60;
--AND department_id NOT IN 60;

--���� 05. �츮ȸ�� ����� �� �μ����� Marketing�̰ų� IT�� ���� �������
--���, ��, �μ� �ڵ� ��ȸ
SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE department_name IN ('Marketing', 'IT'));
---------------------------------------------------------------------------------------------------------------
--���� Į�� ���� ����
--���� ������ ��� Į���� ���� Į���� ���
--���� Į���� pair�� ���·� ���Ѵ�.

--���� 01. �μ� ���� ���� ���� �޿��� �޴� �����
--���, ����, �μ��ڵ�, �޿�, ���� �ڵ� ��ȸ
SELECT employee_id, first_name ||' '|| last_name name, department_id, salary, job_id
FROM employees
WHERE (NVL(department_id, 0), salary)
IN (SELECT NVL(department_id, 0), MAX(salary) FROM employees GROUP BY department_id)
ORDER BY 3;
--�μ��� ���� ����� ����ϱ� ���� NVL�� ����Ѵ�.

--���� 01. �� �μ��� �ֱٿ� �Ի��� �������
--���, ��, �μ� �ڵ�, �Ի����� ��ȸ
SELECT employee_id, last_name, department_id, hire_date
FROM employees
WHERE (NVL(department_id, 0), hire_date) IN (SELECT NVL(department_id, 0), MAX(hire_date) FROM employees GROUP BY department_id)
ORDER BY 3;

--���� 02. �Ŵ����� ���� ����� �Ŵ����� �ִ� �μ���
--�μ� �ڵ�, �μ� ���� ��ȸ
SELECT department_id, department_name
FROM departments 
WHERE department_id IN (SELECT department_id FROM employees WHERE manager_id IS NULL);

--���� 02. �Ŵ����� ���� ����� �Ŵ����� �ִ� ����� �ִ�
--�μ� �ڵ�, �μ� ���� ��ȸ
SELECT DISTINCT(d.department_id), d.department_name
FROM employees e, departments d
WHERE e.manager_id IN (SELECT employee_id FROM employees WHERE manager_id IS NULL)
AND e.department_id = d.department_id(+)
ORDER BY 1;