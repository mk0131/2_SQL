-- 사원의 부서
select * from department;

-- 사원의 부서가 몇개인지 확인
select count(*) from department d ;

-- 사원의 수가 몇명인지 확인
select count(*) from employee ;

-- 사원 월급
select * from sal_grade ;

-- 사원 정보
select * from employee ;

-- 문제 1.EMPLOYEE 테이블에서 월급이 200만원 보다 많이 받는 사원의 모든 정보 출력
select * from employee where SALARY > 3000000;

-- 문제 2. EMPLOYEE 테이블에서 입사한 날짜가 '2000-01-01' 이후 인 사원들의 이름, 주민번호, 입사일 출력
select EMP_NAME , EMP_NO , HIRE_DATE from employee where HIRE_DATE > '2000-01-01'; 

-- 부서 코드가 D6 인 사원 정보 모두 조회하기
select * from employee  where DEPT_CODE = 'D6';

-- 직급이 J1인 사원의 사번 사원명 직급코드 부서코드를 조회
select EMP_ID , EMP_NAME , JOB_CODE , DEPT_CODE from employee where JOB_CODE ='J1';

-- 부서코드가 D6 이면서 이름이 유재식 인 사원의 모든 정보 조회하기
select * from employee where DEPT_CODE = 'D6' and EMP_NAME ='유재식';