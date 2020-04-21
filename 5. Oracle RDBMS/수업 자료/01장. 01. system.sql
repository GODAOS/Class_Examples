���۸޴� -> cmd -> 
> sqlplus --SQL ���� �����Ű�� �� ����� �� �� �ֵ��� ����Ŭ���� �����ϴ� ��
> user-name: system
> password: 0000

HR ���� ����ϱ� ���� HR ���� ���� Ǯ�� --�����ͺ��̽� ����ڴ� ����Ŭ ������ ���� �ǹ̷� ���
ALTER : ��ġ��, �ٲٴ�
ALTER USER hr 
ACCOUNT unlock;

--��й�ȣ ����
ALTER USER hr
IDENTIFIED BY 0000;

�����Ͱ��� : Table
�࿭�� �̷���� 2���� ������ Table�� �����͸� ����

--dba_users ��������
DESC dba_users;

--����� ���� Ȯ��
SELECT username
FROM dba_users;

SELECT *
FROM dba_users;

--��ü ���̺� ��ȸ
SELECT * FROM ALL_TABLES; --(�������� ���)
SELECT * FROM USER_TABLES; --(������ �ƴ� ���)
SELECT * FROM TAB; --(������ �ƴ� ���)

TAB�� TABLE�� ���ڷ� HR����ڰ� �����ϰ� �ִ� 
���̺��� ������ �˷��ִ� �����͵�ųʸ�(Data Dictionary)�̴�.
�����͵�ŷ���(Data Dictionary) : �����ͺ��̽��� ���õ� ��� ������ �����Ѵ�.

--user_tables ���� table_name ����
SELECT table_name 
FROM user_tables
ORDER BY table_name;

--user_tables ���� ����, TABLE_NAME Ȯ��
DESC user_tables;

--SELECT * PRIVILEGE FROM DBA_SYS_PRIVS WHERE GRANTEE IN('CONNECT', 'RESOURCE');
resource role, connect role�� �ο��� ���� ��ȸ
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE IN('CONNECT', 'RESOURCE');

--SELECT * FROM DUAL;

pl/sql developer ����� ȯ�� ����.
SQL developer ���� �۲� ���� 
- ���� > ȯ�漳��... > �ڵ� ������ > �۲� > �۲� ũ��
SQL developer â �ʱ�ȭ : â > ���丮 �������� â �缳��

SQL�����Ϳ��� �ٹ�ȣ ���̰� ����
 - ���� > ȯ�漳�� > �ڵ� ������ > �� ���� > �� ��ȣ ǥ�ÿ� üũ.
 
4. �𵨷�
3. Ʃ��
2. DBA
1. DB�����Ͼ� �� 3~5��

����Ŭ  : MySQL �պ�, ����ȭ
MariaDB : ���� â��, ���۰� ����(���������� �⺻ ���)

����Ŭ ��� ���� OS : ������, ������(���������� Maria DB�� �⺻���� ���), UNIX

����Ŭ������ user��ü�� DB : cf) MySQL������ �����ͺ��̽��� ǥ��
����Ŭ������ dba_users ���̺� �ִ� username �� �ϳ��� ������ ���̽�

�� �����ͺ��̽� ����
1. �䱸���� �м� 	        �� �䱸���׸���
2. ������ ����			    �� ER ���̾�׷�
3. ���� ����			    �� �����̼� ��Ű��, attribute, tuple
4. ������ ����� ����	    �� ������ ��Ű��, column, row

-----------------------------------------------------------------------------------------------
�� ����Ŭ ����
 8i : �̶����� 8080��Ʈ ���
 9i : 
10g : g �� �׸��� ��ǻ��, 
      ������ ���� ����. �׷���, purge����, drop table ���̺�� purge;
      10g �� �ѱ� 2����Ʈ
11g : 11g���� �ѱ� 3����Ʈ
12c : c �� Ŭ���� ����
 :
 :
19c
-----------------------------------------------------------------------------------------------
1521 : �⺻ DB��Ʈ
8080 : ��Ĺ�� �⺻���� ���
tomcat : WAS(Web Application Server)�� ����

Oracle XE���� ���(Standard�ϰ�� Ʋ��)
Orccle DB : �� 1�Ⱑ ���
��ġ�� ������ ���Ŵ� �����
����Ŭ ����Ʈ���� reinstall �ٿ�ε� �޾� ����

�� ����Ŭ ����
- Database Standard Edition 2(SE2) : ���� �⺻���� DB ��ǰ. CPU ���� 2�������� ����� �����ϰ� �� �̻��� ��� EE�� �����ؾ���. 
        SE2������ Real Application Cluster(RAC : ���� ��Ʈ��) �ɼǸ� ����. 
- Database Enterprise Edition(EE) : ���� �������� ��밡���� ����� DB. 
        SE2���� �������� �ʴ� ��� �ɼ��� ���� ����.
- Database Express Edition(XE) : ���߿�, ������ ������ �������� ������ DB.
        ����뵵�� �Ǹ��ϴ� ���� �Ұ���.
- Database Personal Edition(PE) : ���ο� PC���� ����� �� �ִ� DB. ��Ʈ��ũ ������ �Ǿ� ���� ���� ȯ�濡�� ��� ����. 
        ���� ���� �Ǹŵǰ� ����.
- WebLogic Server
- Business Analyst
- Big Data(Big Data Appliance�� �ٸ�)


SQL  : Structured Query Language
��ȸ : Query Language : SELECT
���� DML(Data Manipulation Language): INSERT, UPDATE, DELETE
       DML : SELECT, INSERT, UPDATE, DELETE
���� DDL(Data Definition Language): CREATE, DROP, ALTER, TRUNCATE, RENAME
�������� DCL(Data Control Language): GRANT, REVOKE
Ʈ��������� TCL (Transaction Control Language): COMMIT, ROLLBACK

�� SQL���� �ۼ� ���
SQL���� ��ҹ��ڸ� �������� �ʰ�(���� �����͸� ����) 
�Ϲ������� �� ������ �ٹٲ��� �Ͽ� ����.
������ ���� �����ݷ�(;) �� ����Ͽ� ����� ���� ǥ���Ѵ�.

DML�� commit ����, �������� auto commit ��.
commit : Ʈ�����(����, ���) �Ϸ�, Ȯ��

SYSTEM �������� hanul����� ���� ���� �� ���̺� ����� ������ ���� �� 
sqldeveloper�� cmdâ���� ���ذ��� commit Ȯ��

--hanul ����ڰ��� ���� �� ��й�ȣ ����
CREATE USER hanul 
IDENTIFIED BY 0000;

--hanul����� ���� ���� �� ���� �ο�
--Role (�ϳ��̻��� �������� �̷���� ����ü : resource, connect, dba...) ���� �ο�
--https://fliedcat.tistory.com/98


GRANT CONNECT, 
      RESOURCE,
      CREATE VIEW
TO hanul;



