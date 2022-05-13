--  DDL for Table DEPARTMENT
 CREATE TABLE  DEPARTMENT
   (   DEPT_ID VARCHAR(10) NOT NULL, 
   DEPT_TITLE VARCHAR(35) NOT NULL, 
   LOCATION_ID VARCHAR(2) NOT NULL
   );

  select * from  department;
  
Insert into DEPARTMENT (DEPT_ID,DEPT_TITLE,LOCATION_ID) values ('D1','인사관리부','L1');
Insert into  DEPARTMENT (DEPT_ID,DEPT_TITLE,LOCATION_ID) values ('D2','회계관리부','L1');
Insert into  DEPARTMENT (DEPT_ID,DEPT_TITLE,LOCATION_ID) values ('D3','마케팅부','L1');
Insert into  DEPARTMENT (DEPT_ID,DEPT_TITLE,LOCATION_ID) values ('D4','국내영업부','L1');
Insert into  DEPARTMENT (DEPT_ID,DEPT_TITLE,LOCATION_ID) values ('D5','해외영업1부','L2');
Insert into  DEPARTMENT (DEPT_ID,DEPT_TITLE,LOCATION_ID) values ('D6','해외영업2부','L3');
Insert into  DEPARTMENT (DEPT_ID,DEPT_TITLE,LOCATION_ID) values ('D7','해외영업3부','L4');
Insert into  DEPARTMENT (DEPT_ID,DEPT_TITLE,LOCATION_ID) values ('D8','기술지원부','L5');
Insert into  DEPARTMENT (DEPT_ID,DEPT_TITLE,LOCATION_ID) values ('D9','총무부','L1');


--  DDL for Table EMPLOYEE
  CREATE TABLE  EMPLOYEE
   (   EMP_ID VARCHAR(10) PRIMARY KEY, 
   EMP_NAME VARCHAR(20) NOT NULL, 
   EMP_NO VARCHAR(14) NOT NULL, 
   EMAIL VARCHAR(25), 
   PHONE VARCHAR(12), 
   DEPT_CODE VARCHAR(2), 
   JOB_CODE VARCHAR(2) NOT NULL, 
   SAL_LEVEL VARCHAR(2) NOT NULL, 
   SALARY INT,
   BONUS DOUBLE, 
   MANAGER_ID VARCHAR(3), 
   HIRE_DATE DATE, 
   ENT_DATE DATE , 
   ENT_YN VARCHAR(1) DEFAULT 'N' 
   );
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('200','선동일','621235-1985634','sun_di@ or.kr','01099546325','D9','J1','S1',8000000,0.3,null, str_to_date('19900206','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('201','송종기','631156-1548654','song_jk@ or.kr','01045686656','D9','J2','S1',6000000,null,'200', str_to_date('20010901','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('202','노옹철','861015-1356452','no_hc@ or.kr','01066656263','D9','J2','S4',3700000,null,'201', str_to_date('20010101','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('203','송은희','631010-2653546','song_eh@ or.kr','01077607879','D6','J4','S5',2800000,null,'204', str_to_date('19960503','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('204','유재식','660508-1342154','yoo_js@ or.kr','01099999129','D6','J3','S4',3400000,0.2,'200', str_to_date('20001229','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('205','정중하','770102-1357951','jung_jh@ or.kr','01036654875','D6','J3','S4',3900000,null,'204', str_to_date('19990909','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('206','박나라','630709-2054321','pack_nr@ or.kr','01096935222','D5','J7','S6',1800000,null,'207', str_to_date('20080402','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('207','하이유','690402-2040612','ha_iy@ or.kr','01036654488','D5','J5','S5',2200000,0.1,'200', str_to_date('19940707','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('208','김해술','870927-1313564','kim_hs@ or.kr','01078634444','D5','J5','S5',2500000,null,'207', str_to_date('20040430','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('209','심봉선','750206-1325546','sim_bs@ or.kr','0113654485','D5','J3','S4',3500000,0.15,'207', str_to_date('20111111','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('210','윤은해','650505-2356985','youn_eh@ or.kr','0179964233','D5','J7','S5',2000000,null,'207', str_to_date('20010203','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('211','전형돈','830807-1121321','jun_hd@ or.kr','01044432222','D8','J6','S5',2000000,null,'200', str_to_date('20121212','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('212','장쯔위','780923-2234542','jang_zw@ or.kr','01066682224','D8','J6','S5',2550000,0.25,'211', str_to_date('20150617','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('213','하동운','621111-1785463','ha_dh@ or.kr','01158456632',null,'J6','S5',2320000,0.1,null, str_to_date('19991231','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('214','방명수','856795-1313513','bang_ms@ or.kr','01074127545','D1','J7','S6',1380000,null,'200', str_to_date('20100404','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('215','대북혼','881130-1050911','dae_bh@ or.kr','01088808584','D5','J5','S4',3760000,null,null, str_to_date('19170619','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('216','차태연','770808-1364897','cha_ty@ or.kr','01064643212','D1','J6','S5',2780000,0.2,'214', str_to_date('19130301','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('217','전지연','770808-2665412','jun_jy@ or.kr','01033624442','D1','J6','S4',3660000,0.3,'214', str_to_date('20070320','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('218','이오리','870427-2232123','loo_or@ or.kr','01022306545',null,'J7','S5',2890000,null,null, str_to_date('19161128','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('219','임시환','660712-1212123','im_sw@ or.kr',null,'D2','J4','S6',1550000,null,null, str_to_date('19990909','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('220','이중석','770823-1113111','lee_js@ or.kr',null,'D2','J4','S5',2490000,null,null, str_to_date('19140918','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('221','유하진','800808-1123341','yoo_hj@ or.kr',null,'D2','J4','S5',2480000,null,null, str_to_date('19940120','%Y%m%d'),null,'N');
Insert into  EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN) values ('222','이태림','760918-2854697','lee_tr@ or.kr','01033000002','D8','J6','S5',2436240,0.35,'100', str_to_date('19970912','%Y%m%d'), str_to_date('20170912','%Y%m%d'),'Y');


--  DDL for Table JOB

CREATE TABLE  JOB 
   (   JOB_CODE VARCHAR(2) PRIMARY KEY, 
   JOB_NAME VARCHAR(35)
   ); 


Insert into  JOB (JOB_CODE,JOB_NAME) values ('J1','대표');
Insert into  JOB (JOB_CODE,JOB_NAME) values ('J2','부사장');
Insert into  JOB (JOB_CODE,JOB_NAME) values ('J3','부장');
Insert into  JOB (JOB_CODE,JOB_NAME) values ('J4','차장');
Insert into  JOB (JOB_CODE,JOB_NAME) values ('J5','과장');
Insert into  JOB (JOB_CODE,JOB_NAME) values ('J6','대리');
Insert into  JOB (JOB_CODE,JOB_NAME) values ('J7','사원');

--  DDL for Table LOCATION

  CREATE TABLE  LOCATION 
   (   LOCAL_CODE CHAR(2) PRIMARY KEY, 
   NATIONAL_CODE CHAR(2) NOT NULL, 
   LOCAL_NAME VARCHAR(40) NOT NULL
   );

Insert into  LOCATION (LOCAL_CODE,NATIONAL_CODE,LOCAL_NAME) values ('L1','KO','ASIA1');
Insert into  LOCATION (LOCAL_CODE,NATIONAL_CODE,LOCAL_NAME) values ('L2','JP','ASIA2');
Insert into  LOCATION (LOCAL_CODE,NATIONAL_CODE,LOCAL_NAME) values ('L3','CH','ASIA3');
Insert into  LOCATION (LOCAL_CODE,NATIONAL_CODE,LOCAL_NAME) values ('L4','US','AMERICA');
Insert into  LOCATION (LOCAL_CODE,NATIONAL_CODE,LOCAL_NAME) values ('L5','RU','EU');




--  DDL for Table NATIONAL
 CREATE TABLE  NATIONAL
   (   NATIONAL_CODE VARCHAR(2) PRIMARY KEY, 
   NATIONAL_NAME VARCHAR(35)
   ); 


Insert into  NATIONAL (NATIONAL_CODE,NATIONAL_NAME) values ('KO','한국');
Insert into  NATIONAL (NATIONAL_CODE,NATIONAL_NAME) values ('JP','일본');
Insert into  NATIONAL (NATIONAL_CODE,NATIONAL_NAME) values ('CH','중국');
Insert into  NATIONAL (NATIONAL_CODE,NATIONAL_NAME) values ('US','미국');
Insert into  NATIONAL (NATIONAL_CODE,NATIONAL_NAME) values ('RU','러시아');


--  DDL for Table SAL_GRADE

  CREATE TABLE  SAL_GRADE
   (   SAL_LEVEL VARCHAR(2) PRIMARY KEY, 
   MIN_SAL INT, 
   MAX_SAL INT
   );
Insert into  SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) values ('S1',6000000,10000000);
Insert into  SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) values ('S2',5000000,5999999);
Insert into  SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) values ('S3',4000000,4999999);
Insert into  SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) values ('S4',3000000,3999999);
Insert into  SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) values ('S5',2000000,2999999);
Insert into  SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) values ('S6',1000000,1999999);

show TABLES;
select * from EMPLOYEE;
select * from JOB;
select * from location ;
select * from SAL_GRADE;