-- JOIN
-- 서로 다른 테이블을 오가면서 데이터를 가지고 오는 형태
-- 전제조건 : PK와 FK로 연결이 되어있는 상태
-- INNER JOIN
-- OUTER JOIN : LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN 


-- DEPARTMENTS 테이블과 LOCATIONS 테이블을 JOIN
SELECT D.DEPARTMENT_NAME, L.CITY 
FROM DEPARTMENTS D  JOIN LOCATIONS L 
ON D.LOCATION_ID = L.LOCATION_ID;

-- WHERE을 써도 가능은 하다.
/*SELECT DEPARTMENT_NAME, CITY
FROM DEPARTMENTS D, LOCATIONS L 
WHERE D.LOCATION_ID = L.LOCATION_ID;
*/

-- 사원,부서테이블로 부터 이름, 부서번호, 부서이름을 조회해보세요
SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 지역(LOCATIONS)와 나라(COUNTRIES)테이블을 조회하여 도시명과 국가명을 조회
SELECT L.CITY, C.COUNTRY_NAME
FROM LOCATIONS L JOIN COUNTRIES C 
ON L.COUNTRY_ID = C.COUNTRY_ID;

-- 사원, 부서, 지역 테이블로부터 이름, 이메일, 부서번호, 부서이름, 지역번호, 도시명을
-- 출력하되, CITY가 'Seattle'인 경우만 출력하세요.
SELECT E.FIRST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID AND L.CITY = 'Seattle';

SELECT * FROM LOCATIONS L FULL OUTER JOIN DEPARTMENTS D 
ON D.LOCATION_ID = L.LOCATION_ID;

-- VIEW
-- 기존의 테이블은 그대로 놔둔채
-- 필요한 컬럼들 및 새로운 컬럼을 만든 가상의 테이블
-- 실제 데이터가 저장되는것은 아니지만
-- VIEW를 통해서 데이터를 관리할 수 있다.

-- VIEW의 특징
-- 독립성 : 다른곳에서 변경할 수 없음
-- 편리성 : 긴 쿼리문을 짧게 
-- 보안성 : 짧게 만들기 떄문에 기존의 쿼리는 보이지 않는다.

/*CREATE VIEW 뷰이름 AS
 * (
 * 		쿼리문
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
); -- RANK() OVER(ORDER BY SALARY DESC) 급여를 내림차순으로 순위를 제공해준다.

SELECT * FROM DATA_PLUS;

-----------------------------------------------------------------------------------------

-- DB의 자료형
-- 숫자 : NUMBER(자리수)
--       NUMBER : 22byte까지 입력가능(38자리)

-- 문자 : VARCHAR2(길이) : 가변형

-- 날짜 : DATE : FORMAT에 맞춰서 날짜를 저장하는 타입

-- 테이블 만드는 법
/*CREATE TABLE 테이블명(
 * 		컬럼명1 자료형(길이),
 * 		컬럼명2 자료형(길이),
 * 		컬럼명3 자료형(길이),
 * 		컬럼명4 자료형(길이),
 * );
 */

CREATE TABLE TT(
	ID VARCHAR2(30) PRIMARY KEY, -- 기본키
	PWD VARCHAR2(30) NOT NULL, -- NULL 데이터는 추가하지 못한다.
	NAME VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) NOT NULL UNIQUE,
	PHONE VARCHAR2(20) UNIQUE,
	REG_DATE DATE
);

-- 테이블을 이미 만든 후 컬럼 추가하기
ALTER TABLE TT ADD AGE NUMBER(3);

-- 컬럼 수정하기
-- ALTER TABLE TT MODIFY AGE NUMBER(길이);

-- 컬럼 삭제하기 
ALTER TABLE TT DROP COLUMN AGE;

-- 테이블 지우기
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

-- INSERT문(추가하기)
INSERT INTO MEMO VALUES(1,'제목1','내용1','1111','홍길동','192.1.1',SYSDATE);
INSERT INTO MEMO VALUES(2,'제목1','내용1','1111','홍길동','192.1.1',SYSDATE);
INSERT INTO MEMO VALUES(3,'제목1','내용1','1111','홍길동','192.1.1',SYSDATE);
INSERT INTO MEMO VALUES(4,'제목1','내용1','1111','홍길동','192.1.1',SYSDATE);
INSERT INTO MEMO VALUES(5,'제목1','내용1','1111','홍길동','192.1.1',SYSDATE);

SELECT * FROM MEMO;

-- UPDATE문(수정하기)
/*
 * UPDATE 테이블명 SET
 * 컬럼명 = 데이터,
 * 컬럼명 = 데이터
 * WHERE 조건식
 * */
-- WHERE을 무조건 써야한다 그렇지 않으면 모든 컬럼의 데이터명이 바뀐다.

-- DELETE문 (삭제)
/*
 * DELETE FROM 테이블명
 * WHERE 조건
 * */

-- SEQUENCE : 테이블에 값을 추가할 때 자동으로 순차적인 정수값이 들어가도록
-- 설정해주는 객체
CREATE SEQUENCE MEMO_SEQ;
INSERT INTO MEMO VALUES(MEMO_SEQ.NEXTVAL,'제목1','내용1','1111','홍길동','192.1.1',SYSDATE);

UPDATE EMP SET 
ENAME = '홍길동';
WHERE EMPNO = ?;
SELECT * FROM EMP;
