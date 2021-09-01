/*
    # 뷰 (View)
    
     - 물리적인 기본 테이블들을 이용해 생성한 논리적인 가상의 테이블
     - 기본 테이블에서 파생된 DB객체
     - 뷰를 통해 사용자(개발자)가 기본 테이블을 제한적으로 사용할수 있도록 할 수 있다

    # 뷰 생성하기
    CREATE [OR REPLACE] VIEW 뷰이름 
            AS 서브쿼리 
                [WITH CHECK OPTION | [WITH READ ONLY]];
        - CREATE OR REPLACE : 이미 존재하는 뷰라면 수정을 한다. 없다면 생성한다.
        - WITH CHECK OPTION : 해당 뷰의 조건을 만족하는 DML이 가능해진다.(제한적DML)
        - WITH READ ONLY : 해당 뷰는 SELECT만 가능해진다.(DML금지)
*/
CREATE OR REPLACE VIEW dept30_view AS
    ( SELECT
        employees.*
    FROM
        employees
    WHERE
        department_id = 30
    );
drop view dept30_view;
SELECT * FROM dept30_view;

update dept30_view set first_name = 'Dan'
where first_name = 'Den';

INSERT INTO dept30_view 
VALUES(1, 'Gildong', 'Hong', 'GHong','515-127-4444', sysdate, 'IT_PROG', 1000, null, 100, 70);

CREATE OR REPLACE VIEW dept80_view_check AS
    ( SELECT
        employees.*
    FROM
        employees
    WHERE
        department_id = 80
    )
WITH CHECK OPTION;

SELECT * FROM dept80_view_check;

--80번 부서 사람들만 조회하는 뷰이기 때문에 80번 부서와관련된 DML만 사용할 수 있게된다
INSERT INTO dept80_view_check
 VALUES(3, 'Jaeong', 'Hong', 'JHong','515-127-4434', sysdate, 'IT_PROG', 1000, null, 100, 80);
