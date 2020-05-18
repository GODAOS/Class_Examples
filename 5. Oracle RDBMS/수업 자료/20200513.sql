04. �ٹ����� �����ڵ尡 UK(��, country_id�� UK)�� ���� �ִ� �μ��� 
�μ��ڵ�, ��ġ�ڵ�, �μ��� ��ȸ

�ٹ����� �����ڵ尡 UK �� ���� �ִ� �μ�
SELECT location_id --����� ������ 2400, 2500, 2600
FROM locations 
WHERE LOWER(country_id) = 'uk';  

�Ϲ�����
SELECT d.department_id, d.location_id, d.department_name
FROM departments d, locations l
WHERE d.location_id =  l.location_id
AND LOWER(l.country_id)='uk';   

����(���)�� ��������
SELECT department_id, location_id, department_name
FROM departments
WHERE location_id IN ( SELECT location_id
                       FROM locations 
                       WHERE LOWER(country_id) = 'uk' );
--WHERE location_id  = (�ٹ����� �����ڵ尡 UK �� ���� �ִ� �μ�);
   
05. ���� ��ҹ��� �����ϰ� z �� ���Ե� ���� ���� ������ ���� �μ��� ���� 
������� ���, ����, �μ��ڵ�, �����ڵ� ��ȸ

-----------------------------------------------------------------------------------------------
�ڡڡڡں�. ���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� 
���, ����, �μ��ڵ�, �����ڵ� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, job_id
FROM employees
WHERE LOWER(last_name) LIKE '%z%'; --���� ��ҹ��� �����ϰ� z�� �ִ� ��;
-----------------------------------------------------------------------------------------------

���� ��ҹ��� �����ϰ� z �� ���Ե� ����� ���� �μ�
SELECT department_id, last_name --�μ��� 60, 80, 110
FROM employees
WHERE LOWER(last_name) LIKE '%z%';

SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, job_id
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM employees
                         WHERE LOWER(last_name) LIKE '%z%' );
--WHERE department_id = --���� ��ҹ��� �����ϰ� z �� ���Ե� ����� ���� �μ��� ����


06. 60�� �μ������ ���� �޿��� �޴� ������� 
������� ���, ��, �޿�, �μ��ڵ� ��ȸ

60�� �μ��� �޿�
SELECT salary --����� ������ : 9000, 6000, 4800, 4200
FROM employees 
WHERE department_id = 60;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT salary 
                  FROM employees 
                  WHERE department_id = 60 );

07. 60�� �μ��� ������ �����鼭
60�� �μ������ ���� �޿��� �޴� ������� 
���, ��, �޿�, �μ��ڵ� ��ȸ
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT salary 
                  FROM employees 
                  WHERE department_id = 60 )
AND department_id != 60;
--AND department_id <> 60;
--AND department_id NOT IN(60);

08. �츮ȸ�� ����� �� �μ����� Marketing�̰ų� IT�� ���� �������
���, ��, �μ��ڵ� ��ȸ

�μ����� Marketing�̰ų� IT�� ����� �μ��ڵ�
SELECT department_id --20, 60
FROM departments 
WHERE department_name IN ('Marketing', 'IT');
                         
SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM departments 
                         WHERE department_name IN ('Marketing', 'IT') );
-----------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------
3. �����÷� �������� - ���������� ����÷��� ���� �÷��� ���
- �����÷��� pair �� ���·� ���Ѵ�.
https://data-make.tistory.com/25

-----------------------------------------------------------------------------------------------
�μ����� ���� ���� �޿��� �޴� ����� 
�μ��ڵ�, �ִ�޿��� ��ȸ.
SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id
ORDER BY 1;
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
�μ����� ���� ���� �޿��� �޴� ����� 
���, ����, �μ��ڵ�, �ִ�޿�, �����ڵ� ��ȸ  

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, MAX(salary), job_id
FROM employees
--WHERE
GROUP BY employee_id, first_name, last_name, department_id, job_id --xxxx
--HAVING
ORDER BY 3;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
�μ����� ���� ���� �޿��� �޴� ����� 
--���������� ������� �μ�, �ִ�޿��̹Ƿ� �����÷���������, 
--�׷���, IN ������ ���
���, ����, �μ��ڵ�, �޿�, �����ڵ� ��ȸ  


�����÷� �������� xxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, --����� �ణ �̻�
       department_id, salary, job_id
FROM employees
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         GROUP BY department_id )
AND salary IN ( SELECT MAX(salary)
                FROM employees
                GROUP BY department_id )
ORDER BY department_id;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

�����÷� �������� �ۡۡۡۡۡ�
�ۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡ�
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary, job_id
FROM employees
WHERE ( department_id, salary ) IN ( SELECT department_id, MAX(salary) --�����÷� ��������
                                     FROM employees 
                                     GROUP BY department_id )
ORDER BY 3;


SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary, job_id
FROM employees
WHERE ( NVL(department_id,0), salary ) IN ( SELECT NVL(department_id,0), MAX(salary) --�����÷� ��������
                                            FROM employees 
                                            GROUP BY department_id )
ORDER BY 3;
�ۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡ�
-----------------------------------------------------------------------------------------------
�� �μ����� ���� ���� �޿��� �޴� ����� 
���, ����, �μ��ڵ�, �޿�, �����ڵ� ��ȸ 

�ζ��� �� �������� �� �׷��Լ� �ݵ�� alias  --�μ��� �ִ�޿��� ���̺�ó�� ���
SELECT employee_id, first_name || ' ' || last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE e.department_id = m.department_id
AND e.salary = m.max_sal --�� max_sal : alias�Ѱ�
ORDER BY 3;

-----------------------------------------------------------------------------------------------
EMPLOYEE_ID NAME                DEPARTMENT_ID   SALARY      JOB_ID    
-----------------------------------------------------------------------------------------------
200	        Jennifer Whalen     10	             4400	    AD_ASST
201	        Michael Hartstein	20	            13000	    MK_MAN
114	        Den Raphaely	    30	            11000	    PU_MAN
203	        Susan Mavris	    40	             6500	    HR_REP
121	        Adam Fripp	        50	             8200	    ST_MAN
103	        Alexander Hunold	60	             9000	    IT_PROG
204	        Hermann Baer	    70	            10000	    PR_REP
145	        John Russell	    80	            14000	    SA_MAN
100	        Steven King	        90	            24000	    AD_PRES
108	        Nancy Greenberg	   100	            12008	    FI_MGR
205	        Shelley Higgins	   110	            12008	    AC_MGR
178	        Kimberely Grant	   (null)            7000	    SA_REP    

12�� ���� ���õǾ����ϴ�. 
-----------------------------------------------------------------------------------------------

�� �μ��� �ֱٿ� �Ի��� ������� --���������� ������� �μ���, �ֱ� �Ի�
���, ��, �μ��ڵ�, �Ի����� ��ȸ

�μ��� �ֱ��Ի�����
SELECT department_id, MAX(hire_date)
FROM employees
GROUP BY department_id;

SELECT employee_id, last_name, department_id, hire_date
FROM employees
WHERE (department_id, hire_date) IN ( SELECT department_id, MAX(hire_date) 
                                      FROM employees 
                                      GROUP BY department_id )
ORDER BY 4;

�Ŵ����� ���� �μ���
�μ��ڵ�, �μ����� ��ȸ

�Ϲ�����
SELECT e.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id IS NULL;

����(���)�� ��������
SELECT department_id, department_name 
FROM departments
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         WHERE manager_id IS NULL );
�����÷� ��������
SELECT department_id, department_name 
FROM departments
WHERE ( department_id, manager_id ) --��  
IN ( SELECT department_id, employee_id --�� ���������� ������� �μ��ڵ�, ���
     FROM employees
     WHERE manager_id IS NULL );

DEPARTMENT_ID   DEPARTMENT_NAME               
------------- ------------------------------
90              Executive        

SELECT department_id, employee_id
FROM employees
WHERE manager_id IS NULL; 

DEPARTMENT_ID   EMPLOYEE_ID
------------- -----------
90               100

�Ŵ����� ���� ���(��, ����, employee_id�� 100)�� �Ŵ����� �ִ�
�μ��ڵ�, �μ����� ��ȸ
SELECT DISTINCT(e.department_id), d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.manager_id IN ( SELECT employee_id
                      FROm employees
                      WHERE manager_id IS NULL )
ORDER BY 1;
                      
DEPARTMENT_ID DEPARTMENT_NAME               
------------- ------------------------------
           20 Marketing                     
           30 Purchasing                    
           50 Shipping                      
           80 Sales                         
           90 Executive 
