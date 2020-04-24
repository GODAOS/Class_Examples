6) ���ڿ����� ���ڿ��� �Ϻθ� ��ȯ(�� ���°���� �����)�ϴ� �Լ�
    : SUBSTR(char, position [, LENGTH])
    : SUBSTR(�����, ������ġ, �����)
    �ι�° �Ķ����(position : ������ġ), ���� ���� ���� �� �����ʿ�������
    ����° �Ķ����(LENGTH : �����) ������ �� �� ���ڿ��� ������ ��ȯ
               1   5   9   13
SELECT SUBSTR('You are not alone', 5, 3)  s1, /* are */
       SUBSTR('You are not alone', 5)     s2, /* are not alone */
       SUBSTR('You are not alone', -5, 3) s3, /* alo */
       SUBSTR('You are not alone', -5)    s4  /* alone */
FROM dual;

7) ���ڿ����� Ư�����ڿ��� ��ġ�� �ڽ�����ġ�� ��ȯ�ϴ� �Լ�
    : INSTR(char, search_string [, position] [ , _th])
    : INSTR(�����, ã�¹��ڿ�, ���ڿ�ã�½�����ġ, ���°��)
    �ι�° �Ķ���� �� ã�¹��ڿ�
    ����° �Ķ���� �� ���ڿ� ã�� ���� ��ġ, ���� ���� ���� 
        �� �����ʿ������� ���ʹ������� �� �������� ��� ����
    �׹�° �Ķ���� �� ���°��, ���� ���� - default 1

              1     7   11 14 17 19
SELECT INSTR('Every sha-la-la-la-la', 'la', 1, 2)   s1, 
       /* 1����ġ���� ã�� �����ؼ� 2��°�� �����ϴ� 'la' ���� ��ġ 14 */
       INSTR('Every sha-la-la-la-la', 'la', 12, 2)  s2, /* 17 */
       INSTR('Every sha-la-la-la-la', 'la', 12, 4)  s3, /* 0 */
       INSTR('Every sha-la-la-la-la', 'la', 12)     s4, /* 14 */
       INSTR('Every sha-la-la-la-la', 'la', -3, 2)  s5, /* 14 */
       INSTR('Every sha-la-la-la-la', 'la', -10)    s6 /* 11 */
                     /*-11-8 -5 -2*/            
FROM dual;

-----------------------------------------------------------------------------------------------
email                 @��ġ  id(1��°���� @��ġ �ձ���)   ����������(@��ġ �ں��� ������)
-----------------------------------------------------------------------------------------------
honggildong@naver.com  12    honggildong         1,11     naver.com      13,22
admin@google.com        6    admin               1, 5     google.com      7,16  
hoho0829@hanmail.net    9    hoho0829            1, 8     daum.net       10,20
-----------------------------------------------------------------------------------------------

������ �̸��Ͽ��� �̸��� ���̵� ��ȸ
SELECT 'hoho0829@hanmail.net' email,   
        SUBSTR('hoho0829@hanmail.net', 1, INSTR('hoho0829@hanmail.net', '@')-1) id,
        SUBSTR('hoho0829@hanmail.net', INSTR('hoho0829@hanmail.net', '@')+1) servicer1,
        SUBSTR('hoho0829@hanmail.net', INSTR('hoho0829@hanmail.net', '@')+1,
        	LENGTH('hoho0829@hanmail.net')-INSTR('hoho0829@hanmail.net', '@')) servicer2
FROM dual;

--JOBS ���̺��� �����ڵ�, ��������, ����, ��å ��ȸ
--����, ��å�� �����ڵ忡�� '_'�������� ��ȸ(����_��å)
SELECT job_id, job_title
FROM jobs;

[�ǽ�]
JOB_ID   JOB_TITLE   '_'��ġ   ���ڿ�����   _���� ���� ����     ����      ��å        
-----------------------------------------------------------------------------------
AD_PRES  President        3            7            4            AD       PRES 
:
:

SELECT job_id,
       job_title,
       INSTR(job_id,'_') "_��ġ",
       LENGTH(job_id) "���ڿ�����",
       LENGTH(job_id)-INSTR(job_id,'_') "_���� ���� ����", 
       SUBSTR(job_id,1,INSTR(job_id,'_')-1) "����",   /* _�������� ���� */
       SUBSTR(job_id,INSTR(job_id,'_')+1) "��å1",     /* _���ĺ��� ���� */
       SUBSTR(job_id,INSTR(job_id,'_')+1,LENGTH(job_id)-INSTR(job_id,'_')) "��å2"
FROM jobs;

�μ��ڵ尡 60,80,100 �� �μ��� ���� ������� 
���, ��, ��ȭ��ȣ, ������ȣ, ���ι�ȣ ��ȸ
------------------------------------------------------
                             ������ȣ     ���ι�ȣ  
�ڹ���  515.124.4567         515           4567
�Ӳ���  011.44.1344.467268   011           467268 
ȫ�浿  02.1234.5678         02            5678
����ġ  062.9874.5422        062           5422
��û    0652.4523.6221       0652          6221
------------------------------------------------------

SELECT  employee_id, last_name, phone_number,
        SUBSTR(phone_number,1,INSTR(phone_number,'.')-1) ������ȣ1,
        SUBSTR(phone_number,INSTR(phone_number,'.',-1)+1) ������ȣ2
FROM employees 
WHERE department_id IN (60,80,100);


                            ������ȣ   ���ι�ȣ  
�ڹ���  515.124.4567         515       4567
�Ӳ���  011.44.1344.467268   011       467268 
ȫ�浿  02.1234.5678         02        5678
����ġ  062.9874.5422        062       5422
��û    0652.4523.6221       0652      6221

3.3 ��¥�Լ� : �۱�, ���, ȸ�����Գ�¥, �����ð�
1) �ý����� ���� ��¥�� ��ȯ�ϴ� �Լ� - SYSDATE
�ٸ� �Լ��ʹ� �޸� �Ķ���Ͱ� ���� ()�� ������� ����.
SELECT SYSDATE
FROM dual;

��¥ +/- ����   -> ��¥
��¥ - ��¥     -> ����

���ó�¥ + 1 -> ���ϳ�¥
���ó�¥ - 1 -> ������¥
SELECT SYSDATE+1 tomorrow, SYSDATE-1 yesterday
FROM dual;

���ó�¥ - ������¥ -> �ϼ�����
���ó�¥�� ���� �� ����: 
SELECT SYSDATE+30 after1M
FROM dual;

SELECT SYSTIMESTAMP --�и��ʱ���
FROM dual;

2) Ư����¥�κ��� �� ���� ��/�� �� ��¥ ��ȯ�ϴ� �Լ�
    : ADD_MONTHS(��¥, ������)
���÷κ��� 6���� ���� ��¥ ��ȸ, ���÷κ��� 3���� ���� ��¥ ��ȸ
SELECT ADD_MONTHS(SYSDATE, 6) after6M, 
       ADD_MONTHS(SYSDATE, -3) before3M
FROM dual;

���ó�¥ - ������¥ -> �������� ���� �� MONTH_BETWEEN
3) �� ��¥ ������ �������� ���̸� ��ȯ�ϴ� �Լ�
    : MONTHS_BETWEEN(��¥1, ��¥2) �� ��¥1 > ��¥2

�Ҽ� ù°�ڸ����� ǥ��
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/02/24'),1) diff
FROM dual;

���� �����Ϻ��� ���ñ����� ���� ���� ������ �������� ���� ���� ���� �˾ƺ���.
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/02/24'),1) PASSED, 
       TRUNC(MONTHS_BETWEEN('20/08/21', SYSDATE),1) REMAINED 
FROM dual;

�츮ȸ�� ��� 100���� ��� �� 
���, ��, �Ի�����, �ٹ�������, �ٹ���� ��ȸ
- �ٹ�������, �ٹ������ ������ �������� ����Ͽ� ������ ǥ�� 
���� ��� ������ 2019/08/07 �̰�, 2019/05/27 �Ͽ� �Ի��ߴٸ�  2���� �ٹ��� ��
SELECT employee_id, last_name, hire_date, 
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) work_months,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years
FROM employees
WHERE employee_id = 100;

4) �ش� ��¥�� ���Ե� ���� ������ ���ڸ� ��ȯ�ϴ� �Լ�
    : LAST_DAY(��¥)
    
SELECT LAST_DAY(SYSDATE) s1, 
       LAST_DAY(ADD_MONTHS(SYSDATE, -3)) s2,
       --���÷κ��� 3�������� ���� ������ ��¥
       LAST_DAY(ADD_MONTHS(SYSDATE, 3)) s3
       --���÷κ��� 3���� ���� ���� ������ ��¥
FROM dual;

5) �ش糯¥ ������ ��¥ �߿��� char�� ��õ� ���Ͽ� �ش��ϴ� ù��° ��¥�� ��ȯ 
    : NEXT_DAY(��¥, char)
    char : ���Ϲ��� �� �Ͽ���, ������~~, ��, ��~~, ���ڵ� ����(1:�Ͽ���, 2:������)

SELECT NEXT_DAY(SYSDATE, '������') NEXT1,
       NEXT_DAY(SYSDATE, '�ݿ���') NEXT2,
       NEXT_DAY(SYSDATE, '��') NEXT3, 
       NEXT_DAY(SYSDATE, 4) NEXT4 /* 4 : �� */
FROM dual;   

* ����ȯ�Լ�

1. ����ȭ�Լ� : TO_NUMBER �� ���� -> ����
byte    <   short  <    int    <    long
int i = 10;     /* int   : 4����Ʈ */
short s = 5;    /* short : 2����Ʈ */
s = (short)i; �ȴ�� int   -> short
i = (int)s;          short -> int : ����� ����ȯ
i = s; �Ϲ��� ����ȯ

�Ϲ��� ����ȯ �߻� 
SELECT 10 +20   d1,  /* 30 */
       10 +'20' d2   /* 30 */
from dual;

���ĺ�, ��ȣ, �ѱ� �̷� ���ڵ��� ����ȭ �Ұ�
'������', 'abc', '19/02/05' -> ���ڷ� ��ȯ �Ұ�
''(Ȭ����ǥ)�� ���� ���ڷ� ǥ���Ǿ����� �ȿ� ����� �����Ͱ� ��ü�� ������ ��츸 ����ȭ �Լ��� ����� �� �ִ�.

����� ����ȯ
SELECT TO_NUMBER('1245') s1, /* 1245 */
       1245              s2  /* 1245 */
FROM dual;

   TO_CHAR           TO_DATE
         ->             ->
����           ����          ��¥
Number         Character     Date 
         <-             <-  
   TO_NUMBER         TO_CHAR 

����ȭ�Լ� : TO_CHAR
����ȭ�Լ� : TO_NUMBER
��¥ȭ�Լ� : TO_DATE

2. ����ȭ�Լ� : TO_CHAR(���ڳ� ��¥�� ���ڷ� ��ȯ)
1) ����->���� : TO_CHAR(���, ��������)
   ��������: 
   9: ���ڸ� ����, ��ȿ ���ڴ� �������� ä����(�����϶�), �Ҽ������϶��� 0���� ä����, 
      �ڸ����� �����Ҷ� �ڸ�����ŭ #ǥ��
   0: ���ڸ� ����, ��ȿ ���ڴ� 0���� ä����, �ڸ����� �����Ҷ� �ڸ�����ŭ #ǥ��
   ,: õ����ǥ��
   L: ��ȭ��ȣ

SELECT 123456                         n1,  /*123456*/ /*���� ��ü�� �׳� ���� �ڸ���ŭ �� ������*/
       TO_CHAR(123456, '999999')      c1,  /*_123456*/ /*9�� 6��*/ /*����ȭ ������ ���� ������ �ϳ��� ����*/
       TO_CHAR(123456, '999999999')   c2,  /*____123456*/ /*9�� 9��*/
       TO_CHAR(123456, '9999')        c3,  /*#####*/ /*�ڸ����� �����Ҷ� �ڸ���+1 ��ŭ #ǥ��*/
       TO_CHAR(123456, '999,999,999') c4   /*_____123,456*/
FROM DUAL;

SELECT TO_CHAR(123456, '9,999,999')     c1,  /*___123,456*/
       TO_CHAR(123456, '0,999,999')     c2,  /*_0,123,456*/
       TO_CHAR(123456, '$0,999,999')    c3,  /*_$0,123,456*/
       TO_CHAR(1234.56, '$999,999.999') c4,  /*___$1,234.560*/ /*�Ҽ��� 9�� �Ҽ������϶��� 0���� ä����*/
       TO_CHAR(1234.56, '$999,999,999') c5,  /*_______$1,235*/
       TO_CHAR(1234.56, 'L999,999,999') c6,  /*______________��1,235*/ /*õ����*/ /*9:12��, ����:14��*/
       TO_CHAR(1234.56, 'L999,999.999') c7   /*__________��1,234.560*/ /*�Ҽ���*/ /*9:8��, ����:10��*/
FROM dual;

SELECT 123456                                   n1, /*123456*/
       TO_CHAR(123456)                          n2, /*123456*/
       TO_CHAR(123456, 'L9,999,999,999')        n3, /*______________��123,456*/ /*9:14��, ����:14��*/
       TRIM(TO_CHAR(123456, 'L9,999,999,999'))  n4, /*��123,456*/
       TO_CHAR(123456, 'L00,000,000,000')       n5, /*________��00,000,123,456*/ /*0:15��, ����:8��*/
       TRIM(TO_CHAR(123456, 'L00,000,000,000')) n6  /*��00,000,123,456*/
from dual;

SELECT 12345          n1,           /*12345*/
       1500000        ����ʸ�,     /*1500000*/
       TO_CHAR(123456),             /*123456*/
       TO_CHAR(1500000, 'L9,999,999,999')                    s20,   /*____________��1,500,000*/ /*9:14��, ����:12��*/
       '['|| LTRIM(TO_CHAR(1500000, 'L9,999,999,999'), ' ' ) s21,   /*[��1,500,000*/
       '['|| LTRIM(TO_CHAR(1500000, 'L9,999,999,999'))       s22,   /*[��1,500,000*/
       '['|| TRIM(LEADING ' ' FROM TO_CHAR(1500000, 'L9,999,999,999')) s23,    /*[��1,500,000*/
       '['|| TRIM(' ' FROM TO_CHAR(1500000, 'L9,999,999,999') )        s24,    /*[��1,500,000*/
       '['|| TRIM(TO_CHAR(1500000, 'L9,999,999,999') )                 s25,    /*[��1,500,000*/
       
       TO_CHAR(1500000,'0,000,000,000') s3  /*_0,001,500,000*/
FROM dual;

SELECT 	employee_id, 
		TO_CHAR(salary,'9999')          SAL1,    /*#####*/
		TO_CHAR(salary,'999999')        SAL2,    /*__24000*/
		TO_CHAR(salary,'999,999')       SAL3,    /*__24,000*/
		TO_CHAR(salary,'999,999,999')   SAL4,    /*______24,000*/
		TO_CHAR(salary,'000,999,999')   SAL5,    /*_000,024,000*/
		TO_CHAR(salary,'099,999,999')   SAL6,    /*_000,024,000*/
		TO_CHAR(salary,'000,000')       "0SAL",  /*_024,000*/
		TO_CHAR(salary,'000,000,000')   "00SAL", /*_000,024,000*/
		TO_CHAR(salary,'$999,999')      "$9SAL", /*__$24,000*/
		TO_CHAR(salary,'$999,999,999')  "$99SAL",/*______$24,000*/
		TO_CHAR(salary,'$000,000')      "$0SAL", /*_$024,000*/
		TO_CHAR(salary,'$000,000,000')  "$00SAL",/*_$000,024,000*/
        
		TO_CHAR(salary,'L999,999')      L9SAL,   /*_________��24,000*/ /*����1��+8��*/
		TO_CHAR(salary,'L999,999,999')  L99SAL,  /*_____________��24,000*/ /*����1��+12��*/
        
		TO_CHAR(salary,'L000,000')      L0SAL,   /*________��024,000*/ /*8��*/
		TO_CHAR(salary,'L000,000,000')  L00SAL,  /*________��000,024,000*/ /*8��*/
        
        TRIM(TO_CHAR(salary,'L999,999'))      TRIML9SAL,   /*��24,000*/
		TRIM(TO_CHAR(salary,'L999,999,999'))  TRIML99SAL,  /*��24,000*/
        
		TRIM(TO_CHAR(salary,'L000,000'))      TRIML0SAL,   /*��024,000*/
		TRIM(TO_CHAR(salary,'L000,000,000'))  TRIML00SAL,  /*��000,024,000*/
        
		salary SAL
FROM EMPLOYEES e;

2) ��¥->����: TO_CHAR(���, ǥ������)
ǥ������ : ��-YYYY, YY, RRRR, RR ��-MM, MONTH, MON ��-DD  
           ����-DAY(�ѱ�,������), DY(�ѱ۾���,��,ȭ)
           ��-HH, HH24   ��-MI   ��-SS
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DY HH24:MI:SS') d1
FROM dual;

SELECT TO_CHAR(SYSDATE, 'YYYY-MON-DD') d11,
       TO_CHAR(SYSDATE, 'RRRR-MON-DD') d12,
       TO_CHAR(SYSDATE, 'YY-MM-DD') d13,
       TO_CHAR(SYSDATE, 'RR-MM-DD') d14,
       TO_CHAR(SYSDATE, 'RR/MM/DD HH:MI:SS') d21,
       TO_CHAR(SYSDATE, 'RR/MM/DD HH24:MI:SS') d22,
       TO_CHAR(SYSDATE, 'YY-MM-DD DAY') d31,
       TO_CHAR(SYSDATE, 'YY-MM-DD DY') d32
FROM dual;  

3. ��¥ȭ�Լ�: TO_DATE(���, ǥ������)  
'19-08-04' -> ��ȯ����:��¥����, 
'������', 'abc' -> ��ȯ�Ұ�

SELECT * 
FROM v$nls_parameters;

SELECT VALUE 
FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT';

SELECT '201006' d1, /* 201006 */
       TO_DATE('20-10-06') d2,  /* 20/10/06 */
       TO_DATE('201006') d3, /* 20/10/06 */
       TO_DATE('201006','DDMMRR') d4, /* 06/10/20 */  /* ��¥�� '/'�� ���� */
       TO_DATE('20-10-06', 'DD-MM-RR') d5 /* 06/10/20 */   /* ��¥�� '/'�� ���� */
FROM dual;

SELECT 10 + 20 n1,      /* 30 */
       '10' + '20' n2,  /* 30 */
       10 + '20' n3     /* 30 */
FROM dual;







