-- CRUD : 데이터 기본 처리 로직
-- CREATE : 데이터 추가 / INSERT
-- READ : 데이터 조회 / SELECT
-- UPDATE : 데이터 수정 / UPDATE
-- DELETE : 데이터 삭제 / DELETE 


-- SELECT : 조회용 SQL
-- FROM 테이블명
-- WHERE 조건
-- ORDER BY 컬럼 7
-- ;

-- 컬럼에 별칭 달기
-- 1. AS 표현
select EMP_ID as "사원번호", EMP_NAME as "사원명"
from employee;

-- 2. AS 생략
select  EMP_ID "사원번호" , EMP_NAME "사원명"
from employee e ;

select EMP_NAME "사원명" ,
	(SALARY*12) "연봉",
	BONUS "보너스",
	(SALARY + (SALARY*BONUS)) * 12 "연봉 총합"
	from employee e;
	
-- IFNULL() : 만약 현재 조회하는 값이 NULL이면 지정한 값으로 변경
select  EMP_NAME "사원명",
		(SALARY*12) 연봉, '원' 단위,
		BONUS '보너스',
		(SALARY + (SALARY*IFNULL(BONUS,0)))*12 "연봉총합"
from employee e ;

-- DISTINCT
-- 중복 제거 하고 한 개만 조회
select EMP_NAME, DEPT_CODE
from employee e ;

select distinct DEPT_CODE
from employee e ;

-- 실습1
-- DEPARTMENT 테이블을 참조하여 부서가 해외영업2부 인 부서의 부서코드를 찾고
-- EMPLOYEE 테이블에서 해당 부서의 사원들 중 급여를 200만원 보다 많이 받는 직원의
-- 사번, 사원명 급여를 조회하시오.

select * from department d
where  DEPT_TITLE = '해외영업2부';


select EMP_ID 사번, EMP_NAME 사원명, SALARY 급여  
from employee e 
where DEPT_CODE = 'D6' and SALARY > '2000000';

-- 연산자 --
-- 비교 연산
-- <, >, <=, >= : 크기를 나타내는 부등호
-- = : 같다
-- !=, <> : 같지않다.

-- EMPLOYEE 테이블에서 부서코드가 'D9' 이 아닌 직원들의
-- 모든 정보를 조회
select * from employee e 
-- where  DEPT_CODE  != 'D9';
where DEPT_CODE <> 'D9';

-- 급여가 350만원 이상, 550만원 이하인
-- 직원의 사번, 사원명, 부서코드, 직급코드, 급여정보 조회
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
-- 입력한 숫자, 문자가 포함된 정보를 조회할 때 사용하는 연산자.
-- '_'
-- '%'
-- 사원의 이름에 가운데 글자가 '중' 인 사원 정보 조회
select *
from employee e 
where EMP_NAME like '_중_';

-- EMP_NO 기준 남성인 사원의 정보만 조회
select *
from employee e 
where EMP_NO like '%-1%';
-- 사원 중 이메일 아이디가 5글자 이상인 사원의 사원명 사번 이메일 조회
select EMP_NAME, EMP_ID, EMAIL
from employee e 
where EMAIL like '_____%@%';

select *
from employee e 
where EMP_NAME like '이%';

-- 사원 중 이메일 4번째 글자가 '_'인 사원의 정보 조회
-- ESCAPE 문자를 선언. 뒤에는 문자를 특수문자가 아닌 일반 문자로 선언
select *
from employee e 
where EMAIL like '___#_%@%' escape '#';

-- IN 연산자
-- IN (값1,값2,값3,...)
-- WHERE JOB_CODE = 'J1' OR JOB_CODE ='J4';

-- 직급 코드가 J1 이거나 J4인 직원 정보 조회
select * from employee e 
where JOB_CODE in ('J1','J4');

select * from employee e 
where JOB_CODE not in ('J1','J4');

-- 함수(FUNCTION)

-- LENGTH : BYTE 길이 (영어 1, 한글3)
-- CHAR_LENGTH : 글자 수

-- 문자열의 길이를 계산하는 함수
select length ('HELLO'), char_length('HELLO') ;
select length ('조민규'), char_length('조민규') ;

-- INSTR : 주어진 값에서 원하는 문자가 몇번째인지 찾아 반환하는 함수
select instr('ABCD','A'),
instr('ABCD','C'),
instr('ABCD','Z'); 
select instr('ABCDEF','CD');

-- SUBSTR()
select 'HELLO WORLD',
substr('HELLO WORLD',1,5),
substr('HELLO WORLD',7); 

-- 실습2.
-- EMPLOYEE 테이블에서 사원들의 이름, 이메일 주소를 조회
-- 단 이메일은 아이디 부분만 조회

-- 이름과 이메일 조회
select EMP_NAME , EMAIL from employee e ;
-- @ 위치 찾기
select instr(EMAIL,'@')
from employee e2 ;
-- SUBSTR 활용
select EMP_NAME, substr(EMAIL,1,instr(EMAIL,'@')-1)
from employee e ;

-- LPAD/RPAD
-- 빈칸을 지정한 문자로 채우는 함수
select lpad(EMAIL,20,'*')
from employee e ;

select  rpad(EMAIL,20,'*')
from employee e ;

-- LTRIM/RTRIM
select ltrim('      HELLO'), rtrim('HELLO     ') ;
select ltrim('     H  ELLO     '); 

-- TRIM : 양끝을 기준으로 특정 문자를 지워주는 함수
select trim('   5교시   '); 
select trim('0' from '0012300'); 
-- LEADING / TRAILING
select trim(leading '0' from '0012300'); 
select trim(trailing  '0' from '0012300');
select trim(both  '0' from '0012300'); 

-- CONCAT : 
select CONCAT('마이에스큐엘','너무너무 재미없어요:)');

-- REPLACE : 주어진 문자열에서 특정 문자를 변경할 때 사용하는 함수
 select replace ('HELLO WORLD','HELLO','BYE');

-- EMPLOYEE 테이블에서 모든 사원의 사번 사원명 이메일 주민번호 조회
-- 이때 이메일은 @ 전까지 주민번호는 7번째 자리 이후 * 처리하여 조회
select EMP_ID 사번, EMP_NAME 사원명, 
substr(EMAIL,1,instr(EMAIL,'@')-1) 이메일, 
rpad(substr(EMP_NO,1,8),14,'*') 주민번호 
from employee e ;
-- EMPLOYEE 테이블에서 현재 근무하는
-- 여성 사원의 사번, 사원명, 직급코드를 조회
select EMP_ID, EMP_NAME, JOB_CODE, ENT_YN
from employee e 
where ENT_YN = 'N'
and substr(EMP_NO,8,1) = '2';

-- 단일행 함수 : 결과 찾아서 출력할 때마다 (각 행마다)함수 적용
-- 다중행 함수 : 조건에 만족하는 모든 행을 찾고 나서 한번에 연산

-- SUM(숫자가 기록된 컬럼) : 해당 컬럼들의 합계
select SUM(SALARY)
from employee e ;

-- AVG('') : 평균을 구함
select AVG(SALARY)
from employee e ;

-- MAX('') , MIN('') :최대 최소 값
select max(SALARY),min(SALARY)
from employee e ;

-- EMPLOYEE 테이블에서
-- '해외영업1부' 에 근무하는 모든사원의 평균 , MAX, MIN, 급여를 조회하자
select * from department d ;
select avg(SALARY),max(SALARY),min(SALARY),sum(SALARY)  
from employee e 
where DEPT_CODE ='D5'

select max(SALARY),EMP_NAME
from employee e ;

-- COUNT (컬럼명) : 행의 갯수
select count(*),count(DEPT_CODE),count(distinct DEPT_CODE)
from employee e ;

-- 날짜 처리 함수
-- SYSDATE(),NOW() : 현재 컴퓨터의 날짜를 반환
select sysdate(),now() ; 

select now(),sleep(5), sysdate();  

-- 두날짜 사이의 차이
-- DATEDIFF : 단순 일 차이
-- TIMESTAMPDIFF : 연 분기 월 주 일 시 분 초 지정
select HIRE_DATE 입사일,
DATEDIFF(now(),HIRE_DATE)+1
from employee e ;

select HIRE_DATE,
TIMESTAMPDIFF(year ,HIRE_DATE,now()) "나이"
from employee e ;
-- SECOND MINUTE HOUR DAY WEEK MONTH QUARTER YEAR

-- EXTRACT(YEAR | MONTH | DAY FROM 날짜)

select HIRE_DATE, 
	extract(year  from HIRE_DATE),
 	extract(month from HIRE_DATE),
	extract(day from HIRE_DATE)
from employee;

-- DATE_FORMAT()
-- 날짜 정보 변경
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

-- IF(조건,값,값)
-- 현재 근무하는 직원들의 성별을 남, 여 구분짓기
select EMP_NAME,
	EMP_NO,
	if (substr(EMP_NO,8,1) = 1,'남','여')성별
	from employee e ;

-- EMPLOYEE 테이블에서 모든 직원의 사번 사원명 부서코드 직급코드 근무여부 관리자 여부를 조회
-- 이때 근무여부가 Y 면 퇴사자 N 이면 근무자
-- 관리자 사번이 있으면 사원, 없으면 관리자

select * from employee e ;

select  EMP_ID 사번 ,
		EMP_NAME 사원명,
		DEPT_CODE 부서코드,
		JOB_CODE 직급코드, 
		if(ENT_YN = 'N','근무자','퇴사자') "근무 여부", 
		if(MANAGER_ID is not NULL,'사원','관리자') "관리자 여부" 
from employee e ;


-- CASE 
-- 자바의 IF, SWITCH 처럼 사용가능
-- CASE
-- when 조건식 1 then 결과값 1
-- ELSE 결과값2
-- END


select  EMP_ID 사번,
		EMP_NAME 사원명,
		DEPT_CODE 부서코드,
		JOB_CODE 직급코드,
		case
			when ENT_YN ='Y' then '퇴사자'
			else '근무자'			
		end "근무 여부",
		case
			when MANAGER_ID is null then '관리자'
			else '사원'
		end "관리자 여부"
from employee e ;
		

-- 직급이 'J2' 이면서 200만원 이상 받는 직원 이거나
-- 직급이 'J7' 인 사원의 사번 사원명 직급코드 급여 정보 조회

select  EMP_ID 사번,
		EMP_NAME 사원명,
		JOB_CODE 직급코드,
		SALARY 급여
from employee e 
where (JOB_CODE ='J2' and SALARY >=2000000)
or (JOB_CODE ='J7');


-- 사원의 주민 번호를 확인하여 생년 월 일 을 각각 조회 하시오
select * from employee e ;

select EMP_NAME 이름,
concat(substr(EMP_NO,1,2),'년') "생년", -- 첫번째에서 두개 가져오기 
concat(substr(EMP_NO,3,2),'월') "생월",
concat(substr(EMP_NO,5,2),'일') "생일"
from employee e;
		

-- 부서코드가 D5,D9 인 직원들 중에서 2004년도에 입사한 직원수 조회
-- 사번 사원명 부서코드 입사일
select EMP_ID 사번,
EMP_NAME 사원명,
DEPT_CODE 부서코드,
HIRE_DATE 입사일
from employee e 
where DEPT_CODE in ('D5','D9') and  (substr(HIRE_DATE,3,2)=04);  

-- 직원명 입사일 입사한 달의 근무일수 조회
-- 단 주말도 포함함(LAST_DAY() : 주어진 날짜의 해당월의 마지막 날 반환)
select EMP_NAME 직원명,
HIRE_DATE 입사일,
TIMESTAMPDIFF(day,HIRE_DATE,LAST_DAY(HIRE_DATE))+1 "입사한 달의 근무일수"
from employee e2 ;

-- 직원명 부서코드 생년월일 나이 조회
-- 단, 생년월일은 주민번호에서 추출해서 00년 00월 00일로 출력되게 함.
-- 나이는 주민번호에서 추출해서 날짜데이터로 변환한 다음 계산
select EMP_NAME 이름,
DEPT_CODE 부서코드,
CONCAT(SUBSTR(EMP_NO,1,2),'년',SUBSTR(EMP_NO,3,2),'월', SUBSTR(EMP_NO,5,2),'일') as "생년월일",
TIMESTAMPDIFF(year ,STR_TO_DATE(CONCAT ('19',substr(EMP_NO,1,6)),'%Y%m%d'), now()) as "나이"
from employee e ;
-- TIMESTAMPDIFF(year ,HIRE_DATE,now()) "나이"
-- STR_TO_DATE('190322','%y%m%d')



-- 부서코드가 D5이면 총무부 D6이면 기획부 D9이면 영업부로 처리하시오
-- => CASE 사용  사원명 부서코드 부서명
select EMP_NAME 사원명,
DEPT_CODE 부서코드,
case 
	when DEPT_CODE = 'D5' then '기획부'
	when DEPT_CODE = 'D6' then '영엉부'
	when DEPT_CODE = 'D9' then '영업부'
end "부서명"
from employee e 
where DEPT_CODE in ('D5','D6','D9');
