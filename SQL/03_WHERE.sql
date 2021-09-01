/*
    # SELECT ���� WHERE ���� �߰��Ͽ� �ش� ������ �����ϴ� �����͸� ��ȸ�� �� �ִ�
    ex) SELECT �÷��� FROM ���̺�� WHERE ������;
*/

-- ������ 15000�� ������ ����鸸 ��ȸ�ϱ�
SELECT * FROM EMPLOYEES WHERE SALARY >= 15000;
/*
    # ����Ŭ�� �� �����ڵ�
     = : ����
     <, >, <=, >= : ��
     !=, <>, ^= �ٸ���
*/
SELECT * FROM EMPLOYEES WHERE SALARY != 17000;

-- ����Ŭ�� ���ڿ� ���ͷ��� ''�� ����Ѵ�(""�ȵ�)
SELECT * FROM EMPLOYEES WHERE LAST_NAME = 'Smith';

-- ��¥ Ÿ�Ե� ������ �񱳰� �����ϴ�
SELECT * FROM EMPLOYEES WHERE HIRE_DATE < '2004/01/01';

-- AND, OR, NOT
SELECT * FROM EMPLOYEES WHERE HIRE_DATE > '2005/01/01' AND HIRE_DATE < '2005/05/01';
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'ST_CLERK';

--����1 : 2000���� 3000������ ������ �޴� ��� ������� ��ȸ�غ�����
SELECT * FROM EMPLOYEES WHERE SALARY > 2000 AND SALARY < 3000;

--����2 : �μ���ȣ�� 30���̰ų� 60���̰ų� 90���� ������� 
--        /�̸�/��å/��ȭ��ȣ�� ��ȸ�غ�����
DESC EMPLOYEES
SELECT
    first_name    AS �̸�,
    job_id        AS ��å,
    phone_number  AS ��ȭ��ȣ
FROM
    employees
WHERE
    department_id = 30
    OR department_id = 60
    OR department_id = 90;
    
-- ����� ¦���� ����� ��ȸ�غ���
SELECT * FROM EMPLOYEES WHERE MOD(EMPLOYEE_ID, 2) = 0;

-- �÷��� BETWEEN A AND B : �ش� �÷� ���� A�̻� B������ ��� TRUE
SELECT
    *
FROM
    employees
WHERE
    salary BETWEEN 2000 AND 3000;

-- �÷��� IN (A,B,C...) :()���� ���뿡 ���� �����ϴ� ��� TRUE
SELECT
    *
FROM
    employees
WHERE
    department_id IN ( 30, 60, 90 );

-- Ŀ�̼� �ۼ�Ʈ�� NULL�� ����� ��� ��ȸ�غ���
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
     - �������� �Ϻκ����� ���ϴ� ������ �˻��� �� �ִ�
     - ����Ÿ�԰� ��¥Ÿ�Կ� ����� �� �ִ�
     - % : ���� ���� ���� �ƹ� ���ڿ��̳� �͵� �Ǵ� ���ϵ�ī��(������ ���°͵� ����)
     - _ : �ϳ��� �ƹ� ���ڰ� �ݵ�� �;��ϴ� ���ϵ�ī��
*/
-- �̸��� J�� �����ϴ� ��� ����� ��ȸ �ϰ� ������
SELECT first_name FROM EMPLOYEES WHERE FIRST_NAME LIKE 'J%';
-- �̸��� �ι�° ���ڰ� U�� ��� ����� ��ȸ
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '_u%';
-- �̸��� ����° ���ڰ� e�� ��� ����� ��ȸ
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '__e%';
-- �̸��� x�� ���ԵǾ� �ִ� ��� ����� ��ȸ
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%x%';

--����1 : �̸��� �ڿ��� 3��° ���ڰ� a�� ��� ����� ��ȸ�غ�����
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%a__';
--����2 : �̸��� e�� �ΰ��̻� ���Ե� ��� ����� ��ȸ�غ�����
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%e%e%' or FIRST_NAME LIKE 'E%e%';
--����3 : �̸��� �ټ� �����̸鼭 a�� ������ ��� ����� ��ȸ�غ�����
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '____a';