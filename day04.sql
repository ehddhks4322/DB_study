-- JOIN
-- ���� �ٸ� ���̺��� �����鼭 �����͸� ������ ���� ����
-- �������� : PK�� FK�� ������ �Ǿ��ִ� ����
-- INNER JOIN
-- OUTER JOIN : LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN 


-- DEPARTMENTS ���̺�� LOCATIONS ���̺��� JOIN
SELECT D.DEPARTMENT_NAME, L.CITY 
FROM DEPARTMENTS D  JOIN LOCATIONS L 
ON D.LOCATION_ID = L.LOCATION_ID;

-- WHERE�� �ᵵ ������ �ϴ�.
/*SELECT DEPARTMENT_NAME, CITY
FROM DEPARTMENTS D, LOCATIONS L 
WHERE D.LOCATION_ID = L.LOCATION_ID;
*/

-- ���,�μ����̺�� ���� �̸�, �μ���ȣ, �μ��̸��� ��ȸ�غ�����
SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- ����(LOCATIONS)�� ����(COUNTRIES)���̺��� ��ȸ�Ͽ� ���ø�� �������� ��ȸ
SELECT L.CITY, C.COUNTRY_NAME
FROM LOCATIONS L JOIN COUNTRIES C 
ON L.COUNTRY_ID = C.COUNTRY_ID;

-- ���, �μ�, ���� ���̺�κ��� �̸�, �̸���, �μ���ȣ, �μ��̸�, ������ȣ, ���ø���
-- ����ϵ�, CITY�� 'Seattle'�� ��츸 ����ϼ���.
SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID AND L.CITY = 'Seattle';

SELECT * FROM LOCATIONS L FULL OUTER JOIN DEPARTMENTS D 
ON D.LOCATION_ID = L.LOCATION_ID;

-- VIEW
-- ������ ���̺��� �״�� ����ä
-- �ʿ��� �÷��� �� ���ο� �÷��� ���� ������ ���̺�
-- ���� �����Ͱ� ����Ǵ°��� �ƴ�����
-- VIEW�� ���ؼ� �����͸� ������ �� �ִ�.

-- VIEW�� Ư¡
-- ������ : �ٸ������� ������ �� ����
-- ���� : �� �������� ª�� 
-- ���ȼ� : ª�� ����� ������ ������ ������ ������ �ʴ´�.

/*CREATE VIEW ���̸� AS
 * (
 * 		������
 * 
 * );
 */

CREATE VIEW MY_EMPL AS 
(
	SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, (SALARY*COMMISSION_PCT) COMM 
	FROM EMPLOYEES
);

SELECT * FROM MY_EMPL;

CREATE VIEW DATA_PLUS AS 
(
	SELECT E.SALARY, RANK() OVER(ORDER BY SALARY DESC) "RANK"
	FROM EMPLOYEES E
); -- RANK() OVER(ORDER BY SALARY DESC) �޿��� ������������ ������ �������ش�.

SELECT * FROM DATA_PLUS;

-----------------------------------------------------------------------------------------

-- DB�� �ڷ���
-- ���� : NUMBER(�ڸ���)
--       NUMBER : 22byte���� �Է°���(38�ڸ�)

-- ���� : VARCHAR2(����) : ������

-- ��¥ : DATE : FORMAT�� ���缭 ��¥�� �����ϴ� Ÿ��

-- ���̺� ����� ��
/*CREATE TABLE ���̺��(
 * 		�÷���1 �ڷ���(����),
 * 		�÷���2 �ڷ���(����),
 * 		�÷���3 �ڷ���(����),
 * 		�÷���4 �ڷ���(����),
 * );
 */

CREATE TABLE TT(
	ID VARCHAR2(30) PRIMARY KEY, -- �⺻Ű
	PWD VARCHAR2(30) NOT NULL, -- NULL �����ʹ� �߰����� ���Ѵ�.
	NAME VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) NOT NULL UNIQUE,
	PHONE VARCHAR2(20) UNIQUE,
	REG_DATE DATE
);

-- ���̺��� �̹� ���� �� �÷� �߰��ϱ�
ALTER TABLE TT ADD AGE NUMBER(3);

-- �÷� �����ϱ�
-- ALTER TABLE TT MODIFY AGE NUMBER(����);

-- �÷� �����ϱ� 
ALTER TABLE TT DROP COLUMN AGE;

-- ���̺� �����
-- DROP TABLE TT;

CREATE TABLE MEMO(
	IDX NUMBER(3) PRIMARY KEY,
	TITEL VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(4000),
	PWD VARCHAR2(20) NOT NULL,
	WRITER VARCHAR2(100) NOT NULL,
	IP VARCHAR2(30),
	WRITE_DATE DATE 
);

SELECT * FROM MEMO;

-- INSERT��(�߰��ϱ�)
INSERT INTO MEMO VALUES(1,'����1','����1','1111','ȫ�浿','192.1.1',SYSDATE);
INSERT INTO MEMO VALUES(2,'����1','����1','1111','ȫ�浿','192.1.1',SYSDATE);
INSERT INTO MEMO VALUES(3,'����1','����1','1111','ȫ�浿','192.1.1',SYSDATE);
INSERT INTO MEMO VALUES(4,'����1','����1','1111','ȫ�浿','192.1.1',SYSDATE);
INSERT INTO MEMO VALUES(5,'����1','����1','1111','ȫ�浿','192.1.1',SYSDATE);

SELECT * FROM MEMO;

-- UPDATE��(�����ϱ�)
/*
 * UPDATE ���̺�� SET
 * �÷��� = ������,
 * �÷��� = ������
 * WHERE ���ǽ�
 * */
-- WHERE�� ������ ����Ѵ� �׷��� ������ ��� �÷��� �����͸��� �ٲ��.

-- DELETE�� (����)
/*
 * DELETE FROM ���̺��
 * WHERE ����
 * */

-- SEQUENCE : ���̺� ���� �߰��� �� �ڵ����� �������� �������� ������
-- �������ִ� ��ü
CREATE SEQUENCE MEMO_SEQ;
INSERT INTO MEMO VALUES(MEMO_SEQ.NEXTVAL,'����1','����1','1111','ȫ�浿','192.1.1',SYSDATE);

UPDATE EMP SET 
ENAME = 'ȫ�浿';
WHERE EMPNO = ?;
SELECT * FROM EMP;
