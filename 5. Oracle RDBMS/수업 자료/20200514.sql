4. ��ȣ���� ���� ���� : ���������� �÷��� ���� ������ �������� ���Ǵ� ����
- ���������� ���� ���� ������ �ְ�, ���� ������ ��� ���� �޾Ƽ� ���������� ��ȯ�ؼ� 
  �����ϴ� ����
- ���������� �÷��� ���� ������ �������� ���Ǿ� ���������� ���������� ���� ����
- ���� ���̺�� ���� ���� ���̺� ���� JOIN ������ ����.
- ���� ������ ���� ������ ��� ������ �ְ� �޴´ٴ� �ǹ�

�� ���������� �÷��� ���� ������ �������� ���Ǵ� 
  ��ȣ���� ���� ������ ���·� ���ȴ�.(WHERE ������ ���)
- ��Į�� ���� �������� �ٷ� ����
                          
5. ��Į�� ���� ���� : SELECT ���� ��� , ����(���)��, �����÷��� ��ȸ����, 
   Scalar : (ũ��)�ϳ�, Vector : ũ��� ����
- �ܼ��� �׷��Լ��� �����  SELECT ������ ��ȸ�ϰ��� �Ҷ�
- SELECT ���� ���� ������ ����Ͽ� �ϳ��� �÷�ó�� ����ϱ� ���� ����(ǥ�� �뵵)
- ����(Join)�� ��ü ǥ�������ε� ���� ���  
- �ڵ强 �����͸� ��ȸ�ϰ��� �Ҷ�   


1) �ܼ��� �׷��Լ��� ������� SELECT ���� ��ȸ�ϰ��� �Ҷ�

01. �� ����� �޿� ������ �ľ��ϰ��� �Ѵ�.
��� ����� ���, ��, �޿�, ȸ����ձ޿�, ȸ���ִ�޿� ��ȸ

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, last_name, salary, 
       ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal
FROM employees
GROUP BY employee_id, last_name, salary; --xxxx, ������� SALARY, AVG_SAL, MAX_SAL ���غ���
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

SELECT ROUND(AVG(salary)) avg_sal --6462
FROM employees; 

�ۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡ�
SELECT employee_id, last_name, salary, 
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal,
       ( SELECT MAX(salary) FROM employees ) max_sal
FROM employees;
�ۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡ�

SELECT ���� �׷��Լ��� ���� �Ǹ� ������ �׷��Լ� �̿��� �÷��� 
GROUP BY ���� ����ϰų� �׷��Լ��� �� �� �ִ�.

2) �ڵ强 �����͸� SELECT ���� ��ȸ�ϰ��� �� �� : ��ȣ���� ���� ����, Outer Join ����Ѱ� ó��

01. ��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ1

�Ϲ� ����
SELECT employee_id, last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY 1;

��ȣ���� ���� ���� : ���������� �÷��� ���� ������ �������� ���Ǵ� ����
��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ2 ( ��Į�� ���� ������ "�μ���" ���ϱ� )
SELECT employee_id, last_name, department_id, 
       ( SELECT department_name 
         FROM departments d
         WHERE department_id = e.department_id ) department_name --e.department_id ���
FROM employees e;

02. ��� ����� ���, ��, �μ��ڵ�, �����ڵ�, �������� ��ȸ ( ��Į�� ���� ������ "��������" ���ϱ� )

�Ϲ� ����
SELECT employee_id, last_name, department_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

��ȣ���� ���� ����
SELECT employee_id, last_name, department_id, job_id,
       ( SELECT job_title 
         FROM jobs 
         WHERE job_id = e.job_id ) job_title
FROM employees e;       

03. �� �μ��� ���� �μ��ڵ�, �μ���, ���ø� ��ȸ ( ��Į�� ���� ������ "����" ���ϱ� )

�Ϲ� ����
SELECT department_id, department_name,  l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id(+);

��ȣ���� ���� ����
SELECT department_id, department_name, 
       ( SELECT city 
         FROM locations 
         WHERE location_id = d.location_id ) city
FROM departments d;

04. ��� ������� ���, ��, �޿�, �μ��ڵ�, �μ���, �����ڵ� ��ȸ

�Ϲ� ����
SELECT employee_id, last_name, salary, e.department_id, 
       department_name, job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

��ȣ���� ���� ���� ( ��Į�� ���� ������ "�μ���" ���ϱ� )
SELECT employee_id, last_name, salary, department_id,
       ( SELECT department_name 
         FROM departments 
         WHERE department_id = e.department_id ) department_name,
         job_id
FROM employees e;

ANSI ����
SELECT employee_id, last_name, salary, department_id, 
       department_name, job_id
FROM employees e LEFT OUTER JOIN departments d
USING (department_id);
 
05. �� �μ��� ���� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø� ��ȸ

�Ϲ� ����
SELECT department_id, department_name, d.location_id, city
FROM departments d, locations l
WHERE d.location_id = l.location_id(+);

ANSI ����
SELECT department_id, department_name, location_id, city
FROM departments d LEFT OUTER JOIN locations l
USING (location_id);

��ȣ�������� ����( ��Į�� ���� ������ "����" ���ϱ� )
SELECT department_id, department_name, location_id, 
       ( SELECT city 
         FROM locations 
         WHERE location_id = d.location_id ) city
FROM departments d;

06. �� �μ��� �μ��ڵ�, �μ���ձ޿� ��ȸ
�Ϲ� ����
SELECT department_id, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id;

��ȣ�������� ����( ��Į�� ���� ������ "��ձ޿�" ���ϱ� )
SELECT department_id, 
       ( SELECT ROUND(AVG(salary)) 
         FROM employees
         WHERE department_id = e.department_id ) avg_sal
FROM employees e
GROUP BY department_id;

07. �� ����� ���� ����� �Ҽӵ� �μ��� �޿����� ��� ����� �޿��� �ľ��ϰ��� �Ѵ�.
���, ��, �μ��ڵ�, �޿�, �� ����� ���� �μ��� ��ձ޿� ��ȸ
                          �ءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                         
SELECT employee_id, last_name, department_id, salary, ROUND(AVG(salary)) avg_sal --xxxx
FROM employees
GROUP BY employee_id, last_name, department_id, salary;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

SELECT employee_id, last_name, department_id, salary, 
       ( SELECT ROUND(AVG(m.salary)) 
         FROM employees m
         WHERE m.department_id = e.department_id ) dept_avg_sal
FROM employees e;



6. FROM���� ����ϴ� �ζ��κ� ���� ����
SELECT ���� ����� FROM ������ �ϳ��� ���̺�ó�� ���(���̺� ��ü �뵵)
--FROM ���� ����ϴ� �ζ��� �� ���� �������� �׷��Լ��� ��.��.�� alias �����ؾ� ��!!!!

01. �츮ȸ�� ������� �޿������� ������ ���̺��� �ִ�.
�츮 ȸ�� �ִ�޿�, �ּұ޿�, ��ձ޿�
SELECT  MAX(salary) max_sal, 
        MIN(salary) min_sal, 
        ROUND(AVG(salary)) avg_sal
FROM employees;

MAX_SAL    MIN_SAL    AVG_SAL
---------- ---------- ----------
24000      2100       6462
     
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

02. �츮ȸ�� ������� �޿������� ������ ���̺��� �ִ�.
���, ��, �޿�, �ִ�޿�, �ּұ޿��� ��ȸ
SELECT employee_id, last_name, salary, 
       MAX(salary) max_sal, 
       MIN(salary) min_sal, 
       ROUND(AVG(salary)) avg_sal --xxxx
FROM employees
GROUP BY employee_id, last_name, salary
ORDER BY 1;

EMPLOYEE_ID LAST_NAME  SALARY   MAX(SALARY) MIN(SALARY) ROUND(AVG(SALARY))
--------------------------------------------------------------------------
100         King       24000    24000       24000       24000  --������ salary�� max, min, avg xxx
101         Kochhar    17000    17000       17000       17000
102         De Haan    17000    17000       17000       17000
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

��Į�� ���� ����
SELECT employee_id, last_name, salary, 
       ( SELECT MAX(salary) FROM employees ) max_sal,
       ( SELECT MIN(salary) FROM employees ) min_sal,
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal       
FROM employees;

�ζ��κ� ���� ����
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal
FROM employees, ( SELECT MAX(salary) max_sal, --ȸ���� �ִ�޿�, �ּұ޿�, ��ձ޿��� ���̺�ó�� ���
                  MIN(salary) min_sal, 
                  ROUND(AVG(salary)) avg_sal
                  FROM employees );
--FROM ���� ����ϴ� �ζ��� �� ���� �������� �׷��Լ��� ��.��.�� alias �����ؾ� ��!!!!
 
EMPLOYEE_ID  LAST_NAME  SALARY    MAX_SAL    MIN_SAL  AVG_SAL
-------------------------------------------------------------
100          King       24000     24000      2100     6462
:            :          :         :          :        :
 
03. ����� �޴� �޿��� ȸ����ձ޿� �̻� �ִ�޿� ���Ͽ� �ش��ϴ� �������
���, ��, �޿�, �츮ȸ���ִ�޿�, �츮ȸ���ּұ޿�, �츮ȸ����ձ޿�

��Į�� ���� ����
SELECT employee_id, last_name, salary, 
       ( SELECT MAX(salary) FROM employees ) max_sal,
       ( SELECT MIN(salary) FROM employees ) min_sal,
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal
FROM employees
WHERE salary BETWEEN ( SELECT ROUND(AVG(salary)) FROM employees ) 
             AND     ( SELECT MAX(salary) FROM employees );       

�ζ��� �� ���� ����
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal
FROM employees, ( SELECT MAX(salary) max_sal, 
                         MIN(salary) min_sal,
                         ROUND(AVG(salary)) avg_sal 
                  FROM employees )
                --FROM ���� ����ϴ� �ζ��� �� ���� �������� �׷��Լ��� ��.��.�� alias �����ؾ� ��!!!!
                --�μ��� �ִ�޿�, �ּұ޿�, ��ձ޿��� ���̺�ó�� ���
WHERE salary BETWEEN avg_sal AND max_sal;
                -- �� �� ��ձ޿��� �ִ�޿� ���̸� ������. 

04. �� �μ����� ���� ���� �޿��� �޴� �������
���, ��, �μ��ڵ�, �޿� ��ȸ

�� �μ����� ���� ���� �޿�
SELECT department_id, MAX(salary) max_sal
FROM employees 
GROUP BY department_id;

�����÷� ���� ����
SELECT employee_id, last_name, department_id, salary
FROM employees
WHERE (NVL(department_id, 0), salary) IN ( SELECT NVL(department_id, 0), MAX(salary) 
                                           FROM employees 
                                           GROUP BY department_id )
ORDER BY 3;

�ζ��� �� ���� ����
SELECT employee_id, last_name, e.department_id, salary
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id, 0) = NVL(m.department_id, 0)
AND e.salary = m.max_sal
ORDER BY 3;

05. �츮ȸ�� ������� �޿������� ������ ���̺��� �ִ�.
���, ��, �μ��ڵ�, �޿�, �μ�����, �μ��ִ�޿�, �μ��ּұ޿�, �μ���ձ޿� ��ȸ

�ζ��� �� ���� ����
SELECT employee_id, last_name, e.department_id, salary,
       cnt, max_sal, min_sal, avg_sal
FROM employees e, ( SELECT  COUNT(*) cnt, 
                            MAX(salary) max_sal, 
                            MIN(salary) min_sal, 
                            ROUND(AVG(salary)) avg_sal,
                            department_id
                    FROM employees
                    GROUP BY department_id ) d
WHERE NVL(e.department_id, 0) = NVL(d.department_id, 0);

