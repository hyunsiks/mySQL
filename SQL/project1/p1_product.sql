SELECT * FROM PRODUCTS;
DESC PRODUCTS;
ALTER TABLE PRODUCTS ADD (stocks NUMBER(10));

INSERT INTO PRODUCTS VALUES(11, '목살', '육류', 18000, TO_DATE('21/03/21 08:21:32', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(12, '삼겹살', '육류', 16000, TO_DATE('21/04/11 13:25:22', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(13, '삼겹살', '육류', 16000, TO_DATE('21/04/16 17:02:22', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(14, '항정살', '육류', 20000, TO_DATE('21/02/17 18:51:06', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(15, '갈비살', '육류', 22000, TO_DATE('21/05/26 12:15:06', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '호주');
INSERT INTO PRODUCTS VALUES(16, '삼겹살', '육류', 16000, TO_DATE('21/01/15 20:15:43', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(17, '목살', '육류', 18000, TO_DATE('21/01/01 02:43:31', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(18, '갈비살', '육류', 22000, TO_DATE('21/04/01 12:27:16', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '호주');
INSERT INTO PRODUCTS VALUES(19, '항정살', '육류', 16000, TO_DATE('21/05/14 11:52:12', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(20, '삼겹살', '육류', 16000, TO_DATE('21/03/22 13:39:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');

INSERT INTO PRODUCTS VALUES(21, '광어', '어류', 12000, TO_DATE('21/01/21 11:54:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(22, '참돔', '어류', 22000, TO_DATE('21/04/25 12:11:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(23, '참치', '어류', 14000, TO_DATE('21/03/12 13:42:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(24, '갈치', '어류', 9000, TO_DATE('21/03/26 14:31:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(25, '우럭', '어류', 13000, TO_DATE('21/03/12 15:06:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(26, '광어', '어류', 12000, TO_DATE('21/03/02 16:03:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(27, '참치', '어류', 14000, TO_DATE('21/03/12 17:16:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(28, '광어', '어류', 12000, TO_DATE('21/03/22 03:22:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(29, '참돔', '어류', 16000, TO_DATE('21/03/12 03:54:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(30, '고등어', '어류', 8000, TO_DATE('21/03/30 05:02:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(31, '광어', '어류', 12000, TO_DATE('21/03/31 07:13:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(32, '고등어', '어류', 8000, TO_DATE('21/02/28 09:31:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(33, '연어', '어류', 11000, TO_DATE('21/01/04 11:23:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(34, '연어', '어류', 11000, TO_DATE('21/01/20 12:43:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(35, '고등어', '어류', 8000, TO_DATE('21/04/27 18:13:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(36, '참치', '어류', 14000, TO_DATE('20/12/18 22:19:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(37, '참치', '어류', 14000, TO_DATE('20/10/01 21:39:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(38, '광어', '어류', 12000, TO_DATE('21/03/05 20:32:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(39, '우럭', '어류', 13000, TO_DATE('21/05/21 18:49:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');
INSERT INTO PRODUCTS VALUES(40, '고등어', '어류', 8000, TO_DATE('21/04/22 19:39:34', 'YY/MM/DD HH24:MI:SS'), NULL, NULL, '한국');