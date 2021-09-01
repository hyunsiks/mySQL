/*
    # DML (Data Manipulataion Language, ������ ���۾�)
     - SELECT : ������ ��ȸ
     - INSERT : ������ ����
     - DELETE : ������ ����
     - UPDATE : ������ ����
     �� �̰��� ��� CRUD��� ��
        - CRUD��? Create,Read,Updatd,Delete ��� ���α׷��� �������ִ� ���
     
    # DDL (Data Definitation Language, ������ ���Ǿ�)
     - CREATE : ������Ʈ ����
     - DROP : ������Ʈ ����
     - ALTER : ������Ʈ ����
     - TRUNCATE : ������Ʈ ��������
     
    # DCL (Data Control Language, ������ ���� ��ɾ�)
     - GRANT : ���Ѻο�
     - REVOKE : ����ȸ��
     
    # ���̺� ����
    CREATE TABLE ���̺�� (�÷��̸�1 �÷�Ÿ��1, �÷��̸�2 �÷�Ÿ��2 ...);
    # ���̺� ����
    DROP TABLE ���̺��;
    (drop���� ������ ���̺��� SHOW RECYCLEBIN; ���� �����뿡�ִ°��� Ȯ�ΰ���
    (�����뺹���ϱ� : FLASHBACK TABLE ���̺�� TO BEFORE DROP;)
    (��������� : PURGE RECYCLEBIN;)
    
    # ������ ��ųʸ�
     - �����Ϳ� ���� ������(��Ÿ������)
     - DB�� �츮�� �߰��� �����͸� �˾Ƽ� �����Ѵ�
     - ���� ���״� DB�� ������ ��ųʸ��� ���ؼ��� �� �� �ִ�
     - ����ڰ� ���� ������ ��ųʸ��� ������ ���� ����
    
    # ������ ��ųʸ� ��
     - ������ ��ųʸ��� ����ڰ� Ȯ���ϱ� ���� ���·� �����ϴ� ��
     - USER_ �� ���̺� �տ� ������ �ش� ������ ������ ��ųʸ� ���� ��Ÿ����
     _ ALL_ �� ���̺� �տ� ������ ��� ������ ������ ��ųʸ� ���� ��Ÿ����
*/
CREATE TABLE coffees(
    coffee_id NUMBER(5),
    cname VARCHAR2(50),
    price NUMBER(5)
);

DROP TABLE coffees;

SHOW RECYCLEBIN; --������ ����
FLASHBACK TABLE coffees TO BEFORE DROP; --�����뿡�� Ŀ�����̺� �����ϱ�
PURGE RECYCLEBIN; --������ ����

-- ������ ��ųʸ� ��
SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_TABLES WHERE OWNER = 'HR'; (�ش���������� ������ ��� �������� �ý��۰��������� HR������ ���̺�Ȯ�ΰ���)
