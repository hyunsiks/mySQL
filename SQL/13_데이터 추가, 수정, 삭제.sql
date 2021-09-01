/*
    # �����ͻ���(INSERT)
     - INSERT INTO ���̺��(�÷���, ...) VALUES (��, ...)
    
    # �����ͼ���(UPDATE)
     - UPDATE ���̺�� SET �÷�=�� WHERE ����;
    
    # �����ͻ���(DELETE)
     - DELETE FROM ���̺�� WHERE ����;
*/
DESC coffees;
--����
--  1.����÷��� ����
INSERT INTO coffees(coffee_id, cname, price) VALUES (1, '�Ƹ޸�ī��', 2000);
INSERT INTO coffees(coffee_id, cname, price) VALUES (2, '���̽� �Ƹ޸�ī��', 2500);
INSERT INTO coffees(coffee_id, cname, price) VALUES (3, 'ī���', 3000);
--  2.�Ϻ��÷��� ����
INSERT INTO coffees(cname) VALUES('�Ϻ���', 5000);
INSERT INTO coffees(cname, price) VALUES('�������', 5500);
SELECT * FROM COFFEES;
--  3.�÷��� �����ϰ� ����(��� �����͸� �÷� ������� �־������)
INSERT INTO coffees VALUES(6, '���ɺ���', 6500);
INSERT INTO coffees(price, cname, coffee_id) VALUES(4000, 'ī���ī', 7);
--  4. INSERT INTO ���̺��(��������) : ���̺��� �Ȱ��� �Ʒ��ʿ� �ٿ��ֱ��
INSERT INTO coffees(SELECT * FROM coffees);

--����
--  1. ��絥���� �ѹ��� ���� (WHERE ������ ���� ����)
UPDATE coffees SET price = 1000;

--  2. ���ǿ� �´� ������ ���� (WHERE ���� ���� ��)
UPDATE coffees SET cname = '�����̺���' where cname = '�Ϻ���';

--  3. REPLACE ���
UPDATE coofees SET cname = replace(cname, '�Ƹ޸�', '��Ż��') WHERE cname LIKE '%�Ƹ޸�%';
select * from coffees;

--�ٿ���1 : ������ �ƴϰ�, �Ƹ޸�ī�뵵 �ƴ� ��� ��ǰ���� ������ 3õ������ �����غ�����
UPDATE 
    coffees 
SET 
    price = 3000
WHERE
    cname NOT LIKE '%�Ƹ޸�ī��%' AND 
    cname NOT LIKE '%����%';
 
COMMIT; -- ���ݱ����� �����͸� ��� Ȯ���Ѵ�
ROLLBACK; -- �����͸� Ŀ�������� �ǵ���
--����
--  1. ����ü�� �����Ѵ� (Ư���÷��� �����ϴ� ���� UPDATE�� �ش��Ѵ�)
DELETE FROM coffees WHERE cname LIKE '%�Ƹ޸�ī��%';
--  2. ������� �����Ѵ� (WHERE ������ ���� ������ ���)
DELETE FROM coffees;

