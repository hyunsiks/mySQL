/*
    # 서브쿼리
     - 하나의 SELECT문 내부에 포함된 또 하나의 SELECT문
     - 서브쿼리를 포함하고 있는 쿼리를 메인 쿼리라고한다
     - 서브쿼리는 메인쿼리가 실행되기 전에 한번만 실행된다
    
    # 단일행 서브쿼리
     - 서브쿼리의 수행결과가 단 하나의 행만 반환하는 서브쿼리
     - =, >, <, <-, >= 등의 비교연산자들은 단일 값끼리 비교하는연산자이므로
     - 단일행 서브쿼리와함께 사용해야 한다
    # 다중행 서브쿼리
     - 서브 쿼리의 실행 결과로 반환되는 행이 2줄 이상인 서브 쿼리
     - 다중행 연산자와함께 사용해야 한다
     - IN : 여러개의 값들 중 포함되어 있으면 참
     - ANY,SOME : 여러개의 값들 중 하나 이상 만족시키면 참
     - ALL : 여러개의 값들 모두 만족 시켜야 참
     - EXISTS : 서브쿼리의 실행결과가 존재하면 참
*/
--Sigal과 같은 부서에 근무하는 모든 사원을 조회해보기
SELECT
    *
FROM
    employees
WHERE
    department_id = (
        SELECT
            department_id
        FROM
            employees
        WHERE
            first_name = 'Sigal'
    );
    
--서브쿼리의 실행 결과
SELECT department_id FROM employees WHERE first_name = 'Sigal';

--연습1 EMAIL이 DRAPHEAL인 사원보다 급여를 많이 받는 사원들의 이름/직책/급여를 조회해보세요
DESC employees;
SELECT
    first_name,
    job_id,
    salary
FROM 
    employees
WHERE
    salary > (SELECT salary from employees WHERE email = 'DRAPHEAL');
    
--연습2 : Purchasing 부서에서 근무하는 사원들의 이름/직책/부서번호 조회
desc jobs;
select * from departments;
SELECT
    first_name,
    job_id,
    department_id
FROM
    employees
WHERE
    department_id = (SELECT department_id FROM departments WHERE department_name = 'Purchasing');
    
--다중행 서브쿼리 예제!!!!!!!!!!!!!!!!!!!!!!!!
--급여가 13000$ 이상인 사원이 소속된 부서에서 근무하는 모든 사원을 조회
--IN연산자
SELECT
    employee_id,
    first_name,
    department_id
FROM
    employees
WHERE department_id  in (SELECT department_id FROM employees WHERE salary >= 13000)
ORDER BY
    department_id;

--ALL연산자
SELECT
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING(job_id)
WHERE -- 프로그래머 중 가장 높게 받는 놈보다 높으면 참(모두 만족시켜야 참)
    salary > ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG');

--ANY, SOME연산자
SELECT
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING(job_id)
WHERE -- 프로그래머 중 가장적게 받는 놈보다 높으면 참(한놈이라도 만족하면 참)
    salary > ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG');

--EXIST 연산자
SELECT * FROM employees e1 WHERE NOT EXISTS(SELECT 1 FROM employees e2 WHERE e1.salary < e2.salary);