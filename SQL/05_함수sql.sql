/*
    # dual ���̺�
     - ������ ���̺�
     - �ϳ��� �ุ ������ ����
*/
SELECT 1+3 FROM dual;

--ABS(n) : ���밪
SELECT ABS(-123) FROM dual;
--FLOOR(n) : ����
SELECT FLOOR(123.555) FROM dual;
--ROUND(n) : �ݿø�
SELECT ROUND(123.555) FROM dual;
--CEIL(n) : �ø�
SELECT CEIL(123.111) FROM dual;
--MOD(n,m) : ����������
SELECT MOD(13,10) FROM dual;
--TRUNC(d, m) : ������ �ڸ� �� ���ϸ� �߶󳽴�
SELECT TRUNC(123.1234, 3) FROM dual;
SELECT TRUNC(123.1234, 2) FROM dual;
SELECT TRUNC(123.1234, 0) FROM dual;
SELECT TRUNC(123.1234, -1) FROM dual;

SELECT sysdate FROM dual;
SELECT TRUNC(sysdate, 'YEAR') FROM dual;
SELECT TRUNC(sysdate, 'MONTH') FROM dual;
SELECT TRUNC(sysdate, 'DAY') FROM dual;

--TO_CHAR�� DATEŸ�� �����͸� ���ϴ� �������� �����ϱ�
SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') FROM dual;
SELECT TO_CHAR(TRUNC(sysdate, 'YEAR'), 'YYYY/MM/DD/HH24:MI:SS') FROM dual;

SELECT LOWER('ABC') FROM dual;
SELECT UPPER('abc') FROM dual;
SELECT SUBSTR('Hello, world!!', 1, 5) FROM dual; --1 base(����� �ε����� 1���� ����)
SELECT SUBSTR('Hello, world!!', 5) FROM dual; -- ���ڸ� �ϳ��� ������ �� �ڱ��� �ڸ���

--LENGTH('����');
SELECT LENGTH('Just before his first hit record came')FROM dual;

--LPAD(����, ����, ä�﹮��) : ���ʳ����κ��� ä�﹮��(���� : ���ڿ� ���������ѱ���)
--RPAD(����, ����, ä�﹮��) : �����ʳ����κ��� ä�﹮��
-- �� ������ ���ڰ� ������ ��� ��������
SELECT LPAD('title', 10) FROM dual;
SELECT LPAD('title', 10, '#') FROM dual;
SELECT RPAD('title', 10, '#') FROM dual;
SELECT LPAD('title', 10, '#'), RPAD('title', 10, '#') FROM dual;

--LTRIM('����', '�����ҹ���')
--RTRIM('����', '�����ҹ���')
--TRIM('�����ҹ���' FROM '����')
-- �� ������ ���ڰ� ������ ��� ��������
SELECT LTRIM('#####TITLE', '#') FROM dual;
SELECT LTRIM('     TITLE') FROM dual; 
SELECT TRIM('T' FROM 'TITLE') FROM dual;

--��¥ �����ϱ�
SELECT sysdate - 1 AS ���� FROM dual;
SELECT sysdate + 2 AS "���� ��" FROM dual; --������ ���� �ֵ���ǥ�� ����ߵ�

SELECT LAST_NAME, FLOOR(sysdate - hire_date) AS �ٹ��� FROM EMPLOYEES; --��¥���� �����ϸ� �� ��¥ ������ �ð��� ���� �� �ִ�

/*
    # ����Ŭ�� ��¥ ����
     CC : ����
     YYYY : �⵵
     YY : �⵵(2�ڸ�)
     MM : �� (05,04,03...)
     MON : ��(������)(5��, 4��, 3�� ...)
     DD : ��
     DAY : ����(�ݿ���, ����� ...)
     DY : ����(��, ��, �� ...)
     HH, HH12 : 12��
     HH24 : 24��
     MI : ��
     SS : ��
     AM,PM : ����, ���� ǥ��
     
     �� DATE Ÿ���� ��/��/�� ���� �ð�,�� ���� Ȯ���ϰ��������
     (ALTER SESSION SET NLS_DATE_FORMAT='YY/MM/DD HH24:MI:SS')�� �ٲ��ش�
     (�̷��� �ٲ��ָ� ������ �α׾ƿ� �Ҷ����� ������ �����ȴ�)
*/
SELECT TO_CHAR(sysdate, 'CC DAY')FROM dual;

--MONTHS_BETWEEN : �� ��¥ ������ ���� ���� ���Ѵ�
SELECT LAST_NAME, FLOOR(MONTHS_BETWEEN(sysdate, HIRE_DATE)) AS �ٹ����� FROM EMPLOYEES;

--ADD MONTHS(date, n) : dateŸ�� �����Ϳ� ���ϴ� ���� ���� ���Ѵ�
SELECT ADD_MONTHS(sysdate, 5) FROM dual;

--NEXT_DAY(date, ����) : DATEŸ�� �����͸� �������� ���� ������ ã�´�
SELECT NEXT_DAY(sysdate, 'ȭ') FROM dual;
SELECT NEXT_DAY('21/05/01', 'ȭ����') FROM dual;
SELECT sysdate + 20 from dual;

--LAST_DAY(date) : dateŸ�� �����͸� �������� �ش� ���� ������ ��¥�� ��ȯ�Ѵ�
SELECT LAST_DAY(sysdate) FROM dual;

/*
    # ����Ŭ�� ���� ����
     
     0 : �ڸ����� ��Ÿ���� (���ڰ� ��� 0���� ĭ�� ä���)
     9 : �ڸ����� ��Ÿ���� (���ڰ� ��� ��ĭ���� ä���)
     L : �� ������ ��ȭ ��ȣ�� ���δ�
     . : �Ҽ����� ����Ѵ�
     , : ��ǥ�� ����Ѵ� (õ������ �����ϴ�)
*/
SELECT TO_CHAR(15000000, '999,999,999,999.999L') FROM dual;
SELECT TO_CHAR(15000000, '000,000,000,000.000L') FROM dual;

--TO_NUMBER : ���ڸ� ���ڷ� ��ȯ(������ �����ؾ���)
SELECT TO_NUMBER('15,000,000��', '99,999,999L')FROM dual;