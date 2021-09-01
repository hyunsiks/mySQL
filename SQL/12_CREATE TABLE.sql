/*
    # DML (Data Manipulataion Language, 데이터 조작어)
     - SELECT : 데이터 조회
     - INSERT : 데이터 삽입
     - DELETE : 데이터 삭제
     - UPDATE : 데이터 수정
     ※ 이것을 묶어서 CRUD라고도 함
        - CRUD란? Create,Read,Updatd,Delete 모든 프로그램이 가지고있는 기능
     
    # DDL (Data Definitation Language, 데이터 정의어)
     - CREATE : 오브젝트 생성
     - DROP : 오브젝트 삭제
     - ALTER : 오브젝트 수정
     - TRUNCATE : 오브젝트 완전삭제
     
    # DCL (Data Control Language, 데이터 제어 명령어)
     - GRANT : 권한부여
     - REVOKE : 권한회수
     
    # 테이블 생성
    CREATE TABLE 테이블명 (컬럼이름1 컬럼타입1, 컬럼이름2 컬럼타입2 ...);
    # 테이블 삭제
    DROP TABLE 테이블명;
    (drop으로 삭제한 테이블은 SHOW RECYCLEBIN; 으로 휴지통에있는것을 확인가능
    (휴지통복구하기 : FLASHBACK TABLE 테이블명 TO BEFORE DROP;)
    (휴지통비우기 : PURGE RECYCLEBIN;)
    
    # 데이터 딕셔너리
     - 데이터에 대한 데이터(메타데이터)
     - DB는 우리가 추가한 데이터를 알아서 관리한다
     - 현재 상테는 DB의 데이터 딕셔너리를 통해서만 알 수 있다
     - 사용자가 직접 데이터 딕셔너리를 수정할 수는 없다
    
    # 데이터 딕셔너리 뷰
     - 데이터 딕셔너리를 사용자가 확인하기 편리한 형태로 제공하는 뷰
     - USER_ 가 테이블 앞에 붙으면 해당 계정의 데이터 딕셔너리 임을 나타낸다
     _ ALL_ 가 테이블 앞에 붙으면 모든 계정의 데이터 딕셔너리 임을 나타낸다
*/
CREATE TABLE coffees(
    coffee_id NUMBER(5),
    cname VARCHAR2(50),
    price NUMBER(5)
);

DROP TABLE coffees;

SHOW RECYCLEBIN; --휴지통 보기
FLASHBACK TABLE coffees TO BEFORE DROP; --휴지통에서 커피테이블 복구하기
PURGE RECYCLEBIN; --휴지통 비우기

-- 데이터 딕셔너리 뷰
SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_TABLES WHERE OWNER = 'HR'; (해당계정에서는 권한이 없어서 못보지만 시스템계정에서는 HR계정의 테이블확인가능)
