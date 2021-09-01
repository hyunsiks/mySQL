/*
    # 시퀀스
     - 기본키로 사용하기 편하도록 설계된 자동 번호 생성기
     - select * from user_sequences 로 현재 시퀀스 확인할 수 있다(hr계정에서 확인가능)
     - 시퀀스는 한번 지워서 비어있는 번호는 되돌릴수가 없다
     - 현재몇번째 번호까지 사용중인지? : select sodas_currval from dual;
     - 주의! nextval 로 꺼내 쓰는 것이기 때문에 한번 사용하면 돌이킬수 없다
     CREATE SEQUENCE 시퀀스명
                    [START WITH n] : 시퀀스의 시작 번호 설정
                    [INCREMENT BY n] : 시퀀스의 증가값 설정
                    [MAXVALUE n] : 최대값 설정
                    [MINVALUE n] : 최소값 설정
                    [CYCLE | NOCYCLE] : 최대값 도달시 다시 처음으로 돌아갈지말지
                    [CACHE n | NOCACHE] : 메모리상에 미리 만들어 놓을 시퀀스의 개수 설정
*/

-- 시퀀스 데이터 딕셔너리
SELECT * FROM user_sequences;

CREATE TABLE sodas(
    pid NUMBER(4) CONSTRAINT SODA_PID_PK PRIMARY KEY,
    pname VARCHAR2(30) CONSTRAINT SODA_PNAME_NN NOT NULL
); 
INSERT INTO sodas VALUES(1, '사이다');
INSERT INTO sodas VALUES(2, '청포도 에이드');
INSERT INTO sodas VALUES(3, '자몽 에이드');

--시퀀스 만들기
CREATE SEQUENCE sodas_seq START WITH 4 INCREMENT BY 1;

--시퀀스 적용하기
INSERT INTO sodas VALUES(sodas_seq.nextval, '민트초코라떼');
INSERT INTO sodas VALUES(sodas_seq.nextval, '환타');
INSERT INTO sodas VALUES(sodas_seq.nextval, '밀키스');
INSERT INTO sodas VALUES(sodas_seq.nextval, '암바사');

CREATE TABLE soda_categories(
    cafe_id NUMBER(4),
    cafe_name VARCHAR(40),
    CONSTRAINT SC_ID_PK PRIMARY KEY(cafe_id)
);
/*
연습1 : soda_categories 테이블에서 사용할 시퀀스를 생성해보세요
    1. 시작은 10번부터
    2. 10씩 증가할 것
    3. CACHE 10으로 설정
    4. 순환하지 않을 것
    5. 최대값은 9000
    6. 테이블에 데이터 3개 넣을것
*/
CREATE SEQUENCE soda_categories_seq
                START WITH 10
                INCREMENT BY 10
                NOCYCLE
                CACHE 10
                MAXVALUE 9000;
        
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, '스타벅스');       
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, '탐앤탐스'); 
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, '커피빈'); 
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, '별다방'); 
INSERT INTO soda_categories VALUES(SODA_CATEGORIES_SEQ.nextval, '바나프레소'); 
select * from soda_categories;

drop SEQUENCE sodas_seq;
select soda_categories_seq.currval from dual;
purge recyclebin;