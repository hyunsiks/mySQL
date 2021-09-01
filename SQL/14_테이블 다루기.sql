/*
    # 서브쿼리로 테이블 복사하기 
     - CREATE TABLE 테이블명 AS (서브쿼리)로 테이블을 생성할 수 있다
*/
CREATE TABLE coffees2 AS (SELECT * FROM coffees);
select * from coffees2;

CREATE TABLE bingsu AS (SELECT * FROM coffees WHERE cname LIKE '%빙수%');
SELECT * FROM BINGSU;

/*
    # 테이블에 새 컬럼 추가하기
     -ALTER TABLE 테이블명 ADD (컬럼명 컬럼타입, ...) : 새로운 컬럼을 추가한다
*/
ALTER TABLE bingsu ADD (sirup VARCHAR2(20));

/*
    # 테이블의 컬럼 이름 변경하기
     - ALTER TABLE 테이블명 RENAME COLUMN 현재이름 TO 바꿀이름;
*/
ALTER TABLE bingsu RENAME COLUMN sirup TO syrup;

/*
    # 테이블의 컬럼 타입 변경하기
     - ALTER TABLE 테이블명 MODIFY(컬럼명 컬럼타입, ...);
*/
ALTER TABLE bingsu MODIFY(cname VARCHAR2(60));

/*
    # 테이블 이름 변경하기
     - RENAME 현재테이블명 TO 바꿀테이블명;
*/
RENAME bingsu TO bingsoo;
RENAME bingsoo TO bingsu;

/*
    # 컬럼 삭제하기
     - ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
*/
ALTER TABLE bingsu DROP COLUMN syrup;

SELECT * FROM ALL_TABLES WHERE OWNER = 'JAVA1';

