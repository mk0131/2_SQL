-- ����� �μ�
select * from department;

-- ����� �μ��� ����� Ȯ��
select count(*) from department d ;

-- ����� ���� ������� Ȯ��
select count(*) from employee ;

-- ��� ����
select * from sal_grade ;

-- ��� ����
select * from employee ;

-- ���� 1.EMPLOYEE ���̺��� ������ 200���� ���� ���� �޴� ����� ��� ���� ���
select * from employee where SALARY > 3000000;

-- ���� 2. EMPLOYEE ���̺��� �Ի��� ��¥�� '2000-01-01' ���� �� ������� �̸�, �ֹι�ȣ, �Ի��� ���
select EMP_NAME , EMP_NO , HIRE_DATE from employee where HIRE_DATE > '2000-01-01'; 

-- �μ� �ڵ尡 D6 �� ��� ���� ��� ��ȸ�ϱ�
select * from employee  where DEPT_CODE = 'D6';

-- ������ J1�� ����� ��� ����� �����ڵ� �μ��ڵ带 ��ȸ
select EMP_ID , EMP_NAME , JOB_CODE , DEPT_CODE from employee where JOB_CODE ='J1';

-- �μ��ڵ尡 D6 �̸鼭 �̸��� ����� �� ����� ��� ���� ��ȸ�ϱ�
select * from employee where DEPT_CODE = 'D6' and EMP_NAME ='�����';