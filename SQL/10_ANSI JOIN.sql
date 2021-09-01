/*
    # ANSI JOIN(American National Standards Institute)
     - �̱� ���� ǥ�� ��ȸ���� ���� ǥ���� ������ JOIN����
     - �ٸ� RDBMS���� �� ������ �����Ѵ�
*/
--ANSI CROSS JOIN
SELECT * FROM employees CROSS JOIN departments;

--ANSI INNER JOIN : ���ǿ� �´� �ุ �����ϴ� ����
SELECT * FROM employees e INNER JOIN departments d ON e.department_id = d.department_id;
    --  JOIN ���ǿ� �̿�Ǵ� �÷����� ���� ��� USING�� �̿��� �������� ����ȭ �� �� �ִ�
SELECT
    first_name,
    department_id,
    department_name,
    job_id,
    job_title,
    location_id,
    city
FROM
         employees
    INNER JOIN departments USING ( department_id )
    INNER JOIN jobs USING(job_id)
    RIGHT OUTER JOIN locations USING ( location_id );
--ANSI JOIN�� ����ϸ� ���� ���ǰ� WHERE������ �����Ͽ� ����� �� �ְ�,
--USING�� ���� �÷��� ��� ���̺��� �÷����� ����� �ʿ䰡 ��������

--ANSI OUTER JOIN : ���ǿ� ���� �ʴ� �൵ �����ϴ� ����
    --LEFT OUTER JOIN : (+)�� �����ʿ� �ִ°� (������ OUTER, �ٳ����³��̵�)
    --RIGHT OUTER JOIN : (+)�� ���ʿ� �ִ°� (�������� OUTER, �ٳ����³��̵�)
    --FULL OUTER JOIN : ������ ��� ������ �ƿ������� ���ʿ� (+)�� ���ΰͰ� ����
SELECT 
    e1.employee_id,
    e1.first_name,
    e1.manager_id,
    e2.first_name
FROM employees e1 LEFT OUTER JOIN employees e2 ON e1.manager_id = e2.employee_id; 

-- ANSI JOIN�� �̿��� ���� �������� Ǯ����� 

-- ����1 : first_name�� Valli�� ����� �����ȣ/Ǯ����/�μ����� ��ȸ�غ�����
SELECT
    employee_id,
    first_name,
    last_name,
    department_name
FROM
    employees INNER JOIN departments USING(department_id)
WHERE 
    first_name = 'Valli';
    
-- ����2 : job_id�� IT_PROG�� ������� �̸�/�μ���ȣ/�μ����� ��ȸ�غ�����
SELECT
    first_name,
    last_name, 
    department_id, 
    department_name
FROM
    employees INNER JOIN departments USING(department_id)
WHERE 
    job_id = 'IT_PROG';
    
-- ����3 : �þ�Ʋ���� �ٹ��ϴ� ��� ����� �̸��� ��å�� �޿��� ����غ�����
SELECT
    first_name,
    last_name, 
    job_id, 
    salary
FROM --���̺���� ���� ����ؾ� �ϴ� ��� ��Ī ��� ����
    employees 
    INNER JOIN departments USING (department_id)
    INNER JOIN locations USING (location_id)
WHERE 
    city = 'Seattle';
    
-- ����4 : �����/�μ���ȣ/�μ��̸��� ����ϵ� ����� �Ѹ� ������ ���� �μ��� ��ȸ�غ�����
SELECT
    first_name,
    department_id,
    department_name
FROM
    employees RIGHT OUTER JOIN departments USING (department_id);
    
-- ����5 : �μ���/�ּ�/���ø��� ����ϵ� �Ҽӵ� �μ��� ���� ���õ� �Բ� ��ȸ�غ�����
SELECT
    department_name,
    street_address,
    city
FROM
    departments RIGHT OUTER JOIN locations USING(location_id);










    




