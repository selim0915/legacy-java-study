/*
[1일차 수업]
1. 오라클 소프트웨어 다운로드
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (무료설치)

3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4.Sqlplus 프로그램 제공(CMD) : GUI 환경 일반개발자 사용 불편

5.별도의 Tool 설치 무료(SqlDeveloper)  ,
                 유료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : bituser

-- USER SQL
CREATE USER bituser IDENTIFIED BY 1004
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bituser QUOTA UNLIMITED ON USERS;

-- ROLES
GRANT "CONNECT" TO bituser WITH ADMIN OPTION;
GRANT "RESOURCE" TO bituser WITH ADMIN OPTION;
ALTER USER bituser DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES

7. 현재 접속 계정 확인 : show user;   >> USER이(가) "BITUSER"입니다.

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/
/*
SELECT [DISTINCT] {*, column [alias], . . .}
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]];
*/
select * from emp;
select * from dept;
select * from salgrade;

--1. 사원테이블에서 모든 데이터를 출력하세요

select * from emp;    --쿼리문장은  대소문자를 구분하지 않습니다
SELECT * FROM DEPT;
select * from salgrade;

--2. 특정 컬럼 데이터 출력하기
select empno , ename , sal from emp;

--3. 컬럼에 가명칭(별칭)(alias) 부여하기

select empno 사번 , ename 이름
from emp;

select empno "사    번" , ename "이     름"
from emp;

--정식(ansi 문법)
select empno as "사    번" , ename as "이     름"
from emp;

--Oracle 데이터 문자열 (문자열 데이터는 대소문자 구문)
--문자열 표기  '문자열'
-- 소문자 : a   대문자 : A 다른 문자 취급
select empno , ename from emp where ename='king';

select empno , ename from emp where ename='KING';

--Oracle SQL : 연산자 (결합 연산자( || )  와 산술연산자( + ) 구분)
--Java :  + (숫자 + 숫자  연산)
--Java :  + (문자열 + 문자열 결합)
--TIP) ms-sql +(연산, 결합)


select '사원의 이름은' || ename || ' 입니다'  as "사원정보"
from emp;

--테이블 컬럼은 기본 타입
--컬럼의 타입 숫자 , 문자 , 날짜 ....
desc emp;  --테이블의 타입 기본 정보 조회

select  empno  ||  ename  -- number || varchar  내부적으로 형변환 (숫자 -> 문자) 결합
from emp;

select empno + ename   --"invalid number"  타입이 맞지 않아서   산술연산 불가
from emp;

--사장님 우리 회사에 직종이 몇개나 있나
--distinct : 중복 데이터 제거
--distinct 원리 : grouping
select distinct job from emp;


--재미삼아서 ... (group 에  group 의 데이터)
select distinct  job , deptno from emp order by job ;

select distinct  deptno , job from emp order by deptno;

----------------------------------------------------------------------
--Oracle (SQL 언어)
--JAVA 언어( 연산자)
--JAVA 거의 동일 ( + , * , - ....) : % 나머지   >>  오라클  % 검색 패턴  >> 나머지 구하는 연산자 (x) : Mod() 함수

--산술연사 (+ , * , - , / .....) , Mod() 함수 나머지를 구한다

--사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하세요
desc emp; --SAL   NUMBER
select empno, sal , sal + 100 as "인상급여"  from emp;

select 100 + 100 from dual;  -- dual 임시 테이블 ...
select 100 || 100 from dual;  -- 100100 (형변환)
select '100' + 100 from dual; -- 오라클에서  + 무조건 산술  (문자를 숫자로)
select 'A100' + 100 from dual; -- Error .......

--비교연산자
-- >  , < , <=
--Java 같다 (==)  할당 (=)
--Oracle 같다(=)   같지 않다 (!=)

--논리 연산자
--AND , OR , NOT

--조건절 (원하는 row 가지고 오겠다)
select *
from emp
where sal >= 3000;

select empno , ename , sal
from emp
where sal >= 3000;


--이상 , 이하 (= 포함)
--초과 , 미만

--사번이 7788번인 사원의 사번, 이름, 직종 , 입사일을 출력하세요
--실행순서 :
select empno, ename,job,hiredate       --3
from emp                                      --1
where empno=7788;                         --2

--사원의 이름이 king 사원의 사번, 이름, 급여 정보를 출력하세요
select empno , ename , sal
from emp
where ename = 'KING';

--hint) 논리 (AND , OR )
--AND 두개의 모든 참 --> 참

--급여가 2000달러 이상이면서 직종이 manager 인 사원은 모든 정보를 출력하세요
--두개의 조건을 모든 만족 (둘다 참인)
select *
from emp
where sal >= 2000 and job='MANAGER';

--급여가 2000달러 이상이거나 직종이 manager 인 사원은 모든 정보를 출력하세요
--두개의 조건중 하나면 참이여도 출력
select *
from emp
where sal >= 2000 or job='MANAGER';

--------------------------------------------------------------------------
--오라클 날짜 (DB 서버의 날짜)
--오라클 날짜 (sysdate)
--모든 시스템 날짜 정보
--게시판 글쓰기
--insert into board(writer , title , content , regdate)  values('홍길동' , '방가' , '배고파요' , sysdate)
--TIP) ms -sql : select getdate()


select  sysdate from dual;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select hiredate from emp;

--오라클 시스템 테이블 ....
select * from SYS.NLS_SESSION_PARAMETERS;   --시스템 환경 테이블 조회 확인
--NLS_DATE_FORMAT	      YYYY-MM-DD HH24:MI:SS
--NLS_DATE_LANGUAGE	    KOREAN
--NLS_TIME_FORMAT	        HH24:MI:SSXFF

--오라클 날짜 조회  : '2019-12-12'
select * from emp
where hiredate = '1980-12-17';   --  (-)

select * from emp
where hiredate = '1980/12/17';    -- (/)


select * from emp
where hiredate = '80/12/17';  --형식은 인정이 안되요
--형식 : RR-MM-DD  >> YYYY-MM-DD

--사원의 급여가 2000 이상이고 4000 이하인 모든 사원의 정보를 출력 하세요
select *
from emp
where sal >= 2000 and sal <= 4000;
--연산자 : between A and B  (= 포함)
--주의사항 : 미만 초과 의 사용 금지
select *
from emp
where sal between 2000 and 4000;

--사원의 급여가 2000 초과 4000 미만인 모든 사원의 정보를 출력 하세요

select *
from emp
where sal > 2000 and sal < 4000;

--부선번호가 10 번 또는 20번 또는 30번인 사원의 사번 , 이름 , 급여  ,부서번호를 출력하세요
select empno, ename, sal , deptno
from emp
where deptno=10 or  deptno=20 or deptno=30;
-- IN 연산자 (조건 or 조건 or ....)
select empno, ename, sal , deptno
from emp
where deptno in(10,20,30); --deptno=10 or  deptno=20 or deptno=30;

--부선번호가 10 번 또는 20번이 아닌 사원의 사번 , 이름 , 급여  ,부서번호를 출력하세요

select *
from emp
where deptno != 10 and deptno != 20;

--NOT IN 연산자(부정값 and  부정값 and ....)
select *
from emp
where deptno not in (10,20); --not in (deptno != 10 and deptno != 20; )

--POINT : Oracle 값이 없다(데이터 없다) >> null
--null  (필요악)

create table member(
  userid varchar2(20) not null,  --필수입력
  name varchar2(20) not null,  --필수입력
  hobby varchar2(50)           --default null (null 값을 허용하겠다) :  옵션 ...
);

desc member;
insert into member(userid,hobby) values('hong' , '농구');  --실행 안됨 (name 컬럼에 ....)
insert into member(userid,name) values('hong' , '홍길동'); -- hobby 컬럼의 데이터 >> null
select * from member;
insert into member(userid,name,hobby) values('kim' , '김씨', '게임');
select * from member;

--실제반영
commit;



--수당(comm)을 받지 않는 모든 사원의 정보를 출력하세요
-- 0 도 데이터 취급(받는 조건 포함)
--comm 컬럼에 데이터가 null 인것만 출력하세요
select * from emp where comm = null; -- (x)

--null 의 비교는 (is null , is not null)
select * from emp where comm is null;


--수당(comm)을 받는 모든 사원의 정보를 출력하세요
select * from emp where comm is not null;


--사원테이블에서 사번 , 이름 ,급여 , 수당 , 총급여를 출력하세요
--총급여 (급여 + 수당)
select empno , ename , sal , comm , sal + comm as "총급여"
from emp;


select empno , ename , sal , comm , sal + nvl(comm,0) as "총급여"
from emp;

--POINT  null
--1. null 과의 모든 연산은 그 결과가 : null
--2.위 문제 해결 : 함수 nvl() , nvl2()   >> TIP ms-sql : convert()  , my-sql : IFNULL()  : null 값 대체 ...

select 1000 + null from dual;

select 1000 + nvl(null,0) from dual;

select comm , nvl(comm,11111) from emp;

--사원의 급여가 1000 이상이고 수당을 받지 않는 사원의  사번, 이름, 직종, 급여 , 수당을 출력하세요
select empno, ename,job,sal,comm
from emp
where sal >= 1000 and comm is null;

---------------------------------------------------------------------------
--DQL(data query language) : SELECT
--DDL(데이터 정의어) : create , alter , drop ... (객체 생성 , 수정 ,삭제)

--create Board (boardno number ...
-- JAVA : class Board { private boardno int }

create table Board (
 boardid number not null , --숫자 , 필수입력
 title varchar2(20) not null , --한글 10자 , 영문자 ,특수문자 ,공백 20자 , 필수입력
 content varchar2(2000) not null , -- 필수 입력
 hp varchar2(20)  -- default null 허용  필수 입력 사항 (x)
);

desc Board;

--DML(데이터 조작어) 반영 여부에서 결정 (실반영(commit) , 취소(rollback)) 반드시 수행
--insert , update , delete 작업

insert into board(boardid, title , content)
values(100,'오라클','할만 하네');

select * from board;
--의사결정 : 실제 반영 할거야 (commit)
--의사결정 : 실제 반영 안할거야 (rollback)

rollback;
commit;

--begin
insert into board(boardid, title , content)
values(200,'자바','그립다');

insert into board(boardid, title , content)
values(300,'자바2','그립다2');

--commit 둘다반영
--rollback 둘다 취소

select * from board;
commit;

select boardid , nvl(hp,'EMPTY') as "hp" from board;
--nvl 함수는 숫자 , 날짜 , 문자열  모두 적용 가능하다 .... ^^

------------------------------------------------------------------------------------
--문자열 검색
--주소검색 : 검색어 : '역삼' -> 역삼 단어가 있는 모든 문장  (LIKE 검색)
--문자열 패턴 검색 ( Like 연산자)

--like 연산자 ( 와일드 카드 문자 ( % : 모든것 ,  _ : 한문자 ) 결합 ......

select ename
from emp
where ename like '%A%';  --ename 컬럼에 데이터에 A 들어있는 모든 이름 ....

select ename
from emp
where ename like '%a%';  -- 문자열 데이터 대소문자 엄격하게 구분

select ename
from emp
where ename like 'A%'; -- 이름의 첫 글자가 A 시작

select ename
from emp
where ename like '김%'; -- 이름의 첫 글자가 A 시작

select ename
from emp
where ename like '김수환무%';


select ename
from emp
where ename like '%S';


select ename
from emp
where ename like '%LL%';



select ename
from emp
where ename like '%A%A%';  -- A 가 두개만 있으면 ....


select ename
from emp
where ename like '_A%';  --첫글자 어떤것이 와도 상관없고 두번째 글자는 A ...
--WARD
--MARTIN
--JAMES

--오라클 과제 (regexp_like) 상세 검색
--select * from emp where regexp_like(ename,'[A-C]');
--정규표현식(java -> oracle -> javascript )
--과제 : 정규 표현 예제 5개 만들기 (카페 올려드리면 하세요)  중간 프로젝트 요구사항

---------------------------------------------------------------------------------------
--데이터 정렬하기
--order by 컬럼명 : 문자 , 숫자 , 날짜
--오름차순 : asc : 낮은순  (default)
--내림차순 : desc : 높은순

select * from emp order by sal;  --default asc

select * from emp order by sal asc;

--급여를 많이 받는 순으로 정렬해서 출력하세요
select * from emp order by sal desc;

select ename from emp order by ename asc; -- 정렬가능

--입사일이 가장 늦은 순으로 정렬해서 사번  , 이름 , 급여 , 입사일 데이터를 출력하세요
--(가장 최근에 입사한 순으로)

select empno, ename, sal, hiredate
from emp
order by hiredate desc;

/*
실행순서
SELECT                   3
FROM                     1
WHERE                    2
ORDER BY                4  (select 결과를 정렬)
*/

--해석
select empno , ename, sal , job , hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;

--order by 컬럼명 desc , 컬럼명 asc , 컬럼명 desc
select job , deptno
from emp
order by job asc , deptno desc;

---------------------------------------------------------------------------------------------
--연산자
--합집합(union) : 테이블과 테이블의 데이터를 합치는 것 (중복값은 배제)
--합집합(union all) : 중복값 허용

create table uta (name varchar2(20));

insert into uta(name) values('AAA');
insert into uta(name) values('BBB');
insert into uta(name) values('CCC');
insert into uta(name) values('DDD');
commit;

select * from uta;

create table ut(name varchar2(20));

insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');
commit;

select * from ut;

--union
select * from ut
union
select * from uta;

select * from ut
union all
select * from uta;

--union 규칙
--1. 대응대는 컬럼의 타입이 동일
select empno, ename from emp
union
select dname , deptno from dept;  --대응되는 타입이 틀린다

select empno, ename from emp
union
select deptno , dname from dept;


--실무 > subquery (in line view)  TIP ....
select empno, ename
from (
          select empno, ename from emp
            union
          select deptno , dname from dept
        ) order by empno desc;

--2. 대응대는 컬럼의 개수가 동일  ( null 착한일)
select empno , ename , job , sal from emp
union
select deptno, dname,loc,null from dept;

--여기까지가 초보개발자가 의무적으로 해야하는 (단일 테이블) 대상으로 .....
-------------------------------------------------------------------------------------
--오라클 함수 ......
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  한글 3byte 인식
--KO16KSC5601 2Byte (현재 변환하면 한글 다깨짐)
select * from nls_database_parameters where parameter like '%CHAR%';
--------------------------------------------------------------------------------------
--[2일차 ]
--오라클 함수 (오라클.pdf 49 page)
/*
단일 행 함수의 종류
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다. (to_char() , to_number() , to_date())
5) 일반적인 함수 : NVL, DECODE
*/

--문자열 함수
select initcap('the super man') from dual; --The Super Man

select lower('AAA') , upper('aaaa') from dual;

select ename , lower(ename) as "ename" from emp;

select * from emp where lower(ename) ='king';

--문자열 개수
select length('abcd') from dual; --4개
select length('홍길동') from dual; --3개

select length(' 홍 a길 동') from dual;

--결합 연산자 ||
--concat()

select 'a' || 'b' || 'c'  as "data" from dual;

select concat('a','b') from dual;

select concat(ename,job) from emp;
select ename || '      ' ||  job from emp;

--부분 문자열 추출
--java (substring)
--oracle(substr)
select substr('ABCDE',2,3) from dual; --BCD
select substr('ABCDE',1,1) from dual; --자기자신 : A
select substr('ABCDE',3,1) from dual; --C

select substr('ABCDE',3) from dual;  --3~

select substr('ABCDE',-2,1) from dual; --D
select substr('ABCDE',-2,2) from dual; --DE
/*
사원테이블에서 ename 컬럼 데이터에 대해서 첫글자는 소문자로 나머지 문자는 대문자로 출력하되
하나의 컬럼으로 출력하세요
--컬럼의 가명칭은 : fullname
--첫글자와 나머지 문자 사이에 공백하나를 넣으세요
ex) SMITH  >>  s MITH

*/
select  lower(substr(ename,1,1)) from emp;   --s

select  upper(substr(ename,2)) from emp;    --MITH

select lower(substr(ename,1,1))  || ' ' || upper(substr(ename,2)) as "fullname" from emp;

--lpad , rpad (채우기)
select lpad('ABC',10,'*') from dual; --*******ABC

select rpad('ABC',10,'%') from dual; --ABC%%%%%%%

--Quiz
--사용자 비번 : hong1006
--화면 : ho****** 출력하고 싶어요  (비번 : 1004 > 10**)
select rpad(substr('hong1006',1,2), length('hong1006'),'*') as "password" from dual;
select rpad(substr('1004',1,2), length('1004'),'*') as "password" from dual;

--emp 테이블에서 ename 컬럼의 데이터를 출력하는데 첫글자만 출력하고 나머지는 * 로 표시하세요
select rpad(substr(ename,1,1),length(ename),'*') as "ename" from emp;

create table member2(
  id number ,
  jumin varchar2(14)
);

insert into member2(id, jumin) values(100,'123456-1234567');
insert into member2(id, jumin) values(200,'234567-1234567');
commit;

select * from member2;

--Quiz
--출력결과
--하나의 컬럼으로 출력 :
--100  : 123456-*******
--200 : 234567-*******
--컬럼의 가명칭 "juminnumber"

select id || ' : ' || rpad(substr(jumin,1,7),length(jumin),'*') as "jumin" from member2;

--rtrim 함수
--[오른쪽 문자] 지워라
select rtrim('MILLER' , 'ER') from dual;  --MILL

select ltrim('MILLLLLLLLLLER' , 'MIL') from dual; --ER

select '>' || rtrim('MILLER      ' , ' ') || '<' from dual; --    >MILLER<  공백제거

--치환함수 (replace)
select ename , replace(ename, 'A' , '와우')  from emp;

---------문자열 함수( END ) ----------------------------------------------

--[ 숫자함수 ]
--round (반올림 함수)
--trunc (절삭함수)
--나머지 구하는 함수 (mod())

-- -3  -2  -1  0(정수)  1  2  3
select round(12.345,0) as "r" from dual;  --12  정수부분만 남겨라
select round(12.567,0) as "r" from dual;  --13

select round(12.345,1) as "r" from dual; --12.3
select round(12.567,1) as "r" from dual; --12.6

select round(12.345,-1) as "r" from dual; --10
select round(15.345,-1) as "r" from dual; --20
select round(15.345,-2) as "r" from dual; --0



--trunc (반올림 하지 않고 버려요)
select trunc(12.345,0) as "t" from dual;  --12  정수부분만 남겨라
select trunc(12.567,0) as "t" from dual;  --12

select trunc(12.345,1) as "t" from dual; --12.3
select trunc(12.567,1) as "t" from dual; --12.5

select trunc(12.345,-1) as "t" from dual; --10
select trunc(15.345,-1) as "t" from dual; --10
select trunc(15.345,-2) as "t" from dual; --0
--------------------------------------------------------------
select trunc(12.7897987498787987987,1) from dual;
select round(12.7897987498787987987,1) from dual;

--나머지
select 12/10 from dual; --1.2

select mod(12,10) from dual; --나머지 (2)

select mod(0,0) from dual; --0
------------[숫자 함수 END]-----------------------------------
--날짜 함수
select sysdate  from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--날짜 연수 (POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date >> Number (일수)


select * from SYS.NLS_SESSION_PARAMETERS;
--NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS

select hiredate from emp;

select MONTHS_BETWEEN('2018-02-27','2010-02-27') from dual; --개월의 차 96개월

select round(MONTHS_BETWEEN(sysdate , '2010-01-01'),1) from dual; --110.6

select trunc(MONTHS_BETWEEN(sysdate , '2010-01-01'),1) from dual; --110.6

select to_date('2019-03-20') + 100 from dual; --2019-06-28 00:00:00

select to_date('2019-03-20') + 1000 from dual;

select sysdate + 1000 from dual; --2021-12-14 11:25:59

--Quiz
--1. 사원 테이블에서 사원들의 입사일에서 현재날짜까지 근속월수를 구하세요
--단 근속월수는 정수부분만 출력하세요 (반올림 하지 마세요)
select ename , hiredate , trunc(months_between(sysdate,hiredate),0) as "근속월수" from emp;

--2. 한달이 31 일 이라는 기준에서 근속월수를 구하세요 (반올림 하지 마세요) (날짜 - 날짜 >> 150일 )
select ename , hiredate , trunc((sysdate - hiredate) /31 , 0) as "근속월수" from emp;

--------------------[날짜 함수 END]----------------------------------------------------------
--문자 ...
--숫자 ...
--날짜 .. 날짜연산
--------------------------------------------------------------------------------------------
--[변환함수 ] Today POINT
--Oracle : 문자 , 숫자 , 날짜
--to_char() : 숫자 -> 문자 (1000 -> $1000)  , 날짜 -> 문자 (2019-03-03 -> 2019년03월03일)  형식(format)

--to_date() : 문자 -> 날짜 >>  select '2019-03-03' + 1000 >>  select to_date('2019-03-03') + 1000

--to_number() : 문자 -> 숫자 (자동 형변환)
--select '100' + 100 from dual;
--select to_number('100') + 100 from dual;
/*
오라클 기본 데이터 타입
create table 테이블명 ( 컬러명 타입 )
create table member (age number) >> 1건 insert .. 1000건

Java : class person ..  >> person p = new person();  1건
         List<person) personlist = new ArrayList();
         personlist.add(new person);

Oracle : create person .. >> ....

문자 타입
--char(20) >> 20Byte >> 한글 10자 ,  영문자, 특수문자,공백 20자 : 고정길이문자열
--varchar2(20) >> 20Byte >> 한글 10자 ,  영문자, 특수문자,공백 20자 : 가변길이 문자열

char(20) >> '홍길동' >> 6Byte >> 홍길동 20Byte 안에 저장
varchar2(20) >> '홍길동' >> 데이터 크기 만큼 공간 확보 >> 6Byte

고정길이 데이터 : 남 , 여
char(2) >>

성능상의 문제 )
char()  -> varchar() 검색 우선

결국 문제는 한글 ....
unicode (2byte) : 한글 , 영문자 , 특수문자 , 공백 >> 2byte

nchar(20) >> 20글자 >> 2*20 40Byte
nvarchar2(30) >> 30글자 ...

*/
--1. to_number : 문자를 숫자로 (자동 형변환)
SELECT '1' + 1 FROM dual;

SELECT TO_NUMBER('1') + 1 FROM dual;

--2. to_char() : 숫자 -> 형식문자  , 날짜 -> 형식문자
SELECT TO_CHAR(SYSDATE)  || '일' FROM dual;

SELECT SYSDATE , TO_CHAR(sysdate,'YYYY') || '년' AS "YYYY",
TO_CHAR(sysdate,'YEAR'),
TO_CHAR(sysdate,'MM'),
TO_CHAR(sysdate,'DD'),
TO_CHAR(sysdate,'DAY'),
TO_CHAR(sysdate,'DY')
FROM dual;

/*
입사일이 12월인 사원들의 사번 ,이름 , 입사일 , 입사년도 , 입사월을 출력하세요
*/

SELECT empno,ename,hiredate ,
TO_CHAR(hiredate,'YYYY')  AS "YYYY",
TO_CHAR(hiredate,'MM') AS "MM"
FROM emp
WHERE TO_CHAR(hiredate,'MM') = '12';

SELECT TO_CHAR(hiredate , 'YYYY MM DD') FROM emp;

SELECT TO_CHAR(hiredate , 'YYYY"년" MM"월" DD"일"') FROM emp;

--to_char() : 숫자 -> 형식문자
--1000000 -> $1,000,000,000 (문자형태로)
--표 오라클.pdf 71 page

SELECT '>' || TO_CHAR(12345,'999999999999') || '<' FROM dual;
SELECT '>' || TO_CHAR(12345,'099999999999') || '<' FROM dual;
--> 000000012345<

SELECT '>' || TO_CHAR(12345,'$9,999,999,999') || '<' FROM dual;

-- >        $12,345<  결과는 문자 데이터

SELECT sal , TO_CHAR(sal,'$999,999') FROM emp;

--HR 계정으로 전환 ------------------------------
select * from employees;
desc employees;
/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select employee_id , first_name , last_name , hire_date , salary
from employees;

select   employee_id,
           first_name || last_name as "fullname",
           to_char(hire_date,'YYYY-MM-DD') as "hire_date",
           salary,
           salary * 12 as "연봉",
           to_char((salary * 12)*1.1,'$9,999,999,999') as "인상분",
           hire_date
from employees
where to_char(hire_date,'YYYY') >= '2005'
order by "연봉" desc;  -- order by 절에 별칭이 올수 있다 (order by 마지막 실행)

--다시 bituser 계정으로 전환 ---------------------------------------------------
--to_date() 문자를 -> 날짜로
SELECT '2019-03-03' + 100 FROM dual;

SELECT TO_DATE('2019-03-03') + 100 FROM dual;
-----------------------------------------------------------------------
--변환함수 (to_char() , to_date() , to_number()------------------------------

--일반함수(프로그램적인 성격이 강한 함수)
--nvl() , nvl2() >> null 처리 함수
--decode() 함수 >> java if 문
--case() 함수 >> java switch 문

SELECT comm, NVL(comm,0) FROM emp;

CREATE TABLE t_emp(
  id NUMBER(6),
  job VARCHAR2(20)
);

INSERT INTO t_emp(id, job) VALUES(100,'IT');
INSERT INTO t_emp(id, job) VALUES(200,'SALES');
INSERT INTO t_emp(id, job) VALUES(300,'MGR');
INSERT INTO t_emp(id) VALUES(400);
INSERT INTO t_emp(id, job) VALUES(500,'MGR');
COMMIT;
SELECT * FROM t_emp;



SELECT deptno , DECODE(deptno , 10, '인사부',
                                               20, '관리부',
                                               30,'회계부',
                                               '기타부서') AS "부서이름"
FROM emp;

--Quiz
CREATE TABLE t_emp2(
id NUMBER(2),
jumin CHAR(7)
);
INSERT INTO t_emp2(id, jumin) VALUES(1,'1234567');
INSERT INTO t_emp2(id, jumin) VALUES(2,'2234567');
INSERT INTO t_emp2(id, jumin) VALUES(3,'3234567');
INSERT INTO t_emp2(id, jumin) VALUES(4,'4234567');
INSERT INTO t_emp2(id, jumin) VALUES(5,'5234567');
COMMIT;
SELECT * FROM t_emp2;
/*
t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin 컬럼의 앞자리가 1이면
'남성' 출력 2이면 '여성' 3이면 '중성' 그외는  '기타' 라고 출력하세요
컬럼명은 '성별'
*/
 select id , decode(substr(jumin,1,1),1,'남성',
                                            2,'여성',
                                            3,'중성',
                                              '기타') as "gender"
from t_emp2;

/*
2분 커피
if 문안에 if 문 (중첩 )
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO 문자 출력하고
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD 문자 출력하고
부서번호가 20번인 사원이 아니라면 ETC 라는 문자를 출력하세요
*/
select empno,ename, decode(deptno,20 ,decode(ename,'SMITH','HELLO','WORLD') , 'ETC')
from emp;

--CASE 문 
--Java : switch
/*
   CASE 조건식 WHEN 결과1 THEN 출력1
                   WHEN 결과2 THEN 출력2
                   WHEN 결과3 THEN 출력3
                   ELSE 출력4
   END "컬럼명"                

*/
create table t_zip(
  zipcode number(10)
);
insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(33);
insert into t_zip(zipcode) values(41);
commit;

select * from t_zip;

select '0' || to_char(zipcode),
         case zipcode when 2 then '서울'
                           when 31 then '경기'
                           when 32 then '강원'
                           when 41 then '제주'
                           else '기타지역'
         end "regionname"
from t_zip;        
/*
사원테이블에서 사원급여가 1000달러 이하면 '4급'
1001달러 2000달러 이하면 '3급'
2001달러 3000달러 이하면 '2급'
3001달러 4000달러 이하면 '1급'
4001달러 이상이면 '특급' 이라는 데이터를 출력하세요
*/
--1. case 컬럼명 when 결과 then 출력  (=) 조건
--2. case when 컬럼명 조건 비교식 then 
--          when 컬럼명 조건 비교식 then

select case when sal <= 1000 then '4급'
                 when sal between 1001 and 2000 then '3급'
                 when sal between 2001 and 3000 then '2급'
                 when sal between 3001 and 4000 then '1급'
                 else '특급'
        end "급여등급"
from emp;

---------------------------------------------------------------------------------
--문자함수
--숫자함수
--날짜함수
--변환함수(to_char() , to_date() , to_number())
--일반함수 (nvl() , decode() , case() ....)
---------------------------------------------------------------------------------
--오라클.pdf (75 page)

--집계함수-- 
--1. count(*) > row 수 ,   count(컬럼명) >> 데이터 건수 (null 을 포함하지 않는다)
--2. sum()
--3. avg()
--4.max()
--5.min()
--등등

/*
1. 집계함수는  group by 절과 같이 사용
2. 모든 집계함수는 null 값을 무시
3. select 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 group by 절에 명시되어야 한다
*/

select count(*) from emp;

select count(comm) from emp; -- 6건 (null 값을 무시)

select count(empno) from emp;


--select count(comm) from emp; 데이터가 14건 출력하게 ....

select count(nvl(comm,0)) from emp; 

-----------------------------------------------------
--급여의 합
select sum(sal) as "급여의 합" from emp; --29025
--평균급여
select round(avg(sal),0) as "평균급여" from emp; --2073

--사장님이 회사 총 수당이 얼마나 지급되나 .... (수당의 평균)
select trunc(avg(comm),0) from emp;  --721 
select trunc(sum(comm) / 6,0) from emp; --721  ---- 회사의 규정이 (받는 사원수 나눈다 ...721)


select sum(comm) from emp; --4330
select trunc(sum(comm) / 14,0) from emp; --309

select  trunc(avg(nvl(comm,0)),0) from emp; --309

-- 회사의 규정이 (전체 사원수로 나눈다 .... 309)
-- 회사의 규정이 (받는 사원수 나눈다 ...721)
 
select count(*) from emp where comm is null;  --데이터 처리 null 검증 처리

desc emp;

select max(sal) from emp;

select min(sal) from emp;

--POINT 집계함수 결과는 1개 (1건 컬럼하나 row 하나)
select empno , count(empno) from emp;  --(x) empno 14건 , 집계 1건

select sum(sal) , avg(sal) , max(sal) , min(sal) , count(sal) , count(*) from emp;

--------------------------------------
--부서별 평균 급여를 구하세요
select deptno, avg(sal) 
from emp
group by deptno;

--직종별 평균 급여를 구하세요
select job, avg(sal)
from emp
group by job;

--직종별  평균급여 , 급여합 , 최대급여 , 최소급여 , 건수를 출력하세요

select  job , avg(sal) , sum(sal) , max(sal) , min(sal) , count(sal)
from emp
group by job;

/*
grouping 원리

distinct 컬럼명1 , 컬럼명2
order by 컬럼명1 , 컬럼명2
group by 컬럼명 1, 컬럼명2
*/

--부서별 , 직종별 급여의 합을 구하세요

select deptno , job , sum(sal) ,count(sal)
from emp
group by deptno , job
order by deptno;

/*
select           4    
from             1   
where           2    
group by       3   
order by        5    
*/

/*
직종별 평균급여가 3000 달러 이상인 사원의 직종과 평균급여를 출력하세요

group by 조건절
having 절
*/

select job , avg(sal) as "avgsal"
from emp
--where 순서상 group by 우선...
group by job
having avg(sal) >= 3000;


/*
from 의 조건절 where
group by 조건절 having
*/

/*
select             5
from               1
where             2
group by         3
having             4 
order by           6  
*/
/* 사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인 사원들의 목록을 출력하세요
--급여의 합이 낮은 순으로 출력하세요 */
select job, sum(sal) as "sumsal"
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by "sumsal" asc;

/* 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,인원수 , 급여의 합을 출력하세요 */
select deptno , count(*) as "부서별인원" , sum(sal) as "부서별 급여의 합"
from emp
group by deptno
having count(*) > 4;

/* 사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman) 은 제외하고 급여합으로 내림차순 정렬하세요 */
select job, sum(sal) as "sumsal"
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sumsal desc;

-----------------------------------------------------------------------------------------------
--[JOIN ] 다중 테이블로부터 데이터 검색
--오라클.pdf ( 85 Page)
--조인 실습 테이블 구성하기--
create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;

select * from m;
select * from s;
select * from x;



--종류
--1. 등가조인(equi join)  70%
--원테이블과 대응대는 테이블에 있는 컬럼의 데이터를 1:1 매핑
--SQL JOIN 문법
--ANSI 문법 (권장)  [inner] join  on ~ 조건절


--SQL JOIN
select *
from m , s
where m.m1 = s.s1; 

select m.m1 , m.m2 , s.s2
from m , s
where m.m1 = s.s1; 

--ANSI 문법 (권장)
--where (from 절의 조건절)
--where JOIN 조건절로 사용 (어떤것이 JOIN 조건이고  어떤것이 FROM 절의 조건절인지 혼동)
--ANSI JOIN 의 조건절은 ON 표기 
select *
from m inner join s
on m.m1 = s.s1 ;

select m.m1 , s.s1 , s.s2
from m join s  --inner 구문은 생략 가능
on m.m1 = s.s1;


select m.m2 , x.x1 , x.x2 
from m join x
on m.m1 = x.x1;

--사원번호 , 사원이름 , 사원부서번호 , 사원부서명을 알고 싶어요
select emp.empno , emp.ename, emp.deptno , dept.dname
from emp join dept
on emp.deptno = dept.deptno;

--JOIN 에서 테이블에 별칭 부여 ...
select e.empno , e.ename , d.deptno , d.dname
from emp e join dept d
on e.deptno = d.deptno;

--SQL JOIN 문법 (3개 테이블 조인)
select *
from m , s , x
where m.m1 = s.s1 and x.x1 = s.s1;
--A = B  , B = C >> A = C

--ANSI JOIN 문법 
select m.m1  , s.s2 , x.x2
from m join s  on m.m1 = s.s1
           join x on x.x1 = s.s1;

--[ HR 계정으로 이동 ]

select * from employees;
select * from departments;
select * from locations;

--1. 사번 , 이름(last_name) , 부서번호 , 부서이름을 출력하세요
select e.employee_id , e.last_name , d.department_id , d.DEPARTMENT_NAME
from employees e join departments d
      on e.department_id = d.department_id
order by  e.employee_id;   

--문제점 :
select count(*) from employees; -- 107명
--위 join 쿼리의 결과는 : 106명  (누군가는 누락 ....)
--등가조인으로 해결불가 .... outer  join 으로 해결

--2. 사번 , 이름(last_name) , 부서번호 , 부서명 , 지역코드 , 도시명 출력하세요

select   e.EMPLOYEE_ID , 
           e.LAST_NAME , 
           e.DEPARTMENT_ID , 
           d.DEPARTMENT_NAME,
           d.LOCATION_ID,
           l.CITY
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
                           join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID;

--------------------------------------------------------------------
--[bituser  전환]
--2. 비등가조인(non-euqi join) => 의미만 존재 => 문법 등가조인
--원테이블과 대응대는 테이블에 있는 컬럼이 1:1 매핑이 되지 않는 경우
--ex) emp  , salgrade  급여등급  (emp : sal  >>   salgrade losal , hisal 2개 비교

select * from emp;
select * from salgrade;

select e.empno , e.ename, e.sal , s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal; -- on 조건절

-----------------------------------------------------------------------
--3. outer join (equi join + null)
--outer join (주 종관계의 파악 ) >> 주가 되는 테이블의 데이터를 가져오는 방법 (euqi join 하고 남는 데이터)
--문법 )  left outer join (왼쪽 주)
--        right outer join (오른쫀 주)
--        full outer join(left , right join >> union)

select *  
from  m join s 
on m.m1 = s.s1;

select *  
from  m left join s 
on m.m1 = s.s1;

select *  
from  m right join s 
on m.m1 = s.s1;

--left  , right >> union
select *  
from  m full outer join s 
on m.m1 = s.s1;

--[ HR 계정으로 이동]
--1. 사번 , 이름(last_name) , 부서번호 , 부서이름을 출력하세요
select e.employee_id , e.last_name , d.department_id , d.DEPARTMENT_NAME
from employees e join departments d
      on e.department_id = d.department_id
order by  e.employee_id;   

select * from employees where department_id is null;
--Grant  >> department_id null 가지고 있다

--outer join 
select e.employee_id , e.last_name , d.department_id , d.DEPARTMENT_NAME
from employees e left outer  join departments d
      on e.department_id = d.department_id
order by  e.employee_id;   

---------------------------------------------------------------------------------
--self join(자기참조) -> 문법 > 등가조인

--하나의 테이블에서 특정컬럼이 다른 컬럼을 참조하는 경우

select * from emp;

--문제점 : 테이블이 하나 ...... >> 가명칭 >> 테이블 여러개 ...

select e.empno , e.ename , m.empno , m.ename
from emp e join emp m
on e.mgr = m.empno;

--13명 : king 사장님은 mgr >> null


--null >> outer join >> null 데이터 확인 ......
select e.empno , e.ename , m.empno , m.ename
from emp e  left join emp m
on e.mgr = m.empno;


-----------------------------------------------------------------
--12시 15분까지 ... (bituser)
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';
--WHERE Regexp_like(E.ENAME,'^A'); 
-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
SELECT E.ENAME, D.DNAME, E.SAL ,D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;
 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';
 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
SELECT E.EMPNO AS "사원번호",
               E.ENAME AS "사원이름",
               E.SAL*12 AS "연봉",
           --E.SAL*12+NVL(COMM,0) AS "실급여",
               E.SAL*12+COMM AS "실급여",
               S.GRADE AS "급여등급"
FROM EMP E inner join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;
 
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E   join DEPT D on E.DEPTNO=D.DEPTNO
                         join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;
 
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D              on E.DEPTNO=D.DEPTNO
                   join SALGRADE S       on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE  E.DEPTNO<=20 --WHERE E.DEPTNO IN (10,20)  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;

 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;

-------------------------------------------------------------------------------
--[ subquery ]  오라클.pdf (100 page)
--sql 의 꽃이다  >> sql 만능 해결사 
--함수 >>  조인 >> subquery

--사원테이블에서 사원들의 평균 월급보다 더 많은 급여를 받는 사원의 사번 , 이름 , 급여를 출력하세요

select avg(sal) from emp; --2073

select *
from emp where sal > 2073;


select *
from emp where sal > (select avg(sal) from emp); -- subquery ....

--
--subquery
--1. single row subquery : subquery 의 결과가 1개의 row(단일값) : 한개의 값  (단일컬럼)
--2. multi row subquery : subquery 의 결과가 1개 이사의 row : 여러개의 값   (단일컬럼)
--구분하는 이유는 : 사용되는 연산자의 차이
--multi row (IN , NOT IN) (ANY , ALL)
--ALL : sal > 1000 and sal > 2000 and ....
--ANY: sal > 1000 or sal > 2000 or ....

--정의(subquery)
--1. 괄호안에 있어여 한다  ( select avg(sal) from emp )
--2. 단일 컬럼으로 구성 >> (select sal , deptno from emp >>(X)) 단일컬럼이 아니다
--3. 단독으로 실행 가능해야 한다

--실행순서
--1. subquery 먼저 실행
--2. subquery 의 결과를 가지고 main query 실행

--사원테이블에서 jones의 급여보다 더 많은 급여를 받는 사원의  사번 , 이름 , 급여를 출력하세요
select sal from emp where ename='JONES'; --2975 

select empno , ename, sal 
from emp
where sal > (select sal from emp where ename='JONES');  --single row

--급여가 2000 이상인 ....
select sal from emp where sal > 2000; -- 결과 row 1개 이상 

select *
from emp; 
--where sal =  (select sal from emp where sal > 2000);  (x)

select *
from emp 
where sal  in  (select sal from emp where sal > 2000); -- multi row
--sal = 2001 or sal = 3000 or .....

select *
from emp 
where sal  not in  (select sal from emp where sal > 2000); 
--sal != 2001 and sal != 3000 and .....


--부하직원이 있는 사원의 사번과 이름을 출력하세요
--(내 사번이 mgr 컬럼에 있다....)
select mgr from emp;

select *
from emp where empno in (select mgr from emp);
-- empno=7902 or  empno=7698 or empno=7839 or empno is null 

--부하직원이 없는 사원의 사번과 이름을 출력하세요 (not in >> != and >> null 영향)
select *
from emp where empno not in (select nvl(mgr,0) from emp);
-- empno !=7902 and empno!=7698 and empno!=7839 and empno is not null 

--king 에게 보고하는 즉 직속상관이 king 인 사원의 사번 , 이름 , 직종 , 관리자 사번을 출력하세요
select empno from emp where ename='KING'; --7839

select empno , ename, job , mgr
from emp
where mgr = (select empno from emp where ename='KING');


--20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 사번 , 이름, 급여
--부서번호를 출력하세요
select max(sal) from emp where deptno=20; -- 3000

select * 
from emp
where sal > (select max(sal) from emp where deptno=20);

--
select *
from emp
where deptno in (select deptno from emp where job='SALESMAN')
and sal in (select sal from emp where job='SALESMAN');

--QUIZ) 실무에서 활용 .......
--자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름 , 부서번호 , 부서별 평균 월급을 출력하세요
--1 단계 : 부서번호와 부서의 평균월급을 담고 있는 테이블이 존재한다면 .... (물리적인 테이블은 없어요 ...)
--2단계 : from 절에 subquery 를 사용할 수 있다 ( 가상테이블) -> in line view 

select deptno , round(avg(sal),0) from emp group by deptno;

select e.empno , e.ename, e.deptno , e.sal , s.avgsal
from emp e join (select deptno , round(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal;

-------------------------------------------------------------------------------------------------
--subquery TEST ( 3시 45분까지 )

--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
               FROM EMP
               WHERE ENAME='SMITH');
 
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
                     FROM EMP
                     WHERE ENAME='BLAKE')
AND ENAME!='BLAKE';
 
--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                       FROM EMP
                       WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30


--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
                FROM EMP
                WHERE DEPTNO=30);
 
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
  FROM EMP
  WHERE DEPTNO=30)
 
--where sal > 1600 and sal > 1250 and sal > 2850 and sal > 1500 and sal > 950
 
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = 이 맞는데  IN
                      FROM DEPT
                      WHERE LOC='DALLAS');
 
--8. SALES 부서에서 일하는 사원들의  같은 부서번호, 이름, 직업을 갖는 사원정보를 출력하라.
SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM DEPT
                      WHERE DNAME='SALES')
 
SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM DEPT
                      WHERE DNAME='SALES')
 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
                FROM EMP)
AND DEPTNO IN(SELECT DEPTNO
                   FROM EMP
                   WHERE ENAME LIKE '%S%');
 
--select * from emp
--where  deptno in  (
--                      select deptno from emp where sal > (select avg(sal) from emp)
--                      and ename like '%S%'
--                   )
 
--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM EMP
                      WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
               FROM EMP
               WHERE COMM IS NOT NULL);
 
--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN(SELECT SAL
                        FROM EMP
                        WHERE DEPTNO=30)
AND COMM NOT IN(SELECT NVL(COMM, 0)
                         FROM EMP
                         WHERE DEPTNO=30 and comm is not null);
 
--SELECT NVL(COMM, 0)
--FROM EMP
--WHERE DEPTNO=30 and comm is not null;
 
--SELECT COMM
--FROM EMP
--WHERE DEPTNO=30 and comm is not null;

-----------------------------------------------------------------------------------------------
--요기 까지
/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

기본함수 , 집계함수
JOIN (다중 테이블 조회)
SUBQUERY 까지
초급 개발자 기본 .....과정

*/
--------------------------------------------------------------------------------
--[INSERT ] , [UPDATE] , [DELETE]

/*
오라클 기준
DDL(데이터 정의어) : create  , alter , drop , truncate (rename , modify)
DML(데이터 조작어): insert , update , delete
DQL(데이터 질의어): select 
DCL(데이터 제어어): 권한 (grant , revoke)
TCL(트랜잭션) : commit , rollback , savepoint
*/

--DML (트랜잭션 : 하나의 논리적인 작업 단위)
--A은행에서 출금  B라는 은행 입금 (하나의 논리적인 단위)

--A라는 계좌 (100) 출금 : update ....
-- ,,,
--B라는 계좌(100) 입금 ㅣ update ...

--둘다ㅑ 성공 : commit
--둘중에 하나라도 실패 : rollback

--테이블 정보 보기 (TIP)----------------------------------
desc emp;

select * from tab; --사용자가 만든( 계정) 테이블 목록 출력

select * from tab where tname='BOARD'; -- 데이터가 있다는 것은 이미 존재

select * from col;

select * from col where tname='EMP';

select * from user_tables; --시스템 관리자

select * from user_tables where table_name='DEPT';

----------------------------------------------------------------------
--DML (오라클.pdf  168 page)
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])]
VALUES (value1[, value2, . . . . . . ]);
*/

create table temp(
   id number primary key , -- id 컬럼에는 null(x) , 중복데이터(x) , 유일한 데이터 1건 보장 , where id = 10
   name varchar2(20) -- default null  허용
);

--1. 가장 일반적인 INSERT
insert into temp(id , name)
values(100,'홍길동');

select * from temp;
--실반영 
commit;

--2 컬럼 목록 생략 (.....)   컬럼 리스트 생략
insert into temp values(200,'김유신');
commit;

select * from temp;

--1. 문제 (id 컬럼에 PK 제약 정보)
insert into temp(id, name)
values(100,'아무개');  --unique constraint (BITUSER.SYS_C007003) violated

insert into temp(name)  --cannot insert NULL into ("BITUSER"."TEMP"."ID")
values('아무개');

-----------------------------------------------
--일반 SQL 은 프로그램적인 요소 (x)
--PL-SQL (변수 , 제어문)

--pl-sql
create table temp2( id varchar2(20));

--pl-sql 사용
/*
BEGIN
    FOR i IN 1..1000 LOOP
      insert into temp2(id) values('A' || to_char(i));
    END LOOP;
END;
*/
select * from temp2;
select * from temp2 order by id desc;

----------------------------------------------------------------
create table temp3(
  memberid number(3) not null,
  name varchar2(10) , --null 허용
  regdate date default sysdate  --기본값 설정하기 (regdate 값을 insert 하지 않으면 자동으로 시스템 날짜)
);

select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid , name , regdate)
values(100, '홍길동','2019-03-21');

select * from temp3;
commit;

insert into temp3(memberid, name)
values(200 ,'아무개');  --regdate date default sysdate 

select * from temp3;
commit;

insert into temp3(memberid)
values(300);

select * from temp3;  --name null 기본적으로
commit;

insert into temp3(name)  --cannot insert NULL into ("BITUSER"."TEMP3"."MEMBERID")
values('아무개'); --(x)

-----------------------------------------------------------------------------------
--insert (TIP)
--1. 대량 데이터 insert 하기
create table temp4(id number);
create table temp5(num number);

insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);
commit;

select * from temp4;

--요구사항 : temp4에 있는  모든 데이터를 temp5에 넣고 싶어요
--insert into 테이블명(컬럼리스트)  values(값리스트)
--insert into 테이블명(컬럼리스트)  select 구문 ...  (단 컬럼의 개수와 타입이 동일)

insert into temp5(num)
select id from temp4;  --values 구문 대신에 select 문

select * from temp5;
commit;

--2. insert 
--테이블이 없는 상황에서 [테이블을 생성] + [대량 데이터 삽입]
--단 복사개념(제약 정보는 복사 안되요 (PK , FK)
--순수한 구조정보(컬럼이름 , 타입) 복사

--create table 테이블명 (컬럼명 타입정보)

create table copyemp  --구조(스키마) + 데이터 insert
as
   select * from emp;
   
select * from copyemp;   


create table copyemp2
as
    select empno , ename , sal 
    from emp
    where deptno=30;
    
select * from copyemp2;    

--질문) 구조(틀)만 복사하고 데이터는 복사하고 싶지 않아요
create table copyemp3
as
   select * from emp where 1=2;
   
select * from copyemp3;
desc copyemp3;

--TIP)
--오라클 시스템 테이블 (다양한 정보)
--제약 정보 (PK , FK.....)
select * from user_constraints;

select * from user_constraints where table_name= 'EMP';
select * from user_constraints where table_name= 'COPYEMP';

create table pktest (id number primary key); -- not null 하고 unique 

select * from user_constraints where table_name= 'PKTEST';
insert into pktest(id) values(100);
commit;

--제약정보는 복사되지 않아요 검증
create table pktest2
as
    select * from pktest;

select* from pktest2;
--PK 제약정보는 복사 되지 않았다 (검증)
select * from user_constraints where table_name= 'PKTEST2';

----------------------------------[INSERT END]----------------------------------
--[UPDATE]
/*
update table_name
set column1 = value1 , column2= value2 ....
where  조건

update table_name
set column1 = (subquery) 
where  조건

*/
select * from copyemp;

update copyemp
set sal = 0;

select * from copyemp;
rollback;

update copyemp
set sal =0
where deptno=20;

select * from copyemp where deptno=20;
commit;


--update ( set 구문에 subquery 사용)
update copyemp
set sal = (select sum(sal) from emp);

select  * from copyemp;
rollback;

--여러개 컬럼 update
update copyemp
set ename='AAA' , job = 'BBB' , hiredate=sysdate , sal = (select sum(sal) from emp)
where deptno=10;

select * from copyemp where deptno=10;
commit;

------------------------------------[UPDATE END]----------------------------------
--[DELETE]
--원칙 : delete -> commit -> 복원불가 -> 백업 데이터가 있다면 복원가능.....

delete from copyemp;

select * from copyemp;

rollback;

select * from copyemp;

delete from copyemp where deptno in (10,20);

select * from copyemp;
rollback;

------------------------------[DELETE END]----------------------------------------
/*
  APP(JAVA)   -> JDBC API  -> DB작업(Oracle)
  
  CRUD
  
  create : insert
  read : select (전체 , 조건조회(1건)
  update : update
  delete : delete 
  
  (DML : create , update ,delete) 트랜잭션 : commit , rollbakc 강제)
  
  JDBC -> Oracle
  --전체조회(함수) , 조건조회(함수) , 삭제(함수) , 수정(함수)  , 삽입(함수) =>> 개발자
  
  --public List<Emp> getEmpAllList() {  select * from emp .... }
  --public Emp getEmpListByEmpno(int empno) {select * from emp where empno=7788}
  --public int insertEmp(Emp emp) { insert into emp(.....) values(....)}

*/
----------------------------------------------------------------------------------------
-- [ DDL ] 
-- create , alter , drop (테이블 기준)

select * from user_tables where lower(table_name)='board';

drop table board; 

create table board(
  boardid number,
  title varchar2(50),
  content varchar2(4000),
  regdate date
);

--------------------------------------------------------------
--개발자 편하게 살기 .....
select * from user_tables where lower(table_name)='board';
select * from user_constraints where lower(table_name) = 'board';
--------------------------------------------------------------

--Oracle 11g 가상컬럼(조합컬럼)
--학생성적 테이블 :  국어 , 영어 , 수학 , 총점 컬럼
--국어 , 영어 , 수학 데이터만 insert 하면 자동으로 총점이 구해졌으면 ......

create table vtable(
   no1 number,
   no2 number,
   no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);

insert into vtable (no1, no2)  values(100,50);
select * from vtable;
insert into vtable (no1, no2)  values(80,60);

select * from vtable;

--insert into vtable (no1, no2,no3)  values(80,60,10); --INSERT operation disallowed on virtual columns

--컬럼의 정보 보기 (default value 값 확인하기)
select COLUMN_NAME , DATA_TYPE , DATA_DEFAULT 
from user_tab_columns where table_name='VTABLE';

--실무에서  활용하는 코드
--제품정보 (입고일) 분기별 데이터 (4분기)
--입고일 : 2019-03-01 >> 1분기

create table vtable2
(
  no number , --순번
  p_code char(4), --제품코드 (A001 , B002)
  p_date char(8), --입고일(20190303)
  p_qty number, --수량
  p_bungi number(1) GENERATED ALWAYS as (
                                                                  CASE WHEN substr(p_date,5,2) IN ('01','02','03') THEN 1
                                                                           WHEN substr(p_date,5,2) IN ('04','05','06') THEN 2
                                                                           WHEN substr(p_date,5,2) IN ('07','08','09') THEN 3
                                                                           ELSE 4
                                                                  END        
                                                             ) VIRTUAL
  );

select COLUMN_NAME , DATA_TYPE , DATA_DEFAULT 
from user_tab_columns where table_name='VTABLE2';

insert into vtable2(p_date) values('20180101');
insert into vtable2(p_date) values('20180126');
insert into vtable2(p_date) values('20190301');
insert into vtable2(p_date) values('20191225');
insert into vtable2(p_date) values('20190525');
select * from vtable2;
select * from vtable2 where p_bungi=1;

commit;

------------------------------------------------------------------------------------------
--DDL 테이블 다루기 (오라클.pdf 138 page)

--1 . 테이블 생성하기
create table temp6(id number);

--2. 테이블 생성했는데 컬럼 추가하기
--기존테이블에 컬럼 추가하기
desc temp6;

alter table temp6
add ename varchar2(20);

desc temp6;

--3. 기존 테이블에 있는 컬럼의 이름을 잘못 표기 (ename -> username)
--기존 테이블에 있는 기존 컬럼의 이름 바꾸기 (rename)
alter table temp6
rename column ename to username;

desc temp6;

--4.기존 테이블에 있는 기존 컬럼의 타입 정보 수정하기
--(modify)
alter table temp6
modify(username varchar2(2000));

desc temp6;


--5. 기존 테이블에 있는 기존 컬럼 삭제
alter table temp6
drop column username;

desc temp6;


--6. 테이블 삭제 
--6.1 데이터만 삭제 : delete 
--테이블 처음 만들면 처음 크기 >> 데이터를 넣으면 >> 데이터 크기 중가
--ex) 처음 1 M >> 10 만건 >> 100 M  >> delete 10만건 삭제 >> 여전이 테이블의 크기는 100M

--테이블 데이터 삭제 [공간의 크기를 줄일 수 있을끼]
--truncate (where 절을 사용 못해요)
--ex) 처음 1 M >> 10 만건 >> 100 M  >> truncate 10만건 삭제 >> 여전이 테이블의 크기는 1M


--7. 테이블 삭제 (drop)

drop table temp6;

-----------------------------------------------------------------------------------------
--테이블 제약 설정하기
--오라클.pdf( 144 Page)
--데이터 [ 무결성 ] 확보
--제약 (constraint) : insert , update  주로 적용
/*
*NOT NULL(NN)  : 열은 NULL 값을 포함할 수 없습니다. 

*UNIQUE key(UK) 테이블의 모든 행을 [유일하게 하는 값]을 가진 열(NULL 을 허용) 
--unique 제약은 null 값을 가질 수 있다 >> null 값을 못가지게 할려면 ( not null 포함)

*PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족) 
  not null 하고 unique 한 제약  ( 내부적으로  index 가 자동 설정)
  
*FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다. 
(참조제약)  [테이블]과 [테이블]간의 관계 설정  


*CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정) 
설정한 범위 내의 값만 입력받겠다  (gender : 컬럼에  '남' 또는 '여' 하는 데이터 만)
ex) where gender in ('남','여')

제약을 만드는 시점
1. 테이블 만들면서 바로 생성   (create table ....)
2. 테이블 생성 이후  ( alter table ...  add constraint....)  >> 자동 생성 툴 (exerd )

*/
--1.
select * from user_constraints where table_name='EMP';  
--오라클 not null 제약으로 본다
--"EMPNO" IS NOT NULL
-------------------------------------------------------------------------------
create table temp7
(
 --id number primary key --권장하지 않아요 ( 줄임표현) --SYS_C007009 제약이름 (나중에 제약 수정 , 삭제)
   id number constraint pk_temp7_id primary key, --관용적 표현 : PK_테이블명_컬럼명
   name varchar2(20) not null,
   addr varchar2(50)
);

drop table temp7;

select * from user_constraints where table_name='TEMP7';  

insert into temp7(name , addr) values('홍길동' , '서울시 강남구'); -- (x) cannot insert NULL into ("BITUSER"."TEMP7"."ID")

insert into temp7(id, name , addr) values(10 , '홍길동' , '서울시 강남구');

insert into temp7(id, name , addr) values(10 , '김유신' , '서울시 강북구'); --unique constraint (BITUSER.PK_TEMP7_ID) violated\

commit;

--1. primary key 는 테이블에 몊몇개까지 걸수 있을 까요 ?  1개 .....
--여러개의 컬럼을 묶어서 1개 가능  (ename, age) => 복합키 ..

create table temp8(
 id number constraint pk_temp8_id primary key,
 name varchar2(20) not null,
 jumin char(6) constraint uk_temp8_jumin unique ,   -- 중복값 (x) >> null 도 허용 >>   not null constraint uk_temp8_jumin ....
 addr varchar2(20)
 
);

select * from user_constraints where table_name='TEMP8';  

insert into temp8(id, name, jumin , addr)
values(10,'홍길동','123456','경기도');
commit;

insert into temp8(id, name, jumin , addr)
values(20,'김우신','123456','경기도');   --"unique constraint (%s.%s) violated"   (x)


--null 값 허용할까
insert into temp8(id, name, addr)
values(20,'김우신','경기도');  --null 데이터 허용  (중복체크 될까 ????)

select * from temp8;

insert into temp8(id, name, addr)
values(30,'아무개','강원도');  -- null 중복체크 안되네요 ㅠㅠ  (not null  unique 두개의 제약을 같이 사용)

---------------------------------------------------------------------------------------------
--테이블 생성 후에 제약 걸기

create table temp9 (id number);

--기존 테이블에 제약 추가하기
--주의 ) 기존 데이터가 제약을 위반한다면 제약은 추가되지 않아요  >> 중복된 데이터 >> 데이터 삭제 >> 제약
--제약 걸기전에 데이터 검사 작업 수행

alter table temp9
add constraint pk_temp9_id primary key(id);
--add constraint pk_temp9_id_name primary key(id , name);
--2개 컬럼의 값을 합쳐서 중복값이 아니면 되요 


select * from user_constraints where table_name='TEMP9';  

alter table temp9
add ename varchar2(20);

desc temp9;

--not null 제약 추가하기
alter table temp9
modify (ename not null);

desc temp9;
select * from user_constraints where table_name='TEMP9';  

--------------------------------------------------------------
-- [check ]제약
-- where 조건과 동일한 형태의 제약 >> where gender in ('남','여');
create table temp10(
  id number constraint pk_temp10_id primary key,
  name varchar2(20) not null,
  jumin char(6) constraint uk_temp10_jumin unique,
  addr varchar2(20),
  age number constraint ck_temp10_age check(age >= 19) -- where age >= 19
);

select * from user_constraints where table_name='TEMP10';  

insert into temp10(id, name , jumin , addr , age)
values(100,'홍길동','123456','서울시',25);

select * from temp10;

insert into temp10(id, name , jumin , addr , age)
values(200,'김유신','123456','부산시',18); --check constraint (BITUSER.CK_TEMP10_AGE) violated

commit;

---------------------------------------------------------------------------------------
--참조제약 : 테이블과 테이블과의 제약 >>
--EMP (deptno) 컬럼은 DEPT (deptno) 컬럼을 참조한다

create table c_emp
as
    select empno , ename, deptno from emp where 1=2;

create table c_dept
as
   select deptno , dname from dept where 1=2;
   
select * from c_emp;
select * from c_dept;

--1. 참조제약 ( c_emp 테이블에 있는 deptno 컬럼에 ..... deptno 컬럼 insert  되는 데이터는  c_dept 테이블 deptno 가지는
--데이터중에 하나가 insert , update 강제

alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) references c_dept(deptno);
--위 코드 실행 ERROR 발생
--c_dept >> deptno 에서 데이터를 빌려 쓸거야 ... (저 신용있어여 빌려가 주세요 ....)
--deptno 가지는 데이터는 중복데이터 없고 null 값 없어요 Primary key 

--c_dept >> deptno >> primary key 선행

--1)
alter table c_dept
add constraint pk_dept_deptno primary key(deptno);

--2)
alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) references c_dept(deptno);

insert into c_dept(deptno , dname) values(100,'인사팀');
insert into c_dept(deptno , dname) values(200,'관리팀');
insert into c_dept(deptno , dname) values(300,'회계팀');
commit;


select * from c_dept;

--신입사원 입사
insert into c_emp(empno, ename)
values(100,'홍길동'); -- FK 는 not null 하지 않아요 (null 허용)
--신입사원은 부서를 갖지 않을 수 있다 

--규칙 : 신입사원은 무조건 부서를 가져야 한다   ( deptno not null  constaint ... FK...
------------------------------
insert into c_emp(empno , ename, deptno)
values(200, '아무개',500);
--integrity constraint (BITUSER.FK_EMP_DEPTNO) violated - parent key not found

insert into c_emp(empno , ename, deptno)
values(200, '아무개',300);


------------------------------
--테이블 (부모  , 자식 테이블)
--테이블 (master , detail)

--두개 테이블 deptno 관계에서 ..... (부모: c_dept(PK) , master)
--                                       (자식 : c_emp(FK) , detail)
--c_emp 테이블
--c_dept 테이블

--주의점
select * from c_emp;
select * from c_dept;

--이때 : c_dept 테이블에서 300 데이터 삭제 불가능 (빌려쓰고 있는 데이터)\
delete from c_dept where deptno=300; --integrity constraint (BITUSER.FK_EMP_DEPTNO) violated - child record found
delete from c_dept where deptno=100; -- 빌려쓰지이 않는 데이터는 삭제 가능

commit;

------------------------------------------------------------------------------------
--오라클.pdf 
/*
(column datatype [CONSTRAINT constraint_name]       
REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE]) 

column datatype, . . . . . . . , 
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])        
REFERENCES table_name  (column1[,column2,..] [ON DELETE CASCADE]) 
*/
-- [ON DELETE CASCADE]  부모테이블과 생명을 같이 하겠다
-- 300 삭제 할 있나요?  네 
-- delete from c_dept where detpno=300;
-- 참조하는 자식 데이터 같이 삭제
-- delete from c_emp where deptno=300; 같이 실행

alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) references c_dept(deptno) ON DELETE CASCADE;

--------------------------------------------------------------------------------------------------
/*
--학생 성적 테이블
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드

--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다

--학과코드 , 학과명

--그리고 select 결과는
--학번 , 이름  총점, 평균 , 학과코드 , 학과명 을 출력하세요


*/


