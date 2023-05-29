-- �����Լ�
-- 1�� �Ǵ� 2�� �̻��� ���� ���� �Լ��� ����Ǿ 1���� ������ ��ȯ
-- COUNT() : ����� ������ ��ȯ
-- MIN() : ����� �ּҰ��� ��ȯ
-- MAX() : ����� �ִ밪�� ��ȯ
-- SUM() : ����� �հ踦 ��ȯ
-- AVG() : ����� ����� ��ȯ

-- �Ϲ������� �����Լ��� �Ϲ��÷��� ���� ����� �� ����.
SELECT COUNT(*) FROM EMPLOYEES;

-- �����Լ��� NULL���� ���� �ʴ´�.
SELECT COUNT(COMMISSION_PCT) FROM EMPLOYEES;

-- ������̺��� ������ 'SA_REP'�� �������� ��ձ޿�, �޿��ְ��
-- �޿�������, �޿��� �� ���� ����ϼ���.
SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY), SUM(SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP';

-- DISTINCT : �ߺ��� ���� ���� �ʴ´�.
SELECT COUNT(DISTINCT DEPARTMENT_ID) FROM EMPLOYEES;

-- �μ���ȣ�� 80���� ������� �޿��� ����� �Ҽ��� ���ڸ����� �ݿø��Ͽ� ����ϱ�
SELECT ROUND(AVG(SALARY),1) FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- GROUP BY (�׷�ȭ)
-- Ư�� ���̺��� �ұ׷��� ���� ����� �л���� ����� �� ��
-- GROUP BY : ~�� (�� : �μ��� �ο���)

-- �� �μ��� �޿��� ��հ� �� ���� ���
SELECT DEPARTMENT_ID, AVG(SALARY), SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

-- �μ��� �޿��� �հ踦 ������������ ��ȸ
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY SUM(SALARY) DESC;

-- HAVING��
-- HAVING���� GROUP BY�� ���Ե� �� �� WHERE�� ó��
-- Ư�� ������ �߰��Ѵٰ� �����ϸ� �ȴ�.

-- �� �μ��� �޿��� �ִ밪, �ּҰ� �ο��� ����� �ϵ�,
-- �޿��� �ִ밪�� 8000�̻��� ����� ����Ұ�
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY), COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) >= 8000;

-- �� �μ��� �ο����� 20�� �̻��� �μ��� ������  �μ���ȣ, �޿��� ��
-- �޿��� ���, �ο��� ������ ����ϵ�, �޿��� ����� �Ҽ��� ��°�ڸ����� �ݿø����� ���
SELECT DEPARTMENT_ID, SUM(SALARY), ROUND(AVG(SALARY),2), COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- �μ���, �������� �׷�ȭ �Ͽ� ����� �μ���ȣ, ����, �ο��� ������ ����ϵ�,
-- ������ 'MAN'���� ������ ��쿡�� ���
SELECT DEPARTMENT_ID, JOB_ID, COUNT(*) FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN'
GROUP BY DEPARTMENT_ID, JOB_ID;

-- �� �μ��� ��� �޿��� �Ҽ��� ���ڸ����� �������� ����� �ϵ�,
-- ��� �޿��� 10000�̸��� �׷츸 ��ȸ�ؾ� �ϸ�
-- �μ���ȣ�� 50�������� �μ��� ��ȸ
SELECT DEPARTMENT_ID, TRUNC(AVG(SALARY),1) FROM EMPLOYEES
WHERE DEPARTMENT_ID <= 50
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) < 10000;

-- WHERE -> ��ü ���̺� ���� ����
-- HAVING -> �׷�ȭ�� �����ϰ� �� ����� ���� ����

-- �� �μ��� �μ���ȣ, �޿��� ��, ���, �ο��� ������ ����ϵ�,
-- �޿��� ���� 30000�̻��� ��쿡�� ����ؾ� �ϸ�,
-- �޿��� ����� �Ҽ��� ��°�ڸ� ���� �ݿø����� ����ϱ�
SELECT DEPARTMENT_ID, SUM(SALARY), ROUND(AVG(SALARY),2), COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) >= 30000;









-- SUBQUERY
-- SQL�� �ȿ� �Ǵٸ� SQL���� ���ԵǾ� �ִ� ����
-- ������ DB������ �ʿ��� ��Ȳ�� �ѹ����� �ٿ��� �ӵ��� ������ų �� �ִ�.
-- ���������� ����� �� �ִ°�
-- WHERE��,HAVING��
-- SELECT,DELETE���� FROM��
-- INSERT���� INFO��

-- �̸��� 'Michael'�̰�, ������ 'MK_MAN'�� ����� �޿�����
-- ���� �޴� ������� ������ ���, �̸�, ����, �޿������� ���

-- 1) �̸��� 'Michael'�̰�, ������ 'MK_MAN'�� ����� �޿�����
SELECT SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN';

-- 2) ���� �޴� ������� ������ ���, �̸�, ����, �޿������� ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY > 13000;

-- 3) ���� �� ������ ��ġ��
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES
				WHERE FIRST_NAME = 'Michael' AND JOB_ID = 'MK_MAN')

				
-- ����� 150���� ����� �޿��� ���� �޿��� �޴� ������� ������
-- ���, �̸�, �޿� ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY = (SELECT SALARY FROM EMPLOYEES
				WHERE EMPLOYEE_ID = 150);
			
			
-- �޿��� ȸ���� ��ձ޿� �̻��� ������� �̸��� �޿��� ��ȸ			
SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES);


-- ����� 111���� ����� ������ ����, ����� 159���� ����� �޿����� 
-- ���� �޴� ������� ������ ���, �̸�, ����, �޿������� ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEES
				WHERE EMPLOYEE_ID = 111) AND SALARY > (SELECT SALARY FROM EMPLOYEES
													   WHERE EMPLOYEE_ID = 159);
													   
	
-- ����, ��ձ޿��� ����ϵ�,
-- ��ձ޿��� Bruce������� ���̹޴� ��츦 ��ȸ
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) > (SELECT AVG(SALARY) FROM EMPLOYEES
					 WHERE FIRST_NAME = 'Bruce');
					
					
-- ������̺��� �޿��� ���� ���� ����� ���, �̸�, �޿��� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);


-- 137�� ������� �޿��� ũ�ų� ����, 149�� ������ٴ� �޿��� �۰ų� ����
-- ����� �̸��� �޿��� ��ȸ
SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN (SELECT SALARY FROM EMPLOYEES
					  WHERE EMPLOYEE_ID = 137) AND (SELECT SALARY FROM EMPLOYEES
					  								WHERE EMPLOYEE_ID = 149);
					  								

-- JOIN
-- PRIMARY KEY -> �ߺ� X, NULL �� ������� ����

-- FOREIGN KEY -> �ٸ� ���̺��� PK�� �ǹ��Ѵ�.
--				    ���̺��� ���踦 ���� �� ����Ѵ�.
--			           �ߺ��� �����ϴ�.					  							