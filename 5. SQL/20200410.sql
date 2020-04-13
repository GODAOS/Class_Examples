--tblPanme ���̺� ����
CREATE TABLE tblPanme (
    code VARCHAR2(10),
    part VARCHAR2(20),
    price NUMBER
);

--���ڵ� �Է�
INSERT INTO tblPanme(code, part, price)
    VALUES ('001', 'A������', 3000);
INSERT INTO tblPanme(code, part, price)
    VALUES ('002', 'B������', 6000);
INSERT INTO tblPanme(code, part, price)    
    VALUES ('003', 'A������', 2000);
INSERT INTO tblPanme(code, part, price)
    VALUES ('004', 'B������', 5000);
INSERT INTO tblPanme(code, part, price)
    VALUES ('005', 'C������', 1000);
INSERT INTO tblPanme(code, part, price)
    VALUES ('006', 'D������', 4000);

--��ü ���ڵ� �˻�
SELECT * FROM tblPanme;

--tblPanme ���̺� ����
DROP TABLE tblPanme;

--���� �Ϸ�
COMMIT;

--�� �μ���(GROUP BY)�� �Ǹ� �ݾ�(PRICE)�� ����(SUM)�� ���Ͽ� ���
SELECT part, SUM(price) FROM tblPanme; -- ���� �߻�
SELECT part, SUM(price) FROM tblPanme GROUP BY part;
SELECT part, SUM(price) AS total FROM tblPanme GROUP BY part;

--�� �μ����� �Ǹ� �ݾ��� ������ ���Ͽ� �μ��� ������������ ����(ORDER BY)�Ͽ� ���
SELECT part, SUM(price) FROM tblPanme GROUP BY part ORDER BY part ASC;

--�μ����� ���(��, �ߺ��� �μ��� �����ϰ� �ѹ��� ��� : DISTINCT)
SELECT part FROM tblPanme;
SELECT DISTINCT part FROM tblPanme;
SELECT DISTINCT part FROM tblPanme ORDER BY part DESC;

--�μ��� �� �� ��(COUNT) �μ����� ���(��, �ߺ��� �μ��� �� ���� ���
SELECT COUNT(part) FROM tblPanme;
SELECT COUNT(DISTINCT part) FROM tblPanme;
SELECT COUNT(DISTINCT part) AS partcount FROM tblPanme;

--�� �μ����� �Ǹ� �ݾ��� ������ ���Ͽ� �μ��� ������������ �����Ͽ� ���
--��, �μ��� 2�� �̻� �ִ� �μ��� ������� �Ͻÿ� �� A������, B������
SELECT part, SUM(price) AS total FROM tblPanme
    GROUP BY part HAVING COUNT(part) >= 2 ORDER BY part ASC;