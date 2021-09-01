/*
    # ��ƼƼ���� N : N ����
        1. 2 ���� 1 : N ���踦 ����� ��� (���� ���Ͻ���)        
     ex) �޴�     �մ�              �޴�(PK)   �ֹ�      �մ�
        ¥���     A               ¥���     ¥��� A   A
        «��       B      =>       «��      «�� A     B
        ������     C               ������     ������ A   C
        «�͹�     D               «�͹�     ¥��� B   D
                                            «�� B     E
                                            ��¥�� C   
        
        2. �׳� �����ϰ� �� ���̺� �� ���´�(������ �������� ������, ������ �뷮 ��������)
        
*/









CREATE TABLE menus(
    menu_id VARCHAR2(10) CONSTRAINT MENU_MENU_PK PRIMARY KEY,
      menu_name  VARCHAR2(20),
    price VARCHAR2(10) CONSTRAINT MENU_PRI_NN NOT NULL 
);

CREATE TABLE customer(
    customer_id VARCHAR2(20) CONSTRAINT CUS_CUS_FK PRIMARY KEY,
    customer_name VARCHAR2(50) ,
    customer_sex CHAR(1) CONSTRAINT CUS_SEX_CH CHECK (customer_sex IN ('M','W'))
);
DESC ORDERS;
SELECT SYSDATE FROM DUAL;
CREATE TABLE orders(
    order_id VARCHAR2(10) PRIMARY KEY,
    menu_id VARCHAR2(10) NOT NULL, FOREIGN KEY(menu_id) REFERENCES menus,
    customer_id VARCHAR2(10) NOT NULL, FOREIGN KEY(customer_id) REFERENCES customer,
    order_date DATE
);
ALTER SESSION SET nls_date_format ='YY/MM/DD HH24:MI:SS';
PURGE RECYCLEBIN;
DROP TABLE ORDERS;
DROP TABLE CUSTOMER;
DROP TABLE MENUS;
select * from menus;
select * from customer;
delete from menus where menu_id = 1;
delete from customer where customer_id = 1;
delete from orders where menu_id = 1;

INSERT INTO menus VALUES(1, '¥���', 4500); 
INSERT INTO menus VALUES(2, '«��', 3600); 
INSERT INTO menus VALUES(3, '������', 2400); 
INSERT INTO menus VALUES(4, '������', 6400); 
INSERT INTO menus VALUES(5, '��������', 7700); 
INSERT INTO menus VALUES(6, '������', 5000); 

INSERT INTO customer VALUES(1, 'A', 'M');
INSERT INTO customer VALUES(2, 'B', 'W');
INSERT INTO customer VALUES(3, 'C', 'W');
INSERT INTO customer VALUES(4, 'D', 'M');
INSERT INTO customer VALUES(5, 'E', 'W');

SELECT * FROM ORDERS;
INSERT INTO orders VALUES(1, 1, 1, SYSDATE);
INSERT INTO orders VALUES(2, 2, 1, TO_DATE('21/04/23 10:24:12', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO orders VALUES(3, 3, 1, TO_DATE('21/03/12 17:41:13', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO orders VALUES(4, 1, 2, TO_DATE('21/03/07 14:30:16', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO orders VALUES(5, 5, 2, SYSDATE);
INSERT INTO orders VALUES(6, 1, 3, TO_DATE('21/02/21 08:20:20', 'YY/MM/DD HH24:MI:SS'));
INSERT INTO orders VALUES(7, 6, 4, SYSDATE);
INSERT INTO orders VALUES(8, 1, 4, SYSDATE);
INSERT INTO orders VALUES(9, 2, 5, SYSDATE);
INSERT INTO orders VALUES(10, 4, 5, SYSDATE);

SELECT * FROM orders INNER JOIN menus USING(menu_id)
                    INNER JOIN customer USING(customer_id);

/*����2 : ���� db�� ������ ��ȸ���ּ���
1. A���� ��Ų ��� �޴��� ��ȸ
2. B���� ��Ų ��� �޴��� ������ ��ȸ
3. ��Ų �޴��� ������ �ѵ��� �Ѵ� �մԵ��� ������ ��ȸ
*/
DESC MENUS;
DESC CUSTOMER;
DESC ORDERS;
--1
SELECT 
    MENU_NAME 
FROM
    (SELECT * 
     FROM 
        orders 
        INNER JOIN menus USING(menu_id)
        INNER JOIN customer USING(customer_id))
WHERE 
    CUSTOMER_NAME = 'A';
--2
SELECT 
    SUM(price) AS ���հ��� 
FROM
    (SELECT * FROM orders INNER JOIN menus USING(menu_id)
                    INNER JOIN customer USING(customer_id))
GROUP BY 
    CUSTOMER_NAME HAVING CUSTOMER_NAME = 'B';
--3
SELECT 
    customer_name,
    ���հ��� 
from
    (SELECT customer_name, sum(price) as ���հ��� 
     FROM(SELECT * 
          FROM 
            orders 
            INNER JOIN menus USING(menu_id)
            INNER JOIN customer USING(customer_id)) 
          GROUP BY CUSTOMER_NAME) 
WHERE 
    ���հ��� > 10000;
SELECT customer_name from(SELECT customer_name, SUM(price) AS ���հ��� FROM(SELECT * FROM ORDERS INNER JOIN menus USING(menu_id)
            INNER JOIN customer USING(customer_id)
            WHERE ORDER_DATE BETWEEN '21/04/01' AND SYSDATE)
GROUP BY CUSTOMER_NAME)
WHERE ���հ��� > 9000;





