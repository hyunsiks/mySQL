/*
    # SELECT �÷��� FROM ���̺��;
    
     - �����͸� ��ȸ�ϴ� ������(���ǹ�)
       �÷��� �ڸ��� *�� ���� ���� ��� �÷��� ���Ѵ�
     - �÷���/���̺���� ��ҹ��ڸ� �������� �ʴ´�
     - �������� ��ҹ��ڸ� �������� �ʴ´�
     - �����ʹ� ��ҹ��ڸ� �����Ѵ�(���߿�!!!)
*/
-- tab, tabs�� � ���̺���� �ִ��� Ȯ���� �� �ִ�
SELECT * FROM tab;
SELECT * FROM tabs;
SELECT table_name FROM tabs;

-- *�� ������ ��� �÷��� ��ȸ�ϰ�, �÷����� ������ �ش� �÷��� ��ȸ�Ѵ�
SELECT * FROM employees;
SELECT first_name, salary FROM employees;

/*
    # ������ ���̺� ����
    
     employees : ���� ������ ������ ���̺�
     deplartments : �μ� ������ ������ ���̺�
     jobs : ���� ������ ������ ���̺�
     locations : ���� ������ ������ ���̺�
     countries : ���� ������ ������ ���̺�
     regions : ��� ������ ������ ���̺�
*/
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM jobs;
SELECT * FROM countries;
SELECT * FROM regions;

-- ���̺� �÷� ���� ����
DESC employees;

/* Ÿ��
    # NUMBER(n), NUMBER(n, m)
        - ���� �����͸� ������ �� �ִ� �÷�
        - ���ڰ� �ϳ��� ���������� ����Ÿ��, �ΰ� ���������� �Ǽ�Ÿ��
        - NUMBER(10) : 10�ڸ� ������ �����ϴ� �÷�
        - NUMBER(10,4) : 6�ڸ� ������ �Ҽ��� 4�ڸ��� �����ϴ� �÷��� �ȴ�
    
    # VARCHAR2(n)
        - ���� ���� ���� ����Ʈ�� �����ϴ� �÷� Ÿ��
        - ����� �������� ũ�⿡ ���� �˸��� ������ ����Ѵ�
        - VARCHAR2(10)���� ������ �÷��� �����ͷ� 2���ڰ� ������ 2����Ʈ�� ����Ѵ�
        - ���������࿡ ������ , �ӵ��� CHAR�� ���� �ణ����
    
    # CHAR(n)
        - ���� ���� ���� �����͸� �����ϴ� �÷� Ÿ��(�÷��� ������ ���� ���̶�� �ӵ��� VARCHAR���� ������)
        - ������ ���̺��� ���� ���� �����Ͱ� �������� ������ ���̸� ��� �����Ѵ�
        - CHAR(10)���� ������ �÷��� �����ͷ� 2���ڰ� ������ 10����Ʈ�� ��� ����Ѵ�
        - �����Ͱ� ����� ���� ������ ũ�� ����� ���� ������ �ӵ��� �� ������

    # DATE
        - ��¥ �� �ð��� �����ϴ� �÷� Ÿ��
*/
-- ���� 1 : ��� ����� ���/�̸�/����/�μ���ȣ�� ��ȸ�غ�����
DESC EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES;

-- �˻��� �÷��� �ٲپ� ��ȸ�ϱ� (AS �̿��Ͽ� �̸��ٲٱ�)
SELECT SALARY AS �޿� FROM EMPLOYEES;

-- ��� �����ڸ� �̿��� ���� �� ����ϱ�
SELECT LAST_NAME, SALARY FROM EMPLOYEES;
SELECT LAST_NAME, SALARY + 500 FROM EMPLOYEES;
SELECT LAST_NAME, SALARY * 2 FROM EMPLOYEES;
SELECT LAST_NAME, SALARY * 0.9 AS �谨�ȿ��� FROM EMPLOYEES;
SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES;
SELECT LAST_NAME, SALARY *(1 + COMMISSION_PCT) FROM EMPLOYEES;
-- NULL���� �⺻���� ���ϰ� �Ǹ� �׳� NULL���� ���͹�����

-- NVL(�÷���, ��ü��) : �ش� �÷����� NULL���� ������ �� ��ü���� ����Ѵ�
SELECT LAST_NAME, SALARY *(1 + NVL(COMMISSION_PCT, 0)) AS ���ʽ����� FROM EMPLOYEES;

--����2 : ��� ������� ���/�����̸�/������ ����غ�����(salary�� �����Դϴ�, ��Ī����Ұ�)
DESC EMPLOYEES;
SELECT
    EMPLOYEE_ID AS ���,
    LAST_NAME AS �����̸�,
    SALARY * 12 *(1 + NVL(COMMISSION_PCT, 0)) AS ����
FROM EMPLOYEES;

-- SELECT DISTINCT : �ߺ��Ǵ� ������ ������ �־ �ѹ��� �ٷµȴ�
-- emplotees�� �����ϴ� ��� ��å�� ������� ���
SELECT DISTINCT JOB_ID FROM EMPLOYEES;
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;
SELECT DISTINCT MANAGER_ID FROM EMPLOYEES;