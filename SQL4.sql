-- RANK() DENSE_RANK() / ROW_NUM0BER()

-- 19,19,21
select EMP_NAME , SALARY,
	RANK() OVER(order by SALARY DESC) ����
	from employee e ;
-- 19,19,20
select EMP_NAME, SALARY,
DENSE_RANK() OVER(order by SALARY DESC) ����
from employee e ;
-- ���� ���� ����
select *
from (select EMP_NAME, SALARY,
row_number () OVER(order by SALARY DESC) ����
from employee e)T
where ���� <4;

-- --------------------------------------
-- DDL
-- CREATE TABLE
-- ��������

-- ���̺� ����
create table MEMBER(
	MEMBER_NO INT,
	MEMBER_ID VARCHAR(20),
	MEMBER_PW VARCHAR(20),
	MEMBER_NAME VARCHAR(15) COMMENT 'ȸ���̸�'
);

drop table user_not_null ;
select  * from user_nocons ;

create  table USER_NOT_NULL(
	USER_NO INT not null,
	USER_ID VARCHAR(20) not null,
	USER_PW VARCHAR(20) not null
);
insert into USER_NOT_NULL VALUES(1,null,'PASS01');

desc USER_NOT_NULL;

-- UNIQUE ��������
-- �ߺ��� ������� �ʴ� ���� ����

insert into user_nocons VALUES(3,'USER01','PASS03');
select * from user_nocons ;

create TABLE USER_UNIQUE(
	USER_NO INT,
	USER_ID VARCHAR(20) unique,
	USER_PW VARCHAR(30)
);

insert into user_unique VALUES(1,'UESR01','PASS01');
-- SQL Error [1062] [23000]: Duplicate entry 'UESR01' for key 'user_unique.USER_ID'
insert into user_unique VALUES(1,'UESR01','PASS01');

select * from user_unique ;
desc user_unique ;

create table user_unique2 (
	USER_NO INT,
	USER_ID VARCHAR(20),
	USER_PW VARCHAR(30),
	UNIQUE(USER_ID)
);

insert into user_unique2 VALUES(1,'UESR01','PASS01');
-- SQL Error [1062] [23000]: Duplicate entry 'UESR01' for key 'user_unique.USER_ID'
insert into user_unique2 VALUES(1,'UESR01','PASS01');

-- UNIQUE ���������� ������ �÷��� ����
-- 1 USER01
-- 1 USER02
-- 2 USER01
-- 2 USER02

create table USER_UNIQUE3(
	USER_NO INT,
	USER_ID VARCHAR(20),
	USER_PW VARCHAR(30),
	UNIQUE(USER_ID,USER_NO)
);

insert into user_unique3 VALUES(1,'USER01','PASS01');
insert into user_unique3 VALUES(1,'USER02','PASS01');
insert into user_unique3 VALUES(2,'USER01','PASS01');
insert into user_unique3 VALUES(2,'USER02','PASS01');

select * from user_unique3 ;

-- �������ǿ� �̸� ����
show keys from employee;
select * from information_schema.TABLE_CONSTRAINTS tc ;

create table CONS_NAME(
	TEST_DATA1 INT,
	TEST_DATA2 VARCHAR(20) unique,
	TEST_DATA3 VARCHAR(20),
	constraint UK_CONSNAME_DATA3 UNIQUE(TEST_DATA3)
);

-- CHECK ��������
-- ������ �� �̿ܿ��� ���� ��ϵ��� �ʵ��� ������ �����ϴ� ����.

create table USER_CHECK(
	USER_NO INT,
	USER_ID VARCHAR(20),
	USER_PW VARCHAR(30),
	GENDER VARCHAR(3) CHECK(GENDER in('��','��'))
);
insert into user_check values (1,'USER01','PASS01','��');
-- SQL Error [3819] [HY000]: Check constraint 'user_check_chk_1' is violated.
insert into user_check values (2,'USER02','PASS02','����');

insert into user_check values (2,'USER02','PASS02','��');

-- CHECK �������ǿ� �ε�ȣ
create table TEST_CHECK2(
	TEST_DATA INT,
	constraint CK_TEST_DATA CHECK(TEST_DATA > 0)
);
insert into TEST_CHECK2 VALUES(10);
-- SQL Error [3819] [HY000]: Check constraint 'CK_TEST_DATA' is violated.
insert into TEST_CHECK2 VALUES(-10);

create table TEST_CHEC3(
	C_NAME VARCHAR(15),
	C_PRICE INT,
	C_DATE DATE,
	C_QUAL VARCHAR(1),
	CHECK(C_PRICE between 1 and 999999),
	check (C_DATE >= '2010/10/01'),
	check (C_QUAL >= 'A' and C_QUAL <= 'D')
);

-- �ϳ��� �÷��� �������� ������
create table TEST_CONS(
	TEST_NO INT not null UNIQUE
);

-- PRIMARY KEY ��������
-- '�⺻Ű ��������'
-- ���̺� ���� �� �࿡�� �� ���� �ĺ��ϱ� ���� �������� ������ �÷���
-- NOT NULL �� UNIQUE ���������� �Բ� �ɾ��ִ� �ĺ��� ������ �����Ű�� ��������

create table USER_PK_TABLE(
	USER_NO INT primary key,
	USER_ID VARCHAR(20) unique,
	USER_PW VARCHAR(20) not null,
	GENDER VARCHAR(3) CHECK(GENDER in ('��','��'))
);

desc user_pk_table ;

insert into user_pk_table VALUES(1,'USER01','PASS01','��');
insert into user_pk_table VALUES(2,'USER02','PASS02','��');
-- SQL Error [1062] [23000]: Duplicate entry '1' for key 'user_pk_table.PRIMARY'
insert into user_pk_table VALUES(1,'USER03','PASS03','��');
-- SQL Error [1048] [23000]: Column 'USER_NO' cannot be null
insert into user_pk_table VALUES(NULL,'USER03','PASS03','��');

create table USER_PK_TABLE2(
	USER_NO INT,
	USER_ID VARCHAR(20) unique,
	USER_PW VARCHAR(30) not null,
	GENDER VARCHAR(15) CHECK(GENDER in ('��','��')),
	constraint PK_USER_NOID primary KEY(USER_NO,USER_ID)
);
-- 1, USER01 --> ����
-- 2, USER02 --> ����
-- 3, USER03 --> ����
-- 2, USER01 --> ����

-- CREATE : ����
-- DROP : ����
drop table `member` ;

-- FOERIGN KEY
-- �ܷ�Ű, �ܺ�Ű, ����Ű
-- �ٸ� ���̺��� �÷����� �����Ͽ� �����ϴ� ���̺��� ������ ����Ѵ�.


create table USER_GRADE(
	GRADE_CODE INT primary key,
	GRADE_NAME VARCHAR(30) not NULL
);

insert into user_grade VALUES(1,'�Ϲ�ȸ��');
insert into user_grade VALUES(2,'VIP');
insert into user_grade VALUES(3,'VVIP');
insert into user_grade VALUES(4,'VVVIP');


select * from user_grade ;

create table USER_FOREIGN_KEY(
	USER_NO INT primary key,
	USER_ID VARCHAR(20),
	USER_PW VARCHAR(20),
	GENDER VARCHAR(1) CHECK(GENDER in('M','F')),
	GRADE_CODE INT,
	constraint FK_GRADE_CODE foreign key (GRADE_CODE)
	references USER_GRADE(GRADE_CODE)
);

insert into user_foreign_key VALUES(1,'123','321','F',2);
insert into user_foreign_key VALUES(2,'ABC','ABCD','M',4);
insert into user_foreign_key VALUES(3,'456','654','F',1);
insert into user_foreign_key VALUES(4,'DEF','DLE','M',3);
insert into user_foreign_key VALUES(5,'QWE','WEOX','F',1);

select * from user_foreign_key ;
-- SQL Error [1452] [23000]: Cannot add or update a child row: a foreign key constraint fails 
insert into user_foreign_key VALUES(6,'123','321','F',10);

select * from user_foreign_key ;
JOIN USER_GRADE USING(GRADE_CODE);

-- SQL Error [1451] [23000]: Cannot delete or update a parent row: a foreign key constraint fails 
delete from user_grade 
where GRADE_CODE = 4;

-- ���� �ɼ�
-- ON DELETE CASCADE : �ڽ� ���̺��� �����͵� ����.
drop table user_foreign_key ;

create table USER_FOREIGN_KEY(
	USER_NO INT primary key,
	USER_ID VARCHAR(20),
	USER_PW VARCHAR(20),
	GENDER VARCHAR(1) CHECK(GENDER in('M','F')),
	GRADE_CODE INT,
	constraint FK_GRADE_CODE foreign key (GRADE_CODE)
	references USER_GRADE(GRADE_CODE) on delete cascade
);

insert into user_foreign_key VALUES(1,'123','321','F',2);
insert into user_foreign_key VALUES(2,'ABC','ABCD','M',4);
insert into user_foreign_key VALUES(3,'456','654','F',1);
insert into user_foreign_key VALUES(4,'DEF','DLE','M',3);
insert into user_foreign_key VALUES(5,'QWE','WEOX','F',1);

select * from user_grade ;
select * from user_foreign_key ;

delete from user_grade where GRADE_CODE = 4;


-- ON UPDATE CASCADE

-- SQL Error [1451] [23000]: Cannot delete or update a parent row: a foreign key constraint fails 
update user_grade set GRADE_CODE = 10 where grade_code = 1;

drop table user_foreign_key ;
create table USER_FOREIGN_KEY(
	USER_NO INT primary key,
	USER_ID VARCHAR(20),
	USER_PW VARCHAR(20),
	GENDER VARCHAR(1) CHECK(GENDER in('M','F')),
	GRADE_CODE INT,
	constraint FK_GRADE_CODE foreign key (GRADE_CODE)
	references USER_GRADE(GRADE_CODE) on delete cascade on update cascade 
);

insert into user_foreign_key VALUES(1,'123','321','F',2);
-- insert into user_foreign_key VALUES(2,'ABC','ABCD','M',4);
insert into user_foreign_key VALUES(3,'456','654','F',1);
insert into user_foreign_key VALUES(4,'DEF','DLE','M',3);
insert into user_foreign_key VALUES(5,'QWE','WEOX','F',1);

select * from user_grade ;
select * from user_foreign_key ;

update user_grade set GRADE_CODE = 10 where grade_code = 1;


-- �⺻�� �����ϱ�
drop table default_table ;
create table DEFAULT_TABLE(
	DATA_COL1 VARCHAR(30) default '����',
	DATA_COL2 DATE default (CURRENT_DATE),
	DATA_COL3 DATETIME DEFAULT(CURRENT_TIME)
);

insert into default_table VALUES(default,DEFAULT,DEFAULT);

select * from default_table ;

-- DDL - ALTER
-- ALTER : ����
alter table department add constraint PK_DEPTID primary KEY(DEPT_ID);

alter table employee add constraint foreign key (DEPT_CODE) references DEPARTMENT(DEPT_ID);
alter table employee add constraint foreign key (SAL_LEVEL) references SAL_GRADE(SAL_LEVEL);


alter table employee add check(ENT_YN in ('Y','N'));
alter table employee add check(SALARY>0);

alter table employee add UNIQUE(EMP_NO);

alter table employee add foreign KEY(JOB_CODE) references JOB(JOB_CODE);
alter table department add foreign KEY(LOCATION_ID) references LOCATION(LOCAL_CODE);

alter table location add foreign key(NATIONAL_CODE) references national(NATIONAL_CODE);

-- DML
-- SELECT,INSERT,UPDATE,DELETE 
-- [CRUD]
-- C : INSERT
-- R : SELECT
-- U : UPDATE
-- D : DELETE

-- INSERT ���ο� �ο�(��)�� Ư�� ���̺� �߰��ϴ� ��ɾ��.

desc employee ;

insert into employee (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,
SAL_LEVEL,SALARY, BONUS, MANAGER_ID , HIRE_DATE , ENT_DATE , ENT_YN 
) VALUES(500,'���α�','970131-1111111','JMG21128@GAMIL.COM','01027818542','D1',
'J7','S4','5000000',0.1,'200',NOW(),null,DEFAULT);

select * from employee e 
where EMP_NAME = '���α�';

-- �÷� ����(��� �÷��� �� �߰�)
insert into employee VALUES(900,'�����','990410-2222222','MING@GMAIL.COM','01022540410','D1',
'J7','S3','3000000',0.1,'200',NOW(),null,DEFAULT);

select * from employee e 
where EMP_NAME = '�����';

-- INSERT + SUBAUERY
create table EMP_01(
	EMP_ID INT,
	EMP_NAME VARCHAR(20),
	DEPT_TITLE VARCHAR(40)
);

insert into EMP_01(select EMP_ID, EMP_NAME, DEPT_TITLE 
from employee
left join department on(DEPT_CODE=DEPT_ID));

select * from EMP_01;

-- UPDATE : �ش� ���̺��� �����͸� �����ϴ� ��ɾ�
create table DEPT_COPY
as select * from department d ;

select * from DEPT_COPY;

update DEPT_COPY set DEPT_TITLE = '������ȹ�η�'
where DEPT_ID = 'D9';

select * from DEPT_COPY;
commit;

rollback;

-- EMPLOYEE�� �ֹι�ȣ �߸� ǥ��� ������.
desc employee ;

update employee set EMP_NO = concat('620131',substr(EMP_NO,7))
where EMP_ID = 200;

update employee set EMP_NO = concat('630322',substr(EMP_NO,7))
where EMP_ID = 201;

update employee set EMP_NO = concat('890410',substr(EMP_NO,7))
where EMP_ID = 214;

select EMP_ID,EMP_NO
from employee e 
-- where substr(EMP_NO,5,2) > 31;
where EMP_ID in ('200','201','214');
commit;

-- SQL Error [1452] [23000]: Cannot add or update a child row: a foreign key constraint fails
update employee set DEPT_CODE = 'D0'
where DEPT_CODE = 'D6';

select * from employee e; 

update employee set ENT_YN = default where EMP_ID = 222;


-- DELETE
-- ���̺��� ���� �����ϴ� ��ɾ�

create table TEST_DELETE
as select * from employee e ;

select * from TEST_DELETE;
drop table TEST_DELETE;
-- DELETE �� ���� ��ü ����
delete from TEST_DELETE;


-- ---------------------------

drop table DEPT_COPY;

create table DEPT_COPY
as select * from department d ;

select * from DEPT_COPY;

-- �÷��߰�
alter table DEPT_COPY add(LNAME VARCHAR(20));
select * from DEPT_COPY;

-- �÷� ����
alter table DEPT_COPY drop column LNAME;
select * from DEPT_COPY;

-- �÷� �߰�(�⺻���� �����Ͽ� �߰�)
alter table DEPT_COPY add (LNAME VARCHAR(20) default '�ѱ�');
select * from DEPT_COPY;

alter table DEPT_COPY add constraint PK_DEPTCOPY primary KEY(DEPT_ID);
desc DEPT_COPY;

-- SELECT(������, �Լ�) INSERT, UPDATE, DELETE, CREATE

-- TCL
-- COMMIT, ROLLBACK(+ SAVEPOINT, ROLLBACK TO)

-- Ʈ����� : �����͸� ó���ϴ� �ּ� �۾� ����.
-- �ϳ��� Ʈ��������� �̷���� �۾��� �ݵ�� �۾� ������ ��� �����Ͽ� ����ǰų�, �����Ͽ� ��� �������� �����Ǿ�� �Ѵ�.

commit;

create table USER_TBL(
	USER_NO INT unique,
	USER_ID VARCHAR(20) not null unique,
	USER_PW VARCHAR(30) not NULL
);

desc USER_TBL;

insert into USER_TBL VALUES(1,'TEST01','PASS01');
insert into USER_TBL VALUES(2,'TEST02','PASS02');

select * from user_tbl ut ;

commit; -- ���� ���� �۾��� DML ������ DB�� �ݿ��Ѵ�.

insert into USER_TBL VALUES(3,'TEST03','PASS03');
select * from USER_TBL;

rollback; -- ���� �ֱٿ� commit �ߴ� �������� �ǵ��� ���ڴ�.

select * from user_tbl ut ;

insert into USER_TBL VALUES(3,'TEST03','PASS03');
savepoint SP1;


insert into USER_TBL VALUES(4,'TEST03','PASS04');
select * from user_tbl ut ;

rollback to SP1;
select * from user_tbl ut ;

rollback;
select * from user_tbl ut ;

insert into USER_TBL VALUES(3,'TEST03','PASS03');
insert into USER_TBL VALUES(4,'TEST03','PASS04');
insert into USER_TBL VALUES(4,'TEST03','PASS04');

select * from user_tbl ut ;


-- -------------------------------------------------
-- VIEW(��)
-- �����͸� ��� ���� �ʴ�
-- CREATE VIEW ���̸�
-- AS �������� 

create view V_EMP
as select EMP_ID, EMP_NAME, DEPT_CODE from EMPLOYEE;

select * from V_EMP;

-- ���, �̸�, ���޸�, �μ���, �ٹ������� ��ȸ
-- �� ����� V_RES_EMP ��� �並 ����� �ش� �並 ���� ��� ��ȸ
-- 1) �������� �غ�
select EMP_ID,
EMP_NAME,
JOB_NAME,
DEPT_TITLE,
LOCAL_NAME
from employee e 
left join JOB USING(JOB_CODE)
left join department d2 on (DEPT_CODE = DEPT_ID)
left join location l on (location_ID = LOCAL_CODE);
-- 2) �� ����
create or replace view V_RES_EMP(���,�̸�,����,�μ���,�ٹ���) -- ���� ����ų� ��Ȱ��
as select EMP_ID ,
EMP_NAME ,
JOB_NAME ,
DEPT_TITLE ,
LOCAL_NAME 
from employee e 
left join JOB USING(JOB_CODE)
left join department d2 on (DEPT_CODE = DEPT_ID)
left join location l on (location_ID = LOCAL_CODE);

select * from V_RES_EMP;

show create view V_RES_EMP;

-- ������� VIEW(V_RES_EMP)�� Ȱ���Ͽ�
-- ����� '205' �� ���� ���� ��ȸ�ϱ�.
select * 
from V_RES_EMP
where ��� = '205';

commit;

-- �� ����
drop view V_RES_EMP;
-- �÷��� ��Ī�� ���� �� �ִ�.
create or replace view V_EMP(���,�����,�μ��ڵ�)
as 
select EMP_ID, EMP_NAME, DEPT_CODE
from EMPLOYEE;

-- �信�� ����,�Լ� ����� �����Ͽ� ���� ����.
-- ���, �̸�, ����, �ٹ���� ��ȸ
-- 1)
select EMP_ID,EMP_NAME,
	IF(SUBSTR(EMP_NO,8,1)=1,'����','����'),
	extract(year from NOW()) - extract(year from HIRE_DATE)
from employee e ;
-- 2)
create or replace view V_EMP(���,�̸�,����,�ٹ����)
as 
select EMP_ID,EMP_NAME,
	IF(SUBSTR(EMP_NO,8,1)=1,'����','����'),
	extract(year from NOW()) - extract(year from HIRE_DATE)
from employee e ;

select * from V_EMP;

-- �信 ������ ����, ���� �����ϱ�
create or replace view V_JOB
as
select * from JOB;

select * from V_JOB;

-- �並 ���� ������ �߰�
insert into V_JOB VALUES('J8','����');
select * from JOB;

-- �並 ���� ������ ������ ����
update V_JOB
set JOB_NAME = '�˹�'
where JOB_CODE = 'J8';

select * from JOB;
select * from V_JOB;

-- �並 ���� ������ ������ ����
delete from V_JOB
where JOB_CODE = 'J8';

select * from JOB;
select * from V_JOB;

-- AUTO INCREMENT
-- INSERT �Ҷ� ���� �ڵ����� 1�� ����.

create table AT_TEST(
	ID INT auto_increment primary key,
	NAME VARCHAR(30)
);

select * from AT_TEST;
desc AT_TEST;

insert into AT_TEST VALUES(1,'ȫ�浿');
insert into AT_TEST VALUES(11,'������');

insert into AT_TEST VALUES(null,'��浿');
insert into AT_TEST VALUES(null,'������');

insert into AT_TEST VALUES('�Ż��Ӵ�');
insert into AT_TEST(NAME) VALUES('�Ż��Ӵ�');

select * from AT_TEST;

-- ���� ��� ���ڱ��� ���� �Ǿ����� Ȯ��
select last_insert_id(); 

-- ����
alter table AT_TEST auto_increment = 50;
insert into AT_TEST(NAME) VALUES('�Ż��Ӵ�');
select * from AT_TEST;

set @@AUTO_INCREMENT_INCREMENT = 3; -- 3������
select * from AT_TEST;


create table AT_TEST2(
	ID INT auto_increment primary key, -- primary key �� �־����
	NAME VARCHAR(30) -- VARCHAR ���� ��� �Ұ�
);

insert into AT_TEST2 VALUES(null,"A");
insert into AT_TEST2 VALUES(null,"B");
select * from AT_TEST2;

set @@AUTO_INCREMENT_INCREMENT = 5; -- �������� �����ȴ�














