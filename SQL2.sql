-- CRUD : ������ �⺻ ó�� ����
-- CREATE : ������ �߰� / INSERT
-- READ : ������ ��ȸ / SELECT
-- UPDATE : ������ ���� / UPDATE
-- DELETE : ������ ���� / DELETE 


-- SELECT : ��ȸ�� SQL
-- FROM ���̺��
-- WHERE ����
-- ORDER BY �÷� 7
-- ;

-- �÷��� ��Ī �ޱ�
-- 1. AS ǥ��
select EMP_ID as "�����ȣ", EMP_NAME as "�����"
from employee;

-- 2. AS ����
select  EMP_ID "�����ȣ" , EMP_NAME "�����"
from employee e ;

select EMP_NAME "�����" ,
	(SALARY*12) "����",
	BONUS "���ʽ�",
	(SALARY + (SALARY*BONUS)) * 12 "���� ����"
	from employee e;
	
-- IFNULL() : ���� ���� ��ȸ�ϴ� ���� NULL�̸� ������ ������ ����
select  EMP_NAME "�����",
		(SALARY*12) ����, '��' ����,
		BONUS '���ʽ�',
		(SALARY + (SALARY*IFNULL(BONUS,0)))*12 "��������"
from employee e ;

-- DISTINCT
-- �ߺ� ���� �ϰ� �� ���� ��ȸ
select EMP_NAME, DEPT_CODE
from employee e ;

select distinct DEPT_CODE
from employee e ;

-- �ǽ�1
-- DEPARTMENT ���̺��� �����Ͽ� �μ��� �ؿܿ���2�� �� �μ��� �μ��ڵ带 ã��
-- EMPLOYEE ���̺��� �ش� �μ��� ����� �� �޿��� 200���� ���� ���� �޴� ������
-- ���, ����� �޿��� ��ȸ�Ͻÿ�.

select * from department d
where  DEPT_TITLE = '�ؿܿ���2��';


select EMP_ID ���, EMP_NAME �����, SALARY �޿�  
from employee e 
where DEPT_CODE = 'D6' and SALARY > '2000000';

-- ������ --
-- �� ����
-- <, >, <=, >= : ũ�⸦ ��Ÿ���� �ε�ȣ
-- = : ����
-- !=, <> : �����ʴ�.

-- EMPLOYEE ���̺��� �μ��ڵ尡 'D9' �� �ƴ� ��������
-- ��� ������ ��ȸ
select * from employee e 
-- where  DEPT_CODE  != 'D9';
where DEPT_CODE <> 'D9';

-- �޿��� 350���� �̻�, 550���� ������
-- ������ ���, �����, �μ��ڵ�, �����ڵ�, �޿����� ��ȸ
-- 1.
select EMP_ID , EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
from employee e 
where SALARY >= 3500000
and SALARY  <= 5500000;
-- 2.
select EMP_ID , EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
from employee e 
where SALARY between  3500000 and 3900000;

-- LIKE
-- �Է��� ����, ���ڰ� ���Ե� ������ ��ȸ�� �� ����ϴ� ������.
-- '_'
-- '%'
-- ����� �̸��� ��� ���ڰ� '��' �� ��� ���� ��ȸ
select *
from employee e 
where EMP_NAME like '_��_';

-- EMP_NO ���� ������ ����� ������ ��ȸ
select *
from employee e 
where EMP_NO like '%-1%';
-- ��� �� �̸��� ���̵� 5���� �̻��� ����� ����� ��� �̸��� ��ȸ
select EMP_NAME, EMP_ID, EMAIL
from employee e 
where EMAIL like '_____%@%';

select *
from employee e 
where EMP_NAME like '��%';

-- ��� �� �̸��� 4��° ���ڰ� '_'�� ����� ���� ��ȸ
-- ESCAPE ���ڸ� ����. �ڿ��� ���ڸ� Ư�����ڰ� �ƴ� �Ϲ� ���ڷ� ����
select *
from employee e 
where EMAIL like '___#_%@%' escape '#';

-- IN ������
-- IN (��1,��2,��3,...)
-- WHERE JOB_CODE = 'J1' OR JOB_CODE ='J4';

-- ���� �ڵ尡 J1 �̰ų� J4�� ���� ���� ��ȸ
select * from employee e 
where JOB_CODE in ('J1','J4');

select * from employee e 
where JOB_CODE not in ('J1','J4');

-- �Լ�(FUNCTION)

-- LENGTH : BYTE ���� (���� 1, �ѱ�3)
-- CHAR_LENGTH : ���� ��

-- ���ڿ��� ���̸� ����ϴ� �Լ�
select length ('HELLO'), char_length('HELLO') ;
select length ('���α�'), char_length('���α�') ;

-- INSTR : �־��� ������ ���ϴ� ���ڰ� ���°���� ã�� ��ȯ�ϴ� �Լ�
select instr('ABCD','A'),
instr('ABCD','C'),
instr('ABCD','Z'); 
select instr('ABCDEF','CD');

-- SUBSTR()
select 'HELLO WORLD',
substr('HELLO WORLD',1,5),
substr('HELLO WORLD',7); 

-- �ǽ�2.
-- EMPLOYEE ���̺��� ������� �̸�, �̸��� �ּҸ� ��ȸ
-- �� �̸����� ���̵� �κи� ��ȸ

-- �̸��� �̸��� ��ȸ
select EMP_NAME , EMAIL from employee e ;
-- @ ��ġ ã��
select instr(EMAIL,'@')
from employee e2 ;
-- SUBSTR Ȱ��
select EMP_NAME, substr(EMAIL,1,instr(EMAIL,'@')-1)
from employee e ;

-- LPAD/RPAD
-- ��ĭ�� ������ ���ڷ� ä��� �Լ�
select lpad(EMAIL,20,'*')
from employee e ;

select  rpad(EMAIL,20,'*')
from employee e ;

-- LTRIM/RTRIM
select ltrim('      HELLO'), rtrim('HELLO     ') ;
select ltrim('     H  ELLO     '); 

-- TRIM : �糡�� �������� Ư�� ���ڸ� �����ִ� �Լ�
select trim('   5����   '); 
select trim('0' from '0012300'); 
-- LEADING / TRAILING
select trim(leading '0' from '0012300'); 
select trim(trailing  '0' from '0012300');
select trim(both  '0' from '0012300'); 

-- CONCAT : 
select CONCAT('���̿���ť��','�ʹ��ʹ� ��̾����:)');

-- REPLACE : �־��� ���ڿ����� Ư�� ���ڸ� ������ �� ����ϴ� �Լ�
 select replace ('HELLO WORLD','HELLO','BYE');

-- EMPLOYEE ���̺��� ��� ����� ��� ����� �̸��� �ֹι�ȣ ��ȸ
-- �̶� �̸����� @ ������ �ֹι�ȣ�� 7��° �ڸ� ���� * ó���Ͽ� ��ȸ
select EMP_ID ���, EMP_NAME �����, 
substr(EMAIL,1,instr(EMAIL,'@')-1) �̸���, 
rpad(substr(EMP_NO,1,8),14,'*') �ֹι�ȣ 
from employee e ;
-- EMPLOYEE ���̺��� ���� �ٹ��ϴ�
-- ���� ����� ���, �����, �����ڵ带 ��ȸ
select EMP_ID, EMP_NAME, JOB_CODE, ENT_YN
from employee e 
where ENT_YN = 'N'
and substr(EMP_NO,8,1) = '2';

-- ������ �Լ� : ��� ã�Ƽ� ����� ������ (�� �ึ��)�Լ� ����
-- ������ �Լ� : ���ǿ� �����ϴ� ��� ���� ã�� ���� �ѹ��� ����

-- SUM(���ڰ� ��ϵ� �÷�) : �ش� �÷����� �հ�
select SUM(SALARY)
from employee e ;

-- AVG('') : ����� ����
select AVG(SALARY)
from employee e ;

-- MAX('') , MIN('') :�ִ� �ּ� ��
select max(SALARY),min(SALARY)
from employee e ;

-- EMPLOYEE ���̺���
-- '�ؿܿ���1��' �� �ٹ��ϴ� ������� ��� , MAX, MIN, �޿��� ��ȸ����
select * from department d ;
select avg(SALARY),max(SALARY),min(SALARY),sum(SALARY)  
from employee e 
where DEPT_CODE ='D5'

select max(SALARY),EMP_NAME
from employee e ;

-- COUNT (�÷���) : ���� ����
select count(*),count(DEPT_CODE),count(distinct DEPT_CODE)
from employee e ;

-- ��¥ ó�� �Լ�
-- SYSDATE(),NOW() : ���� ��ǻ���� ��¥�� ��ȯ
select sysdate(),now() ; 

select now(),sleep(5), sysdate();  

-- �γ�¥ ������ ����
-- DATEDIFF : �ܼ� �� ����
-- TIMESTAMPDIFF : �� �б� �� �� �� �� �� �� ����
select HIRE_DATE �Ի���,
DATEDIFF(now(),HIRE_DATE)+1
from employee e ;

select HIRE_DATE,
TIMESTAMPDIFF(year ,HIRE_DATE,now()) "����"
from employee e ;
-- SECOND MINUTE HOUR DAY WEEK MONTH QUARTER YEAR

-- EXTRACT(YEAR | MONTH | DAY FROM ��¥)

select HIRE_DATE, 
	extract(year  from HIRE_DATE),
 	extract(month from HIRE_DATE),
	extract(day from HIRE_DATE)
from employee;

-- DATE_FORMAT()
-- ��¥ ���� ����
select HIRE_DATE,
date_format(HIRE_DATE,'%Y%m%d%H%i%s'),
date_format(HIRE_DATE,'%y/%m/%d %H:%i:%s'),
date_format(now(),'%y/%m/%d %H:%i:%s') 
from employee e ;

-- STR_TO_DATE(CHAR,FORMAT)
select 20190322,
STR_TO_DATE('20190322','%Y%m%d'),
STR_TO_DATE('190322','%y%m%d'),
STR_TO_DATE(190322,'%y%m%d');

-- IF(����,��,��)
-- ���� �ٹ��ϴ� �������� ������ ��, �� ��������
select EMP_NAME,
	EMP_NO,
	if (substr(EMP_NO,8,1) = 1,'��','��')����
	from employee e ;

-- EMPLOYEE ���̺��� ��� ������ ��� ����� �μ��ڵ� �����ڵ� �ٹ����� ������ ���θ� ��ȸ
-- �̶� �ٹ����ΰ� Y �� ����� N �̸� �ٹ���
-- ������ ����� ������ ���, ������ ������

select * from employee e ;

select  EMP_ID ��� ,
		EMP_NAME �����,
		DEPT_CODE �μ��ڵ�,
		JOB_CODE �����ڵ�, 
		if(ENT_YN = 'N','�ٹ���','�����') "�ٹ� ����", 
		if(MANAGER_ID is not NULL,'���','������') "������ ����" 
from employee e ;


-- CASE 
-- �ڹ��� IF, SWITCH ó�� ��밡��
-- CASE
-- when ���ǽ� 1 then ����� 1
-- ELSE �����2
-- END


select  EMP_ID ���,
		EMP_NAME �����,
		DEPT_CODE �μ��ڵ�,
		JOB_CODE �����ڵ�,
		case
			when ENT_YN ='Y' then '�����'
			else '�ٹ���'			
		end "�ٹ� ����",
		case
			when MANAGER_ID is null then '������'
			else '���'
		end "������ ����"
from employee e ;
		

-- ������ 'J2' �̸鼭 200���� �̻� �޴� ���� �̰ų�
-- ������ 'J7' �� ����� ��� ����� �����ڵ� �޿� ���� ��ȸ

select  EMP_ID ���,
		EMP_NAME �����,
		JOB_CODE �����ڵ�,
		SALARY �޿�
from employee e 
where (JOB_CODE ='J2' and SALARY >=2000000)
or (JOB_CODE ='J7');


-- ����� �ֹ� ��ȣ�� Ȯ���Ͽ� ���� �� �� �� ���� ��ȸ �Ͻÿ�
select * from employee e ;

select EMP_NAME �̸�,
concat(substr(EMP_NO,1,2),'��') "����", -- ù��°���� �ΰ� �������� 
concat(substr(EMP_NO,3,2),'��') "����",
concat(substr(EMP_NO,5,2),'��') "����"
from employee e;
		

-- �μ��ڵ尡 D5,D9 �� ������ �߿��� 2004�⵵�� �Ի��� ������ ��ȸ
-- ��� ����� �μ��ڵ� �Ի���
select EMP_ID ���,
EMP_NAME �����,
DEPT_CODE �μ��ڵ�,
HIRE_DATE �Ի���
from employee e 
where DEPT_CODE in ('D5','D9') and  (substr(HIRE_DATE,3,2)=04);  

-- ������ �Ի��� �Ի��� ���� �ٹ��ϼ� ��ȸ
-- �� �ָ��� ������(LAST_DAY() : �־��� ��¥�� �ش���� ������ �� ��ȯ)
select EMP_NAME ������,
HIRE_DATE �Ի���,
TIMESTAMPDIFF(day,HIRE_DATE,LAST_DAY(HIRE_DATE))+1 "�Ի��� ���� �ٹ��ϼ�"
from employee e2 ;

-- ������ �μ��ڵ� ������� ���� ��ȸ
-- ��, ��������� �ֹι�ȣ���� �����ؼ� 00�� 00�� 00�Ϸ� ��µǰ� ��.
-- ���̴� �ֹι�ȣ���� �����ؼ� ��¥�����ͷ� ��ȯ�� ���� ���
select EMP_NAME �̸�,
DEPT_CODE �μ��ڵ�,
CONCAT(SUBSTR(EMP_NO,1,2),'��',SUBSTR(EMP_NO,3,2),'��', SUBSTR(EMP_NO,5,2),'��') as "�������",
TIMESTAMPDIFF(year ,STR_TO_DATE(CONCAT ('19',substr(EMP_NO,1,6)),'%Y%m%d'), now()) as "����"
from employee e ;
-- TIMESTAMPDIFF(year ,HIRE_DATE,now()) "����"
-- STR_TO_DATE('190322','%y%m%d')



-- �μ��ڵ尡 D5�̸� �ѹ��� D6�̸� ��ȹ�� D9�̸� �����η� ó���Ͻÿ�
-- => CASE ���  ����� �μ��ڵ� �μ���
select EMP_NAME �����,
DEPT_CODE �μ��ڵ�,
case 
	when DEPT_CODE = 'D5' then '��ȹ��'
	when DEPT_CODE = 'D6' then '������'
	when DEPT_CODE = 'D9' then '������'
end "�μ���"
from employee e 
where DEPT_CODE in ('D5','D6','D9');
