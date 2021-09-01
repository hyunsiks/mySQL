/*
    # SELECT 컬럼명 FROM 테이블명;
    
     - 데이터를 조회하는 쿼리문(질의문)
       컬럼명 자리에 *를 쓰는 것은 모든 컬럼을 뜻한다
     - 컬럼명/테이블명은 대소문자를 구분하지 않는다
     - 쿼리문도 대소문자를 구분하지 않는다
     - 데이터는 대소문자를 구분한다(★중요!!!)
*/
-- tab, tabs로 어떤 테이블들이 있는지 확인할 수 있다
SELECT * FROM tab;
SELECT * FROM tabs;
SELECT table_name FROM tabs;

-- *를 적으면 모든 컬럼을 조회하고, 컬럼명을 적으면 해당 컬럼만 조회한다
SELECT * FROM employees;
SELECT first_name, salary FROM employees;

/*
    # 연습용 테이블 설명
    
     employees : 직원 정보를 저장한 테이블
     deplartments : 부서 정보를 저장한 테이블
     jobs : 직급 정보를 저장한 테이블
     locations : 지역 정보를 저장한 테이블
     countries : 국가 정보를 저장한 테이블
     regions : 대륙 정보를 저장한 테이블
*/
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM jobs;
SELECT * FROM countries;
SELECT * FROM regions;

-- 테이블 컬럼 정보 보기
DESC employees;

/* 타입
    # NUMBER(n), NUMBER(n, m)
        - 숫자 데이터만 저장할 수 있는 컬럼
        - 숫자가 하나만 적혀있으면 정수타입, 두개 적혀있으면 실수타입
        - NUMBER(10) : 10자리 정수를 저장하는 컬럼
        - NUMBER(10,4) : 6자리 정수와 소수점 4자리를 저장하는 컬럼이 된다
    
    # VARCHAR2(n)
        - 가변 길이 문자 데이트를 저장하는 컬럼 타입
        - 저장된 데이터의 크기에 따라 알맞은 공간만 사용한다
        - VARCHAR2(10)으로 설정된 컬럼의 데이터로 2글자가 들어오면 2바이트만 사용한다
        - 데이터절약에 좋지만 , 속도가 CHAR에 비해 약간느림
    
    # CHAR(n)
        - 고정 길이 문자 데이터를 저장하는 컬럼 타입(컬럼이 무조건 같은 길이라면 속도가 VARCHAR보다 빠르다)
        - 설정된 길이보다 적은 양의 데이터가 들어오더라도 설정된 길이를 모두 차지한다
        - CHAR(10)으로 설정된 컬럼의 데이터로 2글자가 들어오면 10바이트를 모두 사용한다
        - 데이터가 낭비될 수는 있지만 크기 계산이 없기 때문에 속도가 더 빠르다

    # DATE
        - 날짜 및 시간을 저장하는 컬럼 타입
*/
-- 연습 1 : 모든 사원의 사번/이름/월급/부서번호를 조회해보세요
DESC EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES;

-- 검색한 컬럼명 바꾸어 조회하기 (AS 이용하여 이름바꾸기)
SELECT SALARY AS 급여 FROM EMPLOYEES;

-- 산술 연산자를 이용해 계산된 값 출력하기
SELECT LAST_NAME, SALARY FROM EMPLOYEES;
SELECT LAST_NAME, SALARY + 500 FROM EMPLOYEES;
SELECT LAST_NAME, SALARY * 2 FROM EMPLOYEES;
SELECT LAST_NAME, SALARY * 0.9 AS 삭감된월급 FROM EMPLOYEES;
SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES;
SELECT LAST_NAME, SALARY *(1 + COMMISSION_PCT) FROM EMPLOYEES;
-- NULL값과 기본값과 곱하게 되면 그냥 NULL값이 나와버린다

-- NVL(컬럼명, 대체값) : 해당 컬럼에서 NULL값이 나왔을 때 대체값을 사용한다
SELECT LAST_NAME, SALARY *(1 + NVL(COMMISSION_PCT, 0)) AS 보너스적용 FROM EMPLOYEES;

--연습2 : 모든 사원들의 사번/가족이름/연봉을 출력해보세요(salary는 월급입니다, 별칭사용할것)
DESC EMPLOYEES;
SELECT
    EMPLOYEE_ID AS 사번,
    LAST_NAME AS 가족이름,
    SALARY * 12 *(1 + NVL(COMMISSION_PCT, 0)) AS 연봉
FROM EMPLOYEES;

-- SELECT DISTINCT : 중복되는 내용이 여러개 있어도 한번만 줄력된다
-- emplotees에 존재하는 모든 직책을 보고싶은 경우
SELECT DISTINCT JOB_ID FROM EMPLOYEES;
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;
SELECT DISTINCT MANAGER_ID FROM EMPLOYEES;