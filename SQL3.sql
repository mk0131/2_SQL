


-- NOT IN (��,��,��, ...)
select EMP_ID, EMP_NAME, DEPT_CODE
from employee e 
where DEPT_CODE not in ('D1','D5');

-- ABS(��) : Ư��  ������ ���밪 ǥ��.
select  ABS(10) , abs(-10) ;

-- MOD() : �־��� �÷��̳� ���� ���� �������� ��ȯ
select mod (10,3), mod (10,2), mod (10,7);

-- ROUND() : ������ �ڸ��� ���� �ݿø�.
select round(123.456,0), -- �Ҽ��� ù°�ڸ� �ݿø�
	   ROUND(123.456,1),
	   round(123.456,2), 
	   ROUND(123.456,-2); -- 10�� �ڸ� �ݿø�
	   
-- CEIL : �Ҽ��� ù° �ڸ����� �ø�
-- FLLOR : �Ҽ��� ���� �ڸ��� ��� ����.
select ceil (123.456) , floor(123.456); 


-- TRUNCATE() : ������ ��ġ���� ���ڸ� ������ �Լ�
select truncate(123.456,0),
	   TRUNCATE(123.456,1),
	   TRUNCATE(123.465,2),
	   TRUNCATE(123.456,-2);
	   
-- CEILING(����) : �Ҽ��� �ݿø� 
select ceiling (4.0),
	   ceiling (4.1),
	   ceiling (4.2),
	   ceiling (3.9),
	   ceiling (3.1); 
	  
select  ceiling (-4.0),
        ceiling (-4.1),
        ceiling (-3.9);
        
-- EMPLOYEE ���̺��� �Ի��� ���� ���ڰ� Ȧ�� ���� ������
-- ��� ����� �Ի��� ������ ��ȸ
select EMP_ID,
EMP_NAME,
HIRE_DATE
from employee e 
where mod (substr(HIRE_DATE,7,1),2) = 1;

-- DATE_ADD(��¥,INTERVAL)
-- DATE_SUB(��¥,INTERVAL)

select EMP_NAME,HIRE_DATE,
date_add(HIRE_DATE,interval 1 DAY) 
from employee e ;

select EMP_NAME,HIRE_DATE,
date_sub(HIRE_DATE,interval 10 YEAR)
from employee e ;

-- DAYOFWEEK(��¥)
-- �ش� ��¥�� ������ ����
-- 1:�Ͽ��� ~7:�����
select dayofweek(now());      

select EMP_NAME,
case 
	when DAYOFWEEK(HIRE_DATE) = 1 then '�Ͽ���'
	when DAYOFWEEK(HIRE_DATE) = 2 then '������'
	when DAYOFWEEK(HIRE_DATE) = 3 then 'ȭ����'
	when DAYOFWEEK(HIRE_DATE) = 4 then '������'
	when DAYOFWEEK(HIRE_DATE) = 5 then '�����'
	when DAYOFWEEK(HIRE_DATE) = 6 then '�ݿ���'
	when DAYOFWEEK(HIRE_DATE) = 7 then '�����'	
end as '����'
from employee e ;

-- LAST_DAY(��¥) : ��¥�� ������ ���ڸ� ��ȸ
select LAST_DAY(now());

-- EMPLYOEE ���̺��� �ٹ������ 20�� �̻��� �������
-- ��� ����� �μ��ڵ� �Ի��� ��ȸ
select EMP_ID ���,
EMP_NAME �����,
DEPT_CODE �μ��ڵ�,
HIRE_DATE �Ի���
from employee e 
where date_add(HIRE_DATE, interval 20 year) <= now();  


-- ����ȯ �Լ�
-- CAST(), CONVERT() : �־��� ���� ���ϴ� �������� ����
select cast(20220429 as DATE),convert (20220429,DATE);
select cast(20200101030330 as CHAR), convert(20200101030330,CHAR);
select cast(now() as CHAR);

-- BINARY ���� ������
-- CHAR ����
-- DATE ��¥
-- INTEGER ���� (UNSIGEND INTEGER: �����)
-- DECIMAL �Ҽ�������
-- JOSN JSONŸ��

select '123'+'456';
select '123'+'456ABC';
select '123'+'4A56BC';


-- SELECT ���� ���� ����
/*
 * 5:SELECT �÷�, ����, �Լ��� AS ��Ī
 * 1:FROM ���̺��
 * 2:WHERE ����
 * 3:GROUP BY �׷��� ���� �÷�
 * 4:HAVING �׷쿡 ���� ���ǽ�
 * 6:ORDER BY �÷� | ��Ī | ����
 * 
 */
select EMP_ID,EMP_NAME �̸�,SALARY, DEPT_CODE
from employee e 
-- order by EMP_ID; --������ �⺻���� ASC
-- order by EMP_NAME asc ;
-- order by DEPT_CODE desc , EMP_ID;
order by 3 desc ; -- �÷��� ���� 


-- GROUP BY --
-- �μ��� ���
select truncate(AVG(SALARY),-4)
from employee e ;

-- D1 ��� �޿�
select truncate(AVG(SALARY),-4)
from employee e 
where DEPT_CODE = 'D1';

-- Ư�� �÷��� �ϳ��� �׷����� ���� �� ���̺� ������ ��ȸ
select DEPT_CODE, truncate(AVG(SALARY),-4)
from employee e 
group by DEPT_CODE
order by 1 asc ;

-- EMPLOYEE ���̺���
-- �μ��� �� �ο� �޿� �հ� �޿� ��� �ִ� �޿� �ּ� �޿� �� ��ȸ
-- �μ��ڵ� �������� ���� truncate(,-3) �� ó�� 
select DEPT_CODE,
count(*) "�� �ο�", 
TRUNCATE(SUM(SALARY),-3) "�޿� �հ�",
TRUNCATE(AVG(SALARY),-3) "�޿� ���",
TRUNCATE(MAX(SALARY),-3) "�ִ� �޿�",
TRUNCATE(MIN(SALARY),-3) "�ּ� �޿�"
from employee e 
group by DEPT_CODE 
order by 1 asc;


-- HAVING
-- GROUP BY �� �ұ׷쿡 ���� ������ ����
-- �μ��� �޿� ����� 300���� �̻��� �μ�
select DEPT_CODE,
truncate(AVG(SALARY),-4) ���
from employee e 
group by DEPT_CODE
having avg(SALARY)>3000000 
order by 1;


-- �μ��� �׷��� �޿� �հ� �� 900���� �ʰ��ϴ�
-- �μ��� �μ��ڵ�� �޿� �հ� ��ȸ.
select DEPT_CODE,
sum(SALARY) �޿��հ�
from employee e 
group by DEPT_CODE 
having sum(SALARY) > 9000000
order by 1;

select DEPT_CODE, JOB_CODE, SUM(SALARY)
from employee e 
group by DEPT_CODE, JOB_CODE ;

select DEPT_CODE, JOB_CODE, SALARY
from employee e 
where DEPT_CODE = 'D5'
order by 2;

-- EMPLOYEE ���̺��� ���� �� �׷��� ���Ͽ�
-- ���� �ڵ� �޿� �հ� �޿� ��� �ο� ���� ��ȸ
-- �� �ο����� 3���� �ʰ�
-- ��ȸ ����� ��������
select DEPT_CODE,
SUM(SALARY),
truncate(AVG(SALARY),-4),
COUNT(*)
from employee e 
group by JOB_CODE 
having COUNT(*) > 3
order by 4 desc;

-- SET OPERATION
-- ������
-- UNION:
-- �� �� �̻��� SELECT �� ���(RESULTSET)�� ���ϴ� ��ɾ�
-- �ߺ��� ������� �ߺ��Ǵ� ����� 1���� �����ش�
-- UNION ALL:
-- �� �� �̻��� SELECT �� ���(RESULTSET)�� ���ϴ� ��ɾ�
-- �ߺ��� ���� ��� �ߺ��Ǵ� ���� �״�� ��ȸ

-- union 
select EMP_ID,EMP_NAME,DEPT_CODE,SALARY
from employee e 
where DEPT_CODE ='D5'
UNION
select EMP_ID,EMP_NAME,DEPT_CODE,SALARY
from employee e 
where SALARY  >3000000;

-- UNION ALL
select EMP_ID,EMP_NAME,DEPT_CODE,SALARY
from employee e 
where DEPT_CODE ='D5'
union ALL
select EMP_ID,EMP_NAME,DEPT_CODE,SALARY
from employee e 
where SALARY  >3000000;

-- JOIN
-- �ΰ� �̻��� ���̺��� �ϳ��� ���� ����ϴ� ��� ����
-- 'J6'�� ������ ���� ������� �ٹ� �μ���
select EMP_NAME, JOB_CODE, DEPT_CODE
from employee e 
where JOB_CODE ='J6';

select * from department d ;
select * from employee e ;

select EMP_NAME, JOB_CODE, DEPT_CODE, DEPT_TITLE
from employee e 
join department d on(DEPT_CODE = DEPT_ID);

select EMP_ID,EMP_NAME,JOB_CODE,JOB_NAME
from employee e 
-- join JOB ON(employee.JOB_CODE = JOB.JOB_CODE);
join job j using (JOB_CODE);

-- EMPLOYEE ���̺��� ���� �޿� ������
-- SAL_GRADE �� �޿� ����� ���ļ�
-- ��� ����� �޿���� ��� ���� �ּұ޿� ��� ���� �ִ� �޿��� ��ȸ
select * from sal_grade sg ;
select * from employee e ;

select EMP_ID,
EMP_NAME,
SAL_LEVEL,
MIN_SAL,
MAX_SAL
from employee e 
join sal_grade sg USING(SAL_LEVEL);

-- INNER JOIN ���ǿ� �����ϴ� �����͸� ����
-- OUTER JOIN
-- LEFT OUTER JOIN : ù��° ���̺� �������� �ι�° ���̺��� JOIN ���ǿ� �������� �ʴ� ��� ù��° ���̺��� ���� ����
-- RIGHT OUTER JOIN : LEFT �� �ݴ�. �ι�° ���̺��� ����

-- INNER JOIN
-- ǥ�� SQL ��� 
select DEPT_CODE, DEPT_TITLE
from employee e 
inner join department d ON(DEPT_CODE = DEPT_ID)
order by 1;

-- MYSQL ���
select DEPT_CODE, DEPT_TITLE
from employee e ,department d 
where DEPT_CODE = DEPT_ID;

select E.DEPT_CODE, D.DEPT_TITLE
from employee E , department D 
where E.DEPT_CODE = D.DEPT_ID;

-- LEFT JOIN
-- ù��° ���̺��� �������� �ι�° ���̺��� ����.
select DEPT_CODE, DEPT_TITLE
from employee e 
left join department d ON(DEPT_CODE = DEPT_ID)
order by 1;

-- RIGHT JOIN
-- �ι�° ���̺��� ����
select EMP_NAME, DEPT_CODE, DEPT_ID
from employee e 
right join department d  ON(DEPT_CODE = DEPT_ID);

-- -------
select EMP_NAME, DEPT_CODE, SALARY, sg .SAL_LEVEL
from employee e 
join sal_grade sg ON(SALARY between MIN_SAL and MAX_SAL);

-- SELF JOIN
select e .EMP_ID ���,
e .EMP_NAME �����,
e .MANAGER_ID "������ ���",
e2.EMP_NAME �����ڸ�
from employee e 
join employee e2 ON(e .MANAGER_ID = e2.EMP_ID);

-- �������� ���̺��� JOIN �ϴ°�
select *
from employee e 
join department d ON(DEPT_CODE = DEPT_ID)
join location l on (location_ID = LOCAL_CODE);

-- ������ �븮�̸鼭 �ƽþ� �������� �ٹ��ϴ� ��� ��ȸ
-- ��� ����� ���޸� �μ��� �ٹ������� �޿�
select EMP_ID ���,
EMP_NAME �����,
JOB_NAME ���޸�,
DEPT_TITLE �μ���,
LOCAL_NAME �ٹ�������,
SALARY �޿�
from employee e 
join job j ON(e .JOB_CODE = j.JOB_CODE and JOB_NAME = '�븮')
join department d ON(DEPT_CODE = DEPT_ID)
join location l ON(location_ID = local_CODE and LOCAL_NAME like 'ASIA%');


-- �ѱ��� �Ϻ��� �ٹ��ϴ� �ٹ� �������� ������ ��ȸ�Ͻÿ�
-- ����� �μ��� ������ ������ ��ȸ

select EMP_NAME �����,
DEPT_TITLE �μ���,
LOCAL_NAME ������,
NATIONAL_NAME ������
from employee e 
join department d ON(DEPT_CODE = DEPT_ID )
join location l ON(LOCATION_ID = LOCAL_CODE)
join national USING(NATIONAL_CODE)
where NATIONAL_CODE IN('KO','JP')
order by 3;


-- SUB QUERY
-- �ּ� �޿��� �޴� ��� ���� ��ȸ
select MIN(SALARY)
from employee e ;

select *
from employee e 
where SALARY  = (select MIN(SALARY) from employee e2 );

-- ���� �� ��������
-- ��� ���� ���� �� ������ ��������

-- �� ���޺� �ּ� �޿��� �޴� ��� ����
select MIN(SALARY)
from employee e 
group by JOB_CODE;

select *
from employee e 
where SALARY  in  
(select 
MIN(SALARY)
from employee e2 
GROUP by JOB_CODE);


-- ������ ���߿� ��������
-- ���� �÷�, ���� �ο� �� ����� �������� ���������� ���.
select JOB_CODE , MIN(SALARY)
from employee e2 
group by JOB_CODE ;

select *
from employee e 
where (JOB_CODE,SALARY)IN(select JOB_CODE , MIN(SALARY)
from employee e2 
group by JOB_CODE);

-- ������ ���߿� �������� �ڵ带 ������ �������� �� ����

select * from employee e where ENT_YN ='Y';

-- ����� �������� ���� ����, ���� �μ��� �ٹ��ϴ� ���� ���� ��ȸ
select * from employee e 
where DEPT_CODE  = (select DEPT_CODE  from employee e2 where ENT_YN = 'Y')
and JOB_CODE  = (select JOB_CODE from employee e3 where ENT_YN = 'Y')
and EMP_ID <> (select EMP_ID from employee e4 where ENT_YN = 'Y');

-- ���߿�
select * from employee e 
where (DEPT_CODE,JOB_CODE) = (select DEPT_CODE,JOB_CODE from employee e where ENT_YN ='Y')
and EMP_NAME != (select EMP_NAME from employee e  where ENT_YN ='Y');

-- FROM ��ġ�� ���Ǵ� ��������
-- INLINE VIEW 
-- ���̺��� ���̺������ ���� ��ȸ�ϴ� ���
-- ���������� RESULTSET �� Ȱ���Ͽ� ������ ��ȸ

select * from employee e ;

select *
from (
	select EMP_ID,EMP_NAME,DEPT_TITLE,JOB_NAME
	from employee e 
	join department d ON(DEPT_CODE = DEPT_ID)
	join JOB using(JOB_CODE)
 ) T;

select EMP_NAME, SALARY,
rank () OVER(order by SALARY desc)����
from employee e ;

select * 
FROM(
select EMP_NAME, SALARY,
rank () OVER(order by SALARY desc)����
from employee e 
) T
where ���� <4;