--employees의 직원들이 자신이 받을 수 있는 월급 범위내에서 몇 퍼센트 수준의 월급을 받고있는지 조회해보세요

select * from jobs;
DESC EMPLOYEES;
DESC JOBS;
SELECT 
    first_name, 
    department_id, 
    TO_CHAR(((salary - jobs.min_salary)/(jobs.max_salary - jobs.min_salary) * 100), '999.99') || '%' AS 월급수준
FROM
    employees,
    jobs
WHERE 
    employees.job_id = jobs.job_id
ORDER BY 
    월급수준 DESC;

--강사님답
SELECT 
    first_name, 
    department_id, 
    commission_pct, 
    TO_CHAR(((salary * (1 + NVL(commission_pct, 0)) - jobs.min_salary)/(jobs.max_salary - jobs.min_salary) * 100), '990.99') || '%' AS 월급수준
FROM
    employees INNER JOIN jobs USING(job_id)
ORDER BY 
    월급수준 DESC;
    