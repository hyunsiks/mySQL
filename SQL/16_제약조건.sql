/*
    # ������ ���Ἲ
    
     - �����Ϳ��� ������ ����� �Ѵٴ� ��
     - ��ü ���Ἲ
     - ���� ���Ἲ 
     - ������ ���Ἲ
    
    # ��ü ���Ἲ
      - ���̺��� �����ʹ� �ݵ�� �� ���� ������ �� �־�� �Ѵ�
      - ��ü ���Ἲ�� ��Ű�� ���� ���� �������� PK�� ����Ѵ�
    
    # ���� ���Ἲ
      - ���� ���迡 �ִ� �����Ͱ� �׻� �ϰ��� ���� ������ �Ѵ�
        (employees�� department_id�� �μ����̺��� department_id�� �����ϴ� ���� ����ؾ��Ѵ�) 
      - ���� ���Ἲ�� ��Ű�� ���� ���� �������� FK�� ����Ѵ�
    
    # ������ ���Ἲ
      - �ش� �÷��� �����ϴ� ��ü���� �׻� Ÿ���� �����ؾ��Ѵ�
      - ���̺� �÷� Ÿ�� ���� �� CHECK�� ���ؼ� ������ ���Ἲ�� ��ų �� �ִ�
    
    # ������ ���Ἲ ���� ����
      - NOT NULL : �ش� Į���� NULL�� ������� �ʴ� ��Ģ
      - UNIQUE : �ش� �÷��� �ߺ��Ǵ� ���� ������� �ʴ� ��Ģ, �׻�, ������ ���� ������ �Ѵ�
      - PRIMARY KEY : �⺻Ű (NOT NULL + UNIQUE), ���̺�� �ϳ��� ��������
      - FOREIGN KEY : �ܷ�Ű
      - CHECK : ���ϴ� �������� ������ ���� �����Ͽ� ������ ���Ἲ�� ������ �� �ִ�      
      - DEFAULT : �ش��÷��� �⺻���� �����س��� ��������(NULL��� DEFAULT�� ������ �� �߰�)
    
*/
-- # �������� ������ ��ųʸ��� ���� ���� ������ ��� �������ǵ��� Ȯ���� �� �ִ�
SELECT * FROM USER_CONSTRAINTS; --���� ������ ��������
SELECT * FROM ALL_CONSTRAINTS; --���� �������� �� �� �ִ� ��� ���� ����

/*
    # �������� ���̺��� CONSTRAINT_TYPE
        P : Primary Key
        R : Foreign Key
        C : Check / NOT NULL
        U : Unique
*/
CREATE TABLE fruits (
    fid NUMBER(2) PRIMARY KEY,
    fname VARCHAR(20) NOT NULL,
    fcolor VARCHAR(20) CHECK(fcolor IN ('RED','GREEN','BLUE')) -- CHECK()���ο� ���ϴ� ������ �߰�

);
ALTER TABLE fruits MODIFY(fname VARCHAR(20) UNIQUE);
DESC FRUITS;
SELECT * FROM fruits;

INSERT INTO fruitS VALUES(2, 'APPLE', 'RED');
INSERT INTO fruits VALUES(3, 'BANANA', 'BLUE');
INSERT INTO fruits VALUES(1, 'KIWI', 'GREEN');
INSERT INTO fruits VALUES(4, NULL, 'GREEN');
/*
    # ���̺� �����ϴ� �������� �����ϴ� ���
        - ALTER TABLE ���̺�� DROP CONSTRATINT �������Ǹ�;
    # ���̺� �������� �߰��ϱ�
        - ������ ���ÿ� �������� �߰�
         (�÷��� �÷�Ÿ�� CONSTRAINT �������Ǹ� ��������Ÿ��
        - ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� ��������(������÷�);  : �������Ǹ��� ���� ������ �������ִ�
        - ALTER TABLE ���̺�� MODIFY �÷���(���� ����); : �������Ǹ��� �������� �����ϴ�
        - ���̺� ������ �߰��ϱ�
*/
ALTER TABLE fruits DROP CONSTRAINT SYS_C007665; -- SELECT * FROM USER_CONSTRAINTS ���� �������Ǹ� Ȯ�ΰ���
ALTER TABLE fruits DROP CONSTRAINT SYS_C007667;
ALTER TABLE fruits ADD CONSTRAINT f_color_uk UNIQUE(fcolor); --�̹� �ߺ��� Ű�� �ֱ⶧���� ����ũ ��������
ALTER TABLE fruits MODIFY(fcolor VARCHAR(20) NOT NULL);
ALTER TABLE fruits ADD CONSTRAINT FRUITS_FID_PK PRIMARY KEY(fid);

--�����Ҷ� �������� ����¹�
CREATE TABLE fruits2(
    fid NUMBER(4)       CONSTRAINT FRUITS2_FID_PK PRIMARY KEY,
    fname VARCHAR2(20)  CONSTRAINT FRUITS2_FNAME_NN NOT NULL
                        CONSTRAINT FRUITS2_FNAME_UK UNIQUE,
    fcolor VARCHAR2(10) CONSTRAINT FRUITS2_FCOLOR_NN NOT NULL,
    fsize CHAR(1)       CONSTRAINT FRUITS2_FSIZE_CH CHECK(fsize IN('L', 'N', 'S'))
);

--�����Ŀ� �������� �ִ¹�(NOT NULL�� CHECK�� ADD CONSTRAINT ��� MODIFY�� �̿��ؼ� �߰�/�����ؾ��Ѵ�
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_FID_PK PRIMARY KEY(fid);
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_FNAME_UK UNIQUE(fname);
ALTER TABLE fruits3 MODIFY (fname VARCHAR(20) CONSTRAINT FRUITS3_FNAME_NN NOT NULL);
ALTER TABLE fruits3 MODIFY (fcolor VARCHAR(20) CONSTRAINT FRUITS3_FNAME_NN NOT NULL);
ALTER TABLE fruits3 MODIFY (fsize CHAR(1) CONSTRAINT FRUITS3_FSIZE_CH CHECK (fsize IN('L', 'N', 'S')));

DESC FRUITS2;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'FRUITS2';
SELECT * FROM USER_CONSTRAINTS WHERE OWNER = 'JAVA1';

--DEFAULT ���� ����
ALTER TABLE fruits2 ADD(fprice NUMBER(7) DEFAULT 0);
ALTER TABLE fruits2 MODIFY(fprice NUMBER(7) DEFAULT 10);

/*
    # Foreign Key ���� ����
     - ���� ������ ������ �� � ���̺��� � �÷��� �������� �ݵ�� �����ؾ� �Ѵ�
       �ٸ� ���̺��� PK�Ǵ� UK���������� �ɸ� �÷��� ������ �� �ִ�
*/
CREATE TABLE fruit_locations(
    lid NUMBER(2),
    addr VARCHAR(200),
    city VARCHAR(40)
);

INSERT INTO fruit_locations VALUES(10, '��û�ϵ� û�ֽ�', 'û��'); 
INSERT INTO fruit_locations VALUES(20, '���ϵ� �ȵ���', '�ȵ�'); 
INSERT INTO fruit_locations VALUES(30, '���󳲵� ���ﱺ', '����'); 
INSERT INTO fruit_locations VALUES(40, '��û���� ����', '���'); 

-- UNIQUE �Ǵ� PRIMARY KEY ���� ������ �ɸ��� ���� �÷��� �ܷ�Ű�� ������ �� ����
ALTER TABLE fruit_locations ADD CONSTRAINT FLO_LID_UK UNIQUE(lid);
ALTER TABLE fruits2 ADD (lid NUMBER(2) CONSTRAINT FRUITS2_LID_FK REFERENCES fruit_locations(lid));

SELECT * from fruits2; 
insert into fruits2 values(1, 'Apple', 'Red', 'L', 1000, 10);
insert into fruits2 values(2, 'Banana', 'Yellow', 'S', 2500, 20);
select * from fruit_locations;

SELECT * FROM FRUITS2 INNER JOIN FRUIT_LOCATIONS USING(LID);

SELECT * FROM USER_CONSTRAINTS WHERE OWNER = 'JAVA1';
PURGE RECYCLEBIN;

/*
    # �������� �߰��ϴ� ���3 (���̺� ������ �߰��ϱ�)
     - �÷��� ��� ������ CREATE TABLE�� �� �ڿ� ���� ���������� �����ϴ� ���
     - DEFAULT�� NOT NULL�� ���̺� ���� ������� ������ �� ����
*/
CREATE TABLE fruits4(
    fid NUMBER(4), 
    fname VARCHAR2(20) CONSTRAINT F4_FID_NN NOT NULL,
    fcolor VARCHAR2(10)  CONSTRAINT F4_FCOLOR_NN NOT NULL,
    fsize CHAR(1), 
    fprice NUMBER(7) DEFAULT 123,
    lid NUMBER(2),
    CONSTRAINT F4_FID_PK PRIMARY KEY(fid),
    CONSTRAINT F4_FNAME_UK UNIQUE(fname),
    CONSTRAINT F4_FSIZE_CH CHECK (fsize IN ('L' ,'N', 'S')),
    CONSTRAINT F4_LID_FK FOREIGN KEY(lid) REFERENCES fruit_locations(lid)
);
DESC fruits4;

/*
    # 1:N ���踦 ������ �� ���̺��� ������ �� ���������� �����غ�����
    # ���±��� ��� ��� ���������� �ּ��ѹ��̻� ���/ ������ �ּ� 3���̻�
*/
CREATE TABLE gym(
    gym_id VARCHAR(5) CONSTRAINT GYM_GID_PK PRIMARY KEY,
    customer_id VARCHAR(5) CONSTRAINT GYM_CID_UK UNIQUE,
                           CONSTRAINT GYM_CID_FK FOREIGN KEY(customer_id) REFERENCES CUSTOMERS,
    regist_period VARCHAR(10) CONSTRAINT GYM_RPD_NN NOT NULL,
    teacher VARCHAR(15) CONSTRAINT GYM_RPD_CH CHECK (teacher LIKE '��%' OR teacher LIKE '��%' OR teacher LIKE '��%'),
    pt CHAR(1) CONSTRAINT GYM_PT_CH CHECK (pt IN('Y', 'N'))
);
INSERT INTO gym VALUES(1, 10, 30, '������', 'Y');
INSERT INTO gym VALUES(2, 20, 60, '������', 'N');
INSERT INTO gym VALUES(3, 30, 90, '�̻���', 'N');
INSERT INTO gym VALUES(4, 40, 40, '��ȫȫ', 'Y');

SELECT * FROM GYM;
DROP TABLE GYM;
select * from customers;

CREATE TABLE customers(
    customer_id VARCHAR(5) CONSTRAINT CUS_CID_PK PRIMARY KEY,
    pay_money VARCHAR(20) CONSTRAINT CUS_PMY_NN NOT NULL,
    phone_number VARCHAR(15),
    purpose_excercise VARCHAR(100)
);
INSERT INTO customers VALUES(10, 100000, '010-1234-1234', '���̾�Ʈ');
INSERT INTO customers VALUES(20, 150000, '010-3242-1234', '�ٷ�');
INSERT INTO customers VALUES(30, 130000, '010-3252-1234', '�ٷ�');
INSERT INTO customers VALUES(40, 200000, '010-5252-1127', '���̾�Ʈ');

SELECT * FROM gym INNER JOIN customers USING(customer_id);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'GYM';

SELECT * FROM fruits4;
DESC FRUITS4;
SELECT * FROM fruit_locations;

--FK������ ���Ἲ �����ϴ� ���� (�ٸ����̺��� �����Ǵ� �ڽ� ���ڵ尡 �ֱ⶧��)
INSERT INTO FRUITS4 VALUES (1, '���', 'RED', 'L', 2000, 10);
COMMIT;
DELETE FROM FRUIT_LOCATIONS WHERE LID = 10;

/*
    # ON DELETE ��������
        - �ڽ� ���ڵ尡 �����ϰ� �ִ� �θ� ���ڵ带 �����Ϸ��� �� �� ��������� ������ �� �ִ�
        - CASCADE, SET NULL, RESTRICT
    
    # ON DELETE CASCADE
        - �θ� ���ڵ带 �����ϸ� �ڽ� ���ڵ带 ��� �Բ� �����Ѵ�
    
    # ON DELETE SET NULL
        - �θ� ���ڵ带 �����ϸ� �����ϴ� �ڽ� ���ڵ��� ���� NULL�� �����Ѵ�
    
    # RESTRICT
        - �ڽ� ���ڵ尡 ������ �θ� ���ڵ带 ������ �� �����Ѵ�
*/













