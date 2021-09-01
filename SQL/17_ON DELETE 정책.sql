/*
    # ON DELETE ��������
        - �ڽ� ���ڵ尡 �����ϰ� �ִ� �θ� ���ڵ带 �����Ϸ��� �� �� ��������� ������ �� �ִ�
        - CASCADE, SET NULL, RESTRICT
    
    # ON DELETE CASCADE
        - �θ� ���ڵ带 �����ϸ� �ڽ� ���ڵ带 ��� �Բ� �����Ѵ�
    
    # ON DELETE SET NULL
        - �θ� ���ڵ带 �����ϸ� �����ϴ� �ڽ� ���ڵ��� ���� NULL�� �����Ѵ�
    
    # RESTRICT (������ ���ϸ� RESTRICT�� �ȴ� ��, �⺻���̴�)
        - �ڽ� ���ڵ尡 ������ �θ� ���ڵ带 ������ �� �����Ѵ�
*/
SAVEPOINT S1;
ROLLBACK S1;

-- # CASCADE TEST
DESC FRUITS4;
INSERT INTO FRUITS4 VALUES (1, '���', 'RED', 'L', 2000, 10);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'FRUITS4';
ALTER TABLE FRUITS4 DROP CONSTRAINT F4_LID_FK;

ALTER TABLE fruits4 ADD
    CONSTRAINT F4_LID_FK FOREIGN KEY(lid) REFERENCES FRUIT_LOCATIONS(LID)
    ON DELETE SET NULL;

SELECT * FROM FRUITS4;
SELECT * FROM FRUIT_LOCATIONS;

DELETE FROM FRUIT_LOCATIONS WHERE LID = 10;

ALTER TABLE FRUITS2 DROP CONSTRAINT FRUITS2_LID_FK;