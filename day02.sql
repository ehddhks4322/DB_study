-- ������̺��� �̸��� 'Michael��' ����� ���, �̸��� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME = 'Michael';

-- ������̺��� ������ IT_PROG�� ������� ������ ���, �̸�, ����, �޿� ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

-- ������̺��� �޿��� 10000�̻��̸鼭 13000������ ����� ������ �̸�, �޿������� ��ȸ
SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY <= 13000;

-- ������̺��� 06�⵵�� �Ի��� ������� ������ ���, �̸�, ����, �Ի��ϼ����� ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE >= '2006-01-01' AND HIRE_DATE <= '2006-12-31';

-- ������̺��� �޿��� 2200, 3200, 5000, 6800�� �޴� ������� ������ ���, �̸�, ����, �޿������� ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY = 2200 OR SALARY = 3200 OR SALARY = 5000 OR SALARY = 6800;

-- SQL������
-- 1. BETWEEN : A��B������ ���� ��ȸ�� �� ���(�̻�,���ϰ� �϶��� ��� ����)
-- 2. IN : OR�� ����ؼ� ����ϴ� ������
-- 3. LIKE : ����˻�

-- ������̺��� �޿��� 5000�̻��̰� 6000������ ����� ������ ���, �̸�, �޿������� ��ȸ
--SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
--WHERE SALARY >= 5000 AND SALARY <= 6000;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 6000;

-- IN������
-- ������ SA_MAN, IT_PROG�� ������� ������ �̸�, ���������� ���
--SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
--WHERE JOB_ID = 'SA_MAN' OR JOB_ID = 'IT_PROG';

SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE JOB_ID IN('SA_MAN','IT_PROG');

-- LIKE������(����˻�)
-- % : ��簪
-- _ : �ϳ��� ��

-- EX) 'M%' : M���� �����ϴ� ��� ������
-- EX) '%M' : M���� ������ ��� ������
-- EX) '%A%' : ���� ���� A�� �����ϰ� �ִ� ��� ��
-- EX) 'A_' : A�� �����ϴ� �� ���� ������
-- EX) '__A' : A�� ������ �� ���� ������

-- ������̺��� ������� �̸� �� M���� �����ϴ� ����� ������ ���, �̸�, ���� ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'M%';

-- ������̺��� �̸��� d�� ������ ����� ���, �̸�, ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%d';

-- ������̺��� �̸��� ������ a�� ���ԵǾ��ִ� ����� ������ �̸�, ���� ������ ���
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%a%';

-- ������̺��� �̸��� ����° ���ڿ� a�� ���� ������� ������ ���, �̸������� ���
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__a%';

-- �̸��� H�� �����ϸ鼭 6���� �̻��� ������� ������ ���, �̸� ������ ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'H_____%';

-- ������̺��� �̸��� s�� ���ԵǾ����� ���� ������� ������ ���, �̸������� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE '%s%'; 

-- ORDER BY (����)
-- ���� ����� ��ȯ�Ǵ� �ൿ�� Ư�� �������� �����ϰ��� �� �� ���
-- ORDER BY���� �׻� �ǵڿ� �ۼ��� �ȴ�.
-- ASC : ��������(��������)
-- DESC : ��������(���� �Ұ���)

-- ������̺��� �޿��� ���̹޴� ��������� ���, �̸�, �޿�, �Ի����� ����ϵ� 
-- �޿��� ������� �Ի����� ���������� ����
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
ORDER BY SALARY DESC, HIRE_DATE ASC;

-- ���̺� ��ü ��ȸ��  �÷��� ������ ������ ������ ����
SELECT * FROM EMPLOYEES ORDER BY 8 ASC;

-- �޿��� 15000�̻��� ������� ���, �̸�, �޿�, �Ի�����
-- �Ի����� ���������� ��ȸ 
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE FROM EMPLOYEES
WHERE SALARY >= 15000

-- SQL�Լ�
-- ����Ŭ���� ��ü������ �����ϴ� �Լ�
-- ��Ȳ�� �´� ������ �Լ��� ����ϱ� ���ؼ��� � ����� �ϴ� �Լ����� �����ϴ��� �ľ��ؾ� �Ѵ�.

-- �����Լ��� ����
-- ������ �Լ� : 1���� ��(1��)�� ���� �Լ��� ����Ǿ� 1���� ���� ��ȯ�Ѵ�.
-- ���� �Լ� : 1�� �̻��� ���� ���� �Լ��� ����Ǿ� 1�� �̻��� ���� ��ȯ�Ѵ�.

-- �����Լ�

-- ������ ���ڸ� ASCII(�ƽ�Ű �ڵ�)������ ��ȯ�ϴ� �Լ�
SELECT ASCII('A') FROM DUAL; -- DUAL(������ ���̺�)

-- ������ ������ ��ġ�ϴ� ASCII�ڵ带 ��ȯ�Ѵ�.
SELECT CHR(65) FROM DUAL;

-- ���� ������, �����ʿ� ���� �� ���鿡 Ư�� ���ڸ� ä�� ��ȯ�Ѵ�.
SELECT RPAD(CITY,10,'*') FROM LOCATIONS;

--������ ������, ���ʿ� ���� �� ���鿡 Ư�� ���ڸ� ä�� ��ȯ�Ѵ�.
SELECT LPAD(CITY,10,'*') FROM LOCATIONS;
ORDER BY HIRE_DATE ASC;

-- ���ڿ��� ���� ���ڵ��� �����Ѵ�.
SELECT TRIM('   HELLO   ') FROM DUAL;

-- Ư�� ���� ��������
SELECT TRIM('Z'FROM'ZZZHELLOZZZ') FROM DUAL;

-- RTRIM : ������ ���鸸 ����, LTRIM : ���� ���鸸 ����

-- Ư�� ���� ��ġ�� ��ȯ�Ѵ�.(INDEX�� �ƴ�(0������ ���� �ƴ�))
SELECT INSTR('HELLOW','O') FROM DUAL;

-- HELLOW ���� L�� ��ġ�� 1�����ͽ����ؼ� ���°�� ������ L�� ��ȯ
SELECT INSTR('HELLOW','L',1,2) FROM DUAL;

-- ã�� ���ڿ��� ������ 0�� ��ȯ�Ѵ�.
SELECT INSTR('HELLOW','Z') FROM DUAL;

-- ù ���ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ�, �����̳� /�� �����ڷ� �ν�
SELECT INITCAP('good morning') FROM DUAL;
SELECT INITCAP('good/morning') FROM DUAL;

-- ���ڿ��� ���̸� ��ȯ�ϴ� �Լ�(���� ����)
SELECT LENGTH('jhon') FROM DUAL;

-- ù��° ������ ���ڸ� �ι�° ������ ���ڷ� ġȯ�ϴ� �Լ�
SELECT REPLACE(FIRST_NAME,'el','**') FROM EMPLOYEES;

-- �����͸� �빮�ڷ� �ٲ��ִ� �Լ�
SELECT UPPER('good morning') FROM DUAL;

-- �����͸� �ҹ��ڷ� �ٲ��ִ� �Լ�
SELECT LOWER('GOOD MORNING') FROM DUAL;

-- ���� ����ϴ� �� : LENGTH, UPPER, LOWER, REPLACE

-- �����Լ�

-- ABS() : ���밪�� ��ȯ�ϴ� �Լ�
SELECT -10, ABS(-10) FROM DUAL;

-- �ݿø� ���ִ� �Լ�
SELECT ROUND(3.141592), ROUND(3.141592,2) FROM DUAL;

-- �־��� �����ͺ��� �۰ų� ���� ���� �� �ִ밪�� ��ȯ�Ѵ�.
SELECT FLOOR(2), FLOOR(2.1) FROM DUAL;

-- ���� �Լ�
SELECT TRUNC(3.141592), TRUNC(3.141592,2) FROM DUAL;

-- �־��� ���� ����, ���, 0�� ���θ� �Ǵ��ϴ� �Լ�
-- ������ -1, ����� 1, 0�̸� 0�� ��ȯ�Ѵ�.
SELECT SIGN(-100),SIGN(100),SIGN(0) FROM DUAL;

-- �־��� ���ں��� ũ�ų� ���� ���� �� �ּҰ��� ��ȯ�ϴ� �Լ�
SELECT CEIL(2),CEIL(2.1) FROM DUAL;

-- ������ �� �������� ��ȯ�ϴ� �Լ�
SELECT MOD(1,3), MOD(2,3), MOD(3,3), MOD(4,3) FROM DUAL;

-- ������ ���ִ� �Լ�
SELECT POWER(2,1), POWER(2,2), POWER(2,3) FROM DUAL;

-- ��¥�Լ�

-- SYSDATE : ���糯¥�� �����ش�.

SELECT SYSDATE FROM DUAL;

-- Ư�� ��¥�� �������� �����ִ� �Լ�
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) FROM DUAL;

-- ������̺��� ��� ����� �Ի��Ϸκ��� 6���� ���� ��¥�� 
-- �̸�, �Ի���, 6���� ���� ��¥ ������ ����غ�����.
SELECT FIRST_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6) FROM EMPLOYEES;

-- �� ��¥ ������ ������ -> (�ֱٳ�¥,�����ȳ�¥)������ ����� �Ѵ�.
SELECT MONTHS_BETWEEN(SYSDATE,HIRE_DATE) FROM EMPLOYEES;

-- ������� �̸�, �Ի���, �Ի��� ���ñ����� �������� ��ȸ�ϵ�, 
-- �Ի�Ⱓ�� 200���� �̻��� ����� ����� �ϰ�, �Ҽ����� ���ڸ������� �������� ���
SELECT FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) FROM EMPLOYEES
WHERE MONTHS_BETWEEN(SYSDATE,HIRE_DATE) >= 200;


-- ����� 120���� ����� �Ի��� 3�� 6������ �Ǵ³� ����ߴ�.
-- �� ����� ���, �̸�, �Ի���, ������� ����ϼ���.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE,42) FROM EMPLOYEES
WHERE EMPLOYEE_ID = 120;