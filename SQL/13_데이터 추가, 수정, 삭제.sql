/*
    # 데이터삽입(INSERT)
     - INSERT INTO 테이블명(컬럼명, ...) VALUES (값, ...)
    
    # 데이터수정(UPDATE)
     - UPDATE 테이블명 SET 컬럼=값 WHERE 조건;
    
    # 데이터삭제(DELETE)
     - DELETE FROM 테이블명 WHERE 조건;
*/
DESC coffees;
--삽입
--  1.모든컬럼에 삽입
INSERT INTO coffees(coffee_id, cname, price) VALUES (1, '아메리카노', 2000);
INSERT INTO coffees(coffee_id, cname, price) VALUES (2, '아이스 아메리카노', 2500);
INSERT INTO coffees(coffee_id, cname, price) VALUES (3, '카페라떼', 3000);
--  2.일부컬럼에 삽입
INSERT INTO coffees(cname) VALUES('팥빙수', 5000);
INSERT INTO coffees(cname, price) VALUES('망고빙수', 5500);
SELECT * FROM COFFEES;
--  3.컬럼명 생략하고 삽입(모든 데이터를 컬럼 순서대로 넣어줘야함)
INSERT INTO coffees VALUES(6, '눈꽃빙수', 6500);
INSERT INTO coffees(price, cname, coffee_id) VALUES(4000, '카페모카', 7);
--  4. INSERT INTO 테이블명(서브쿼리) : 테이블을 똑같이 아래쪽에 붙여넣기됨
INSERT INTO coffees(SELECT * FROM coffees);

--수정
--  1. 모든데이터 한번에 수정 (WHERE 조건을 설정 안함)
UPDATE coffees SET price = 1000;

--  2. 조건에 맞는 데이터 수정 (WHERE 조건 설정 함)
UPDATE coffees SET cname = '인절미빙수' where cname = '팥빙수';

--  3. REPLACE 사용
UPDATE coofees SET cname = replace(cname, '아메리', '이탈리') WHERE cname LIKE '%아메리%';
select * from coffees;

--☆연습1 : 빙수도 아니고, 아메리카노도 아닌 모든 제품들의 가격을 3천원으로 수정해보세요
UPDATE 
    coffees 
SET 
    price = 3000
WHERE
    cname NOT LIKE '%아메리카노%' AND 
    cname NOT LIKE '%빙수%';
 
COMMIT; -- 지금까지의 데이터를 모두 확정한다
ROLLBACK; -- 데이터를 커밋전으로 되돌림
--삭제
--  1. 행전체를 삭제한다 (특정컬럼만 삭제하는 것은 UPDATE에 해당한다)
DELETE FROM coffees WHERE cname LIKE '%아메리카노%';
--  2. 모든행을 삭제한다 (WHERE 조건절 설정 안했을 경우)
DELETE FROM coffees;

