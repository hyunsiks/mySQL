/*
    # DECODE
    
     - �ڵ尪�� ���� �����͸� ã�´�
     - switch case ���� ������ �Ѵ�
*/
SELECT * FROM employees;
SELECT
    last_name,
    department_id,
    DECODE(department_id,
    90, '����',
    100, '����',
    60, '�濵'
    ) AS department_name
FROM
    employees;
    
/*
����1 : ���޿� ���� �޿��� �ٸ��� �λ��Ͽ� ����غ�����
    IP_PROG : 15%
    FI_ACCOUNT : 10%
    ��� ������ CLERK : 5% �λ�
������ �޿��� before_salary�� �λ�� �޿��� after_salary�� �̸��� �Բ� ���
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
    # DECODE�� �ش� �÷��� ���� ��Ȯ�ϰ� ��ġ�ϴ� ���� �̿��� �� ������
      CASE�� ������ ����� �� �ִ�      
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

