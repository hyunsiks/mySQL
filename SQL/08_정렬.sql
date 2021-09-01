/*
    # ORDER BY 컬럼명 [ASC|DESC]
*/

SELECT * FROM employees; --기본적으로는 PK순서로 조회된다
-- ORDER BY를 사용하여 정렬을 할 수 있다
-- 원하는 컬럼 기준으로 정렬
-- ASC : ASCENDING 오름차순
-- DESC : DESCENDING 내림차순

SELECT * FROM employees ORDER BY first_name ASC;