-- 집계함수
-- 1개 또는 2개 이상의 행의 값이 함수에 적용되어서 1개의 값으로 반환
-- COUNT() : 행들의 개수를 반환
-- MIN() : 행들의 최소값을 반환
-- MAX() : 행들의 최대값을 반환
-- SUM() : 행들의 합계를 반환
-- AVG() : 행들의 평균을 반환

-- 일반적으로 집계함수와 일반컬럼은 같이 사용할 수 없다.
SELECT COUNT(*) FROM EMPLOYEES;

-- 집계함수는 NULL값을 세지 않는다.
SELECT COUNT(COMMISSION_PCT) FROM EMPLOYEES;

-- 사원테이블에서 직종이 'SA_REP'인 직원들의 평균급여, 급여최고액
-- 급여최저액, 급여의 총 합을 출력하세요.
SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY), SUM(SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP';

-- DISTINCT : 중복된 값은 세지 않는다.
SELECT COUNT(DISTINCT DEPARTMENT_ID) FROM EMPLOYEES;

-- 부서번호가 80번인 사원들의 급여의 평균을 소수점 한자리까지 반올림하여 출력하기
SELECT ROUND(AVG(SALARY),1) FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- GROUP BY (그룹화)
-- 특정 테이블에서 소그룹을 만들어서 결과를 분산시켜 얻고자 할 때
-- GROUP BY : ~별 (예 : 부서별 인원수)

-- 각 부서별 급여의 평균과 총 합을 출력
SELECT DEPARTMENT_ID, AVG(SALARY), SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

-- 부서별 급여의 합계를 내림차순으로 조회
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY SUM(SALARY) DESC;

-- HAVING절
-- HAVING절은 GROUP BY로 집게된 값 중 WHERE절 처럼
-- 특정 조건을 추가한다고 생각하면 된다.

-- 각 부서별 급여의 최대값, 최소값 인원수 출력을 하되,
-- 급여의 최대값이 8000이상인 결과만 출력할것
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY), COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) >= 8000;

-- 각 부서별 인원수가 20명 이상인 부서의 정보를  부서번호, 급여의 합
-- 급여의 평균, 인원수 순으로 출력하되, 급여의 평균은 소수점 둘째자리까지 반올림으로 출력
SELECT DEPARTMENT_ID, SUM(SALARY), ROUND(AVG(SALARY),2), COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- 부서별, 직종별로 그룹화 하여 결과를 부서번호, 직종, 인원수 순으로 출력하되,
-- 직종이 'MAN'으로 끝나는 경우에만 출력
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN'
GROUP BY DEPARTMENT_ID, JOB_ID;

-- 각 부서별 평균 급여를 소수점 한자리까지 버림으로 출력을 하되,
-- 평균 급여가 10000미만인 그룹만 조회해야 하며
-- 부서번호가 50번이하인 부서만 조회
SELECT DEPARTMENT_ID, TRUNC(AVG(SALARY),1) FROM EMPLOYEES
WHERE DEPARTMENT_ID <= 50
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) < 10000;

-- WHERE -> 전체 테이블에 대한 조건
-- HAVING -> 그룹화를 진행하고 난 결과에 대한 조건

-- 각 부서별 부서번호, 급여의 합, 평균, 인원수 순으로 출력하되,
-- 급여의 합이 30000이상인 경우에만 출력해야 하며,
-- 급여의 평균은 소수점 둘째자리 까지 반올림으로 출력하기
SELECT DEPARTMENT_ID, SUM(SALARY), ROUND(AVG(SALARY),2), COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) >= 30000;









-- SUBQUERY
-- SQL문 안에 또다른 SQL문이 포함되어 있는 형태
-- 여러번 DB접속이 필요한 상황을 한번으로 줄여서 속도를 증가시킬 수 있다.
-- 서브쿼리를 사용할 수 있는곳
-- WHERE절,HAVING절
-- SELECT,DELETE문의 FROM절
-- INSERT문의 INFO절

-- 이름이 'Michael'이고, 직종이 'MK_MAN'인 사원의 급여보다
-- 많이 받는 사람들의 정보를 사번, 이름, 직종, 급여순으로 출력

-- 1) 이름이 'Michael'이고, 직종이 'MK_MAN'인 사원의 급여보다
SELECT SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN';

-- 2) 많이 받는 사람들의 정보를 사번, 이름, 직종, 급여순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY > 13000;

-- 3) 위의 두 쿼리문 합치기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES
				WHERE FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN')

				
-- 사번이 150번인 사원의 급여와 같은 급여를 받는 사원들의 정보를
-- 사번, 이름, 급여 순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY = (SELECT SALARY FROM EMPLOYEES
				WHERE EMPLOYEE_ID = 150);
			
			
-- 급여가 회사의 평균급여 이상인 사람들의 이름과 급여를 조회			
SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES);


-- 사번이 111번인 사원의 직종과 같고, 사번이 159번인 사원의 급여보다 
-- 많이 받는 사원들의 정보를 사번, 이름, 직종, 급여순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEES
				WHERE EMPLOYEE_ID = 111) AND SALARY > (SELECT SALARY FROM EMPLOYEES
													   WHERE EMPLOYEE_ID = 159);
													   
	
-- 직종, 평균급여를 출력하되,
-- 평균급여가 Bruce사원보다 많이받는 경우를 조회
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > (SELECT AVG(SALARY) FROM EMPLOYEES
					 WHERE FIRST_NAME = 'Bruce');
					
					
-- 사원테이블에서 급여가 가장 적은 사람의 사번, 이름, 급여를 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);


-- 137번 사원보다 급여가 크거나 같고, 149번 사원보다는 급여가 작거나 같은
-- 사원의 이름과 급여를 조회
SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN (SELECT SALARY FROM EMPLOYEES
					  WHERE EMPLOYEE_ID = 137) AND (SELECT SALARY FROM EMPLOYEES
					  								WHERE EMPLOYEE_ID = 149);
					  								

-- JOIN
-- PRIMARY KEY -> 중복 X, NULL 값 허용하지 않음

-- FOREIGN KEY -> 다른 테이블의 PK를 의미한다.
--				    테이블끼리 관계를 맺을 때 사용한다.
--			           중복이 가능하다.					  							