/*
    # �� (View)
    
     - �������� �⺻ ���̺���� �̿��� ������ ������ ������ ���̺�
     - �⺻ ���̺��� �Ļ��� DB��ü
     - �並 ���� �����(������)�� �⺻ ���̺��� ���������� ����Ҽ� �ֵ��� �� �� �ִ�

    # �� �����ϱ�
    CREATE [OR REPLACE] VIEW ���̸� 
            AS �������� 
                [WITH CHECK OPTION | [WITH READ ONLY]];
        - CREATE OR REPLACE : �̹� �����ϴ� ���� ������ �Ѵ�. ���ٸ� �����Ѵ�.
        - WITH CHECK OPTION : �ش� ���� ������ �����ϴ� DML�� ����������.(������DML)
        - WITH READ ONLY : �ش� ��� SELECT�� ����������.(DML����)
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

--80�� �μ� ����鸸 ��ȸ�ϴ� ���̱� ������ 80�� �μ��Ͱ��õ� DML�� ����� �� �ְԵȴ�
INSERT INTO dept80_view_check
 VALUES(3, 'Jaeong', 'Hong', 'JHong','515-127-4434', sysdate, 'IT_PROG', 1000, null, 100, 80);
