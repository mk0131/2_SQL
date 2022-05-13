


-- NOT IN (값,값,값, ...)
select EMP_ID, EMP_NAME, DEPT_CODE
from employee e 
where DEPT_CODE not in ('D1','D5');

-- ABS(값) : 특정  숫자의 절대값 표현.
select  ABS(10) , abs(-10) ;

-- MOD() : 주어진 컬럼이나 값을 나눈 나머지를 반환
select mod (10,3), mod (10,2), mod (10,7);

-- ROUND() : 지정한 자리수 부터 반올림.
select round(123.456,0), -- 소수점 첫째자리 반올림
	   ROUND(123.456,1),
	   round(123.456,2), 
	   ROUND(123.456,-2); -- 10의 자리 반올림
	   
-- CEIL : 소수점 첫째 자리에서 올림
-- FLLOR : 소수점 이하 자리를 모두 버림.
select ceil (123.456) , floor(123.456); 


-- TRUNCATE() : 지정한 위치까지 숫자를 버리는 함수
select truncate(123.456,0),
	   TRUNCATE(123.456,1),
	   TRUNCATE(123.465,2),
	   TRUNCATE(123.456,-2);
	   
-- CEILING(숫자) : 소수점 반올림 
select ceiling (4.0),
	   ceiling (4.1),
	   ceiling (4.2),
	   ceiling (3.9),
	   ceiling (3.1); 
	  
select  ceiling (-4.0),
        ceiling (-4.1),
        ceiling (-3.9);
        
-- EMPLOYEE 테이블에서 입사한 달의 숫자가 홀수 달인 직원의
-- 사번 사원명 입사일 정보를 조회
select EMP_ID,
EMP_NAME,
HIRE_DATE
from employee e 
where mod (substr(HIRE_DATE,7,1),2) = 1;

-- DATE_ADD(날짜,INTERVAL)
-- DATE_SUB(날짜,INTERVAL)

select EMP_NAME,HIRE_DATE,
date_add(HIRE_DATE,interval 1 DAY) 
from employee e ;

select EMP_NAME,HIRE_DATE,
date_sub(HIRE_DATE,interval 10 YEAR)
from employee e ;

-- DAYOFWEEK(날짜)
-- 해당 날짜의 요일을 리턴
-- 1:일요일 ~7:토요일
select dayofweek(now());      

select EMP_NAME,
case 
	when DAYOFWEEK(HIRE_DATE) = 1 then '일요일'
	when DAYOFWEEK(HIRE_DATE) = 2 then '월요일'
	when DAYOFWEEK(HIRE_DATE) = 3 then '화요일'
	when DAYOFWEEK(HIRE_DATE) = 4 then '수요일'
	when DAYOFWEEK(HIRE_DATE) = 5 then '목요일'
	when DAYOFWEEK(HIRE_DATE) = 6 then '금요일'
	when DAYOFWEEK(HIRE_DATE) = 7 then '토요일'	
end as '요일'
from employee e ;

-- LAST_DAY(날짜) : 날짜의 마지막 일자를 조회
select LAST_DAY(now());

-- EMPLYOEE 테이블에서 근무년수가 20년 이상인 사원들의
-- 사번 사원명 부서코드 입사일 조회
select EMP_ID 사번,
EMP_NAME 사원명,
DEPT_CODE 부서코드,
HIRE_DATE 입사일
from employee e 
where date_add(HIRE_DATE, interval 20 year) <= now();  


-- 형변환 함수
-- CAST(), CONVERT() : 주어진 값을 원하는 형식으로 변경
select cast(20220429 as DATE),convert (20220429,DATE);
select cast(20200101030330 as CHAR), convert(20200101030330,CHAR);
select cast(now() as CHAR);

-- BINARY 이진 데이터
-- CHAR 문자
-- DATE 날짜
-- INTEGER 숫자 (UNSIGEND INTEGER: 양수만)
-- DECIMAL 소수점까지
-- JOSN JSON타입

select '123'+'456';
select '123'+'456ABC';
select '123'+'4A56BC';


-- SELECT 문의 실행 순서
/*
 * 5:SELECT 컬럼, 계산식, 함수식 AS 별칭
 * 1:FROM 테이블명
 * 2:WHERE 조건
 * 3:GROUP BY 그룹을 묶을 컬럼
 * 4:HAVING 그룹에 대한 조건식
 * 6:ORDER BY 컬럼 | 별칭 | 순서
 * 
 */
select EMP_ID,EMP_NAME 이름,SALARY, DEPT_CODE
from employee e 
-- order by EMP_ID; --정렬의 기본값은 ASC
-- order by EMP_NAME asc ;
-- order by DEPT_CODE desc , EMP_ID;
order by 3 desc ; -- 컬럼의 순서 


-- GROUP BY --
-- 부서별 평균
select truncate(AVG(SALARY),-4)
from employee e ;

-- D1 평균 급여
select truncate(AVG(SALARY),-4)
from employee e 
where DEPT_CODE = 'D1';

-- 특정 컬럼을 하나의 그룹으로 묶어 한 테이블 내에서 조회
select DEPT_CODE, truncate(AVG(SALARY),-4)
from employee e 
group by DEPT_CODE
order by 1 asc ;

-- EMPLOYEE 테이블에서
-- 부서별 총 인원 급여 합계 급여 평균 최대 급여 최소 급여 를 조회
-- 부서코드 오름차순 정렬 truncate(,-3) 로 처리 
select DEPT_CODE,
count(*) "총 인원", 
TRUNCATE(SUM(SALARY),-3) "급여 합계",
TRUNCATE(AVG(SALARY),-3) "급여 평균",
TRUNCATE(MAX(SALARY),-3) "최대 급여",
TRUNCATE(MIN(SALARY),-3) "최소 급여"
from employee e 
group by DEPT_CODE 
order by 1 asc;


-- HAVING
-- GROUP BY 한 소그룹에 대한 조건을 설정
-- 부서별 급여 평균이 300만원 이상인 부서
select DEPT_CODE,
truncate(AVG(SALARY),-4) 평균
from employee e 
group by DEPT_CODE
having avg(SALARY)>3000000 
order by 1;


-- 부서별 그룹의 급여 합게 중 900만원 초과하는
-- 부서의 부서코드와 급여 합계 조회.
select DEPT_CODE,
sum(SALARY) 급여합계
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

-- EMPLOYEE 테이블에서 직급 별 그룹을 편성하여
-- 직급 코드 급여 합계 급여 평균 인원 수를 조회
-- 단 인원수는 3명을 초과
-- 조회 결과는 내림차순
select DEPT_CODE,
SUM(SALARY),
truncate(AVG(SALARY),-4),
COUNT(*)
from employee e 
group by JOB_CODE 
having COUNT(*) > 3
order by 4 desc;

-- SET OPERATION
-- 합집합
-- UNION:
-- 두 개 이상의 SELECT 한 결과(RESULTSET)를 구하는 명령어
-- 중복이 있을경우 중복되는 결과는 1번만 보여준다
-- UNION ALL:
-- 두 개 이상의 SELECT 한 결과(RESULTSET)를 구하는 명령어
-- 중복이 있을 경우 중복되는 내용 그대로 조회

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
-- 두개 이상의 테이블을 하나로 합쳐 사용하는 명령 구문
-- 'J6'의 직급을 가진 사원들의 근무 부서명
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

-- EMPLOYEE 테이블의 직원 급여 정보와
-- SAL_GRADE 의 급여 등급을 합쳐서
-- 사번 사원명 급여등급 등급 기준 최소급여 등급 기준 최대 급여를 조회
select * from sal_grade sg ;
select * from employee e ;

select EMP_ID,
EMP_NAME,
SAL_LEVEL,
MIN_SAL,
MAX_SAL
from employee e 
join sal_grade sg USING(SAL_LEVEL);

-- INNER JOIN 조건에 만족하는 데이터만 선택
-- OUTER JOIN
-- LEFT OUTER JOIN : 첫번째 테이블 기준으로 두번째 테이블을 JOIN 조건에 만족하지 않는 경우 첫번째 테이블의 값은 유지
-- RIGHT OUTER JOIN : LEFT 의 반대. 두번째 테이블이 기준

-- INNER JOIN
-- 표쥰 SQL 방식 
select DEPT_CODE, DEPT_TITLE
from employee e 
inner join department d ON(DEPT_CODE = DEPT_ID)
order by 1;

-- MYSQL 방식
select DEPT_CODE, DEPT_TITLE
from employee e ,department d 
where DEPT_CODE = DEPT_ID;

select E.DEPT_CODE, D.DEPT_TITLE
from employee E , department D 
where E.DEPT_CODE = D.DEPT_ID;

-- LEFT JOIN
-- 첫번째 테이블을 기준으로 두번째 테이블을 조합.
select DEPT_CODE, DEPT_TITLE
from employee e 
left join department d ON(DEPT_CODE = DEPT_ID)
order by 1;

-- RIGHT JOIN
-- 두번째 테이블이 기준
select EMP_NAME, DEPT_CODE, DEPT_ID
from employee e 
right join department d  ON(DEPT_CODE = DEPT_ID);

-- -------
select EMP_NAME, DEPT_CODE, SALARY, sg .SAL_LEVEL
from employee e 
join sal_grade sg ON(SALARY between MIN_SAL and MAX_SAL);

-- SELF JOIN
select e .EMP_ID 사번,
e .EMP_NAME 사원명,
e .MANAGER_ID "관리자 사번",
e2.EMP_NAME 관리자명
from employee e 
join employee e2 ON(e .MANAGER_ID = e2.EMP_ID);

-- 여러개의 테이블을 JOIN 하는것
select *
from employee e 
join department d ON(DEPT_CODE = DEPT_ID)
join location l on (location_ID = LOCAL_CODE);

-- 직급이 대리이면서 아시아 지역에서 근무하는 사원 조회
-- 사번 사원명 직급명 부서명 근무지역명 급여
select EMP_ID 사번,
EMP_NAME 사원명,
JOB_NAME 직급명,
DEPT_TITLE 부서명,
LOCAL_NAME 근무지역명,
SALARY 급여
from employee e 
join job j ON(e .JOB_CODE = j.JOB_CODE and JOB_NAME = '대리')
join department d ON(DEPT_CODE = DEPT_ID)
join location l ON(location_ID = local_CODE and LOCAL_NAME like 'ASIA%');


-- 한국과 일본에 근무하는 근무 직원들의 정보를 조회하시오
-- 사원명 부서명 지역명 국가명 조회

select EMP_NAME 사원명,
DEPT_TITLE 부서명,
LOCAL_NAME 지역명,
NATIONAL_NAME 국가명
from employee e 
join department d ON(DEPT_CODE = DEPT_ID )
join location l ON(LOCATION_ID = LOCAL_CODE)
join national USING(NATIONAL_CODE)
where NATIONAL_CODE IN('KO','JP')
order by 3;


-- SUB QUERY
-- 최소 급여를 받는 사원 정보 조회
select MIN(SALARY)
from employee e ;

select *
from employee e 
where SALARY  = (select MIN(SALARY) from employee e2 );

-- 다중 행 서브쿼리
-- 결과 값이 여러 줄 나오는 서브쿼리

-- 각 직급별 최소 급여를 받는 사원 정보
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


-- 다중행 다중열 서브쿼리
-- 여러 컬럼, 여러 로우 의 결과를 가져오는 서브쿼리를 사용.
select JOB_CODE , MIN(SALARY)
from employee e2 
group by JOB_CODE ;

select *
from employee e 
where (JOB_CODE,SALARY)IN(select JOB_CODE , MIN(SALARY)
from employee e2 
group by JOB_CODE);

-- 다중행 다중열 서브쿼리 코드를 단일행 서브쿼리 로 변경

select * from employee e where ENT_YN ='Y';

-- 퇴사한 여직원과 같은 직급, 같은 부서에 근무하는 직원 정보 조회
select * from employee e 
where DEPT_CODE  = (select DEPT_CODE  from employee e2 where ENT_YN = 'Y')
and JOB_CODE  = (select JOB_CODE from employee e3 where ENT_YN = 'Y')
and EMP_ID <> (select EMP_ID from employee e4 where ENT_YN = 'Y');

-- 다중열
select * from employee e 
where (DEPT_CODE,JOB_CODE) = (select DEPT_CODE,JOB_CODE from employee e where ENT_YN ='Y')
and EMP_NAME != (select EMP_NAME from employee e  where ENT_YN ='Y');

-- FROM 위치에 사용되는 서브쿼리
-- INLINE VIEW 
-- 테이블을 테이블명으로 직접 조회하는 대신
-- 서브쿼리의 RESULTSET 을 활용하여 데이터 조회

select * from employee e ;

select *
from (
	select EMP_ID,EMP_NAME,DEPT_TITLE,JOB_NAME
	from employee e 
	join department d ON(DEPT_CODE = DEPT_ID)
	join JOB using(JOB_CODE)
 ) T;

select EMP_NAME, SALARY,
rank () OVER(order by SALARY desc)순위
from employee e ;

select * 
FROM(
select EMP_NAME, SALARY,
rank () OVER(order by SALARY desc)순위
from employee e 
) T
where 순위 <4;