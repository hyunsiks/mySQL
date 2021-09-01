/* 
    ※ 기본키(Primary Key, PK)
    ※ 외래키(Foreign Key, FK)
*/
/*
    ※ 조인 : 기본키와 외래키로 관계가 형성되어 있는 테이블들의 정보를 종합하여 조회하는 것
*/
--  1. CROSS JOIN : 모든데이터
--   - 조인에 사용되는 테이블들의 데이터를 조합하여 나올 수 있는 모든 경우를 출력하는 JOIN
--   - 그냥 모든 경우를 출력하는 쓸모없는 정보
SELECT * FROM employees; -- 107rows
SELECT * FROM departments; -- 27rows
SELECT * FROM employees, departments; -- 107 * 27 rows

--  2. EQUI JOIN(등가조인) : 조건식에 '='을 사용
--   - 두 테이블 간에 서로 동일한 값을 지닌 컬럼(기본키와 외래키)을 이용하여
--     CROSS JOIN의 결과에서 의미있는 데이터만 걸러내는 JOIN
SELECT * FROM employees,departments WHERE employees.department_id = departments.department_id;

--연습1 : first_name이 Valli인 사람의 사번/풀네임/부서명을 조회
DESC employees;
DESC departments;
SELECT
    employee_id,
    first_name,
    last_name,
    department_name
FROM
    employees,
    departments
WHERE 
    first_name = 'Valli' AND
    employees.department_id = departments.department_id;
    
    
--연습2 : job_id가 IT_PROG인 사람들의 이름/부서번호/부서명을 조회
SELECT
    first_name,
    last_name, 
    employees.department_id, 
    department_name
FROM
    employees,
    departments
WHERE 
    job_id = 'IT_PROG' AND
    employees.department_id = departments.department_id;

--연습 3 : 시애틀에서 근무하는 모든 사원의 이름과 직책과 급여를 출력해보세요(Hint, locations테이블)
DESC locations;
SELECT * FROM locations;
SELECT
    first_name,
    last_name, 
    job_id, 
    salary
FROM --테이블명을 많이 사용해야 하는 경우 별칭 사용 가능
    employees e,
    locations l,
    departments d
WHERE 
    city = 'Seattle' AND
    e.department_id = d.department_id AND
    d.location_id = l.location_id;

--  3. SELF JOIN : 
--   - 하나의 테이블 내에서 자기 자신과 JOIN하여 원하는 데이터를 얻어내는 조인 방식
SELECT
    e1.employee_id,
    e1.first_name,
    e1.job_id,
    e1.manager_id,
    e2.first_name AS "MANAGER_NAME"
FROM
    employees e1, employees e2 --SELF JOIN은 테이블 별칭을 사용할 수 밖에 없다
WHERE
    e1.manager_id = e2.employee_id
ORDER BY
    e1.employee_id;
    
--연습1 : 매니저 이름이 Nancy인 사원들의 사번/이름/job_title을 조회해보세요
DESC EMPLOYEES;
DESC DEPARTMENTS;
DESC JOBS;
SELECT
    e1.employee_id,
    e1.first_name,
    job_title
FROM 
    employees e1,
    employees e2,
    jobs
WHERE 
    e2.first_name = 'Nancy' AND
    e1.manager_id = e2.employee_id AND
    jobs.job_id = e1.job_id;

--연습2 : Curtis와 동일한 직책을 가진 사원들의 모든 정보를 조회해보세요
SELECT
    e1.*
FROM 
    employees e1,
    employees e2
WHERE 
    e2.first_name = 'Curtis' AND
    e1.job_id = e2.job_id AND
    e1.first_name != 'Curtis';
    
-- 4. OUTER JOIN
--  - 
--  - (+)를 붙인쪽의 칼럼에 NULL을 추가해서 등장하지 못했던 행들을 확인할 수 있다
SELECT
    employee_id,
    first_name,
    e.department_id,
    d.department_id
FROM
    employees e,
    departments d
WHERE
    e.department_id = d.department_id(+);

SELECT
    e1.employee_id,
    e1.first_name,
    e1.manager_id,
    e2.employee_id,
    e2.first_name
FROM
    employees e1,
    employees e2
WHERE
    e1.manager_id = e2.employee_id(+)
ORDER BY e1.employee_id;
/*
    오른쪽(+) : e1.manager_id는 있지만, e2에 일치하는 값이 없어서 출력되지 못한 행을 출력
                - manager_id가 잘못된 경우, null, 메니저를 null로 설정한 경우
    왼쪽(+) : e2.employee_id는 있지만, e1.manager_id에 일치하는 값이 없어서 출력되지 못한 행을 출력
                - 직원이지만, 부하직원은 없는 경우가 추가되어 출력됨
*/
--연습1 : 사원명/부서번호/부서이름을 출력하되 사원이 한명도 속하지 않은 부서도 조회해보세요
desc employees;
desc departments;
SELECT
    first_name,
    d.department_id,
    department_name
FROM
    employees e,
    departments d
WHERE
    e.department_id(+) = d.department_id;

--연습2 : 사원명/직책id/직책명을 출력하되 사원이 한명도 속하지 않은 직책도 함께 조회해보세요
desc jobs;
SELECT
    first_name,
    j.job_id,
    job_title
FROM
    employees e,
    jobs j
WHERE
    e.job_id(+) = j.job_id;
    
--연습3 : 부서명/주소/도시명을 출력하되 소속된 부서가 없는 도시도 함께 조회해보세요
desc locations;
SELECT
    department_name,
    street_address,
    city
FROM
    departments d,
    locations l
WHERE
    d.location_id(+) = l.location_id;
