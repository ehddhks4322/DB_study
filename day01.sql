--�ּ�
/*������
 * �ּ�
 */


-- DML(DataManipulationLanguage)
-- SELECT(��ȸ),INSERT(�߰�),UPDATE(����),DELETE(����)

-- SELECT �÷���1,�÷���2,�÷���3 FROM ���̺��;

-- ������̺��� ��� ���� ��ȸ�ϱ�
SELECT * FROM EMPLOYEES;

-- �μ����̺��� ��� ���� ��ȸ�ϱ�
SELECT * FROM DEPARTMENTS;

-- ������̺��� �̸�,����,�޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES;

-- ������̺��� ���, �̸�, �Ի���, �޿��� ��ȸ�ϼ���
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES;

-- �÷��� ���� ������ ����ϰ� ���� �� 
-- ������̺��� ���,�̸�,����,�޿�,���ʽ� �ݾ��� ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY*COMMISSION_PCT FROM EMPLOYEES;

-- where�� (���Ǻο�) ������ FROM �ڿ��� ���!
-- ����ڰ� ���ϴ� �����͸� �˻��� �� ������ ���� ����� ���߸� �� �ִ�.

-- where ���� ����
-- �÷���(���ǽ��� ������ ��ġ)
-- �񱳿����� (=, >, <...)
-- ����,����(���ǽ��� �����ʿ� ��ġ)

-- ������̺��� �޿��� 10000�̻��� ������� ������ ���,�̸�,�޿������� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY >= 10000;