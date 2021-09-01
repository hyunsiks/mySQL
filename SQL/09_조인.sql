/* 
    �� �⺻Ű(Primary Key, PK)
    �� �ܷ�Ű(Foreign Key, FK)
*/
/*
    �� ���� : �⺻Ű�� �ܷ�Ű�� ���谡 �����Ǿ� �ִ� ���̺���� ������ �����Ͽ� ��ȸ�ϴ� ��
*/
--  1. CROSS JOIN : ��絥����
--   - ���ο� ���Ǵ� ���̺���� �����͸� �����Ͽ� ���� �� �ִ� ��� ��츦 ����ϴ� JOIN
--   - �׳� ��� ��츦 ����ϴ� ������� ����
SELECT * FROM employees; -- 107rows
SELECT * FROM departments; -- 27rows
SELECT * FROM employees, departments; -- 107 * 27 rows

--  2. EQUI JOIN(�����) : ���ǽĿ� '='�� ���
--   - �� ���̺� ���� ���� ������ ���� ���� �÷�(�⺻Ű�� �ܷ�Ű)�� �̿��Ͽ�
--     CROSS JOIN�� ������� �ǹ��ִ� �����͸� �ɷ����� JOIN
SELECT * FROM employees,departments WHERE employees.department_id = departments.department_id;

--����1 : first_name�� Valli�� ����� ���/Ǯ����/�μ����� ��ȸ
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
    
    
--����2 : job_id�� IT_PROG�� ������� �̸�/�μ���ȣ/�μ����� ��ȸ
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

--���� 3 : �þ�Ʋ���� �ٹ��ϴ� ��� ����� �̸��� ��å�� �޿��� ����غ�����(Hint, locations���̺�)
DESC locations;
SELECT * FROM locations;
SELECT
    first_name,
    last_name, 
    job_id, 
    salary
FROM --���̺���� ���� ����ؾ� �ϴ� ��� ��Ī ��� ����
    employees e,
    locations l,
    departments d
WHERE 
    city = 'Seattle' AND
    e.department_id = d.department_id AND
    d.location_id = l.location_id;

--  3. SELF JOIN : 
--   - �ϳ��� ���̺� ������ �ڱ� �ڽŰ� JOIN�Ͽ� ���ϴ� �����͸� ���� ���� ���
SELECT
    e1.employee_id,
    e1.first_name,
    e1.job_id,
    e1.manager_id,
    e2.first_name AS "MANAGER_NAME"
FROM
    employees e1, employees e2 --SELF JOIN�� ���̺� ��Ī�� ����� �� �ۿ� ����
WHERE
    e1.manager_id = e2.employee_id
ORDER BY
    e1.employee_id;
    
--����1 : �Ŵ��� �̸��� Nancy�� ������� ���/�̸�/job_title�� ��ȸ�غ�����
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

--����2 : Curtis�� ������ ��å�� ���� ������� ��� ������ ��ȸ�غ�����
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
--  - (+)�� �������� Į���� NULL�� �߰��ؼ� �������� ���ߴ� ����� Ȯ���� �� �ִ�
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
    ������(+) : e1.manager_id�� ������, e2�� ��ġ�ϴ� ���� ��� ��µ��� ���� ���� ���
                - manager_id�� �߸��� ���, null, �޴����� null�� ������ ���
    ����(+) : e2.employee_id�� ������, e1.manager_id�� ��ġ�ϴ� ���� ��� ��µ��� ���� ���� ���
                - ����������, ���������� ���� ��찡 �߰��Ǿ� ��µ�
*/
--����1 : �����/�μ���ȣ/�μ��̸��� ����ϵ� ����� �Ѹ� ������ ���� �μ��� ��ȸ�غ�����
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

--����2 : �����/��åid/��å���� ����ϵ� ����� �Ѹ� ������ ���� ��å�� �Բ� ��ȸ�غ�����
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
    
--����3 : �μ���/�ּ�/���ø��� ����ϵ� �Ҽӵ� �μ��� ���� ���õ� �Բ� ��ȸ�غ�����
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
