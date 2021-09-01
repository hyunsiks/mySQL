/*
    # ANSI JOIN(American National Standards Institute)
     - 미국 국가 표준 협회에서 정한 표준을 따르는 JOIN문법
     - 다른 RDBMS에도 이 문법이 존재한다
*/
--ANSI CROSS JOIN
SELECT * FROM employees CROSS JOIN departments;

--ANSI INNER JOIN : 조건에 맞는 행만 등장하는 조인
SELECT * FROM employees e INNER JOIN departments d ON e.department_id = d.department_id;
    --  JOIN 조건에 이용되는 컬럼명이 같은 경우 USING을 이용해 쿼리문을 간소화 할 수 있다
SELECT
    first_name,
    department_id,
    department_name,
    job_id,
    job_title,
    location_id,
    city
FROM
         employees
    INNER JOIN departments USING ( department_id )
    INNER JOIN jobs USING(job_id)
    RIGHT OUTER JOIN locations USING ( location_id );
--ANSI JOIN을 사용하면 조인 조건과 WHERE조건을 구분하여 사용할 수 있고,
--USING에 사용된 컬럼을 어느 테이블의 컬럼인지 명시할 필요가 없어진다

--ANSI OUTER JOIN : 조건에 맞지 않는 행도 등장하는 조인
    --LEFT OUTER JOIN : (+)가 오른쪽에 있는것 (왼쪽이 OUTER, 다나오는놈이됨)
    --RIGHT OUTER JOIN : (+)가 왼쪽에 있는것 (오른쪽이 OUTER, 다나오는놈이됨)
    --FULL OUTER JOIN : 양쪽이 모두 나오는 아우터조인 양쪽에 (+)를 붙인것과 같다
SELECT 
    e1.employee_id,
    e1.first_name,
    e1.manager_id,
    e2.first_name
FROM employees e1 LEFT OUTER JOIN employees e2 ON e1.manager_id = e2.employee_id; 

-- ANSI JOIN을 이용해 다음 문제들을 풀어보세요 

-- 연습1 : first_name이 Valli인 사람의 사원번호/풀네임/부서명을 조회해보세요
SELECT
    employee_id,
    first_name,
    last_name,
    department_name
FROM
    employees INNER JOIN departments USING(department_id)
WHERE 
    first_name = 'Valli';
    
-- 연습2 : job_id가 IT_PROG인 사원들의 이름/부서번호/부서명을 조회해보세요
SELECT
    first_name,
    last_name, 
    department_id, 
    department_name
FROM
    employees INNER JOIN departments USING(department_id)
WHERE 
    job_id = 'IT_PROG';
    
-- 연습3 : 시애틀에서 근무하는 모든 사원의 이름과 직책과 급여를 출력해보세요
SELECT
    first_name,
    last_name, 
    job_id, 
    salary
FROM --테이블명을 많이 사용해야 하는 경우 별칭 사용 가능
    employees 
    INNER JOIN departments USING (department_id)
    INNER JOIN locations USING (location_id)
WHERE 
    city = 'Seattle';
    
-- 연습4 : 사원명/부서번호/부서이름을 출력하되 사원이 한명도 속하지 않은 부서도 조회해보세요
SELECT
    first_name,
    department_id,
    department_name
FROM
    employees RIGHT OUTER JOIN departments USING (department_id);
    
-- 연습5 : 부서명/주소/도시명을 출력하되 소속된 부서가 없는 도시도 함께 조회해보세요
SELECT
    department_name,
    street_address,
    city
FROM
    departments RIGHT OUTER JOIN locations USING(location_id);










    




