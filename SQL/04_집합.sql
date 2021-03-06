-- UNION : 합집합(중복은 알아서 제거됨)
SELECT * FROM departments WHERE department_id BETWEEN 10 AND 40
UNION
SELECT * FROM departments WHERE department_id BETWEEN 30 AND 50;

-- UNION ALL : 합집합(중복제거안함)
SELECT * FROM departments WHERE department_id BETWEEN 10 AND 40
UNION ALL
SELECT * FROM departments WHERE department_id BETWEEN 30 AND 50;

-- INTERSECT : 교집합
SELECT * FROM departments WHERE department_id BETWEEN 10 AND 40
INTERSECT
SELECT * FROM departments WHERE department_id BETWEEN 30 AND 50;

-- MINUS : 차집합
SELECT * FROM departments WHERE department_id BETWEEN 10 AND 40
MINUS
SELECT * FROM departments WHERE department_id BETWEEN 30 AND 50;