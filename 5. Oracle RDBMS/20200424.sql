--6) ���ڿ����� ���ڿ��� �Ϻθ� ��ȯ(�� �� ��°���� �� ����)�ϴ� �Լ�
--SUBSTR(char, poisition [, LENGTH])
--SUBSTR(��� ����, ���� ��ġ, �� ����)
--�� ��° �Ķ����(position : ���� ��ġ)���� ���� ���� �� �����ʿ�������
--�� ��° �Ķ����(LENGTH : �� ����) ������ �� �� ���ڿ��� ������ ��ȯ

SELECT SUBSTR('You are not alone', 5, 3) s1,    --are
       SUBSTR('You are not alone', 5) s2,       --are not alone
       SUBSTR('You are not alone', -5, 3) s3,   --alo
       SUBSTR('You are not alone', -5) s4       --alone
FROM dual;

--7) ���ڿ����� Ư�� ���ڿ��� ��ġ�� �ڽ��� ��ġ�� ��ȯ�ϴ� �Լ�
--INSTR(char, search_string [, position] [, _th])
--INSTR(��� ����, ã�� ���ڿ�, ã�� ���� ��ġ, �� ��°��)
--�� ��° �Ķ���� �� ã�� ���ڿ�
--�� ��° �Ķ���� �� ���ڿ� ã�� ���� ��ġ, ���� �������� �� �����ʿ��� ���� �������� �� ���� ��� ����
--�� ��° �Ķ���� �� ���� ���� - default 1
--                      11 14 17 19
SELECT INSTR('Every sha-la-la-la-la', 'la', 1, 2)   s1,
--1�� ��ġ���� ã�� �����ؼ� 2��°�� �����ϴ� 'la' ���� ��ġ 14
       INSTR('Every sha-la-la-la-la', 'la', 12, 2)  s2, --17
       INSTR('Every sha-la-la-la-la', 'la', 12, 4)  s3, --0
       INSTR('Every sha-la-la-la-la', 'la', 12)     s4, --14
       INSTR('Every sha-la-la-la-la', 'la', -3, 2)  s5, --14
       INSTR('Every sha-la-la-la-la', 'la', -10)    s6  --11
--                    -11 -8 -5 -2
FROM dual;

--���� 1. �̸���
SELECT 'admin@naver.com'    email,
       INSTR('admin@naver.com', '@', 1, 1) AS "@_index",
       SUBSTR('admin@naver.com', 1, INSTR('admin@naver.com', '@', 1, 1) - 1)  id,
       SUBSTR('admin@naver.com', INSTR('admin@naver.com', '@', 1, 1) + 1)  servicer1,
       SUBSTR('admin@naver.com', INSTR('admin@naver.com', '@', 1, 1) + 1,
        LENGTH('admin@naver.com') - INSTR('admin@naver.com', '@', 1, 1))  servicer2
FROM dual;

--���� 2. JOBS ���̺��� ���� �ڵ�, ���� ����, ����, ��å ��ȸ
--����, ��å�� �����ڵ忡�� '_'�������� ��ȸ(����_��å)
SELECT job_id,
       job_title,
       INSTR(job_id, '_', 1, 1)  AS "'_' ��ġ",
       LENGTH(job_id) AS "���ڿ� ����",
       LENGTH(SUBSTR(job_id, INSTR(job_id, '_', 1, 1) + 1)) AS "_���� ���� ����",
       SUBSTR(job_id, 1, INSTR(job_id, '_', 1, 1) - 1) AS ����,
       SUBSTR(job_id, INSTR(job_id, '_', 1, 1) + 1, LENGTH(SUBSTR(job_id, INSTR(job_id, '_', 1, 1) + 1))) AS ��å
FROM jobs;

--���� 3. �μ� �ڵ尡 60, 80, 100�� �μ��� ���� �������
--���, ��, ��ȭ��ȣ, ������ȣ, ���ι�ȣ ��ȸ
SELECT employee_id      AS ���,
       last_name        AS ��,
       phone_number     AS ��ȭ��ȣ,
       SUBSTR(phone_number, 1, INSTR(phone_number, '.', 1, 1) - 1)         AS ������ȣ,
       SUBSTR(phone_number, INSTR(phone_number, '.', -1, 1) + 1)         AS ���ι�ȣ
FROM employees
WHERE department_id IN (60, 80, 100);

--8) ���ڿ����� Ư�� ���ڿ��� ã�� �ٸ� ���ڿ��� �ٲ� ��ȯ�ϴ� �Լ�
--REPLACE(char, search_string [, replace_string])
--REPLACE(��� ����, ã�� ���ڿ�, ��ü�� ���ڿ�)
--�� ��° �Ű� ����(�Ķ����) ��ü�� ���ڿ� ���� ���� : default - null
SELECT REPLACE('You are not alone', 'You', 'We')    rep1,   --We are not alone
       REPLACE('You are not alone', 'not')          rep2,   --You are__alone
       REPLACE('You are not alone', 'not', null)    rep3   --You are__alone
FROM dual;

--9) ���ڿ��� �ִ� Ư�� ���� �� ��ü�� �ٸ� Ư�� ���ڷ� �� �ϳ��� �����ؼ� �ٲ� ��ȯ�ϴ� �Լ�
--TRANSLATE(char, from_string, to_string)
--TRANSLATE(��� ����, ã�� ������ ����, ��ü�� ������ ����)
SELECT TRANSLATE('You are not alone', 'You', 'We')  ts1
--Y �� W / o �� e / u �� null �� We are net alene
FROM dual;

--���� 1. REPLACE ����ؼ� '�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���'�� '���� ���� �𸣴µ� ���� ���� �˰ڴ���'�� �����ϱ�
SELECT REPLACE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '��', '��'),
       REPLACE(REPLACE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '�ʴ�', '����'), '�ʸ�', '����')
FROM dual;

--���� 2. TRANSLATE ����ؼ� '�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���'�� '���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ���'�� �����ϱ�
SELECT TRANSLATE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '����', '�ʳ�'),
       TRANSLATE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ³�', '�ʳ�', '����')
FROM dual;

--[���� ����]
--���� 1. ��� ���̺��� �̸�(first_name)�� A�� �����ϴ� ��� ����� �̸��� �̸��� ���̸� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT first_name AS name,
       LENGTH(first_name) AS length
FROM employees
WHERE first_name LIKE 'A%';
--WHERE SUBSTR(first_name, 1, 1) = 'A';

--���� 2. 80�� �μ����� �̸��� �޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--��, �޿��� 15�� ���̷� ���ʿ� �� ��ȣ�� ä���� ���·� ǥ�õǵ��� �Ѵ�.
SELECT first_name, LPAD(LPAD(salary, LENGTH(salary) + 1, '$'), 15) AS Salary
FROM employees
WHERE department_id = 80;

--���� 3. 60�� �μ�, 80�� �μ�, 100�� �μ��� �Ҽӵ� ����� ���, �̸�, ��ȭ��ȣ, ��ȭ��ȣ�� ������ȣ�� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--��, ������ȣ�� Į���� Local Number��� ǥ���ϰ�, ������ȣ�� 515.124.4169���� 515�� ������ȣ�� �Ѵ�.
SELECT employee_id,
       first_name,
       phone_number,
       SUBSTR(phone_number, 1, INSTR(phone_number, '.', 1, 1) - 1) AS "Local Number",
       SUBSTR(phone_number, INSTR(phone_number, '.', -1, 1) + 1)  AS "Private Number"
FROM employees
WHERE department_id IN (60, 80, 100);


--3.3 ��¥ �Լ� : �۱�, ���, ȸ������ ��¥, ���� �ð�
--1) �ý����� ���� ��¥�� ��ȯ�ϴ� �Լ� - SYSDATE
--�ٸ� �Լ��ʹ� �޸�
SELECT SYSDATEM FROM dual;

--��¥ +/- ���� �� ��¥
--��¥ - ��¥   �� ���� 

--���� ��¥ - ���� ��¥ �� �ϼ� ����
--���ó�¥�κ��� �� �� ��
SELECT SYSDATE + 30 AS "after 1M" FROM dual;

--SYSTIMESTAMP : �и��ʱ��� ����ϴ� �Լ�
SELECT SYSTIMESTAMP FROM dual;

--2) Ư�� ��¥�κ��� �� ���� ��/���� ��¥ ��ȯ�ϴ� �Լ�
--ADD_MONTHS(��¥, ������)
--���÷κ��� 6���� ���� ��¥ ��ȸ, ���÷κ��� 3���� ���� ��¥ ��ȸ
SELECT ADD_MONTHS(SYSDATE, 6) after6M,
       ADD_MONTHS(SYSDATE, -3) before3M
FROM dual;

--3) �� ��¥ ������ �������� ���̸� ��ȯ�ϴ� �Լ�
--���� ��¥ - ���� ��¥ �� �������� ���� �� MONTH_BETWEEN(��¥1, ��¥2) �� ��¥1 > ��¥2
SELECT MONTHS_BETWEEN(SYSDATE, '20/02/20') diff1,
       TRUNC(MONTHS_BETWEEN(SYSDATE, '20/02/20'), 1) diff2
FROM dual;

--���� �����Ϻ��� ���ñ����� ���� ���� ������ �������� ���� ���� ���� �˾ƺ���.
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/02/24'), 1) AS "���� ������",
       TRUNC(MONTHS_BETWEEN('20/08/21', SYSDATE), 1) AS "���� ���� ��"
FROM dual;

--�츮 ȸ�� ��� 100���� ����� ���, ��, �Ի� ����, �ٹ� ������, �ٹ� ��� ��ȸ
--�ٹ� ������, �ٹ� ����� ������ �������� ����Ͽ� ������ ǥ��
--���� ��� ������ 2019/08/07�̰�, 2019/05/27�� �Ի��ߴٸ� 2���� �ٹ��� ��
SELECT employee_id, last_name, hire_date,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) work_months,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years
FROM employees
WHERE employee_id = 100;

--4) �ش� ��¥�� ���Ե� ���� ������ ���ڸ� ��ȯ�ϴ� �Լ�
--LAST_DAY(��¥)
SELECT LAST_DAY(SYSDATE) s1,
       LAST_DAY(ADD_MONTHS(SYSDATE, -3)) s2, --���÷κ��� 3���� ���� ���� ������ ��¥
       LAST_DAY(ADD_MONTHS(SYSDATE, 3)) s3 -- ���÷κ��� 3���� ���� ���� ������ ��¥
FROM dual;

--5) �ش� ��¥ ������ ��¥ �߿��� char�� ��õ� ���Ͽ� �ش��ϴ� ù��° ��¥�� ��ȯ
--NEXT_DAY(��¥, char)
--char : ���� ���� �� �Ͽ���, ������~~, ��, ��~~, ���ڵ� ����(1: �Ͽ���, 2: ������)
SELECT NEXT_DAY(SYSDATE, '������') NEXT1,
       NEXT_DAY(SYSDATE, '�ݿ���') NEXT2,
       NEXT_DAY(SYSDATE, '��') NEXT3,
       NEXT_DAY(SYSDATE, 4) NEXT4   -- 4 : ��
FROM dual;


--�� ����ȯ �Լ�
--1. ����ȭ �Լ� : TO_NUMBER �� ���� �� ����
--���ĺ�, ��ȣ, �ѱ� �̷� ���ڵ��� ����ȭ �Ұ�
--'������', 'abc', '19/20/05' �� ���ڷ� ��ȯ �Ұ�
--''(���� ����ǥ)�� ���� ���ڷ� ǥ���Ǿ����� �ȿ� ����� �����Ͱ� ��ü�� ������ ��쿡�� ����ȭ �Լ��� ����� �� �ִ�.

--2. ����ȭ �Լ� : TO_CHAR(���ڳ� ��¥�� ���ڷ� ��ȯ)
--1) ���� �� ���� : TO_CHAR(���, ���� ����)
--���� ����
--9 : �� �ڸ� ����, ��ȿ ���ڴ� �������� ä����(�����϶�), �Ҽ� �����϶��� 0���� ä����.
--0 : �� �ڸ� ����, ��ȿ ���ڴ� 0���� ä����, �ڸ����� �����Ҷ� �ڸ�����ŭ #ǥ��
--, : õ ���� ǥ��
--L : Local, ��ȭ ��ȣ
SELECT 123456                        ,   --123456
       TO_CHAR(123456, '999999')     ,   --_123456       ǥ�� ���Ŀ� �� �´��� �տ� ������ �⺻������ �ٴ´�.
       TO_CHAR(123456, '9999999999') ,   --_____123456   ǥ�� ���ĺ��� �ڸ����� ������ ��ĭ���� ä������.
       TO_CHAR(123456, '9999')       ,   --#####         ǥ�� ���ĺ��� �ڸ����� ������ #####���� ��µȴ�.
       TO_CHAR(123456, '999,999,999')    --_____123,456  ǥ�� ���ĺ��� �ڸ����� ��� ��ĭ���� ä��������, �޸�(,) �ڸ����� ��ĭ���� �������� �ʴ´�.
FROM dual;

--2) ��¥ �� ���� : TO_CHAR
--ǥ�� ���� : ��-YYYY, YY, RRRR, RR, ��-MM, MONTH, MON ��-DD
--           ���� - DAY(�ѱ�, ������), DY(�ѱ۾���, ��, ȭ)
--           ��-HH, HH24 ��-MI    ��-SS
SELECT TO_CHAR(SYSDATE, 'YYYY-MON-DD'),
       TO_CHAR(SYSDATE, 'RRRR-MON-DD'),
       TO_CHAR(SYSDATE, 'YY-MM-DD'),
       TO_CHAR(SYSDATE, 'RR-MM-DD'),
       TO_CHAR(SYSDATE, 'RR/MM/DD HH:MI:SS'),
       TO_CHAR(SYSDATE, 'RR/MM/DD HH24:MI:SS'),
       TO_CHAR(SYSDATE, 'YY-MM-DD DAY'),
       TO_CHAR(SYSDATE, 'YY-MM-DD DY')
FROM DUAL;

--3. ��¥ȭ �Լ� : TO_DATE
SELECT '201006',
       TO_DATE('20-10-06'),
       TO_DATE('201006'),
       TO_DATE('201006', 'DDMMRR'),
       TO_DATE('20-10-06', 'DD-MM-RR')
FROM DUAL;
        