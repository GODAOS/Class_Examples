3��. �⺻ �Լ�
: �����Լ�, �����Լ�, ��¥�Լ�, ����ȯ�Լ�, �Ϲ��Լ�

�Լ��� ���� : ������ �Լ�, ������(������) �Լ�
�Լ��� ����ϴ� �Ķ���Ϳ� ��ȯ�Ǵ� ���� ������ ���� �Լ��� ����
���� �� �Լ� : �ϳ��� �������࿡ ���� �ϳ��� ����� ��ȯ�ϴ� ������ �Լ�
�����Լ�: ROUND, TRUNC, CEIL, FLOOR
�����Լ�: UPPER, LOWER, TRIM, LTRIM/RTRIM, LPAD/RPAD, 
          SUBSTR, INSTR, REPLACE, TRANSLATE
��¥�Լ�: SYSDATE, MONTHS_BETWEEN, ADD_MONTHS, LAST_DAY
����ȯ�Լ�: TO_CHAR, TO_NUMBER, TO_DATE
�Ϲ��Լ�: NVL, NVL2, COALESCE, DECODE, CASE~END

������ �׽�Ʈ�� ���� ���̺� : dummy table �� dual, ������ �����ʹ� �� ���� ����.

3.1 �����Լ�
ABS(n) : n�� ���밪�� ��ȯ�ϴ� �Լ��̴�.
SELECT ABS(32), ABS(-32)
FROM dual;

SIGN(n) : n�� ������� ���������� ���θ� ��ȯ�ϴ� �Լ��̴�. 
n�� ����̸� 1��, n�� �����̸� -1��, 0�̸� 0�� ��ȯ�Ѵ�. 
SELECT SIGN(32), SIGN(-32), SIGN(0) 
FROM dual;

1) �ݿø� �Լ� : ROUND(n [, i]), ROUND(����, �Ҽ�����/�̻� �ڸ���)
�Ҽ�����/�̻� �ڸ��� : �������� ����, ������ default�� 0 -> ������ ǥ��
�Ҽ� ��°�ڸ����� ǥ�� : ROUND(1234.56789, 2) -> 1234.57
SELECT ROUND(1234.56789, 2) r1, /* 1234.57 */
       ROUND(1234.56789, 0) r2, /* 1235 */
       ROUND(56789.32154, -2) r3,  /* 56800 */
       ROUND(1234.56789) r4 /* 1235 */
FROM dual;

2) ������ ���� �Լ�: TRUNC(n [, i]), TRUNC(����, �Ҽ�����/�̻� �ڸ���)
�Ҽ�����/�̻� �ڸ��� : �������� ����, ������ default�� 0 -> ������ ǥ��
SELECT TRUNC(1234.56789, 2)  t1, /* 1234.56 */
       TRUNC(1234.56789, 0) t2, /* 1234 */
       TRUNC(56789.32154, -2) t3, /* 56700 */
       TRUNC(1234.56789) t4 /* 1234 */
FROM dual;

3) ���ں��� ū ������ ��ȯ�ϴ� �Լ� : CEIL(n) - ������ �ø��� ����
�Խ��ǿ��� ������ ���� ��, �������� 10���� ��½�
0 ~ 1 ���̿��� ������ ���� �Ǽ�
0.9999999999999999999999 -> 1
0.000000000000000000000000000000001 -> 1

SELECT CEIL(0.9999999999999999999999) c1, /* 1 */
       CEIL(0.000000000000000000000000000000001) c2, /* 1 */
       CEIL(0) c3, /* 0 */
       CEIL(12.1) c4 /* 13 */
FROM dual;

4) ���ں��� ���� ������ ��ȯ�ϴ� �Լ�: FLOOR(n) - ������ ������ ����
0 ~ 1 ���̿��� ������ ���� �Ǽ�
0.9999999999999999999999 -> 0
0.000000000000000000000000000000001 -> 0

SELECT FLOOR(0.9999999999999999999999) f1, /* 1 */
       FLOOR(0.000000000000000000000000000000001) f2, /* 1 */
       FLOOR(0) f3, /* 0 */
       FLOOR(12.1) f4 /* 12 */
FROM dual;

SELECT  CEIL(12.0000000001) c1,  /* 13 */
        FLOOR(12.99999999999999999) f1 /* 12 */
FROM dual;

���� �����͸� ǥ���� �� �ִ� �Լ� : ROUND, TRUNC, CEIL, FLOOR
�Ҽ��� �����͸� ǥ���� �� �ִ� �Լ� : ROUND, TRUNC
���� �����͸� ǥ���� �� �ִ� �Լ� : CEIL, FLOOR, ROUND/TRUNC(�ι�° �Ķ���Ͱ� 0)

5) �������� ��ȯ�ϴ� �Լ� : MOD(m, n), MOD(����, ��������)
SELECT MOD(17, 4) m1,    /* 1 */
       MOD(17, -4) m2,   /* 1 */
       MOD(-17, 4) m3,   /* -1 */
       MOD(-17, -4) m4,  /* -1 */
       MOD(17, 0) m5     /* 17 */
FROM dual;

17  /  4  :  17   =  4 *  4 + 1 /** 1 **/
17  / -4  :  17   = -4 * -4 + 1 /** 1 **/
-17 /  4  : -17   =  4 * -4 + (-1) /** -1 **/
-17 / -4  : -17   = -4 *  4 + (-1) /** -1 **/
17  /  0  :  17   =  0 * 754446878 + 17 /** 17 **/

-----------------------------------------------------------------------------------------------
[�������� 3-1]
��� ���̺��� �μ��ڵ尡 100, 110 �� �μ��� ���� �������
���, ����, �޿�, �μ��ڵ�, 15%�λ�� �޿� ��ȸ - �λ�� �޿��� ������ ǥ��
SELECT employee_id, first_name||' '||last_name name, salary, department_id,
       --ROUND( salary * 1.15 ) "Increased Salary"
       --CEIL( salary * 1.15 ) "Increased Salary"
       --TRUNC( salary * 1.15 ) "Increased Salary"
       FLOOR( salary * 1.15 ) "Increased Salary"
FROM employees
WHERE department_id IN (100, 110) ; --�μ��ڵ尡 100, 110 �� �μ��� ����
-----------------------------------------------------------------------------------------------

3.2 �����Լ�
1. ��/�ҹ��� ��ȯ �Լ� : UPPER/LOWER(����)

SELECT *
FROM employees;

����/��¥ ������ ǥ�� : ''
���� King �� ������� ���, ��, �� ��ȸ
SELECT employee_id, last_name, first_name
FROM employees
WHERE last_name = 'King';
--WHERE UPPER(last_name) = 'KING';
--WHERE LOWER(last_Name) = 'king';

���� ��ҹ��� �����ϰ� z �� �ִ� ������� ���, ��, �� ��ȸ
SELECT employee_id, last_name, first_name
FROM employees
WHERE UPPER(last_name) LIKE '%Z%';
--WHERE LOWER(last_name) LIKE '%z%';
--WHERE last_name LIKE '%z%' OR last_name LIKE '%Z%' ; 
--���� ��ҹ��� �����ϰ� z �� �ִ�

2. �ܾ� ������ ù���ڴ� �빮��, �������� �ҹ���ȭ �ϴ� �Լ�: INITCAP(���)
    : �̴ϼȸ� �빮�ڷ� ��ȯ
--SELECT INITCAP('we are studing oracle') title     /* We Are Studying Oracle */
SELECT INITCAP('WE ARE STDUYING ORACLE') title      /* We Are Studying Oracle */   
--SELECT INITCAP('wE aRE sTDUYing oRACLE') title    /* We Are Studying Oracle */
FROM dual;

SELECT email, INITCAP(email) INITCAP,
       first_name, UPPER(first_name) UPPER, LOWER(first_name) LOWER
FROM employees;

3. ���� ������(char1)�� Ư�� ����(char2)�� ä���� ��ȯ�ϴ� �Լ� 
    : LPAD/RPAD(char1, n [, char2])
    : LPAD/RPAD(���, ��üũ��, ��������), pad : ä�� �ִ°�
    : ����° �Ķ������ �������� ���� ���� : default ���鹮��

SELECT LPAD('abc', 5,'?')   p1,  /*??abc*/
       RPAD('abc', 5, '#')  p2,  /*abc##*/
       '['||LPAD('abc', 5)  p3,  /*__abc*/
       RPAD('abc', 5)||']'  p4   /*abc__*/
FROM dual;

SELECT LPAD('abc', 10, '@') p1
FROM dual;

SELECT employee_id, LPAD(last_name , 20, ' ') last_name
--SELECT employee_id, LPAD(last_name , 20) last_name �� ������ ���鹮��
FROM employees;

4. ���ڵ����Ϳ��� Ư�����ڸ� �����ϰ� ��ȯ�ϴ� �Լ�
   : ������ ���ڴ� ���� ���� ���� ���ɡ�  �� TRIM
   : �Է»��ڿ��� ����� �Ǽ��� ������ �Է½�
   : request.getParameter('UserId').TRIM();

TRIM([LEADING, TRAILING, BOTH] [, TRIM_char] [FROM] char)
�� TRIM(��������ġ ���Ź����Ѱ� FROM �����) ��
TRIM(LEADING/TRAILING/BOTH ���Ź���(���ѱ��ڸ� ����) FROM �����)
  ������ ��ġ - ����:LEADING, ������:TRAILING, ����:BOTH
  ������ ��ġ ���� ���� - default:BOTH
  ���Ź��� ���� ���� - default ���鹮��
  
SELECT TRIM('a' FROM 'abcdcbaaaaa')          t1, /*bcdcb*/
       TRIM(LEADING 'a' FROM 'abcdcba')      t2, /*bcdcba*/
       TRIM(TRAILING 'a' FROM 'abcdcbaaaaa') t3, /*abcdcb*/
       TRIM(BOTH 'a' FROM 'abcdcbaaaaa')     t4, /*bcdcb*/
       '  abcdcba '                          t5, /*__abcdcba_*/
       TRIM('  abcdcba ')                    t6  /*abcdcba*/
FROM dual;

5. ���ڵ����Ϳ� Ư�����ڸ� �����ϰ� ��ȯ�ϴ� �Լ�
    : ������ ���ڸ� �ڿ��� �� ���� ���� �� TRIM�Լ��� ������
    : LTRIM/RTRIM(char1 [,char2])
    : LTRIM/RTRIM(�����, �����ҹ����ǳ���)
    : �� ��° �Ķ���� ���� ���� - default ���鹮��
    
SELECT LTRIM( 'abcdcba' , 'a' )  t1, /* bcdcba */
       LTRIM( 'abcdcba' , 'ba' ) t2, /* cdcba */
       RTRIM( 'abcdcba' , 'acb') t3, /* abcd */
       RTRIM( '   abcdcba   ')   t4  /* ___abcdcba */
FROM dual;

