/*
    # ���������� ���̺� �����ϱ� 
     - CREATE TABLE ���̺�� AS (��������)�� ���̺��� ������ �� �ִ�
*/
CREATE TABLE coffees2 AS (SELECT * FROM coffees);
select * from coffees2;

CREATE TABLE bingsu AS (SELECT * FROM coffees WHERE cname LIKE '%����%');
SELECT * FROM BINGSU;

/*
    # ���̺� �� �÷� �߰��ϱ�
     -ALTER TABLE ���̺�� ADD (�÷��� �÷�Ÿ��, ...) : ���ο� �÷��� �߰��Ѵ�
*/
ALTER TABLE bingsu ADD (sirup VARCHAR2(20));

/*
    # ���̺��� �÷� �̸� �����ϱ�
     - ALTER TABLE ���̺�� RENAME COLUMN �����̸� TO �ٲ��̸�;
*/
ALTER TABLE bingsu RENAME COLUMN sirup TO syrup;

/*
    # ���̺��� �÷� Ÿ�� �����ϱ�
     - ALTER TABLE ���̺�� MODIFY(�÷��� �÷�Ÿ��, ...);
*/
ALTER TABLE bingsu MODIFY(cname VARCHAR2(60));

/*
    # ���̺� �̸� �����ϱ�
     - RENAME �������̺�� TO �ٲ����̺��;
*/
RENAME bingsu TO bingsoo;
RENAME bingsoo TO bingsu;

/*
    # �÷� �����ϱ�
     - ALTER TABLE ���̺�� DROP COLUMN �÷���;
*/
ALTER TABLE bingsu DROP COLUMN syrup;

SELECT * FROM ALL_TABLES WHERE OWNER = 'JAVA1';

