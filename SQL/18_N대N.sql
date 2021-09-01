/*
    # ¿£Æ¼Æ¼°£ÀÇ N : N °ü°è
        1. 2 °³ÀÇ 1 : N °ü°è¸¦ ¸¸µå´Â ¹æ¹ý (¼º´É ÀúÇÏ½ÉÇÔ)        
     ex) ¸Þ´º     ¼Õ´Ô              ¸Þ´º(PK)   ÁÖ¹®      ¼Õ´Ô
        Â¥Àå¸é     A               Â¥Àå¸é     Â¥Àå¸é A   A
        Â«»Í       B      =>       Â«»Í      Â«»Í A     B
        ÅÁ¼öÀ°     C               ÅÁ¼öÀ°     ÅÁ¼öÀ° A   C
        Â«»Í¹ä     D               Â«»Í¹ä     Â¥Àå¹ä B   D
                                            Â«»Í B     E
                                            ÅÁÂ¥¸é C   
        
        2. ±×³É Æ÷±âÇÏ°í ÇÑ Å×ÀÌºí¿¡ ´Ù Àû´Â´Ù(¼º´ÉÀÌ ¶³¾îÁöÁö ¾ÊÁö¸¸, ¹°¸®Àû ¿ë·® ¸¹ÀÌÂ÷Áö)
        
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

INSERT INTO menus VALUES(1, 'Â¥Àå¸é', 4500); 
INSERT INTO menus VALUES(2, 'Â«»Í', 3600); 
INSERT INTO menus VALUES(3, 'ÅÁ¼öÀ°', 2400); 
INSERT INTO menus VALUES(4, '¶óÁ¶±â', 6400); 
INSERT INTO menus VALUES(5, '´©·îÁöÅÁ', 7700); 
INSERT INTO menus VALUES(6, 'ººÀ½¹ä', 5000); 

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

/*¿¬½À2 : ¸¸µç db·Î ´ÙÀ½À» Á¶È¸ÇØÁÖ¼¼¿ä
1. A¾¾°¡ ½ÃÅ² ¸ðµç ¸Þ´º¸¦ Á¶È¸
2. B¾¾°¡ ½ÃÅ² ¸ðµç ¸Þ´ºÀÇ ÃÑÇÕÀ» Á¶È¸
3. ½ÃÅ² ¸Þ´ºÀÇ ÃÑÇÕÀÌ ÇÑµµ¸¦ ³Ñ´Â ¼Õ´ÔµéÀÇ Á¤º¸¸¦ Á¶È¸
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
    SUM(price) AS ÃÑÇÕ°¡°Ý 
FROM
    (SELECT * FROM orders INNER JOIN menus USING(menu_id)
                    INNER JOIN customer USING(customer_id))
GROUP BY 
    CUSTOMER_NAME HAVING CUSTOMER_NAME = 'B';
--3
SELECT 
    customer_name,
    ÃÑÇÕ°¡°Ý 
from
    (SELECT customer_name, sum(price) as ÃÑÇÕ°¡°Ý 
     FROM(SELECT * 
          FROM 
            orders 
            INNER JOIN menus USING(menu_id)
            INNER JOIN customer USING(customer_id)) 
          GROUP BY CUSTOMER_NAME) 
WHERE 
    ÃÑÇÕ°¡°Ý > 10000;
SELECT customer_name from(SELECT customer_name, SUM(price) AS ÃÑÇÕ°¡°Ý FROM(SELECT * FROM ORDERS INNER JOIN menus USING(menu_id)
            INNER JOIN customer USING(customer_id)
            WHERE ORDER_DATE BETWEEN '21/04/01' AND SYSDATE)
GROUP BY CUSTOMER_NAME)
WHERE ÃÑÇÕ°¡°Ý > 9000;





