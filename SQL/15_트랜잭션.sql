/*
    # 트랜잭션 (Transaction)
     - 데이터 처리의 한 단위
     - 하나의 논리적인 작업이 완전하게 마무리 될 때 까지의 절차
        ex) 송금 트랜잭션(1,2를 합쳐서 하나의 트랜잭션이라고하는것)
            1. 보내는 사람의 통장에서 돈이 줄어든다
            2. 받는 사람의 통장의 돈이 늘어난다
     - 하나의 트랜잭션은 여러 명령어의 집합이다
     - 트랜잭션의 모든 과정이 정상적으로 완료되는 경우에만 변경 사항을 확정짓는다(All or Nothing)
     - 트랜잭션을 관리하기 위해 사용되는 TCL로는 COMMIT, ROLLBACK, SAVEPOINT등이 있다
     - 트랜잭션은 마지막으로 실행된 커밋(또는 롤백)이후 부터 새로운 커밋을 실행하는 
       시점까지 수행하는 모든 DML을 의미한다.(즉 DDL은 롤백의 대상이 아니다, CREATE등은 롤백안됨)
*/
-- SAVEPOINT(save01에 저장하고 롤백을 이쪽으로 하면 save01이후의 모든 내용은 사라짐)
SAVEPOINT save01;
INSERT INTO coffees(coffee_id,coffee_name) VALUES (100, '감자탕');
ROLLBACK TO save01;

SELECT * FROM COFFEES;

COMMIT;

SELECT * FROM coffees;
TRUNCATE TABLE coffees; -- 테이블의 모든 내용을 자른다. DROP TABLE과는 다르게 구조는 남긴다. 롤백안된다
ROLLBACK;

DESC COFFEES;

--연습1 : COFFEES 테이블에 새로운 컬럼을 추가해보세요
ALTER TABLE coffees ADD(kcal NUMBER(5));
ALTER TABLE coffees ADD(origin_id NUMBER(4));
ALTER TABLE coffees ADD(bitter VARCHAR2(15));
ALTER TABLE coffees ADD(BEST CHARACTER);

--연습2 : 컬럼의 이름도 몇개 변경해보세요
ALTER TABLE coffees RENAME COLUMN cname TO coffee_name;

--연습1 : INSERT문을 사용해 제대로 된 메뉴를 5개 이상 넣어보세요(그리고 쿼리를 저한테 보내주세요)
INSERT INTO coffees VALUES(1, '아메리카노', 2000, 30, 5, '☆☆☆', 'Y');
INSERT INTO coffees VALUES(2, '카라멜마끼야또', 320, 220, 3, '☆', 'N');
INSERT INTO coffees VALUES(3, '카페라떼', 4000, 150, 5, '☆☆', 'N');
INSERT INTO coffees VALUES(4, '콜드브루', 3500, 40, 4, '☆☆☆', 'Y');
INSERT INTO coffees VALUES(5, '에스프레소', 1000, 15, 2, '☆☆☆☆☆', 'N');



INSERT INTO coffees VALUES(1, '아메리카노', 2000, 30, 5, '☆☆☆', 'Y');
INSERT INTO coffees VALUES(2, '아이스 아메리카노', 2000, 35, 5, '☆☆☆', 'Y');
INSERT INTO coffees VALUES(3, '카페라떼', 3000, 150, 3, '☆☆', 'N');
INSERT INTO coffees VALUES(4, '아인슈페너', 8000, 350, 2, '☆', 'N');
INSERT INTO coffees VALUES(5, '카푸치노', 6500, 170, 4, '☆☆', 'N');
INSERT INTO coffees VALUES(6, '카페 비엔나', 7000, 210, 4, '☆☆', 'Y');
INSERT INTO coffees VALUES(7, '에스프레소', 1500, 15, 5, '☆☆☆☆☆', 'N');
INSERT INTO coffees VALUES(8, '콜드 브루', 5000, 40, 3, '☆☆☆☆', 'Y');
INSERT INTO coffees VALUES(9, '에스프레소 콘파나', 5000, 290, 3, '☆☆☆☆', 'N');
INSERT INTO coffees VALUES(10, '카페오레', 4500, 340, 2, '☆☆☆', 'N');
INSERT INTO coffees VALUES(11, '카푸치노', 4500, 140, 4, '☆☆☆', 'N');
INSERT INTO coffees VALUES(12, '비너 멜랑쉬', 7500, 240, 5, '☆☆', 'N');
INSERT INTO coffees VALUES(13, '크랜베리아몬드 쿠기', 3500, 40, 3, '☆', 'N');
INSERT INTO coffees(coffee_id,coffee_name,price,kcal) VALUES(14, '모카초코칩 쿠키', 3500, 160);
INSERT INTO coffees(coffee_id,coffee_name,price,kacl) VALUES(15, '더블초코칩 쿠키', 3500, 180);
INSERT INTO coffees(coffee_id,coffee_name,price,kcal) VALUES(16, '치즈 케이크', 4500, 400);
INSERT INTO coffees(coffee_id,coffee_name,price,kcal) VALUES(17, '초코무스 케이크', 4500, 450);

update coffees set origin_id = null, bitter = null, best = null where coffee_id = 13; 
update coffees set kcal = 140 where coffee_id = 13;
select * from coffees; 

--테이블하나 만들어보기
