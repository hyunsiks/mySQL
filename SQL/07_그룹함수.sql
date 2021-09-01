/*
    # �׷� �Լ�(GROUP BY)
    
     - ���� ���� ���� Ư�� �÷��� �������� �׷�ȭ �ϴ� �Լ���
     - Ư�� ������ ����, ����, ��� ���� ���� �� �ִ�
     - �׷��� ������ �Ǵ� �÷��� GROUP BY���� ���� �����Ѵ�
     - �׷��Լ��� ����� �Ϲ� �÷��� �Բ� ��µ� �� ����
*/
SELECT SUM(salary) FROM employees;

SELECT job_id, SUM(salary) FROM employees GROUP BY job_id;
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id;

-- SUM(column) : �׷� ���� �ش� �÷��� �� ���� ���Ѵ�
SELECT department_id, SUM(salary) FROM employees GROUP BY department_id;
-- MAX(),MIN() : �ִ�, �ּҰ�
SELECT job_id, MAX(salary) FROM employees GROUP BY job_id;
-- count() : ����
SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;

--����1 : �μ����� ���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� ��¥�� ������ִ� �������ۼ�
SELECT 
    department_id,
    max(hire_date) AS �ֱ��Ի�, 
    min(hire_date) AS �������Ի�
FROM 
    EMPLOYEES
GROUP BY 
    department_id;
--����2 : ���ʽ��� �޴� ����� �� �μ��� ��� �ִ��� ����� �������� �ۼ�
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

--����3 : �� ��å�� ��� ������ ���غ�����
DESC EMPLOYEES;

SELECT
    job_id,
    TO_CHAR(AVG(salary * 12 * nvl(1 + commission_pct, 1)), '999999.99')
FROM 
    EMPLOYEES
GROUP BY 
    JOB_ID;

--GROUP BY�� �������� �׷쿡 ������ �ְ� ���� ���� HAVING���� �̿�
--WHERE�� �׷��� �����Ǳ� ���� ��� �࿡ ����Ǵ� �����̴�
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

--����1 : �μ��� �ִ�޿��� �ּұ޿��� ����ϵ� �ִ� �޿��� 5000�̻��� �μ��� ���
SELECT
    department_id,
    max(salary) AS �ִ�޿�,
    min(salary) AS �ּұ޿�
FROM
    employees
GROUP BY
    department_id
HAVING 
    max(salary) >= 5000;

--����2 : �μ��� ��� �޿��� ����ϵ� �ش� �μ��� �Ҽӵ� ����� 10�� �̻��� �μ��� ����غ�����
SELECT 
    TO_CHAR(AVG(SALARY), 99999999.99) AS ��ձ޿�
FROM 
    employees 
GROUP BY department_id HAVING count(*) >= 10;