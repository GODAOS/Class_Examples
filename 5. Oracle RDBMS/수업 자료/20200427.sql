--[�������� 3-3]
--1. ������̺��� 30�� �μ��� ���, ����, �޿�, �ٹ�������, �ٹ������ ��ȸ
--��, �ٹ��������� ���� ��¥�� �������� ��¥�Լ��� ���

SELECT  employee_id, first_name||' '||last_name name, salary, 
        FLOOR(MONTHS_BETWEEN(SYSDATE,hire_date)) work_months,
        FLOOR(MONTHS_BETWEEN(SYSDATE,hire_date)/12) work_years
FROM employees
WHERE department_id = 30;

--2. �޿��� 12000 �̻��� ������� ���, ����, �޿��� ��ȸ�Ͽ�
--�޿������� �����Ѵ�.
--�޿��� ������� õ���� ��ȣ�� ����Ͽ� ǥ���Ѵ�.

SELECT  employee_id, first_name||' '||last_name name, 
        TO_CHAR(salary, '9,999,999') salary
FROM EMPLOYEES
WHERE salary >= 12000
ORDER BY salary ASC;

--3. 2005�� ��(2004�����)�� �Ի��� ������� 
--���, ����, �Ի�����, �Ի����� ������ ��ȸ�Ͽ� 
--�ֱٿ� �Ի��� ��������� �����Ѵ�.

SELECT  employee_id, first_name||' '||last_name name, 
        hire_date, to_char(hire_date,'DAY') hire_day
FROM EMPLOYEES
--WHERE hire_date <='2004-12-31'
--WHERE hire_date <= TO_DATE('2004-12-31')
--WHERE TO_CHAR(hire_date,'RRRR') < 2005
WHERE TO_CHAR(hire_date,'YYYY') < 2005
ORDER BY hire_date DESC;

-----------------------------------------------------------------------------------------------

* �Ϲ��Լ� : NULL �� ���Ǿ��� ��� ���� NULL �� ������ �Ǿ� ����

commission_pct Ȯ��
SELECT employee_id, first_name, salary, commission_pct
FROM employees;

Ŀ�̼Ǳݾ��� 1000 �̸��� ����� ���, �̸�, �޿�, Ŀ�̼ǿ���, Ŀ�̼Ǳݾ��� ��ȸ
SELECT employee_id, first_name, salary, commission_pct, salary*commission_pct comm
FROM employees
WHERE salary*commission_pct < 1000;

��ȸ�� NULL ���� ġȯ�ϴ� �Լ� : NVL(Null VaLue)�Լ�, DECODE �Լ�
NVL(�÷�,0) : ���� NULL �̸� 0���� ġȯ, �ƴϸ� �÷��� ��
DECODE(�÷�, A, 1, B, 2, 3) : �÷����� A�̸� 1, B�̸� 2, �װ͵� �ƴϸ� 3

1. �����Ͱ��� NULL �� ��� �ٸ� ������ ��ü�Ͽ� ��ȯ�ϴ� �Լ�
: NVL(���, NULL �϶� ��ȯ ǥ��) �� NULL VALUE, ����Ŭ������ ���
  NULL �϶� ��ȯ ǥ���� ������ Ÿ���� ����� ������ Ÿ�԰� ���ƾ� �Ѵ�.

desc employees;

Ŀ�̼� �ݾ��� 1000 �̸���
���, ��, �޿�, Ŀ�̼ǿ���, Ŀ�̼Ǳݾ� ��ȸ
Ŀ�̼Ǳݾ� = �޿� * Ŀ�̼ǿ���
SELECT employee_id, last_name, salary, commission_pct, salary*commission_pct comm
FROM employees
WHERE salary*commission_pct < 1000;

NVL ���
SELECT employee_id, last_name, salary, commission_pct, salary*NVL(commission_pct,0) comm
FROM employees
WHERE salary*NVL(commission_pct,0) < 1000;
     
���, ��, �޿�, Ŀ�̼ǿ���, �ѱ޿� ��ȸ
�ѱ޿� = �޿� + Ŀ�̼Ǳݾ� 

--SELECT employee_id, last_name, commission_pct, salary + salary * NVL(commission_pct,0)
SELECT  employee_id, last_name, commission_pct, 
        salary * (1 + NVL(commission_pct,0))
FROM employees;

2. ������ ���� NULL �� ��� ��ȯ ǥ���� 
NULL �� �ƴ� ��� ��ȯ ǥ���� ���� ������ �� �ִ� ������ �Լ�
: NVL2(���, NULL�� �ƴ� ��� ��ȯ��, NULL �� ��� ��ȯ��)
: NVL2(���, ����� ���� ���� ��� ��ȯ��, ���� ���� ��� ��ȯ��) �ڡڡڡ�
  NULL �� ��� ��ȯǥ���� NULL �ƴ� ��� ��ȯǥ���� ������ Ÿ���� ���ƾ� �Ѵ�.
  NULL �� ��� ��ȯ Ÿ�� = NULL �ƴ� ��� ��ȯ Ÿ��

Ŀ�̼��� �޴� ����� �ѱ޿� = �޿� + Ŀ�̼Ǳݾ�
         ���� �ʴ� ����� �ѱ޿� = �޿���

���, ��, �޿�, Ŀ�̼ǿ���, �ѱ޿� ���� ��ȸ
SELECT employee_id, last_name, salary, commission_pct,
       NVL2(commission_pct, '�޿�+Ŀ�̼Ǳݾ�', '�޿�') type1,
       NVL2(commission_pct, 'salary+commission', 'salary') type2,
       NVL2(commission_pct, salary*(1+commission_pct), salary) type3
FROM employees;

--�޿�, Ŀ�̼ǿ���, NVL ��� �ѱ޿�, NVL2 ��� �ѱ޿� ��ȸ.
SELECT  salary, commission_pct,
        salary*(1+NVL(commission_pct,0)),
        NVL2(commission_pct,salary*(1+commission_pct),salary),
        NVL2(commission_pct,salary + salary * commission_pct, salary)
FROM employees;






SELECT salary, commission_pct, 
       salary + salary*NVL(commission_pct,0), --NVL���
       NVL2(commission_pct, salary + salary * commission_pct, salary) --NVL2���
FROM employees;


3. �����Ͱ��� NULL �� ��� ��ü�ؼ� ��ȯ ǥ���� ���� �� ������ �� �ִ� ���� �Լ�
  : NULL �� �ƴ� ù��° �����͸� ��ȯ�ϴ� �Լ�
 COALESCE(���ǥ��, ��üǥ��1, ��üǥ��2, ��üǥ��3, ...) 
    �� COALESCE : ��ġ��, �����ϴ�, ��ü�ϴ�, �յ��ϴ�
 NULL �� NULL �Ǵ� ''�� ǥ��
 
SELECT COALESCE('a', '', NULL, 'd') n1,
       COALESCE(NULL, 'b', NULL, 'd') n2, 
       COALESCE(NULL, '', 'c', 'd') n3,
       COALESCE(NULL, '', NULL, 'd') n4,
       COALESCE(NULL, '', NULL, '') n5
FROM dual;
----------------------------------------------------------
name    �޴���            ��                �繫��
ȫ�浿  010-1234-5678
��û                      062-1234-5678
����ġ                                      062-1234-5679

SELECT name, COALESCE(�޴���, ��, �繫��)  ����ó
FROM dual;

���
NAME       ����ó
ȫ�浿     010-1234-4567
��û       062-1234-5678
����ġ     062-1234-5679
----------------------------------------------------------

[�������� 3-4]
���, ��, �μ��ڵ�, �����ڵ�, �Ի�����, �Ŵ����ڵ�, �Ŵ������翩��(NVL, NVL2 ���� ���) ��ȸ
�Ŵ������翩�δ� �� ����� ���� 

NVL�� �����ڰ� ������ manager_id�� ������ �������� ǥ��,
NVL2��
����� ������(�Ŵ���)�� ������ '����' ����
       ������(�Ŵ���)�� ������ '����' ���� ��ȸ�ǰ� �Ѵ�.


SELECT  employee_id, last_name, department_id, job_id, hire_date, manager_id,
        NVL(manager_id,0) manager_id2,
        --NVL(manager_id,'����') manager_id2, --����, ������ Ÿ���� NUMBER(6,0)
        NVL2(manager_id, '����', '����')  manager_exist1,
        NVL2(manager_id, 'Manager', 'No Manager')  manager_exist2
FROM employees;

SELECT employee_id, 
       NVL(manager_id, 0) manager_id,
       NVL2(manager_id, 'O', 'X') exist
FROM employees;

desc employees;

3.6 DECODE �� CASE

1. ���ǹ��� �ش��ϴ� �Լ�
IF ( ���ǽ�1 ) {
 ....
} ELSE IF( ���ǽ�2 ) {
 .....
} ELSE IF( ���ǽ�3 ) {
 .....
} ELSE {
 ....
}

�μ����� ���ʽ��� �����ϱ�� �ߴ�.

�μ��ڵ尡 10 �̸� �޿��� 10%,
           20 �̸� �޿��� 20%,
           30 �̸� �޿��� 30%,
           ������ �μ����� �޿��� 5%
         
IF( �μ��ڵ� == 10 ) {
  ���ʽ� = �޿�*0.1;
} ELSE IF( �μ��ڵ� == 20 ) {
  ���ʽ� = �޿�*0.2;
} ELSE IF( �μ��ڵ� == 30 ) {
  ���ʽ� = �޿�*0.3;
} ELSE {
  ���ʽ� = �޿�*0.05;
}

���ǹ��� �ش��ϴ� �Լ� : DECODE : ����Ŭ������ ���
���ǥ���� �񱳵�����ǥ���� ������������ ��ġ�ؾ���.
: DECODE(���ǥ��,  �񱳵�����ǥ��1, ��ȯ������1, 
                    �񱳵�����ǥ��2, ��ȯ������2,
                    �񱳵�����ǥ��3, ��ȯ������3, default��ȯ������)

���, ��, �μ��ڵ�, �޿�, ���ʽ� ��ȸ
���ʽ��� 
�μ��ڵ尡 10 �̸� �޿��� 10%,
           20 �̸� �޿��� 20%,
           30 �̸� �޿��� 30%,
           ������ �μ����� �޿��� 5%
SELECT employee_id, last_name, department_id, salary, 
       DECODE(department_id, 10, salary*0.1, 
                             20, salary*0.2, 
                             30, salary*0.3, salary*0.05 ) bonus
FROM employees;       

SELECT employee_id, last_name, department_id, salary, 
       CASE department_id WHEN 10 THEN salary * 0.1
                          WHEN 20 THEN salary * 0.2
                          WHEN 30 THEN salary * 0.3
                          ELSE salary * 0.05                
       END bonus
FROM employees;

SELECT employee_id, last_name, department_id, salary, 
       CASE WHEN department_id = 10 THEN salary * 0.1
            WHEN department_id = 20 THEN salary * 0.2
            WHEN department_id = 30 THEN salary * 0.3
            ELSE salary * 0.05                
       END bonus
FROM employees;

������� ���, ��, �����ڵ�, ������� ��ȸ
��������� �����ڵ忡 ���� �з��Ѵ�.

�����ڵ�     �������
AD_PRES      A
ST_MAN       B
IT_PROG      C
�� ��        X

SELECT employee_id, last_name, job_id, 
       DECODE( job_id, 'AD_PRES', 'A', 
                       'ST_MAN', 'B', 
                       'IT_PROG', 'C',
                       'X' ) job_grade                     
FROM employees;

SELECT employee_id, last_name, job_id, 
       CASE job_id  WHEN 'AD_PRES' THEN 'A' 
                    WHEN 'ST_MAN' THEN 'B'
                    WHEN 'IT_PROG' THEN 'C' 
                    ELSE 'X' 
       END job_grade
FROM employees;

SELECT employee_id, last_name, job_id, 
       CASE WHEN job_id = 'AD_PRES' THEN 'A' 
            WHEN job_id = 'ST_MAN' THEN 'B'
            WHEN job_id = 'IT_PROG' THEN 'C' 
            ELSE 'X' 
       END job_grade
FROM employees;

���ǹ��� �ش��ϴ� ����: CASE ~ END
CASE�� DECODE �Լ����� �� ū ������ ���� ǥ�����̴�.
DECODE ������ �� ����񱳸� �� �� ������ 
CASE�� �� �پ��� �� �񱳿����� �� �� �ִ�.

����񱳽� ǥ��
CASE ���ǥ�� WHEN �񱳵����Ͱ�1 THEN ��ȯ������1
              WHEN �񱳵����Ͱ�2 THEN ��ȯ������2
              WHEN �񱳵����Ͱ�3 THEN ��ȯ������3
              ....
              ELSE default��ȯ������
END

���, ��, �μ��ڵ�, �޿�, ���ʽ�
SELECT employee_id, last_name, department_id, salary,
       CASE department_id WHEN 10 THEN salary*0.1 
                          WHEN 20 THEN salary*0.2
                          WHEN 30 THEN salary*0.3 
                          ELSE salary*0.05 
       END bonus
FROM employees;

SELECT employee_id, last_name, department_id, salary,
       CASE WHEN department_id = 10 THEN salary*0.1 
            WHEN department_id = 20 THEN salary*0.2
            WHEN department_id = 30 THEN salary*0.3 
            ELSE salary*0.05 
       END bonus
FROM employees;

����񱳽� ǥ��: 
���� ���ǿ� ���� �����͸� ��ȯ�ϴ� ����� CASE ����

-----------------------------------------------------------------------------------------------
CASE WHEN ���ǽ�1 THEN ��ȯ������1
     WHEN ���ǽ�2 THEN ��ȯ������2
     WHEN ���ǽ�3 THEN ��ȯ������3
     ELSE default��ȯ������
END      
-----------------------------------------------------------------------------------------------

�μ��ڵ尡 10~30 �̸� �޿��� 10%
           40~60 �̸� �޿��� 20%
           70~100 �̸� �޿��� 30%
           �׿� �μ����� �޿��� 5%

���, ��, �μ��ڵ�, �޿�, ���ʽ� ��ȸ
SELECT employee_id, last_name, department_id, salary,
        -- ���� ������ �� 
       CASE WHEN department_id BETWEEN 10 AND 30 THEN salary*0.1
            WHEN department_id BETWEEN 40 AND 60 THEN salary*0.2
            WHEN department_id BETWEEN 70 AND 100 THEN salary*0.3
            ELSE salary*0.05 
        END bonus1,
        CASE WHEN department_id <=30 THEN salary*0.1
             WHEN department_id <=60 THEN salary*0.2
             WHEN department_id <=100 THEN salary*0.3 
             ELSE salary*0.05 
        END bonus2    
FROM employees;

-----------------------------------------------------------------------------------------------
���ʽ��� 
�μ��ڵ尡 20���� �̸�  �޿��� 30%
�޿��� 10000 �̻��̸� �޿��� 20%
�����ڵ尡 clerk ������ �����̸� �޿��� 10% 
�׿ܴ� �޿��� 5%
���, ��, �μ��ڵ�, �޿�, �����ڵ�, ���ʽ� ��ȸ
SELECT employee_id, last_name, department_id, salary, job_id,
      CASE 
           WHEN department_id <= 20 THEN salary*0.3
           WHEN salary>=10000 THEN salary*0.2
           WHEN LOWER(job_id) LIKE '%clerk%' THEN salary*0.1 
           ELSE salary*0.05
      END bonus
FROM employees;
-----------------------------------------------------------------------------------------------
[�������� 3-5]
1. ������� ���, �̸�, �����ڵ�, ������� ��ȸ
��������� �����ڵ忡 ���� �з��Ѵ�.
DECODE �� CASE~END ����Ͽ� ��ȸ

�����ڵ�    �������
AD_PRES      A
ST_MAN       B
IT_PROG      C
SA_REP       D
ST_CLERK     E
�� ��        X

SELECT employee_id, last_name, job_id,
       DECODE(job_id, 'AD_PRES','A',
                      'ST_MAN','B',
                      'IT_PROG','C',
                      'SA_REP','D',
                      'ST_CLERK','E',
                      'X') job_grade
FROM employees;
 
SELECT employee_id, last_name, job_id, 
        CASE 
            WHEN job_id = 'AD_PRES' THEN 'A' 
            WHEN job_id = 'ST_MAN' THEN 'B'
            WHEN job_id = 'IT_PROG' THEN 'C' 
            WHEN job_id = 'SA_REP' THEN 'D' 
            WHEN job_id = 'ST_CLERK' THEN 'E' 
            ELSE 'X' 
        END job_grade
FROM employees;


SELECT employee_id, last_name, job_id, 
        CASE job_id WHEN 'AD_PRES' THEN 'A' 
                    WHEN 'ST_MAN' THEN 'B'
                    WHEN 'IT_PROG' THEN 'C' 
                    WHEN 'SA_REP' THEN 'D' 
                    WHEN 'ST_CLERK' THEN 'E' 
                    ELSE 'X' 
        END job_grade
FROM employees;

-----------------------------------------------------------------------------------------------

2. ��� ����� �� ������� �ٹ����, �ټӻ��¸� �ľ��ϰ��� �Ѵ�.
������� ���, ��, �Ի�����, �ٹ����, �ټӻ��� ��ȸ
�ٹ������ ������ �������� �ٹ��� ����� ������ ǥ���Ѵ�.
�ټӻ��´� �ٹ������ ���� ǥ���Ѵ�.
�ٹ������ 13�� �̸� �̸�              '13�� �̸� �ټ�'���� ǥ��
           13�� �̻� 15�� �̸� �̸�    '15�� �̸� �ټ�'���� ǥ��
           15�� �̻� �̸�              '15�� �̻� �ټ�'���� ǥ��    
               
SELECT  employee_id, last_name, hire_date,
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years,
        
        CASE
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 13 THEN '13�� �̸� �ټ�'
--            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) >= 13 
--                 AND TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 15 THEN '15�� �̸� �ټ�' 
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) BETWEEN 13 AND 15 THEN '15�� �̸� �ټ�' 
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) >=15 THEN '15�� �̻� �ټ�' 
        END work_status1,
       
        CASE 
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 13 THEN '13�� �̸� �ټ�'
            WHEN TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) < 15 THEN '15�� �̸� �ټ�' 
            ELSE  '15�� �̻� �ټ�' 
        END work_status2       
FROM employees;

-----------------------------------------------------------------------------------------------









