--@190319 신지혁
--1. 이름, 전화번호, 나이가 들어있는 person테이블 생성 (이름은 널이올수없음)
create table person(
  name varchar2(30) not null,
  phone varchar2(50),
  age number
);
desc person;
--2. person테이블에 홍길동(20, 1234-5678) / 철수(18, 1111-1111) / 영희(?, 0000-7777) / 아무개(22, 1212-1212)추가
insert into person (name, phone, age) values ('홍길동', '1234-5678', 20);
insert into person (name, phone, age) values ('철수', '1111-1111', 18);
insert into person (name, phone) values ('영희', '0000-7777');
insert into person (name, phone, age) values ('아무개', '1212-1212', 22);
select * from person;
--3. 전화번호에 1이 들어가면서 나이가 20이상인 사람 출력
select * from person where phone like '%1%' and age>=20;
--4. 이름,학과,성적이 들어있는 student 테이블 생성후 값은 홍길동(컴공,A) / 누구게(수학,B) / 아무개(전자,F)
create table student (
  name varchar2(20),
  major varchar2(30),
  grade varchar2(10)
);
insert into student (name, major, grade) values ('홍길동','컴공','A');
insert into student (name, major, grade) values ('누구게','수학','B');
insert into student (name, major, grade) values ('아무개','전자','F');
select * from student;
--5. person테이블중 학생이면서, 성적이 B이상인 사람의 이름, 번호, 학과, 성적 출력
select person.name, phone, major, grade 
from person 
join STUDENT on person.NAME = student.name 
where student.grade='A' or student.grade='B';


--@190319 우세림
--------------------------
create table student2(
  name varchar2(20) not null,
  age number not null,
  phone number(30),
  birthday date not null
);
desc student2;

insert into student2 (name, age, phone, birthday) values ('김민지', 16, 01012341234, '2004-08-04');
insert into student2 (name, age, phone, birthday) values ('강소심', 15, 01023456789, '2004-01-04');
insert into student2 (name, age, phone, birthday) values ('김나나', 15, 01034567890, '2005-01-02');
insert into student2 (name, age, phone, birthday) values ('장윤지', 15, 01056789012, '2005-01-17');
insert into student2 (name, age, birthday) values ('홍래경', 15, '2005-07-04');
insert into student2 (name, age, birthday) values ('문소진', 15, '2005-11-04');
insert into student2 (name, age, phone, birthday) values ('김지석', 14, 01067890123, '2006-01-01');
insert into student2 (name, age, phone, birthday) values ('김나나', 14, 01078901234, '2006-06-06');
insert into student2 (name, age, phone, birthday) values ('장석규', 14, 01089012345, '2006-05-04');
insert into student2 (name, age, phone, birthday) values ('김민지', 16, 01012341234, '2004-08-04');
select * from student2;
--1
select name as "학생 이름", age+10, phone, birthday from student2 order by name;
select *
from Student2;
--2
select name||' 착한학생', age, phone, birthday from student2 where name like '김%' or name like '장%' or name like'문%';
select name||' 착한학생', age, phone, birthday from student2 where regexp_like(name, '[김장문]');
--3
select distinct name, age from student2 order by name desc, age desc;
--4
select mod(2000,3) from dual;
--5
select name, age, nvl(phone,0) from student2 where birthday between '2005-01-01' and '2006-12-31';


--@190320 우세림
--1. EMP 테이블에서 급여가 3000 이면서 사원번호가 7788인 사원의 사원번호,이름,담당업무,급여를 출력
select empno, ename, JOB, sal from emp where sal>=3000 and empno=7788;
--2.EMP 테이블에서 입사일이 1981 이후인 사원들의 이름,업무,입사일을 입사일 순으로 출력하시오.
select ename, job, hiredate from emp where to_char(hiredate,'YYYY-MM-DD') > '1981' order by hiredate; 
--3. EMP 테이블에서 부서번호가 10,20 인 사원중 이름에 'S'로 시작하는 사원의 이름, 부서번호를 출력, 단 이름순으로 정렬 (in사용)
select ename, deptno from emp where deptno in (10,20) and ename like 'S%' order by ename;
--4. EMP 테이블에서 급여가 1500 이상이고 부서번호가 10,30 인 사원 중 1982 년에 입사한 사원의 정보를 출력
select * from emp where sal >=1000 and deptno in (10,30) and to_char(hiredate,'YYYY') = '1982';
--5. EMP 테이블에서 COMM 에 NULL 이 아니고 MANAGER가 아닌 사원의 모든 정보를 출력
select * from emp where comm is not null and job != 'MANAGER';
--6. EMP 테이블에서 보너스가 급여보다 10%가 많은 모든 종업원을 부서번호 오름차순으로 정렬하여 출력
select * from emp where comm < sal*10 order by deptno asc;
--7. EMP 테이블에서 이름에 L 이 두 자가 있고 부서가 30 이거나 또는 관리자가 7782 인 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
select * from emp where ename like '%L%L%' and deptno=30 or mgr='7782';
--8. 현재 날짜를 출력(2019.03.05 07:03)하고 열 레이블은 '현재시간' 으로 출력
select to_char(sysdate,'YYYY.MM.ss HH:mm') as "현재시간" from dual;
--9. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장을 기술하시오.
select empno, ename, job, sal as "급여", sal*15 as "증가된 급여", (sal*15)-sal as "증가액" from emp;
--10. EMP 테이블에서 이름,입사일,입사일로부터 6 개월 후 돌아오는 월요일 구하여 출력
select hiredate "날짜", add_months(hiredate, 6) "6개월후", next_day(add_months(hiredate, 6), '월요일') "6개월후 월" from emp;
--11. EMP 테이블에서 입사일, 입사일로부터 현재까지의 월수, 급여, 입사일부터 현재까지의 급여의 총계를 출력
select hiredate, trunc(months_between(sysdate, HIREDATE),0) as "현재까지의 월수" 
, sal, to_char(trunc(months_between(sysdate, HIREDATE),0)*sal,'999,999,999') as "현재까지의 급여" from emp;
--12. EMP 테이블에서 모든 사원의 이름과 급여(15 자리로 출력 좌측의 빈곳은 “*”로 대치)를 출력
select rpad(ename||sal,15,'*') from emp;
--13. EMP 테이블에서 모든 사원의 입사일,입사한 요일을 출력
select hiredate, to_char(hiredate,'day') from emp;
--14. EMP 테이블에서 이름의 길이가 6 자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력
select * from emp where length(ename)=6;
--15. EMP 테이블에서 모든 SALESMAN 에 대하여 급여의 평균, 최고액, 최저액, 합계를 구하여 출력
select avg(sal), max(sal), min(sal), sum(sal) from emp where job ='SALESMAN';
--16. EMP 테이블에 등록되어 있는 인원수, 보너스에 NULL 이 아닌 인원수, 보너스의 평균(null 포함, 정수값만), 부서의 수(3개)를 구하여 출력
select count(*), count(comm), trunc(avg(nvl(comm,0)),0), count(distinct deptno) from emp;
--17. EMP 테이블에서 부서별로 인원수,평균 급여,최저급여,최고 급여,급여의 합을 구하여 급여의 합이 많은 순으로 출력
select job, count(*), round(avg(sal),1), max(sal), min(sal), sum(sal) from emp group by job order by sum(sal) desc;
--18. EMP 테이블에서 부서별 최고 급여와 최소 급여의 차이는 얼마인가 출력
select job, max(sal)-min(sal) as "급여차이" from emp group by JOB;


--@190320 윤종석
--1. 부서 번호(department_id)가 50인 사원들의 이메일 아이디를 불러와 아이디를 소문자로 바꾸고 아이디@oracle.com 형식으로 출력하세요.
select lower(email)||'@oracle.com' as "이메일" from EMPLOYEES where DEPARTMENT_ID=50;
--2. 모든 사원의 전화번호를 불러와 앞의 3개 숫자를 010으로 바꾸고 '.'을 '-'로 바꿔서 출력하세요
select phone_number, replace(replace(phone_number, substr(phone_number,1,3), '010'),'.','-') from EMPLOYEES;
--3. 부서 번호 별로 급여(salary)의 총합이 얼마인지 출력하되 사원 번호(employee_id)가 100번부터 150번까지인 사람만 계산해서 출력하세요
select sum(salary) , employee_id from EMPLOYEES where EMPLOYEE_ID between 100 and 150 group by DEPARTMENT_ID;
--4. 입사 연도별로 입사등급을 나눠 출력하고 사원의 이름(first_name)과 성(last_name)을 중간에 공백을 넣어 같이 출력하세요
select case when to_char(hire_date,'YYYY')>2002 then '원로' 
            when to_char(hire_date,'YYYY')>2005 then '청년' 
            when to_char(hire_date,'YYYY')>2007 then '꼬꼬마' 
            else '외계인'
      end as "등급", FIRST_NAME || ' ' || LAST_NAME
from EMPLOYEES;


--@190320 김동민
--1. empno 와 ename 결합하여 출력하시오.  ( || 사용!)
select empno || ename from EMP;
--2. 이름이 SMITH 이고 직업이 CLERK 인 사원의 사원번호, 이름, 직업, 급여를 출력하시오. (where 이름 =' ' and 직업=' ')
select empno, ename, job, sal from emp where ename='SMITH' and job='CLERK';
--3. 사원번호가 10 이상이고 급여가 2000 이상인 사람의 모든 정보를 출력하시오. where 사원번호 = ' ' and 급여(sal) = ' ';
select * from emp where deptno >10 and sal >=2000;
--4. 수당이 null 인 모든 사람의 정보를 출력하시오.where comm IS NULL
select * from emp where comm is null;
--5. 사번, 이름, 급여, 수당, 총급여를 출력하시오.select sal + nvl(comm,0) from emp;
select empno, ename, sal, comm, sal+nvl(COMM,0) from emp;
--6. 이름에서 A로 시작하는 사원의 사번,이름, 급여, 수당 을 출력하시오. 단, 수당이 null이라면 0 로 출력하시오. (edited) 
select empno, ename, sal, nvl(comm,0) from emp where ename like 'A%';

---------------------
--@190321 우세림
-- 1. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와
-- 입사년도(hire_date)별 평균 급여를 출력하시오.
-- 출력 시 년도를 기준으로 오름차순 정렬하시오.
select to_char(hire_date,'YY'), SALARY, job_id from EMPLOYEES where SALARY in(select SALARY from EMPLOYEES) and  job_id = 'SA_MAN' order by to_char(hire_date,'YY');


--2. 각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
--   평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 직원수를 출력하시오. 
--   단, 도시에 근 무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.

--3. ‘Public  Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하시오. 
--   (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려 하지 않는다.)      
--   이름은 first_name, last_name을 아래의 실행결과와 같이 출력한다.

--4. 자신의 매니저보다 연봉(salary)를 많이 받는 직원들의 성(last_name)과 연봉(salary)를 출 력하시오. 

--5. 2007년에 입사(hire_date)한 직원들의 사번(employee_id), 이름(first_name), 성(last_name), 
--   부서명(department_name)을 조회합니다.  
--   이때, 부서에 배치되지 않은 직원의 경우, ‘<Not Assigned>’로 출력하시오. 

------------------------------------------------------------------
------------------------------------------------------------------










