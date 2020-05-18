7. ��� �������ุ ��ȸ�� ����.
���������� ��ȸ�ؿ��� ���� : ROWNUM - ���̺� �������� �ʴ� �÷��� �ƴ����� 
����� �� �ִ� ��¥ �÷�(PSEUDO COLUMN), 
SELECT ���� WHERE ������ ���,
�� �������� ����� ���� �� �࿡ ���� ������
�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�
�� ���� �������� ���� ����(ORDER BY) �� ���� �������� ���� �ű��(ROWNUM)
-  ROWNUM�� �ζ��� ���� Ư���� �̿��Ͽ� ����¡ ó�� ���� �۾��� ����

�Խ��ǿ��� �Ϲ������� ������ ��ȣ�� 3 ������ �̻��� ���� ���� ���� ����. 
��, ������ ��ȣ�� ���� ���� �ξ� �� ���� ��ȸ�ϰ� �ְ�, 
�� ������ 5 ������ ������ ������ ��ȸ���� 95% �̻�

�츮ȸ�� ������� 
���, ��, �޿� ��ȸ
SELECT ROWNUM, employee_id, last_name, salary
FROM employees;

�츮ȸ�� ����鿡 ���� �޿��� ���� �޴� ������ �����Ͽ� 
���, ��, �޿� ��ȸ
SELECT ROWNUM, employee_id, last_name, salary
FROM employees
ORDER BY salary DESC;

�츮ȸ�� ����� ��������� �����Ͽ� 10������
���, ��, �޿� ��ȸ
SELECT ROWNUM, employee_id, last_name, salary
FROM employees
WHERE ROWNUM <= 10;

SELECT ROWNUM, employee_id, last_name, salary
FROM employees
WHERE ROWNUM <= 10
ORDER BY salary DESC;

�ζ��� �� ����Ͽ�
�޿� ���� 5���� ���� ���, �̸�, �޿� ��ȸ
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, first_name, salary
       FROM employees
       ORDER BY salary DESC ) e
WHERE ROWNUM <= 5;

�ζ��� �� ����Ͽ�
�޿� ���� 5���� ���, �̸�, �޿� ��ȸ
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, first_name, salary
       FROM employees
       ORDER BY salary ) e
WHERE ROWNUM <= 5;

���� ���� �Ի��� ��� 10�� ���� ���, ��, �Ի����� ��ȸ
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, last_name, hire_date
       FROM employees
       ORDER BY hire_date ) e
WHERE ROWNUM <= 10 ;

8. ������ �����ϰ��� �Ѵٸ�
RANK() OVER(������������) - 1,2,2,2,2,6
DENSE_RANK() OVER(������������) - 1,2,2,2,2,3 
    --DENSE : ������, ������

�� ROWNUM : �������� ����� ���� �� �࿡ ���� ������
�Ի����ڸ� �������� �������� 10������(���� �Ի��� ��� 10��)
���, ��, �Ի����� ��ȸ
SELECT ROWNUM, e.*
FROM ( SELECT employee_id, last_name, hire_date
       FROM employees
       ORDER BY hire_date) e
WHERE ROWNUM <= 10 ;

SELECT * 
FROM ( SELECT DENSE_RANK() OVER(ORDER BY hire_date) rank, 
              employee_id, last_name, hire_date
       FROM employees )
WHERE rank <= 10;

������ ��ȸ �� SELECT 
SELECT �÷���, ....
FROM ���̺��, ....
WHERE ��������
WHERE �Ϲ�����
WHERE �������� AND �Ϲ�����
GROUP BY ����
HAVING �Ϲ�����(�׷��Լ�)
ORDER BY ���ı���;

-----------------------------------------------------------------------------------------------
[�������� 6-4]
1. �޿��� ���� ���� 5�� ����� 
����, ���, �̸�, �޿��� ��ȸ�ϴ� �������� 
DENSE_RANK()�� ����� �ζ��κ� ���� ������ ����Ͽ� �ۼ�

�޿� ���� 5���� ����, ���, �̸�, �޿� ��ȸ
SELECT e.* 
FROM ( SELECT RANK() OVER(ORDER BY salary) rank, 
              employee_id, first_name, salary
       FROM employees ) e
WHERE rank<=5;

2. �μ����� ���� �޿��� ���� �޴� ����� 
���, �̸�, �μ��ڵ�, �޿�, �����ڵ带 ��ȸ�ϴ� ������ 
�ζ��� �� ���� ������ ����Ͽ� �ۼ�

SELECT employee_id, first_name, e.department_id, salary, job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND salary=max_sal
ORDER BY department_id;
-----------------------------------------------------------------------------------------------



