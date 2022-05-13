-- RANK() DENSE_RANK() / ROW_NUM0BER()

-- 19,19,21
select EMP_NAME , SALARY,
	RANK() OVER(order by SALARY DESC) 순위
	from employee e ;
-- 19,19,20
select EMP_NAME, SALARY,
DENSE_RANK() OVER(order by SALARY DESC) 순위
from employee e ;
-- 같은 순위 무시
select *
from (select EMP_NAME, SALARY,
row_number () OVER(order by SALARY DESC) 순위
from employee e)T
where 순위 <4;

-- --------------------------------------
-- DDL
-- CREATE TABLE
-- 제약조건

-- 테이블 생성
create table MEMBER(
	MEMBER_NO INT,
	MEMBER_ID VARCHAR(20),
	MEMBER_PW VARCHAR(20),
	MEMBER_NAME VARCHAR(15) COMMENT '회원이름'
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

-- UNIQUE 제약조건
-- 중복을 허용하지 않는 제약 조건

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

-- UNIQUE 제약조건을 여러개 컬럼에 적용
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

-- 제약조건에 이름 설정
show keys from employee;
select * from information_schema.TABLE_CONSTRAINTS tc ;

create table CONS_NAME(
	TEST_DATA1 INT,
	TEST_DATA2 VARCHAR(20) unique,
	TEST_DATA3 VARCHAR(20),
	constraint UK_CONSNAME_DATA3 UNIQUE(TEST_DATA3)
);

-- CHECK 제약조건
-- 지정한 값 이외에는 값이 기록되지 않도록 범위를 제한하는 조건.

create table USER_CHECK(
	USER_NO INT,
	USER_ID VARCHAR(20),
	USER_PW VARCHAR(30),
	GENDER VARCHAR(3) CHECK(GENDER in('남','여'))
);
insert into user_check values (1,'USER01','PASS01','남');
-- SQL Error [3819] [HY000]: Check constraint 'user_check_chk_1' is violated.
insert into user_check values (2,'USER02','PASS02','여자');

insert into user_check values (2,'USER02','PASS02','여');

-- CHECK 제약조건에 부등호
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

-- 하나의 컬럼에 제약조건 여러개
create table TEST_CONS(
	TEST_NO INT not null UNIQUE
);

-- PRIMARY KEY 제약조건
-- '기본키 제약조건'
-- 테이블 내의 한 행에서 그 행을 식별하기 위한 고유값을 가지는 컬럼에
-- NOT NULL 과 UNIQUE 제약조건을 함께 걸어주는 식별자 역할을 수행시키는 제약조건

create table USER_PK_TABLE(
	USER_NO INT primary key,
	USER_ID VARCHAR(20) unique,
	USER_PW VARCHAR(20) not null,
	GENDER VARCHAR(3) CHECK(GENDER in ('남','여'))
);

desc user_pk_table ;

insert into user_pk_table VALUES(1,'USER01','PASS01','남');
insert into user_pk_table VALUES(2,'USER02','PASS02','여');
-- SQL Error [1062] [23000]: Duplicate entry '1' for key 'user_pk_table.PRIMARY'
insert into user_pk_table VALUES(1,'USER03','PASS03','여');
-- SQL Error [1048] [23000]: Column 'USER_NO' cannot be null
insert into user_pk_table VALUES(NULL,'USER03','PASS03','여');

create table USER_PK_TABLE2(
	USER_NO INT,
	USER_ID VARCHAR(20) unique,
	USER_PW VARCHAR(30) not null,
	GENDER VARCHAR(15) CHECK(GENDER in ('남','여')),
	constraint PK_USER_NOID primary KEY(USER_NO,USER_ID)
);
-- 1, USER01 --> 성공
-- 2, USER02 --> 성공
-- 3, USER03 --> 성공
-- 2, USER01 --> 실패

-- CREATE : 생성
-- DROP : 삭제
drop table `member` ;

-- FOERIGN KEY
-- 외래키, 외부키, 참조키
-- 다른 테이블의 컬럼값을 참조하여 참조하는 테이블의 값만을 허용한다.


create table USER_GRADE(
	GRADE_CODE INT primary key,
	GRADE_NAME VARCHAR(30) not NULL
);

insert into user_grade VALUES(1,'일반회원');
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

-- 삭제 옵션
-- ON DELETE CASCADE : 자식 테이블의 데이터도 삭제.
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


-- 기본값 설정하기
drop table default_table ;
create table DEFAULT_TABLE(
	DATA_COL1 VARCHAR(30) default '없음',
	DATA_COL2 DATE default (CURRENT_DATE),
	DATA_COL3 DATETIME DEFAULT(CURRENT_TIME)
);

insert into default_table VALUES(default,DEFAULT,DEFAULT);

select * from default_table ;

-- DDL - ALTER
-- ALTER : 수정
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

-- INSERT 새로운 로우(행)을 특정 테이블에 추가하는 명령어다.

desc employee ;

insert into employee (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,
SAL_LEVEL,SALARY, BONUS, MANAGER_ID , HIRE_DATE , ENT_DATE , ENT_YN 
) VALUES(500,'조민규','970131-1111111','JMG21128@GAMIL.COM','01027818542','D1',
'J7','S4','5000000',0.1,'200',NOW(),null,DEFAULT);

select * from employee e 
where EMP_NAME = '조민규';

-- 컬럼 생략(모든 컬럼에 값 추가)
insert into employee VALUES(900,'김민지','990410-2222222','MING@GMAIL.COM','01022540410','D1',
'J7','S3','3000000',0.1,'200',NOW(),null,DEFAULT);

select * from employee e 
where EMP_NAME = '김민지';

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

-- UPDATE : 해당 테이블의 데이터를 수정하는 명령어
create table DEPT_COPY
as select * from department d ;

select * from DEPT_COPY;

update DEPT_COPY set DEPT_TITLE = '전략기획부로'
where DEPT_ID = 'D9';

select * from DEPT_COPY;
commit;

rollback;

-- EMPLOYEE에 주민번호 잘못 표기된 데이터.
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
-- 테이블의 행을 삭제하는 명령어

create table TEST_DELETE
as select * from employee e ;

select * from TEST_DELETE;
drop table TEST_DELETE;
-- DELETE 를 통해 전체 삭제
delete from TEST_DELETE;


-- ---------------------------

drop table DEPT_COPY;

create table DEPT_COPY
as select * from department d ;

select * from DEPT_COPY;

-- 컬럼추가
alter table DEPT_COPY add(LNAME VARCHAR(20));
select * from DEPT_COPY;

-- 컬럼 삭제
alter table DEPT_COPY drop column LNAME;
select * from DEPT_COPY;

-- 컬럼 추가(기본값을 적용하여 추가)
alter table DEPT_COPY add (LNAME VARCHAR(20) default '한국');
select * from DEPT_COPY;

alter table DEPT_COPY add constraint PK_DEPTCOPY primary KEY(DEPT_ID);
desc DEPT_COPY;

-- SELECT(연산자, 함수) INSERT, UPDATE, DELETE, CREATE

-- TCL
-- COMMIT, ROLLBACK(+ SAVEPOINT, ROLLBACK TO)

-- 트랜잭션 : 데이터를 처리하는 최소 작업 단위.
-- 하나의 트랜잭션으로 이루어진 작업은 반드시 작업 내용이 모두 성공하여 저장되거나, 실패하여 모두 이전으로 복구되어야 한다.

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

commit; -- 현재 까지 작업한 DML 내용을 DB에 반영한다.

insert into USER_TBL VALUES(3,'TEST03','PASS03');
select * from USER_TBL;

rollback; -- 가장 최근에 commit 했던 구간으로 되돌아 가겠다.

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
-- VIEW(뷰)
-- 데이터를 담고 있지 않다
-- CREATE VIEW 뷰이름
-- AS 서브쿼리 

create view V_EMP
as select EMP_ID, EMP_NAME, DEPT_CODE from EMPLOYEE;

select * from V_EMP;

-- 사번, 이름, 직급명, 부서명, 근무지역을 조회
-- 그 결과를 V_RES_EMP 라는 뷰를 만들고 해당 뷰를 통해 결과 조회
-- 1) 서브쿼리 준비
select EMP_ID,
EMP_NAME,
JOB_NAME,
DEPT_TITLE,
LOCAL_NAME
from employee e 
left join JOB USING(JOB_CODE)
left join department d2 on (DEPT_CODE = DEPT_ID)
left join location l on (location_ID = LOCAL_CODE);
-- 2) 뷰 생성
create or replace view V_RES_EMP(사번,이름,직급,부서명,근무지) -- 새로 만들거나 재활용
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

-- 만들어진 VIEW(V_RES_EMP)를 활용하여
-- 사번이 '205' 인 직원 정보 조회하기.
select * 
from V_RES_EMP
where 사번 = '205';

commit;

-- 뷰 삭제
drop view V_RES_EMP;
-- 컬럼별 별칭을 붙일 수 있다.
create or replace view V_EMP(사번,사원명,부서코드)
as 
select EMP_ID, EMP_NAME, DEPT_CODE
from EMPLOYEE;

-- 뷰에는 연산,함수 결과도 포함하여 저장 가능.
-- 사번, 이름, 성별, 근무년수 조회
-- 1)
select EMP_ID,EMP_NAME,
	IF(SUBSTR(EMP_NO,8,1)=1,'남성','여성'),
	extract(year from NOW()) - extract(year from HIRE_DATE)
from employee e ;
-- 2)
create or replace view V_EMP(사번,이름,성별,근무년수)
as 
select EMP_ID,EMP_NAME,
	IF(SUBSTR(EMP_NO,8,1)=1,'남성','여성'),
	extract(year from NOW()) - extract(year from HIRE_DATE)
from employee e ;

select * from V_EMP;

-- 뷰에 데이터 삽입, 수정 삭제하기
create or replace view V_JOB
as
select * from JOB;

select * from V_JOB;

-- 뷰를 통한 데이터 추가
insert into V_JOB VALUES('J8','인턴');
select * from JOB;

-- 뷰를 통해 데이터 수정도 가능
update V_JOB
set JOB_NAME = '알바'
where JOB_CODE = 'J8';

select * from JOB;
select * from V_JOB;

-- 뷰를 통해 데이터 삭제도 가능
delete from V_JOB
where JOB_CODE = 'J8';

select * from JOB;
select * from V_JOB;

-- AUTO INCREMENT
-- INSERT 할때 마다 자동으로 1씩 증가.

create table AT_TEST(
	ID INT auto_increment primary key,
	NAME VARCHAR(30)
);

select * from AT_TEST;
desc AT_TEST;

insert into AT_TEST VALUES(1,'홍길동');
insert into AT_TEST VALUES(11,'김유신');

insert into AT_TEST VALUES(null,'고길동');
insert into AT_TEST VALUES(null,'유관순');

insert into AT_TEST VALUES('신사임당');
insert into AT_TEST(NAME) VALUES('신사임당');

select * from AT_TEST;

-- 현재 어느 숫자까지 증가 되었는지 확인
select last_insert_id(); 

-- 변경
alter table AT_TEST auto_increment = 50;
insert into AT_TEST(NAME) VALUES('신사임당');
select * from AT_TEST;

set @@AUTO_INCREMENT_INCREMENT = 3; -- 3씩증가
select * from AT_TEST;


create table AT_TEST2(
	ID INT auto_increment primary key, -- primary key 가 있어야함
	NAME VARCHAR(30) -- VARCHAR 에는 사용 불가
);

insert into AT_TEST2 VALUES(null,"A");
insert into AT_TEST2 VALUES(null,"B");
select * from AT_TEST2;

set @@AUTO_INCREMENT_INCREMENT = 5; -- 설정값은 공유된다














