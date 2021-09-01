/*
    # Ʈ����� (Transaction)
     - ������ ó���� �� ����
     - �ϳ��� ������ �۾��� �����ϰ� ������ �� �� ������ ����
        ex) �۱� Ʈ�����(1,2�� ���ļ� �ϳ��� Ʈ������̶���ϴ°�)
            1. ������ ����� ���忡�� ���� �پ���
            2. �޴� ����� ������ ���� �þ��
     - �ϳ��� Ʈ������� ���� ��ɾ��� �����̴�
     - Ʈ������� ��� ������ ���������� �Ϸ�Ǵ� ��쿡�� ���� ������ Ȯ�����´�(All or Nothing)
     - Ʈ������� �����ϱ� ���� ���Ǵ� TCL�δ� COMMIT, ROLLBACK, SAVEPOINT���� �ִ�
     - Ʈ������� ���������� ����� Ŀ��(�Ǵ� �ѹ�)���� ���� ���ο� Ŀ���� �����ϴ� 
       �������� �����ϴ� ��� DML�� �ǹ��Ѵ�.(�� DDL�� �ѹ��� ����� �ƴϴ�, CREATE���� �ѹ�ȵ�)
*/
-- SAVEPOINT(save01�� �����ϰ� �ѹ��� �������� �ϸ� save01������ ��� ������ �����)
SAVEPOINT save01;
INSERT INTO coffees(coffee_id,coffee_name) VALUES (100, '������');
ROLLBACK TO save01;

SELECT * FROM COFFEES;

COMMIT;

SELECT * FROM coffees;
TRUNCATE TABLE coffees; -- ���̺��� ��� ������ �ڸ���. DROP TABLE���� �ٸ��� ������ �����. �ѹ�ȵȴ�
ROLLBACK;

DESC COFFEES;

--����1 : COFFEES ���̺� ���ο� �÷��� �߰��غ�����
ALTER TABLE coffees ADD(kcal NUMBER(5));
ALTER TABLE coffees ADD(origin_id NUMBER(4));
ALTER TABLE coffees ADD(bitter VARCHAR2(15));
ALTER TABLE coffees ADD(BEST CHARACTER);

--����2 : �÷��� �̸��� � �����غ�����
ALTER TABLE coffees RENAME COLUMN cname TO coffee_name;

--����1 : INSERT���� ����� ����� �� �޴��� 5�� �̻� �־����(�׸��� ������ ������ �����ּ���)
INSERT INTO coffees VALUES(1, '�Ƹ޸�ī��', 2000, 30, 5, '�١١�', 'Y');
INSERT INTO coffees VALUES(2, 'ī��Ḷ���߶�', 320, 220, 3, '��', 'N');
INSERT INTO coffees VALUES(3, 'ī���', 4000, 150, 5, '�١�', 'N');
INSERT INTO coffees VALUES(4, '�ݵ���', 3500, 40, 4, '�١١�', 'Y');
INSERT INTO coffees VALUES(5, '����������', 1000, 15, 2, '�١١١١�', 'N');



INSERT INTO coffees VALUES(1, '�Ƹ޸�ī��', 2000, 30, 5, '�١١�', 'Y');
INSERT INTO coffees VALUES(2, '���̽� �Ƹ޸�ī��', 2000, 35, 5, '�١١�', 'Y');
INSERT INTO coffees VALUES(3, 'ī���', 3000, 150, 3, '�١�', 'N');
INSERT INTO coffees VALUES(4, '���ν����', 8000, 350, 2, '��', 'N');
INSERT INTO coffees VALUES(5, 'īǪġ��', 6500, 170, 4, '�١�', 'N');
INSERT INTO coffees VALUES(6, 'ī�� �񿣳�', 7000, 210, 4, '�١�', 'Y');
INSERT INTO coffees VALUES(7, '����������', 1500, 15, 5, '�١١١١�', 'N');
INSERT INTO coffees VALUES(8, '�ݵ� ���', 5000, 40, 3, '�١١١�', 'Y');
INSERT INTO coffees VALUES(9, '���������� ���ĳ�', 5000, 290, 3, '�١١١�', 'N');
INSERT INTO coffees VALUES(10, 'ī�����', 4500, 340, 2, '�١١�', 'N');
INSERT INTO coffees VALUES(11, 'īǪġ��', 4500, 140, 4, '�١١�', 'N');
INSERT INTO coffees VALUES(12, '��� �����', 7500, 240, 5, '�١�', 'N');
INSERT INTO coffees VALUES(13, 'ũ�������Ƹ�� ���', 3500, 40, 3, '��', 'N');
INSERT INTO coffees(coffee_id,coffee_name,price,kcal) VALUES(14, '��ī����Ĩ ��Ű', 3500, 160);
INSERT INTO coffees(coffee_id,coffee_name,price,kacl) VALUES(15, '��������Ĩ ��Ű', 3500, 180);
INSERT INTO coffees(coffee_id,coffee_name,price,kcal) VALUES(16, 'ġ�� ����ũ', 4500, 400);
INSERT INTO coffees(coffee_id,coffee_name,price,kcal) VALUES(17, '���ڹ��� ����ũ', 4500, 450);

update coffees set origin_id = null, bitter = null, best = null where coffee_id = 13; 
update coffees set kcal = 140 where coffee_id = 13;
select * from coffees; 

--���̺��ϳ� ������
