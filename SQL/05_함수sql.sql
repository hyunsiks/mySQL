/*
    # dual 테이블
     - 연습용 테이블
     - 하나의 행만 가지고 있음
*/
SELECT 1+3 FROM dual;

--ABS(n) : 절대값
SELECT ABS(-123) FROM dual;
--FLOOR(n) : 내림
SELECT FLOOR(123.555) FROM dual;
--ROUND(n) : 반올림
SELECT ROUND(123.555) FROM dual;
--CEIL(n) : 올림
SELECT CEIL(123.111) FROM dual;
--MOD(n,m) : 나머지연산
SELECT MOD(13,10) FROM dual;
--TRUNC(d, m) : 지정한 자리 값 이하를 잘라낸다
SELECT TRUNC(123.1234, 3) FROM dual;
SELECT TRUNC(123.1234, 2) FROM dual;
SELECT TRUNC(123.1234, 0) FROM dual;
SELECT TRUNC(123.1234, -1) FROM dual;

SELECT sysdate FROM dual;
SELECT TRUNC(sysdate, 'YEAR') FROM dual;
SELECT TRUNC(sysdate, 'MONTH') FROM dual;
SELECT TRUNC(sysdate, 'DAY') FROM dual;

--TO_CHAR로 DATE타입 데이터를 원하는 포맷으로 변경하기
SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') FROM dual;
SELECT TO_CHAR(TRUNC(sysdate, 'YEAR'), 'YYYY/MM/DD/HH24:MI:SS') FROM dual;

SELECT LOWER('ABC') FROM dual;
SELECT UPPER('abc') FROM dual;
SELECT SUBSTR('Hello, world!!', 1, 5) FROM dual; --1 base(여기는 인데스를 1부터 센다)
SELECT SUBSTR('Hello, world!!', 5) FROM dual; -- 숫자를 하나만 적으면 맨 뒤까지 자른다

--LENGTH('글자');
SELECT LENGTH('Just before his first hit record came')FROM dual;

--LPAD(원본, 길이, 채울문자) : 왼쪽끝으로부터 채울문자(길이 : 글자와 문자포함총길이)
--RPAD(원본, 길이, 채울문자) : 오른쪽끝으로부터 채울문자
-- ※ 제거할 문자가 공백일 경우 생략가능
SELECT LPAD('title', 10) FROM dual;
SELECT LPAD('title', 10, '#') FROM dual;
SELECT RPAD('title', 10, '#') FROM dual;
SELECT LPAD('title', 10, '#'), RPAD('title', 10, '#') FROM dual;

--LTRIM('원본', '제거할문자')
--RTRIM('원본', '제거할문자')
--TRIM('제거할문자' FROM '원본')
-- ※ 제거할 문자가 공백일 경우 생략가능
SELECT LTRIM('#####TITLE', '#') FROM dual;
SELECT LTRIM('     TITLE') FROM dual; 
SELECT TRIM('T' FROM 'TITLE') FROM dual;

--날짜 연산하기
SELECT sysdate - 1 AS 어제 FROM dual;
SELECT sysdate + 2 AS "내일 모래" FROM dual; --공백이 들어가면 쌍따옴표로 묶어야됨

SELECT LAST_NAME, FLOOR(sysdate - hire_date) AS 근무일 FROM EMPLOYEES; --날짜끼리 연산하면 두 날짜 사이의 시간을 구할 수 있다

/*
    # 오라클의 날짜 포맷
     CC : 세기
     YYYY : 년도
     YY : 년도(2자리)
     MM : 월 (05,04,03...)
     MON : 월(문자형)(5월, 4월, 3월 ...)
     DD : 일
     DAY : 요일(금요일, 토요일 ...)
     DY : 요일(금, 토, 일 ...)
     HH, HH12 : 12시
     HH24 : 24시
     MI : 분
     SS : 초
     AM,PM : 오전, 오후 표시
     
     ※ DATE 타입을 년/월/일 말고도 시간,분 까지 확인하고싶을때는
     (ALTER SESSION SET NLS_DATE_FORMAT='YY/MM/DD HH24:MI:SS')로 바꿔준다
     (이렇게 바꿔주면 세션을 로그아웃 할때까지 포멧이 유지된다)
*/
SELECT TO_CHAR(sysdate, 'CC DAY')FROM dual;

--MONTHS_BETWEEN : 두 날짜 사이의 개월 수를 구한다
SELECT LAST_NAME, FLOOR(MONTHS_BETWEEN(sysdate, HIRE_DATE)) AS 근무개월 FROM EMPLOYEES;

--ADD MONTHS(date, n) : date타입 데이터에 원하는 개월 수를 더한다
SELECT ADD_MONTHS(sysdate, 5) FROM dual;

--NEXT_DAY(date, 요일) : DATE타입 데이터를 기준으로 다음 요일을 찾는다
SELECT NEXT_DAY(sysdate, '화') FROM dual;
SELECT NEXT_DAY('21/05/01', '화요일') FROM dual;
SELECT sysdate + 20 from dual;

--LAST_DAY(date) : date타입 데이터를 기준으로 해당 달의 마지막 날짜를 반환한다
SELECT LAST_DAY(sysdate) FROM dual;

/*
    # 오라클의 숫자 포맷
     
     0 : 자릿수를 나타낸다 (숫자가 비면 0으로 칸을 채운다)
     9 : 자릿수를 나타낸다 (숫자가 비면 빈칸으로 채운다)
     L : 각 지역별 통화 기호를 붙인다
     . : 소수점을 출력한다
     , : 쉼표를 출력한다 (천단위를 구분하는)
*/
SELECT TO_CHAR(15000000, '999,999,999,999.999L') FROM dual;
SELECT TO_CHAR(15000000, '000,000,000,000.000L') FROM dual;

--TO_NUMBER : 문자를 숫자로 변환(포맷을 적용해야함)
SELECT TO_NUMBER('15,000,000￦', '99,999,999L')FROM dual;