--[�������� 10 - 1]
--1. ���̺�� : STAR_WARS(��ȭ ����)
--   Į�� : EPISODE_ID    : ���Ǽҵ� ���̵�, ���� Ÿ��(5), �⺻Ű
--          EPISODE_NAME  : ���Ǽҵ忡 ���� ��ȭ ����, ���� ���� Ÿ��(50)
--          OPEN_YEAR     : ���� ����, ���� Ÿ��(4)
CREATE TABLE star_wars (
episode_id NUMBER(5) CONSTRAINT sw_episode_id_pk PRIMARY KEY,
episode_name VARCHAR2(50),
open_year NUMBER(4)
);

--2. ���̺�� : characters(�����ι�)
--   Į�� : character_id    : �����ι� ���̵�, ���� Ÿ��(5), �⺻Ű
--          character_name  : �����ι� �̸�, ���� ���� Ÿ��(30)
--          master_id       : �����ι��� �������� ���, ������ ���̵� ���� ����, ���� Ÿ��(5)
--          role_id         : �����ι� ���� ���̵�, ���� Ÿ��(4)
--          email           : �����ι� �̸��� �ּ�, ���� ���� Ÿ��(40)
CREATE TABLE characters (
character_id NUMBER(5) CONSTRAINT char_character_id_pk PRIMARY KEY,
character_name VARCHAR2(30),
master_id NUMBER(5),
role_id NUMBER(4),
email VARCHAR2(40)
);

--3. ���̺�� : casting(�����ι��� ���� ����� ����)
--   Į�� : episode_id    : ���Ǽҵ� ���̵�, ���� Ÿ��(5), �⺻Ű
--          character_id  : �����ι� ���̵�, ���� Ÿ��(5), �⺻Ű
--          real_name     : �����ι��� ���� �̸�, ���� ���� Ÿ��(30)
CREATE TABLE casting (
episode_id NUMBER(5),
character_id NUMBER(5),
real_name VARCHAR2(30),
CONSTRAINT cast_episode_character_id_pk PRIMARY KEY (episode_id, character_id)
);

--4. STAR_WARS ���̺� ������ ���� �����Ѵ�.
INSERT INTO star_wars
VALUES (4, '���ο� ���(A New Hope)', 1977);

INSERT INTO star_wars
VALUES (5, '������ ����(The Empires Strikes Back)', 1980);

INSERT INTO star_wars
VALUES (6, '�������� ��ȯ(Return of the Jedi)', 1983);

INSERT INTO star_wars
VALUES (1, '������ �ʴ� ����(The Phantom Menace)', 1999);

INSERT INTO star_wars
VALUES (2, 'Ŭ���� ����(Attack of the Clones)', 2002);

INSERT INTO star_wars
VALUES (3, '�ý��� ����(Revenge of the Sith)', 2005);

--5. CHARACTERS ���̺� ������ ���� �����Ѵ�.
INSERT INTO characters
VALUES (1, '��ũ ��ī�̿�Ŀ', '', '', 'luke@jedai.com');

INSERT INTO characters
VALUES (2, '�� �ַ�', '', '', 'solo@alliance.com');

INSERT INTO characters
VALUES (3, '���̾� ����', '', '', 'leia@alliance.com');

INSERT INTO characters
VALUES (4, '����� �ɳ��', '', '', 'Obi-Wan@jedai.com');

INSERT INTO characters
VALUES (5, '�پ� ���̴�', '', '', 'vader@sith.com');

INSERT INTO characters
VALUES (6, '�پ� ���̴�(��Ҹ�)', '', '', 'vader_voice@sith.com');

INSERT INTO characters
VALUES (7, 'C-3PO', '', '', 'c3po@alliance.com');

INSERT INTO characters
VALUES (8, 'R2-D2', '', '', 'r2d2@alliance.com');

INSERT INTO characters
VALUES (9, '���ī', '', '', 'Chewbacca@alliance.com');

INSERT INTO characters
VALUES (10, '���� Į���þ�', '', '', '');

INSERT INTO characters
VALUES (11, '���', '', '', 'yoda@jedai.com');

INSERT INTO characters
VALUES (12, '�پ� �õ�', '', '', 'sidious@sith.com');

INSERT INTO characters
VALUES (13, '�Ƴ�Ų ��ī�̿�Ŀ', '', '', 'Anakin@jedai,com');

INSERT INTO characters
VALUES (14, '���̰� ��', '', '', '');

INSERT INTO characters
VALUES (15, '�ƹ̴޶� ����', '', '', '');

INSERT INTO characters
VALUES (16, '�Ƴ�Ų ��Ӵ�', '', '', '');

INSERT INTO characters
VALUES (17, '���ں�ũ��(��Ҹ�)', '', '', '');

INSERT INTO characters
VALUES (18, '�پ� ��', '', '', 'maul@sith.com');

INSERT INTO characters
VALUES (19, '��� ��', '', '', '');

INSERT INTO characters
VALUES (20, '������ ����', '', '', 'windu@jedai.com');

INSERT INTO characters
VALUES (21, '���� ����', '', '', 'dooku@jedai.com');

--6. ROLES ���̺��� �����Ͽ� ������ ���� �����Ѵ�.
CREATE TABLE roles (
role_id NUMBER(4) CONSTRAINT roles_role_id_pk PRIMARY KEY,
role_name VARCHAR2(30)
);

INSERT INTO roles
VALUES (1001, '������');

INSERT INTO roles
VALUES (1002, '�ý�');

INSERT INTO roles
VALUES (1003, '�ݶ���');

--7. CHARACTERS ���̺��� ROLE_ID Į���� �����Ͱ� ROLES ���̺��� ROLE_ID Į���� �����͸� �����ϵ��� CHARACTERS ���̺� ����Ű�� �����Ѵ�.

--------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM star_wars;
SELECT * FROM characters;
DROP TABLE casting;
COMMIT;
--------------------------------------------------------------------------------------------------------------------------------