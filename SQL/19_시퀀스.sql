/*
    # ������
     - �⺻Ű�� ����ϱ� ���ϵ��� ����� �ڵ� ��ȣ ������
     - select * from user_sequences �� ���� ������ Ȯ���� �� �ִ�(hr�������� Ȯ�ΰ���)
     - �������� �ѹ� ������ ����ִ� ��ȣ�� �ǵ������� ����
     - ������° ��ȣ���� ���������? : select sodas_currval from dual;
     - ����! nextval �� ���� ���� ���̱� ������ �ѹ� ����ϸ� ����ų�� ����
     CREATE SEQUENCE ��������
                    [START WITH n] : �������� ���� ��ȣ ����
                    [INCREMENT BY n] : �������� ������ ����
                    [MAXVALUE n] : �ִ밪 ����
                    [MINVALUE n] : �ּҰ� ����
                    [CYCLE | NOCYCLE] : �ִ밪 ���޽� �ٽ� ó������ ���ư�������
                    [CACHE n | NOCACHE] : �޸𸮻� �̸� ����� ���� �������� ���� ����
*/

-- ������ ������ ��ųʸ�
SELECT * FROM user_sequences;

CREATE TABLE sodas(
    pid NUMBER(4) CONSTRAINT SODA_PID_PK PRIMARY KEY,
    pname VARCHAR2(30) CONSTRAINT SODA_PNAME_NN NOT NULL
); 
INSERT INTO sodas VALUES(1, '���̴�');
INSERT INTO sodas VALUES(2, 'û���� ���̵�');
INSERT INTO sodas VALUES(3, '�ڸ� ���̵�');

--������ �����
CREATE SEQUENCE sodas_seq START WITH 4 INCREMENT BY 1;

--������ �����ϱ�
INSERT INTO sodas VALUES(sodas_seq.nextval, '��Ʈ���ڶ�');
INSERT INTO sodas VALUES(sodas_seq.nextval, 'ȯŸ');
INSERT INTO sodas VALUES(sodas_seq.nextval, '��Ű��');
INSERT INTO sodas VALUES(sodas_seq.nextval, '�Ϲٻ�');

CREATE TABLE soda_categories(
    cafe_id NUMBER(4),
    cafe_name VARCHAR(40),
    CONSTRAINT SC_ID_PK PRIMARY KEY(cafe_id)
);
/*
����1 : soda_categories ���̺��� ����� �������� �����غ�����
    1. ������ 10������
    2. 10�� ������ ��
    3. CACHE 10���� ����
    4. ��ȯ���� ���� ��
    5. �ִ밪�� 9000
    6. ���̺� ������ 3�� ������
*/
CREATE SEQUENCE soda_categories_seq
                START WITH 10
                INCREMENT BY 10
                NOCYCLE
                CACHE 10
                MAXVALUE 9000;
        
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, '��Ÿ����');       
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, 'Ž��Ž��'); 
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, 'Ŀ�Ǻ�'); 
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, '���ٹ�'); 
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, '�ٳ�������'); 
select * from soda_categories;

drop SEQUENCE sodas_seq;
select soda_categories_seq.currval from dual;
purge recyclebin;