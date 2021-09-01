/*
    # 데이터 무결성
    
     - 데이터에는 결점이 없어야 한다는 뜻
     - 개체 무결성
     - 참조 무결성 
     - 도메인 무결성
    
    # 개체 무결성
      - 테이블의 데이터는 반드시 한 행을 구분할 수 있어야 한다
      - 개체 무결성을 지키기 위한 제약 조건으로 PK를 사용한다
    
    # 참조 무결성
      - 참조 관계에 있는 데이터가 항상 일관된 값을 가져야 한다
        (employees의 department_id는 부서테이블의 department_id에 존재하는 값만 사용해야한다) 
      - 참조 무결성을 지키기 위한 제약 조건으로 FK를 사용한다
    
    # 도메인 무결성
      - 해당 컬럼을 구성하는 개체들은 항상 타입이 일정해야한다
      - 테이블 컬럼 타입 설정 및 CHECK를 통해서 도메인 무결성을 지킬 수 있다
    
    # 데이터 무결성 제약 조건
      - NOT NULL : 해당 칼럼에 NULL을 허용하지 않는 규칙
      - UNIQUE : 해당 컬럼에 중복되는 값을 허용하지 않는 규칙, 항상, 유일한 값을 갖도록 한다
      - PRIMARY KEY : 기본키 (NOT NULL + UNIQUE), 테이블당 하나만 설정가능
      - FOREIGN KEY : 외래키
      - CHECK : 원하는 데이터의 조건을 직접 지정하여 도메인 무결성을 유지할 수 있다      
      - DEFAULT : 해당컬럼에 기본값을 설정해놓는 제약조건(NULL대신 DEFAULT로 설정한 값 추가)
    
*/
-- # 제약조건 데이터 딕셔너리를 통해 현재 계정의 모든 제약조건들을 확인할 수 있다
SELECT * FROM USER_CONSTRAINTS; --현재 계정의 제약조건
SELECT * FROM ALL_CONSTRAINTS; --현재 계정으로 볼 수 있는 모든 제약 조건

/*
    # 제약조건 테이블의 CONSTRAINT_TYPE
        P : Primary Key
        R : Foreign Key
        C : Check / NOT NULL
        U : Unique
*/
CREATE TABLE fruits (
    fid NUMBER(2) PRIMARY KEY,
    fname VARCHAR(20) NOT NULL,
    fcolor VARCHAR(20) CHECK(fcolor IN ('RED','GREEN','BLUE')) -- CHECK()내부에 원하는 조건을 추가

);
ALTER TABLE fruits MODIFY(fname VARCHAR(20) UNIQUE);
DESC FRUITS;
SELECT * FROM fruits;

INSERT INTO fruitS VALUES(2, 'APPLE', 'RED');
INSERT INTO fruits VALUES(3, 'BANANA', 'BLUE');
INSERT INTO fruits VALUES(1, 'KIWI', 'GREEN');
INSERT INTO fruits VALUES(4, NULL, 'GREEN');
/*
    # 테이블에 존재하는 제약조건 삭제하는 방법
        - ALTER TABLE 테이블명 DROP CONSTRATINT 제약조건명;
    # 테이블에 제약조건 추가하기
        - 생성과 동시에 제약조건 추가
         (컬럼명 컬럼타입 CONSTRAINT 제야조건명 제약조건타입
        - ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건(적용될컬럼);  : 제약조건명을 내가 스스로 지을수있다
        - ALTER TABLE 테이블명 MODIFY 컬럼명(새로 설정); : 제약조건명은 못짓지만 간편하다
        - 테이블 레벨로 추가하기
*/
ALTER TABLE fruits DROP CONSTRAINT SYS_C007665; -- SELECT * FROM USER_CONSTRAINTS 에서 제약조건명 확인가능
ALTER TABLE fruits DROP CONSTRAINT SYS_C007667;
ALTER TABLE fruits ADD CONSTRAINT f_color_uk UNIQUE(fcolor); --이미 중복된 키가 있기때문에 유니크 설정못함
ALTER TABLE fruits MODIFY(fcolor VARCHAR(20) NOT NULL);
ALTER TABLE fruits ADD CONSTRAINT FRUITS_FID_PK PRIMARY KEY(fid);

--생성할때 제약조건 만드는법
CREATE TABLE fruits2(
    fid NUMBER(4)       CONSTRAINT FRUITS2_FID_PK PRIMARY KEY,
    fname VARCHAR2(20)  CONSTRAINT FRUITS2_FNAME_NN NOT NULL
                        CONSTRAINT FRUITS2_FNAME_UK UNIQUE,
    fcolor VARCHAR2(10) CONSTRAINT FRUITS2_FCOLOR_NN NOT NULL,
    fsize CHAR(1)       CONSTRAINT FRUITS2_FSIZE_CH CHECK(fsize IN('L', 'N', 'S'))
);

--생성후에 제약조건 넣는법(NOT NULL과 CHECK는 ADD CONSTRAINT 대신 MODIFY를 이용해서 추가/수정해야한다
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_FID_PK PRIMARY KEY(fid);
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_FNAME_UK UNIQUE(fname);
ALTER TABLE fruits3 MODIFY (fname VARCHAR(20) CONSTRAINT FRUITS3_FNAME_NN NOT NULL);
ALTER TABLE fruits3 MODIFY (fcolor VARCHAR(20) CONSTRAINT FRUITS3_FNAME_NN NOT NULL);
ALTER TABLE fruits3 MODIFY (fsize CHAR(1) CONSTRAINT FRUITS3_FSIZE_CH CHECK (fsize IN('L', 'N', 'S')));

DESC FRUITS2;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'FRUITS2';
SELECT * FROM USER_CONSTRAINTS WHERE OWNER = 'JAVA1';

--DEFAULT 제약 조건
ALTER TABLE fruits2 ADD(fprice NUMBER(7) DEFAULT 0);
ALTER TABLE fruits2 MODIFY(fprice NUMBER(7) DEFAULT 10);

/*
    # Foreign Key 제약 조건
     - 제약 조건을 설정할 때 어떤 테이블의 어떤 컬럼을 참조할지 반드시 지정해야 한다
       다른 테이블의 PK또는 UK제약조건이 걸린 컬럼만 지정할 수 있다
*/
CREATE TABLE fruit_locations(
    lid NUMBER(2),
    addr VARCHAR(200),
    city VARCHAR(40)
);

INSERT INTO fruit_locations VALUES(10, '충청북도 청주시', '청주'); 
INSERT INTO fruit_locations VALUES(20, '경상북도 안동시', '안동'); 
INSERT INTO fruit_locations VALUES(30, '전라남도 고흥군', '고흥'); 
INSERT INTO fruit_locations VALUES(40, '충청남도 논산시', '논산'); 

-- UNIQUE 또는 PRIMARY KEY 제약 조건이 걸리지 않은 컬럼은 외래키로 참조될 수 없다
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
    # 제약조건 추가하는 방법3 (테이블 레벨로 추가하기)
     - 컬럼을 모두 정의한 CREATE TABLE의 맨 뒤에 따로 제약조건을 지정하는 방식
     - DEFAULT와 NOT NULL은 테이블 레벨 방식으로 정의할 수 없다
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
    # 1:N 관계를 가지는 두 테이블을 생성한 후 제약조건을 설정해보세요
    # 여태까지 배운 모든 제약조건을 최소한번이상 사용/ 데이터 최소 3개이상
*/
CREATE TABLE gym(
    gym_id VARCHAR(5) CONSTRAINT GYM_GID_PK PRIMARY KEY,
    customer_id VARCHAR(5) CONSTRAINT GYM_CID_UK UNIQUE,
                           CONSTRAINT GYM_CID_FK FOREIGN KEY(customer_id) REFERENCES CUSTOMERS,
    regist_period VARCHAR(10) CONSTRAINT GYM_RPD_NN NOT NULL,
    teacher VARCHAR(15) CONSTRAINT GYM_RPD_CH CHECK (teacher LIKE '김%' OR teacher LIKE '이%' OR teacher LIKE '박%'),
    pt CHAR(1) CONSTRAINT GYM_PT_CH CHECK (pt IN('Y', 'N'))
);
INSERT INTO gym VALUES(1, 10, 30, '김현식', 'Y');
INSERT INTO gym VALUES(2, 20, 60, '박현준', 'N');
INSERT INTO gym VALUES(3, 30, 90, '이상해', 'N');
INSERT INTO gym VALUES(4, 40, 40, '김홍홍', 'Y');

SELECT * FROM GYM;
DROP TABLE GYM;
select * from customers;

CREATE TABLE customers(
    customer_id VARCHAR(5) CONSTRAINT CUS_CID_PK PRIMARY KEY,
    pay_money VARCHAR(20) CONSTRAINT CUS_PMY_NN NOT NULL,
    phone_number VARCHAR(15),
    purpose_excercise VARCHAR(100)
);
INSERT INTO customers VALUES(10, 100000, '010-1234-1234', '다이어트');
INSERT INTO customers VALUES(20, 150000, '010-3242-1234', '근력');
INSERT INTO customers VALUES(30, 130000, '010-3252-1234', '근력');
INSERT INTO customers VALUES(40, 200000, '010-5252-1127', '다이어트');

SELECT * FROM gym INNER JOIN customers USING(customer_id);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'GYM';

SELECT * FROM fruits4;
DESC FRUITS4;
SELECT * FROM fruit_locations;

--FK삭제시 무결성 위반하는 문제 (다른테이블에서 참조되는 자식 레코드가 있기때문)
INSERT INTO FRUITS4 VALUES (1, '사과', 'RED', 'L', 2000, 10);
COMMIT;
DELETE FROM FRUIT_LOCATIONS WHERE LID = 10;

/*
    # ON DELETE 제약조건
        - 자식 레코드가 참조하고 있는 부모 레코드를 삭제하려고 할 때 어떻게할지를 결정할 수 있다
        - CASCADE, SET NULL, RESTRICT
    
    # ON DELETE CASCADE
        - 부모 레코드를 삭제하면 자식 레코드를 모두 함께 삭제한다
    
    # ON DELETE SET NULL
        - 부모 레코드를 삭제하면 참조하던 자식 레코드의 값을 NULL로 변경한다
    
    # RESTRICT
        - 자식 레코드가 있으면 부모 레코드를 삭제할 수 없게한다
*/













