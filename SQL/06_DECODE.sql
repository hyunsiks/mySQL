/*
    # DECODE
    
     - 코드값을 통해 데이터를 찾는다
     - switch case 같은 역할을 한다
*/
SELECT * FROM employees;
SELECT
    last_name,
    department_id,
    DECODE(department_id,
    90, '물류',
    100, '지원',
    60, '경영'
    ) AS department_name
FROM
    employees;
    
/*
연습1 : 직급에 따라 급여를 다르게 인상하여 출력해보세요
    IP_PROG : 15%
    FI_ACCOUNT : 10%
    모든 종류의 CLERK : 5% 인상
원래의 급여는 before_salary로 인상된 급여는 after_salary로 이름과 함께 출력
*/
DESC EMPLOYEES;

SELECT SALARY * (1.05) as after_salary FROM EMPLOYEES WHERE JOB_ID = 'PU_CLERK';

SELECT
    last_name,
    job_id,
    salary        AS before_salary,
    nvl(decode(job_id, 'IP_PROG', salary *(1.15), 'FI_ACCOUNT', salary *(1.1)),
        salary)   AS after_salary
FROM
    employees WHERE job_id NOT LIKE '%CLERK%'
UNION
SELECT
    last_name,
    job_id,
    salary               AS before_salary,
    salary * ( 1.05 )      AS after_salary
FROM
    employees
WHERE
    job_id LIKE '%CLERK%';

SELECT SALARY FROM employees;

/*
    # DECODE는 해당 컬럼의 값과 정확하게 일치하는 값만 이용할 수 있지만
      CASE는 조건을 사용할 수 있다      
*/
SELECT
    last_name,
    job_id,
    salary AS before_salary,
    CASE
        WHEN job_id = 'IT_PROG' THEN salary * 1.15
        WHEN job_id = 'FI_ACCOUNT' THEN salary * 1.1
        WHEN job_id LIKE '%CLERK%' THEN salary * 1.05
        ELSE salary 
    END AS after_salary
FROM employees;

