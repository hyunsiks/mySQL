--employees�� �������� �ڽ��� ���� �� �ִ� ���� ���������� �� �ۼ�Ʈ ������ ������ �ް��ִ��� ��ȸ�غ�����

select * from jobs;
DESC EMPLOYEES;
DESC JOBS;
SELECT 
    first_name, 
    department_id, 
    TO_CHAR(((salary - jobs.min_salary)/(jobs.max_salary - jobs.min_salary) * 100), '999.99') || '%' AS ���޼���
FROM
    employees,
    jobs
WHERE 
    employees.job_id = jobs.job_id
ORDER BY 
    ���޼��� DESC;

--����Դ�
SELECT 
    first_name, 
    department_id, 
    commission_pct, 
    TO_CHAR(((salary * (1 + NVL(commission_pct, 0)) - jobs.min_salary)/(jobs.max_salary - jobs.min_salary) * 100), '990.99') || '%' AS ���޼���
FROM
    employees INNER JOIN jobs USING(job_id)
ORDER BY 
    ���޼��� DESC;
    