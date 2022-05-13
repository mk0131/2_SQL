create table dept (
	dept_id varchar(10) primary key,
	dept_name varchar(20) not null,
	office varchar(20)
);

select * from dept


create table student(
	stu_id varchar(10) primary key,
	resident_id varchar(14) not null,
	name varchar(10) not null,
	year int,
	address varchar(10),
	dept_id varchar(10),
	constraint FK_dept_id foreign key (dept_id)
	references dept(dept_id)
);

select * from student;



create table professor(
	prof_id varchar(10),
	resident_id varchar(14) not null,
	name varchar(10) not null,
	dept_id varchar(10),
	location varchar(10),
	year_emp int,
	constraint pk_professor primary key(prof_id),
	constraint fk_professor foreign key(dept_id)
	references dept(dept_id)	
);

select * from professor;

create table course(
	course_id varchar(10),
	title varchar(14) not null,
	credit int,
	constraint pk_course primary key(course_id)
);

select  * from course;




create table class(
	class_id varchar(10),
	course_id varchar(10),
	year int,
	semester int,
	division char(1),
	prof_id varchar(10),
	classroom varchar(9),
	enroll int,
	constraint pk_class primary key(class_id),
	constraint fk_class1 foreign key(course_id)
	references course(course_id),
	constraint fk_class2 foreign key(prof_id)
	references professor(prof_id)
);

select * from class;

create table takes(
	stu_id varchar(10) ,
	class_id varchar(10),
	grade char(5),
	constraint pk_takes primary key(stu_id, class_id),
	constraint fk_takes1 foreign key(stu_id)
	references student(stu_id),
	constraint fk_takes2 foreign key(class_id)
	references class(class_id)
);

select * from takes;


insert into dept values('920','컴퓨터공학과','201호');
insert into dept values('923','산업공학과','207호');
insert into dept values('925','전자공학과','308호');

select * from dept;

insert into student values('1292001','900424-1825409','김광식','3','서울','920');
insert into student values('1292002','900305-1730021','김민수','3','서울','920');
insert into student values('1292003','891021-2308302','김민지','3','서울','920');
insert into student values('1292301','890902-2704012','김민정','3','서울','923');
insert into student values('1292303','910715-1524390','박정훈','3','서울','923');
insert into student values('1292305','921011-1809003','채진원','3','서울','923');
insert into student values('1292501','900825-1506390','임병태','3','서울','925');
insert into student values('1292502','911011-1809003','백재하','3','서울','925');

select * from student;

insert into professor values('92001','590327-1839240','이태규','920','교수',1997);
insert into professor values('92002','690702-1350026','고희석','920','부교수',2003);
insert into professor values('92301','741011-2765501','최성희','923','부교수',2005);
insert into professor values('92302','750728-1102458','김태석','923','교수',1999);
insert into professor values('92501','680505-1200546','박철재','925','조교수',2007);
insert into professor values('92502','740101-1830264','장민석','925','부교수',2005);

select * from professor;

insert into course values('C101','전산개론',3);
insert into course values('C102','자료구조',3);
insert into course values('C103','데이터베이스',4);
insert into course values('C301','운영체제',3);
insert into course values('C302','컴퓨터구조',3);
insert into course values('C303','이산수학',4);
insert into course values('C304','객체지향언어',4);
insert into course values('C501','인공지능',3);
insert into course values('C502','알고리즘',2);

select * from course;

insert into class values('C101-01','C101',2022,1,'A','92301','301호',40);
insert into class values('C102-01','C102',2022,1,'A','92001','209호',30);
insert into class values('C103-01','C103',2022,1,'A','92501','208호',30);
insert into class values('C103-02','C103',2022,1,'B','92301','301호',30);
insert into class values('C501-01','C501',2022,1,'A','92501','103호',45);
insert into class values('C501-02','C501',2022,1,'B','92502','204호',25);
insert into class values('C301-01','C301',2022,2,'A','92502','301호',30);
insert into class values('C302-01','C302',2022,2,'A','92501','209호',45);
insert into class values('C502-01','C502',2022,2,'A','92001','209호',30);
insert into class values('C502-02','C502',2022,2,'B','92301','103호',26);

select * from class;

insert into takes values('1292001','C101-01','B+');
insert into takes values('1292001','C103-01','A+');
insert into takes values('1292001','C301-01','A');
insert into takes values('1292002','C102-01','A');
insert into takes values('1292002','C103-01','B+');
insert into takes values('1292002','C502-01','C+');
insert into takes values('1292003','C103-02','B');
insert into takes values('1292003','C501-02','A+');
insert into takes values('1292301','C102-01','C+');
insert into takes values('1292303','C102-01','C');
insert into takes values('1292303','C103-02','B+');
insert into takes values('1292303','C501-01','A+');

select * from takes ;

select student.stu_id
from student, dept
where student.dept_id = dept.dept_id and 
student.year = 3 and 
dept.dept_name = '컴퓨터공학과';

select * 
from student 
where resident_id like '%-2%';

select title, credit, year , semester
from course, class 
where course.course_id = class.course_id;

select count(*)
from student s, dept d
where s.dept_id = d.dept_id and d.dept_name = '컴퓨터공학과';

select sum(2022-year_emp)
from professor;

select dept_name, count(*)
from student s, dept d
where s.dept_id = d.dept_id
group by dept_name;

select dept_name, count(*), avg(2022 - year_emp), max(2022 - year_emp)
from professor p , dept d
where p.dept_id = d.dept_id
group by dept_name;

create or replace view cs_student as
select s.stu_id, s.resident_id, s.name, s.year,s.address, s.dept_id
from student s, dept d
where s.dept_id = d.dept_id 
and d.dept_name = '컴퓨터공학과';

select * from cs_student;

select stu_id
from takes 
where grade <> 'A+';