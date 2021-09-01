/*
    # SELECT 문에 WHERE 절을 추가하여 해당 조건을 만족하는 데이터만 조회할 수 있다
    ex) SELECT 컬럼명 FROM 테이블명 WHERE 조건절;
*/

-- 월급이 15000원 이하인 사원들만 조회하기
SELECT * FROM EMPLOYEES WHERE SALARY >= 15000;
/*
    # 오라클의 비교 연산자들
     = : 같다
     <, >, <=, >= : 비교
     !=, <>, ^= 다르다
*/
SELECT * FROM EMPLOYEES WHERE SALARY != 17000;

-- 오라클의 문자열 리터럴은 ''만 사용한다(""안됨)
SELECT * FROM EMPLOYEES WHERE LAST_NAME = 'Smith';

-- 날짜 타입도 가볍게 비교가 가능하다
SELECT * FROM EMPLOYEES WHERE HIRE_DATE < '2004/01/01';

-- AND, OR, NOT
SELECT * FROM EMPLOYEES WHERE HIRE_DATE > '2005/01/01' AND HIRE_DATE < '2005/05/01';
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'ST_CLERK';

--연습1 : 2000에서 3000사이의 월급을 받는 모든 사원들을 조회해보세요
SELECT * FROM EMPLOYEES WHERE SALARY > 2000 AND SALARY < 3000;

--연습2 : 부서번호가 30번이거나 60번이거나 90번인 사원들의 
--        /이름/직책/전화번호를 조회해보세요
DESC EMPLOYEES
SELECT
    first_name    AS 이름,
    job_id        AS 직책,
    phone_number  AS 전화번호
FROM
    employees
WHERE
    department_id = 30
    OR department_id = 60
    OR department_id = 90;
    
-- 사번이 짝수인 사원만 조회해보기
SELECT * FROM EMPLOYEES WHERE MOD(EMPLOYEE_ID, 2) = 0;

-- 컬럼명 BETWEEN A AND B : 해당 컬럼 값이 A이상 B이하인 경우 TRUE
SELECT
    *
FROM
    employees
WHERE
    salary BETWEEN 2000 AND 3000;

-- 컬럼명 IN (A,B,C...) :()안의 내용에 값이 존재하는 경우 TRUE
SELECT
    *
FROM
    employees
WHERE
    department_id IN ( 30, 60, 90 );

-- 커미션 퍼센트가 NULL인 사원을 모두 조회해보기
SELECT
    *
FROM
    employees
WHERE
    commission_pct IS NULL;
    
-- NOT
SELECT * FROM employees WHERE department_id NOT IN ( 30, 60, 90 );
SELECT * FROM employees WHERE NOT department_id IN ( 30, 60, 90 );

/*
    # LIKE
     - 데이터의 일부분으로 원하는 내용을 검색할 수 있다
     - 문자타입과 날짜타입에 사용할 수 있다
     - % : 길이 제한 없이 아무 문자열이나 와도 되는 와일드카드(심지어 없는것도 가능)
     - _ : 하나의 아무 문자가 반드시 와야하는 와일드카드
*/
-- 이름이 J로 시작하는 모든 사원을 조회 하고 싶을때
SELECT first_name FROM EMPLOYEES WHERE FIRST_NAME LIKE 'J%';
-- 이름의 두번째 글자가 U인 모든 사원을 조회
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '_u%';
-- 이름의 세번째 글자가 e인 모든 사원을 조회
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '__e%';
-- 이름에 x가 포함되어 있는 모든 사원을 조회
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%x%';

--연습1 : 이름의 뒤에서 3번째 글자가 a인 모든 사원을 조회해보세요
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%a__';
--연습2 : 이름에 e가 두개이상 포함된 모든 사원을 조회해보세요
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%e%e%' or FIRST_NAME LIKE 'E%e%';
--연습3 : 이름이 다섯 글자이면서 a로 끝나는 모든 사원을 조회해보세요
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '____a';