/*
    # 그룹 함수(GROUP BY)
    
     - 여러 행의 값을 특정 컬럼을 기준으로 그룹화 하는 함수들
     - 특정 집단의 총합, 개수, 평균 등을 구할 수 있다
     - 그룹의 기준이 되는 컬럼은 GROUP BY절을 통해 선택한다
     - 그룹함수의 결과는 일반 컬럼과 함께 출력될 수 없다
*/
SELECT SUM(salary) FROM employees;

SELECT job_id, SUM(salary) FROM employees GROUP BY job_id;
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id;

-- SUM(column) : 그룹 별로 해당 컬럼의 총 합을 구한다
SELECT department_id, SUM(salary) FROM employees GROUP BY department_id;
-- MAX(),MIN() : 최대, 최소값
SELECT job_id, MAX(salary) FROM employees GROUP BY job_id;
-- count() : 개수
SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;

--연습1 : 부서별로 가장 최근에 입사한 사원과 가장 오래전에 입사한 사원의 날짜를 출력해주는 쿼리문작성
SELECT 
    department_id,
    max(hire_date) AS 최근입사, 
    min(hire_date) AS 오래전입사
FROM 
    EMPLOYEES
GROUP BY 
    department_id;
--연습2 : 보너스를 받는 사원이 각 부서에 몇명 있는지 세어보는 쿼리문을 작성
DESC EMPLOYEES;
SELECT 
    department_id, 
COUNT (
    CASE
        WHEN commission_pct IS NOT NULL THEN
            employee_id
    END
)
FROM 
    EMPLOYEES
GROUP BY 
    department_id;

--연습3 : 각 직책별 평균 연봉을 구해보세요
DESC EMPLOYEES;

SELECT
    job_id,
    TO_CHAR(AVG(salary * 12 * nvl(1 + commission_pct, 1)), '999999.99')
FROM 
    EMPLOYEES
GROUP BY 
    JOB_ID;

--GROUP BY로 나누어진 그룹에 조건을 주고 싶을 때는 HAVING절을 이용
--WHERE는 그룹이 생성되기 전에 모든 행에 적용되는 조건이다
SELECT 
    job_id, 
    count(*) 
FROM employees 
GROUP BY job_id HAVING count(*) < 5;

SELECT 
    job_id, 
    count(*)
FROM employees 
WHERE SALARY <= 5000 GROUP BY job_id HAVING count(*) < 5;

--연습1 : 부서별 최대급여와 최소급여를 출력하되 최대 급여가 5000이상인 부서만 출력
SELECT
    department_id,
    max(salary) AS 최대급여,
    min(salary) AS 최소급여
FROM
    employees
GROUP BY
    department_id
HAVING 
    max(salary) >= 5000;

--연습2 : 부서별 평균 급여를 출력하되 해당 부서에 소속된 사원이 10명 이산인 부서만 출력해보세요
SELECT 
    TO_CHAR(AVG(SALARY), 99999999.99) AS 평균급여
FROM 
    employees 
GROUP BY department_id HAVING count(*) >= 10;