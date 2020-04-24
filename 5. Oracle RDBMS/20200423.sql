--NULL�� �������������� ������ ������ ����, ���������� ���� �켱 ������ ����
--���������� ���� ���� ��ġ�ϰ� �Ϸ��� NULLS FIRST �ɼ��� ����
--���������� ���� �������� ��ġ�ϰ� �Ϸ��� DESC NULLS LAST �ɼ��� ����

--���� 1
SELECT *
FROM locations
--ORDER BY state_province;
--ORDER BY state_province DESC;
--ORDER BY state_province NULLS FIRST;
ORDER BY state_province DESC NULLS LAST;

--[���� ���� 1]
--1. �μ��ڵ� 30, 40, 60�� �μ��� ���� �������
--���, ����, �μ��ڵ�, �޿��� ��ȸ�Ͽ� ��������� �����Ѵ�.
SELECT employee_id, first_name ||' '||last_name AS name, department_id, salary
FROM employees
WHERE department_id IN (30, 40, 60)
ORDER BY name;

--2. Ŀ�̼��� �޴� ������� ���, ����, �޿�, Ŀ�̼ǿ����� ��ȸ�Ͽ�
--Ŀ�̼ǿ����� ���� ������� ���� ��������� �����Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct DESC;

--3. ���� ��/�ҹ��� �����ϰ� z �� �ִ� �������
--���, ���� �� ��ȸ�Ͽ� ��������� �����Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name
FROM employees
--WHERE LOWER(first_name || last_name) LIKE '%z%'
--WHERE UPPER(first_name || last_name) LIKE '%Z%'
WHERE first_name || last_name LIKE '%z%'
OR first_name || last_name LIKE '%Z%'
ORDER BY name;
--ORDER BY first_name ||' '|| last_name;
--ORDER BY 2;

--[�������� 2]
--1. ����� 200�� ����� ����� �μ��ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, department_id
FROM employees
WHERE employee_id = 200;

--2. �޿��� 3000���� 15000 ���̿� ���Ե��� �ʴ� ����� ���, ����, �޿� ������ ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--(��, �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���ļ� ��ȸ�Ѵ�. 
--���� ��� �̸��� John �̰� ���� Seo �̸�  John Seo �� ��ȸ�ǵ��� �Ѵ�.)
SELECT employee_id, first_name ||' '|| last_name AS name, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 15000;

--3. �μ��ڵ� 30�� 60 �� �Ҽӵ� ����� ���, ����, �μ��ڵ�, �޿��� ��ȸ�ϴµ�, 
--������ ���ĺ������� �����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, department_id, salary
FROM employees
WHERE department_id IN(30, 60)
ORDER BY name ASC;

--4. �޿��� 3000���� 15000 ���� �̸鼭, �μ��ڵ� 30�Ǵ� 60�� �Ҽӵ� ����� 
--���, ����, �޿�, �μ� �ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--(��, ��ȸ�Ǵ� �÷����� �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���� name ����,
--�޿��� Monthly Salary �� ��ȸ�ǵ��� �Ѵ�.)
SELECT employee_id, first_name ||' '|| last_name AS name, salary AS "Monthly Salary", department_id
FROM employees
WHERE salary BETWEEN 3000 AND 15000
AND department_id IN (30, 60);

--5. �Ҽӵ� �μ��ڵ尡 ���� ����� ���, ����, �����ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, job_id
FROM employees
WHERE department_id IS NULL;

--6. Ŀ�̼��� �޴� ����� ���, ����, �޿�, Ŀ�̼��� ��ȸ�ϴµ�, 
--Ŀ�̼��� ���� ������� ���� ��� ������ �����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct DESC;

--7. ���� ��ҹ��� ���о��� ���� z �Ǵ� Z �� ���Ե� ����� ����� ����(name)�� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name ||' '|| last_name AS name
FROM employees
WHERE LOWER(first_name || last_name) LIKE '%z%';


--3��. �⺻ �Լ� : ���� �Լ�, ���� �Լ�, ��¥ �Լ�, ����ȯ �Լ�, �Ϲ� �Լ�

--�Լ��� ���� : ������ �Լ�, ������(������) �Լ�
--�Լ��� ����ϴ� �Ķ���Ϳ� ��ȯ�Ǵ� ���� ������ ���� �Լ��� ����
--���� �� �Լ� : �ϳ��� �������࿡ ���� �ϳ��� ����� ��ȯ�ϴ� ������ �Լ�
--���� �Լ� : ROUND, TRUNC, CEIL, FLOOR
--���� �Լ� : UPPER, LOWER, TRIM, LTRIM/RTRIM, LPAD/RPAD,
--           SUBSTR, INSTR, REPLACE, TRANSLATE
--��¥ �Լ� : SYSDATE, MONTHS_BETWEEN, ADD_MONTHS, LAST_DAY
--����ȯ �Լ� : TO_CHAR, TO_NUMBER, TO_DATE
--�Ϲ� �Լ� : NVL, NVL2, COALESCE, DECODE, CASE~END

--������ �׽�Ʈ�� ���� ���̺� : dummy table �� dual, ������ �����ʹ� �� ���� ����.

--3.1 ���� �Լ�
--ABS(n) : n�� ���밪�� ��ȯ�ϴ� �Լ��̴�.
SELECT ABS(32), ABS(-32)
FROM dual;

--SIGN(n) : n�� ������� ���������� ���θ� ��ȯ�ϴ� �Լ��̴�.
--n�� ����̸� 1��, �����̸� -1��, 0�̸� 0�� ��ȯ�Ѵ�.
SELECT SIGN(32), SIGN(-32), SIGN(0)
FROM dual;

--1) �ݿø� �Լ� : ROUND(n, [, i]), ROUND(����, �Ҽ� ����/�̻� �ڸ���)
--�Ҽ�����/�̻� �ڸ��� : ���� ���� ����, ������ default�� 0 �� ������ ǥ��
--�Ҽ� ��°�ڸ����� ǥ�� : ROUND(1234.56789, 2) �� 1234.57
SELECT ROUND(1234.56789, 2) r1,     -- 1234.57
       ROUND(1234.56789, 0) r2,     -- 1235
       ROUND(56789.32154, -2) r3,   -- 56800, -2�� 0�� 2�� �پ��ٴ� ������ �����ϸ� ���ϴ�.
       ROUND(1234.56789) r4         -- 1235
FROM dual;       

--2) ������ ���� �Լ� : TRUNC(n [, i]), TRUNC(����, �Ҽ� ����/�̻� �ڸ���)
--�Ҽ� ����/�̻� �ڸ��� : ���� ���� ����, ������ default�� 0 �� ������ ǥ��
SELECT TRUNC(1234.56789, 2) t1,     --1234.56
       TRUNC(1234.56789, 0) t2,     --1234
       TRUNC(56789.32154, -2) t3,   --56700
       TRUNC(1234.56789) t4         --1234
FROM dual;       

--3) ������ �ø��ϴ� �Լ� : CEIL(n) - ������ �ø��� ����
--�Խ��ǿ��� ������ ���� ��, �������� 10���� ��½�
--0 ~ 1 ���̿��� ������ ���� �Ǽ�
--0.9999999999999999 �� 1
--0.00000000000000000000001 �� 1

--4) ������ �����ϴ� �Լ� : FLOOR(n) - ������ ������ ����
--0 ~ 1 ���̿��� ������ ���� �Ǽ�
--0.9999999999999999 �� 0
--0.00000000000000000000001 �� 0
SELECT CEIL(12.00000001) c1,    --13
       FLOOR(12.999999999) f1  --12
FROM dual;

--���� �����͸� ǥ���� �� �ִ� �Լ� : ROUND, TRUNC, CEIL, FLOOR
--�Ҽ��� �����͸� ǥ���� �� �ִ� �Լ� : ROUND, TRUNC
--���� �����͸� ǥ���� �� �ִ� �Լ� : CEIL, FLOOR, ROUND/TRUNC(�ι�° �Ķ���Ͱ� 0)

--5) ������ ��ȯ �Լ� : MOD(m, n), MOD(������, ����)
SELECT MOD(17, 4) m1,   -- 1
       MOD(17, -4) m2,  -- 1
       MOD(-17, 4) m3,  -- -1
       MOD(-17, -4) m4,  -- 1
       MOD(17, 0) m5    -- 17
FROM dual;       

--[�������� 3]
--employees ���̺��� �츮 ȸ�� ����� �� �μ� �ڵ尡 100, 110�� �μ��� ���� �������
--���, ����, �޿�, �μ� �ڵ�, 15% �λ�� �޿� ��ȸ - �λ�� �޿��� ������ ǥ��
SELECT employee_id, first_name ||' '|| last_name AS name, salary, department_id AS dept_id,
       ROUND(salary*1.15, 0) AS "Increased Salary ROUND",
       TRUNC(salary*1.15, 0) AS "Increased Salary TRUNC",
       CEIL(salary*1.15) AS "Increased Salary CEIL",
       FLOOR(salary*1.15) AS "Increased Salary FLOOR"
FROM employees
WHERE department_id IN (100, 110);

--3.2 ���� �Լ�
--1. ��/�ҹ��� ��ȯ �Լ� : UPPER/LOWER(����)

--���� 1. ���� King�� ������� ���, ��, ��, ��ȸ
SELECT employee_id, last_name, first_name
FROM employees
--WHERE UPPER(last_name) = 'KING'
WHERE LOWER(last_name) = 'king';

--���� 2. ���� ��ҹ��� �����ϰ� z���ִ� ������� ���, ��, �� ��ȸ
SELECT employee_id, last_name, first_name
FROM employees
WHERE UPPER(last_name) LIKE '%Z%';
--WHERE LOWER(last_name) LIKE '%z%'

--2. �ܾ� ������ ù ���ڴ� �빮��, �������� �ҹ���ȭ �ϴ� �Լ�: INITCAP(���) : �̴ϼȸ� �빮�ڷ� ��ȯ
SELECT INITCAP('we are studying oracle') title1,
       INITCAP('WE ARE STUDYING ORACLE') title2,
       INITCAP('wE aRE sTUDYING oRACLE') title3
FROM dual;

--���� 2
SELECT email, INITCAP(email),
       first_name, UPPER(first_name), LOWER(first_name)
FROM employees;

--3. ���� ������(char1)�� Ư�� ����(char2)�� ä���� ��ȯ�ϴ� �Լ�
--LPAD/RPAD(char1, n [, char2])
--LPAD/RPAD(���, ��üũ��, ��������)
--�� ��° �Ķ������ �������� ���� ���� : default ���鹮��
SELECT LPAD('abc', 7, '?') p1,  --????abc
       RPAD('abc', 5, '#') p2,  --abc##
       '['||LPAD('abc', 5) p3,  --__abc
       RPAD('abc', 5)||']' p4  --abc__
FROM dual;

--���� 2
SELECT employee_id, LPAD(last_name, 20) last_name
--LPAD(last_name, 20, ' ')
FROM employees;

--4. ���� �����Ϳ��� Ư�� ���ڸ� �����ϰ� ��ȯ�ϴ� �Լ�
--������ ���ڴ� *�� ���� ���� ����* �� TRIM
--�Է� ���ڿ��� ����� �Ǽ��� ������ �Է½�
--request.getParameter('UserId').TRIM();

--TRIM([LEADING, TRAILING, BOTH] [, TRIM_char] [FROM] char)
--TRIM(��������ġ, ���Ź����Ѱ�, FROM �����)
--TRIM(LEADING/TRALING/BOTH ���Ź���(�ѱ���) FROM �����)
--������ ��ġ - ���� : LEADING, ������ : TRAILING, ���� : BOTH
--������ ��ġ ���� ���� - default : BOTH
--���Ź��� ���� ���� - default : ���� ����
SELECT TRIM(LEADING 'a' FROM 'aaaabcdcba') t1,
       TRIM(TRAILING 'a' FROM 'abcdcbaaaa') t2,
       TRIM(BOTH 'a' FROM 'aaabcdcbaaa') t3,
       TRIM('a' FROM 'aaabcdcbaaa') t4,
       '    abcdcba    ' t5,
       TRIM('    abcdcba    ') t6
FROM dual;

--5. ���� �����Ϳ� Ư�� ���ڸ� �����ϰ� ��ȯ�ϴ� �Լ�
--������ ���ڸ� �ڿ��� �� ���� ���ɡ� �� TRIM �Լ����� ������
--LTRIN/RTRIM(char 1 [, char2])
--LTRIM/RTRIM(�����, �����ҹ����ǳ���)
--�� ��° �Ķ���� ���� ���� - default ���� ����
SELECT LTRIM('abcdcba', 'a') t1,    --bcdcb
       LTRIM('abcdcba', 'ba') t2,   --cdcba
       RTRIM('abcdcba', 'acb') t3,  --abcd
       RTRIM('  abcdcba   ') t4     --___abcdcba
FROM dual;