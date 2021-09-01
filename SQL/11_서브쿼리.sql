/*
    # ��������
     - �ϳ��� SELECT�� ���ο� ���Ե� �� �ϳ��� SELECT��
     - ���������� �����ϰ� �ִ� ������ ���� ��������Ѵ�
     - ���������� ���������� ����Ǳ� ���� �ѹ��� ����ȴ�
    
    # ������ ��������
     - ���������� �������� �� �ϳ��� �ุ ��ȯ�ϴ� ��������
     - =, >, <, <-, >= ���� �񱳿����ڵ��� ���� ������ ���ϴ¿������̹Ƿ�
     - ������ �����������Բ� ����ؾ� �Ѵ�
    # ������ ��������
     - ���� ������ ���� ����� ��ȯ�Ǵ� ���� 2�� �̻��� ���� ����
     - ������ �����ڿ��Բ� ����ؾ� �Ѵ�
     - IN : �������� ���� �� ���ԵǾ� ������ ��
     - ANY,SOME : �������� ���� �� �ϳ� �̻� ������Ű�� ��
     - ALL : �������� ���� ��� ���� ���Ѿ� ��
     - EXISTS : ���������� �������� �����ϸ� ��
*/
--Sigal�� ���� �μ��� �ٹ��ϴ� ��� ����� ��ȸ�غ���
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
    
--���������� ���� ���
SELECT department_id FROM employees WHERE first_name = 'Sigal';

--����1 EMAIL�� DRAPHEAL�� ������� �޿��� ���� �޴� ������� �̸�/��å/�޿��� ��ȸ�غ�����
DESC employees;
SELECT
    first_name,
    job_id,
    salary
FROM 
    employees
WHERE
    salary > (SELECT salary from employees WHERE email = 'DRAPHEAL');
    
--����2 : Purchasing �μ����� �ٹ��ϴ� ������� �̸�/��å/�μ���ȣ ��ȸ
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
    
--������ �������� ����!!!!!!!!!!!!!!!!!!!!!!!!
--�޿��� 13000$ �̻��� ����� �Ҽӵ� �μ����� �ٹ��ϴ� ��� ����� ��ȸ
--IN������
SELECT
    employee_id,
    first_name,
    department_id
FROM
    employees
WHERE department_id  in (SELECT department_id FROM employees WHERE salary >= 13000)
ORDER BY
    department_id;

--ALL������
SELECT
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING(job_id)
WHERE -- ���α׷��� �� ���� ���� �޴� �𺸴� ������ ��(��� �������Ѿ� ��)
    salary > ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG');

--ANY, SOME������
SELECT
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING(job_id)
WHERE -- ���α׷��� �� �������� �޴� �𺸴� ������ ��(�ѳ��̶� �����ϸ� ��)
    salary > ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG');

--EXIST ������
SELECT * FROM employees e1 WHERE NOT EXISTS(SELECT 1 FROM employees e2 WHERE e1.salary < e2.salary);