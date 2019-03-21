/*
[1일차 수업]

1. 오라클 소프트웨어 다운로드
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html 

2. Oracle Database 11g Release 2 Express Edition for Windows 64

3. Oracle 설치 (SYS, SYSTEM 계정 암호 설정) : 1004

4. Sqlplus 프로그램 제공(CMD) : GUI 환경이 아니라 사용하기 분편..

5. 별도의 툴을 설치해서 사용
무료: sqlDeveloper, 유료: 토드, 오렌지, SqlDate

6. SqlDeveloper 툴을 통해서 Oracle Server 접속..
  >> HR계정: 암호1004, Unlook 2가지 해제 .. (사원관리 실습테이블 출력)
  >> 새로운 계정 생성: bituser
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

7. 현재 접속 계정 확인: show uaer;

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

select * from emp;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );


INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;

select * from DEPT;


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

select * from SALGRADE;
*/

select * from emp;
select * from DEPT;
select * from SALGRADE;

--1. 사원테이블에서 모든 데이터를 출력하세요.
select * from emp;
SELECT * FROM dept;
select * from SALGRADE;

--2. 특정 컬럼 데이터 출력하기
SELECT EMPNO, ENAME, JOB,MGR, HIREDATE, sal, COMM, DEPTNO FROM EMP;

--3. 컬럼에 가명칭 부여하기 정식 표기 as
select empno 사번, ENAME "이   름", job as "직업" from emp;

--4. Oracle 데이터 문자열(문자열은 대소문자 구분) 
--문자열 표기 ''
select empno, ename from emp where ename='king';
select empno, ename from emp where ename='KING';

--Oracle SQL: 연산자(결합연산자 != 산술연산자 :구분)
--JAVA: + (산술연산(숫자+숫자), 결합연산(문자열+문자열)
--ORACLE: 결합연산자|| , 산술연산자+
select '사원의 이름은' || ename || '입니다' as "사원정보" from emp;


--테이블 컬럼은 기본타입
--컬럼의 타입 숫자, 문자, 날짜 ...
desc emp; --테이블의 타입 기본정보
select empno  || ename from emp; --number + varchar 내부적형변환
select empno+ename from emp; --The specified number was invalid (산술연산은 불가)

--사장님: 우리회사에 직종이 몇개 있나
--distinct 중복 데이터 제거
select DISTINCT job from emp;
--재미삼아서(group에 group을 잡아서 데이터 출력)
--재미삼아서(group에 group을 잡아서 데이터 출력)
SELECT job, deptno from emp order by job;
SELECT DISTINCT job, deptno from emp order by job;
SELECT job, deptno from emp order by deptno;
SELECT DISTINCT deptno, job from emp order by deptno;

-----------------------
--Oracle (sql언어)
--java 언어(연산자)
--java 거의 동일(+,-,*,/) : %나머지 >> %검색패턴 >> 오라클: 나머지를 구하는 연산자가 없다. >>함수를 만들어 사용한다. .Mod():나머지를 구하는 함수

--산술연산(*+,-,*,/) : Mod() 

--사원테이블에서 사원의 급여를 100$인상한 결과를 출력해보세요.
desc emp;
select empno, ename, sal, sal+100 as "100$인상결과" from emp;

select 100+100 from dual; --dual 가상테이블
select 100||100 from dual; --묵시적형변환(문자열)
select mod(100,100) from dual;
select '100'+100 from dual; --*오라클은 결합과 산술이 분리되어 있다.
select 'a'||('100'+100) from dual;

--비교연산자
-- >,<,<=
-- java 같다 ==, 할당=
-- oracle 같다=, 같지않다!=

--논리연산자
--AND, OR, NOT

--조건절(원하는 row 가지고 오겠다)
select * from emp where sal>=3000;
select empno, ename, sal from emp where sal>=3000;

--이상, 이하 (=)포함 
--초과, 미만 (=)미포함

--사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력하세요.
select empno, ename, job, HIREDATE  --3
from emp --1
where empno=7788; --2

--사원의 이름이 king 인 사람의 사번, 이름, 급여를 출력하세요
select empno, ename, sal from emp where ename='KING'; --문자열데이터는 '' 싱글쿼테이션

--급여가 2000달러이상이거나 직종이 매니저인 사람의 모든정보를 출력하세요 (두개의 조건을 모두 만족한다)
select * from emp;
select * from emp where sal >= 2000 or job='MANAGER';

--급여가 2000달러이상이고 직종이 매니저인 사람의 모든정보를 출력하세요 (두개의 조건을 모두 만족한다)
select * from emp;
select * from emp where sal >= 2000 and job='MANAGER';

----------
--오라클날짜(DB서버의 날짜)
--오라클의 날짜정보 sysdate
select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select hiredate from emp;

--게시판 글쓰기
--insert into board(writer, title, content, regdate) values('홍길동','방가방가', '배고파요",sysdate);


--오라클시스템테이블
select * from SYS.NLS_SESSION_PARAMETERS; --시스템환경 테이블 조회 확인  --오라클이 가지고 있는 포멧
--NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
--NLS_DATE_LANGUAGE	KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF

--오라클 날짜 조회: '2019-12-12'
select * from emp where hiredate='1980-12-17'; --날짜 찾을때도 '' 을 사용한다.
select * from emp where hiredate='1980/12/17'; -- (-, /) 둘다 인정해줌

select * from emp where hiredate='80-12-17'; --형식을 바꿔놔서 조회안됨

--사원의 급여가 2000$ 이상이고, 4000$이하인 모든 사원의 정보를 출력하세요
select * from emp where sal >=2000 and sal <=4000; 
select * from emp where sal between 2000 and 4000; --between and 이상, 이하 == (본인자신을 포함한다)

--부선번호가 10 또는 20 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력하세여
select empno, ename, sal, deptno from emp where deptno=10 or deptno=20 or deptno=30;
--in 연산자(조건 or 조건 or 조건..)
select empno, ename, sal, deptno from emp where deptno in(10,20,30);
--부선번호가 10 또는 20이 아닌  사원의 사번, 이름, 급여, 부서번호를 출력하세여
select empno, ename, sal, deptno from emp where deptno!= 10 and deptno !=20;
--not in 연산자(부정값 and 부정값 ..)
select empno, ename, sal, deptno from emp where deptno not in(10,20);

--**null
--Oracle에서 값이 없다는 표현은 null이라고 한다.
--null (필요악)

create table member(
  userid varchar2(20) not null, --필수
  name varchar2(20) not null, --필수
  hobby varchar2(50)  --default null (아무것도 쓰지않으면 null값을 허용하겠다)
);

desc member;
insert into member (userid, hobby) values ('rhak','달리기'); --cannot insert NULL into
insert into member (userid, name, hobby) values ('rhak','우세림','달리기');
insert into member (userid, name) values ('asdasd','모모코코');
select * from member;

--실제반영
commit;

--수당(COMM)을 받지않는 모든 사원의 정보를 출력하세요.
--0도 데이터취급해주세요
select * from emp where comm is null;
--null의 비교는 is null, is not null)
select * from emp where comm is not null;
select * from emp where comm is not null and comm !=0;

--사원테이블에서 사번, 이름, 급여, 수당, 총급여를 출력하세요
--총급여 (급여+수당)
select empno, ename, sal, comm, sal+comm from emp;
--**point 
--null
--1. null과 모든 연산은 null이다.
--2. 문제해결 : 함수nvl(), nvl2()        --같은 기능) ms-sql: convert(), my-sql: ifnull() 
select empno, ename, sal, comm, sal+nvl(comm, 0) from emp;

select 1000 + null from dual;
select 1000 + nvl(null,0) from dual;
select comm, nvl(comm,111) from emp; --치환값이 들어가는 것

--사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름, 직종, 급여, 수당을 출력하세요
select empno, ename, sal, comm from emp where sal >=1000 and comm is null;
select * from emp;


----------------------
--DQL(data query language) : select
--DDL(데이터정의어) : create, alter, drop .. (객체생성, 수정, 삭제)

--create Board (boardno number ...
--JAVA : class Board {private boardno int}

create table Board (
  boardid number not null, --숫자, 필수입력
  title varchar2(20) not null, --한글10자, 필수입력
  content varchar2(2000) not null, --필수입력
  hp varchar2(20) --default null 필수입력사항 아니다
);

desc board;

--DML(데이터 조작어) 반영여부에서 결정(실반형(commi), 취소(rollback)) 반드시 수행
--insert, update, delete 작업

insert into board(boardid, title, content) values (100,'타이틀', '내용');
select * from board;
--의사결정 : 실제반영(commit), 실제반영 안한다(rollback)
rollback;
commit;

insert into board(boardid, title, content) values (200,'자바','그립다');
insert into board(boardid, title, content) values (300,'자바','그립다');
commit; --둘다 반영, 둘다 취소

select boardid, nvl(hp,'EMPTY') as "hp" from board;
--nvl 함수는 숫자, 날짜, 문자열 모두 적용 가능하다.

--------------
--문자열 검색
--주소검색: 검색어 : '역삼' -> 역삼이라는 단어가 있는 모든 문장 like검색
--문자열 패턴 검색 (Like 연산자)

--like 연산자 (와일드 카드 문자 (%: 모든 것, _:한 문자))
select * from emp where ename like '%A%'; --ename컬럼의 데이터에 A가 들어있는 모든 이름 검색
select * from emp where ename like '%a%'; --대소문자 구분

select ename from emp where ename like 'A%'; --이름의 첫글자가 A로 시작
select * from emp where ename like '%S';
select * from emp where ename like '%LL%';
select * from emp where ename like '%A%A%';

select ename from emp where ename like '_A%'; --첫글자 어떤것이 와도 상관없고 두번쨰 글자는 A

--오라클 과제: reqexp_like 상세검색 가능'
select * from emp where REGEXP_LIKE(ename,'[A-C]');
--java > oracle > jacascript
--과제: 정규표현예저 5개씪 만들기


----------
--데이터정렬하기
--order by 컬럼명: 문자, 숫자, 날짜 정렬가능
--오름차순(1,2,3) asc default , 내림차순 (4,3,2) desc
select * from emp order by sal;
select * from emp order by sal asc;
select * from emp order by sal desc;

select ename from emp order by ename asc; --a-z
--입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일 출력
select empno, ename, sal, HIREDATE from emp order by HIREDATE desc;

/*
select --3
from --1
where --2
order by --4 (select 결과를 정렬)
*/

select empno, ename, sal, job, hiredate 
from emp 
where job='MANAGER' 
order by hiredate desc;

--order by 컬럼명 desc, 컬럼명 asc, 컬럼명 desc --어센딩, 디센딩
select job, deptno
from emp
order by job asc, deptno desc;


-----------
--합집합(union): 테이블과 테이블의 데이터를 합치는 것 (중복값은 배제)
--합집합(union all): 중복값 허용

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

--union 중복제거
select * from ut
union
select * from uta;


--union all 전체 다보임
select * from ut
union all
select * from uta;

--union 규칙
--1. 대용대는 컬럼의 타입이 동일
select empno, ename from emp
union
select deptno, dname from dept; --대응되는 칼럼의 타입이 틀려서 오류. --앞에있는 쿼리가 기준, --문자방에 문자들어가고, 숫자방에 숫자들어가게

--실무 > subquery (in line view)
select empno, ename from (
  select empno, ename from emp
  union
  select deptno, dname from dept
) order by empno desc;

--2. 대응되는 컬럼의 갯수가 동일 (null이 착한 일을 한다)
select empno, ename, job, sal from emp
union
select deptno, dname, loc, null from dept;



--오라클 함수
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET : AL32UTF8 한글 3byte 인식
--K016KSC5601
select * from nls_database_parameters where parameter like '%CHAR%';


------------------------------
---------------------------
---------단일 테이블--------
---------------------------
---------------------------
--[2일차]
/*
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5) 일반적인 함수 : NVL, DECODE
*/

--문자열 함수
--initcap() : 단어의 첫글자를 대문자로 만들어 준다
select initcap('the super man') from dual; 
--lower() : 대문자를 소문자로 바꿈
--upper() : 소문자를 대문자로 바꿈
select lower('AAA'), upper('aaa') from dual;
select ename, lower(ename) as "ename" from emp;
select * from emp where lower(ename)='king'; --where절에서도 사용한다.

--문자열개수관련
--length() : 단어길이가 몇인가요(문자열의 갯수)
select length('abcd') from dual; 
select length('홍길동') from dual;
select length(':A12a 가가 각 ') from dual;

--결합연산자 || 
--concat() : 문자를 연결한다 (2개만)
select 'a' || 'b' || 'c' as "data" from dual;
select concat('a','b') from dual;
select concat(ename,job) from emp; --띄어쓰기를 못한다

--부분문자열 추출
--java(substring)
--oracle(substr) (문자열데이터, 1시작:시작인덱스, 글자수)
select substr('abcde',2,3) from dual;
select substr('abcde',1,1) from dual;
select substr('abcde',3,1) from dual;
select substr('abcde',3) from dual; --뒤에까지 다
select substr('abcde',-2,1) from dual; -- -붙이면 뒤부터 순서 매김
select substr('abcde',-1) from dual;
select substr('abcde',-5,2) from dual;

--사원테이블에서 ename컬럼 데이터에 대해 첫글자는 소문자로 나머지 문자는 대문자호 출력하되
--하나의 컬럼으로 출력하세요
--컬럼의 가명칭은 fullname
--첫글자와 나머지 문자사이에 공백 하나를 넣으세요
select INITCAP(ename) from emp;
select lower(substr(ename,1,1))|| ' ' || upper(substr(ename,2)) as "fullname" from emp;

--lpad, rpad (채우기)
select lpad('ABC',10,'*') from dual; --앞에 채우기
select rpad('ABC',10,'%') from dual; --뒤에 채우기

--Quiz
--사용자비번 : hong1006
--화면: ho****** 출력

select substr('hong1006',1,2)|| lpad('hong1006',length('hong1006')-2,'*') from dual;
select rpad(substr('hong1006',1,2), length('hong1006'),'*') from dual;
select rpad(substr('1004',1,2), length('1004'),'*') from dual;

--emp 테이블에서 ename컬럼의 데이터를 출력하는데 첫글자만 출력하고 나머지는 *로 표시하세요.
select rpad(substr(ename,1,1), length(ename),'*') from emp;

create table member2(
  id number,
  jumin varchar2(14)
);

insert into member2(id, jumin) values (100, '123456-1234567');
insert into member2(id, jumin) values (200, '123456-1234567');
commit;

select * from member2;

--Quiz
--출력결과
--하나의 컬럼으로 출력
--100 : 123456-*******
--200 : 123456-*******
--컬럼의 가명칭 "juminnumber"
select id || ' : ' || rpad(substr(jumin,1,7),length(JUMIN),'*') as "jumin" from member2;

--rtrim 함수 : 오른쪽 문자를 지워라
select rtrim('MILLER', 'ER') from dual; --MILL
select ltrim('MILLLLLLLLLLLLLER', 'MIL') from dual; --ER
select '>' || rtrim('MILLER    ','') || '<' from dual; --공백제거

--치환함수
select ename, replace(ename, 'A', '와우') from emp;


--숫자함수
--round (반올림함수)
--trunc (절삭함수)
--나머지 구하는 함수 (mod())

-- -3 -2 -1 0 1 2 3
--round
select round(12.345,0) as "r" from dual; --12
select round(12.567,0) as "r" from dual; --정수부분 반올림 13
select round(12.345,1) as "r" from dual; -- 12.3
select round(12.567,1) as "r" from dual; -- 12.6
select round(12.345,-1) as "r" from dual; --10
select round(15.345,-1) as "r" from dual; --20
select round(15.345,-2) as "r" from dual; --0

--trunc (절삭함수)
select trunc(12.345,0) as "t" from dual; --12
select trunc(12.567,0) as "t" from dual; --12
select trunc(12.345,1) as "t" from dual; -- 12.3
select trunc(12.567,1) as "t" from dual; -- 12.5
select trunc(12.345,-1) as "t" from dual; --10
select trunc(15.345,-1) as "t" from dual; --10
select trunc(15.345,-2) as "t" from dual; --0

--나머지
select 12/10 from dual; --몫하고 나머지 같이 나옴
select mod(12,10) from dual;
select mod(0,0) from dual; --0

--날짜 함수

select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--날짜 연수(POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date >> Number

select * from SYS.NLS_SESSION_PARAMETERS;
--NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS

select hiredate from emp;
select MONTHS_BETWEEN('2018-02-27','2010-02-27') from dual; --개월의 차
select round(MONTHS_BETWEEN(sysdate, '2010-01-01'),1) from dual; --110.6
select trunc(MONTHS_BETWEEN(sysdate, '2010-01-01'),1) from dual; --110.6

--to_date() : 문자를 날짜로 바꿔준다.
select to_date('2019-03-20')+100 from dual;
select to_date('2019-03-20')+1000 from dual;
select sysdate +1000 from dual;

--Quiz
select * from emp;
--1.사원테이블에서 사원들이 입사일에서 현재일 까지의 근속월수를 구하세요. 
--단 일수는 정수만 출력하세요
select trunc(MONTHS_BETWEEN(sysdate, hiredate),0) as "현재 근속 월수" from emp;
select ename, hiredate, trunc(months_between(sysdate,hiredate),0) as "현재 근속 월수" from emp;

--2.한달이 31일이라는 기준에서 근속월수를 구하세요.
select hiredate-31 as "현재 근속 월수" from emp;
select ename, hiredate, trunc((sysdate-hiredate)/31,0) as "현재 근속 월수" from emp;

--------------------
---지금까지 배운거----
--문자, 숫자, 날짜 ---
----각 연산 규칙------
---------------------


--**변환함수 Today Point
--Oracle : 문자, 숫자, 날짜
--to_char() : 숫자 > 문자 (1000 > $1000)로 바꾸자, 
--            날짜 > 문자 (2019-03=03) > 2019년03월03일 
--to_date() : 문자 > 날짜 select '2019-03-03'+1000 > select to_date('2019-03-03') +1000
--to_number() : 문자 > 숫자 (어느정도는 자동형변환 됨)
select to_number('100')+100 from dual;



/*
오라클 기본 데이터 타입
create table 테이블명 (컬러명 타입)
create table member (age number); >> insert를 몇번이나 할 수잇지

java : class person.. >> person p = new person(); 1건
      List<person> personlist = new ArrayList();
      personlist.add(new person);
oracle : create person.. >> ...

문자타입
char(20) >>20byte >>한글10자, 영문.특수.공백20자 : 고정길이 문자열
varchar2(20) >>20byte >> 한글10자, 영문.특수.공백20자 : 가변길이 문자열

char(20) >> '홍길동' >> 6byte >> 홍길동 20byte안에 저장
varchar2(20) >> '홍길동' >> 데이터 크기만큼 공간 확보 >>6byte

결국 문제는 한글..
unicode (2byte) : 한글, 영문자, 특수문자, 공백 >> 2byte
nchar(20) >> 20글자 --앞에 n이 붙으면 유니코드
nvarchar2(30) >> 30글자
*/

--1. to_number : 문자를 숫자로
select '1' +1 from dual;
select to_number('1')+1 from dual;

--2. to_char() : 숫자 > 형식문자, 날짜 > 형식문자
select sysdate || '일' from dual;
select to_char(sysdate) || '일' from dual;

select sysdate, to_char(sysdate,'YYYY') from dual; --연도만 뽑기 (문자로 나온다)

select sysdate, to_char(sysdate,'YYYY') || '년' as "YYYYY",
to_char(sysdate,'year'),
to_char(sysdate,'MM'),
to_char(sysdate,'DD'),
to_char(sysdate,'DAY'),
to_char(sysdate,'Dy')
from dual;

--Quiz
--입사일이 12월인 사원들의 사번, 이름, 입사일, 입사년도, 입사월을 출력
select empno, ename, hiredate, to_char(hiredate,'YYYY'), to_char(hiredate,'MM') from emp where to_char(HIREDATE,'MM') = '12';

select * from emp;
select empno, ename, hiredate, to_char(hiredate, 'YYYY') as "입사년도", to_char(hiredate,'MM') as "입사월" from emp where to_char(hiredate,'MM')=12;

select to_char(hiredate, 'YYYY"년" MM"월" DD"일"') from emp;

--to_char() :숫자 > 형식 문자
--10000 > $10000 (문자형태로 바꿔서 처리)

-- 표 오라클.pdf 71
select '>' || To_char(12345,'9999999999') || '<' from dual;
select '>' || To_char(12345,'09999999999') || '<' from dual; --> 00000012345<

select '>' || To_char(12345,'$9,999,999,999') || '<' from dual;
select sal, TO_CHar(sal,'$999,999') from EMP;


/*
사원 테이블에서 사원의 이름은 last_name, first_name 합쳐서 fullname 별칭부여해서 출력하고
입사일은 yyyy-mm-dd형식으로 출력하고 연봉(급여*12)을 구하고 연봉의 10%(연봉*1.1)인상한 값을 출력하고
그 결과 1000단위 콤마처리해서 출력하세여.
단 2005년 이후 입사자만 출력하세요. 연봉이 높은 순 출력
*/
select last_name || ' '|| first_name as "이름", to_char(hiredate,'yyyy-MM-dd'), sal*12 from EMPLOYEES;

select * from employees;
select LAST_NAME||FIRST_NAME as "fullname", to_char(hire_date,'YYYY-MM-DD') as "입사일", SALARY, SALARY*12 as "연봉", to_char(SALARY*12*1.1,'999,999') as "연봉인상" 
from EMPLOYEES 
where to_char(hire_date,'YYYY') >= 2005--where HIRE_DATE>='2005-01-01' 
order by "연봉" desc;


-------------------------------------------------
--to_date() 문자를 날짜로
select '2019-03-03' + 100 from daul;
select to_date('2019-03-03') + 100 from dual;

------------변환 함수 끝 --------------
-------------------------------------

--일반함수
--nbl(), nvl2() >> null처리 함수
--decode() 함수 >> java if문
--case() 함수 >> java switch문

select comm, nvl(comm,0) from emp;

create table t_emp(
  id number(6),
  job varchar2(20)
);

select * from t_emp;
insert into t_emp(id,job) values(100,'it');
insert into t_emp(id,job) values(200,'sales');
insert into t_emp(id,job) values(300,'mgr');
insert into t_emp(id) values(400);
insert into t_emp(id,job) values(500,'mgr');

commit;
--1
--nvl()
select id, job, nvl(job,'Empty...') from t_emp;

--2
--nvl2(값, null이 아니면, null이면)
select id,job, nvl2(job, job || '입니다', 'empty') from t_emp;

--3
--decode (통계데이터에서 많이 사용) if, switch 와 비슷
--decode(표현식, 조건1, 결과1, 조건2, 결과2, 조건3, 결과3 ...,default)
select id, job, decode(id, 100, 'It..', 200, 'sales..', 300, 'mgr..','etc..') from t_emp;

select job, decode(job,'it',1) from t_emp; --default 안쓰면 null로나옴
select count(decode(job,'it',1)) as "it",
        count(decode(job,'sales',1)) as "sales",
        count(decode(job,'mgr',1)) as "mgr" 
from t_emp;

--Quiz
--emp테이블에서 부서번호사 10이면 '인사부' 20이면 '관리부', 30이면 '회계부' 나머지는 기타부서 라고 출력
select * from emp;
select deptno, decode(deptno,10,'인사부',20,'관리부',30,'회계부','기타부서') from emp;

create table t_emp2(
  id number(2),
  jumin char(7)
);
insert into t_emp2(id, jumin) values(1,'1234567');
insert into t_emp2(id, jumin) values(2,'2234567');
insert into t_emp2(id, jumin) values(3,'3234567');
insert into t_emp2(id, jumin) values(4,'4234567');
insert into t_emp2(id, jumin) values(5,'5234567');
select * from t_emp2;
commit;

--t_emp2 테이블에서 id와 jumin데이터를 출력하되 jumin컬럼의 앞자리가 1이면 남성, 2이면 여성, 3이면 중성 그외 기타 라고 출력
select id, jumin, decode(substr(jumin,1,1),'1','남성','2','여성','3','중성','기타') as "성별" from t_emp2;
select jumin, substr(jumin,1,1) from t_emp2;


--부서번호가 20번인 사원중 smith이름이면 hello 출력
--부서번호가 20번인 사원중 smith이름아니면 world 출력
--20번이 아니면 etc
select ename, deptno, decode(deptno, 20, decode(ename, 'SMITH', 'hello','world'),'etd') as "result" from emp;


--case문
--java: switch
/*
case 조건식, when 결과1 then 출력1
            when 결과2 then 출력2
            when 결과3 then 출력3
            else 출력4
end "컬럼명"
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

select '0'|| to_char(zipcode), case zipcode when 2 then '서울'
                    when 31 then '경기'
                    when 32 then '강원'
                    when 41 then '제주'
                    else '기타지역'
                    end as "region name" 
from t_zip;                    

--사원테이블에서 사원급여가 1000$이하면 '4급',1001달러~2000달러이하면 '3급',2001달러~3000달러이하면 '2급',3001달러~4000달러이하면 '1급' 4000이상이면 '특급'을 출력
select * from emp;
--1. case 컬럼명 when 결과 then 출력 
--2. case when 컬럼명 조건 비교식 then **
select empno, ename, sal, case when sal <= 1000 then '4급'
                              when sal > 1000 and sal <=2000 then '3급'
                              when sal > 2000 and sal <=3000 then '2급'
                              when sal > 3000 and sal <= 4000 then '1급'
                              else '특급'
                              end as "result"
from emp;

select empno, ename, sal, case when sal <= 1000 then '4급'
                              when sal between 1001 and 2000 then '3급'
                              when sal between 2001 and 3000 then '2급'
                              when sal between 3001 and 4000 then '1급'
                              else '특급'
                              end as "result"
from emp;

-----------------------------------------------------------
----문자함수
----숫자함수
----날짜함수
----뱐환함수 to_chat(), to_date(), to_number()
----일반함수 nvl(), nvl2(), decode(), case() ..
-----------------------------------------------------------


--집계함수
--1. count(*) 아스트리카  row 수, count(컬럼명) >> 데이터건수 (null을 포함하지 않는다)
--2. sum()
--3. avg()
--4. max()
--5. min()

--1. 집계함수 특징 group by절과 같이 사용
--2. 모든 집계함수는 null값을 무시한다.
--3. select 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 group by절에 명시되어야 한다.

select count(*) from emp; --14
select count(comm) from emp; --6 (null값을 세지 못함)
select * from emp;
select count(empno) from emp; --14


select count(nvl(comm,0)) from emp;
--select nvl(comm,0) from emp;


--급여의 합
select sum(sal) as "급여의 합" from emp; --29025

--급여의 평균
select round(avg(sal),0) as "급여평균" from emp;

--사장님이 회사 총 수당이 얼마나 지급되지? (수당평균)
select trunc(avg(comm),0) from emp; --721
select trunc(sum(comm)/count(empno),0) from emp; --309
select trunc(avg(nvl(comm,0)),0) from emp; --309
--회사 규정에 따라 다르다

--desc 로 null검증 작업후 작업하기
desc emp;
--컬럼 is null로 확인
select count(*) from emp where comm is null;

select max(sal) from emp;
select min(sal) from emp;
--***point 집계함수의 결과는 1개 (1건당 컬럼1개만 반환된다)

select empno, count(empno) from emp;-- group by empno; --empno 14건, 집계 1건
select sum(sal), avg(sal), max(sal), min(sal), count(sal), count(*) from emp; --1건에 1로우 같이 있어서

--------------
--부서별 평균급여
select deptno, avg(sal) from emp group by deptno;
--직종별 평균 급여를 구하세요
select job, avg(sal) from emp group by job;

--직종별 평균급여, 급여 합, 최대급여, 최소급여, 건수를 구하세요
select avg(sal), sum(sal), max(sal), min(sal), count(sal) from emp group by job;

/*
grouping 원리
distinct 컬럼명1, 컬럼명2
order by 컬럼명1, 컬럼명2
group by 컬럼명1, 컬럼명2
*/

--부서별, 직종별 급여의 합을 구하세요
select deptno, job, sum(sal), count(*) from emp group by deptno, job order by deptno;
select * from emp;

/*
select 4
from 1
where 2
group by 3
order by 5
*/

--직종별 평균급여가 3000달러 이상인 사원의 직종과 평균급여를 출력하세요.
select * from emp;
--group by 조건절 - having  (실행순서가 달라서 )
select job, avg(sal) from emp group by job;
select job, avg(sal) from emp group by job having avg(sal) >= 3000;

--from조건절 where
--group by 조건절 having

/*
select    5
from      1
where     2
group by  3
having    4
order by  6
*/

select * from emp;
--사원테이블에서 직종별 급여합을 출력하되 수당은 지급받고 급여의 합이 5000이상인 사원들의 목록을 출력하세요
--급여의 합이 낮은 순으로 출력하세요
--select sum(sal) from emp group by job having sum(sal+nvl(comm,0))>=5000 order by sum(sal) asc;
select job, sum(sal) from emp where comm is not null group by job having sum(sal)>=5000 order by sum(sal) asc;

--사원테이블에서 부서인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하세요.
select deptno, count(deptno), sum(sal) from emp group by deptno having count(deptno) >4;

--사원테이블에서 직종별 급여의 합이 5000을 초과하는 직종과 급여의 합을 출력하세요
--단, 판매직종(salesman)은 제외하고 급여합으로내림차순으로 정렬하세요
select job, sum(sal) from emp where job != 'SALESMAN' group by job having sum(sal) >5000 order by sum(sal) desc;


---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------

--190321
--[join] 다중 테이블 검색
--오라클.pdf 85p

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

--join의 종류
--1. 등가조인 (equui join) 70%
--원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1로 매핑
--sql join문법
--ansi문법 (권장) [inner] join on~ 조건절

select * from m, s where m.m1= s.s1; --null값은 비교대상이 아니다
--오라클 문법
select m.m1, m.m2, s.s2 from m, s where m.m1= s.s1;
--ansi 문법
select * from m inner join s on m.m1=s.s1; 

--where 절 = 조건절
--where절을 조인문으로 사용하면, 어떤것이 join이고ㅡ 어떤것이 조건인지 혼동
--ansi에서는 조인의 조건문을 on에 담는다.

select m.m1, s.s1, s.s2 from m join s on m.m1=s.s1; --inner생략가능

select * from m join x on m.m1=x.x1; --매핑되는 값만 가져옴(inner)
select m.m1, x.x1 from m join x on m.m1=x.x1;

--사원번호, 사원이름, 사원부서번호, 사원부서명 출력
select * from emp join dept on emp.deptno=dept.DEPTNO;
select empno, ename, emp.deptno, dname from emp join dept on emp.deptno=dept.deptno;
select * from dept;

--join에서는 별칭을 사용할수 있다
select e.empno, e.ename, e.deptno, d.dname from emp e join dept d on e.deptno=d.deptno;

select * from m join s on m.m1=s.s1 join x on s.s1=x.x1;
select * from m, s, x where m.m1=s.s1 and s.s1=x.x1;

select m.m1, m.m2, s.s2, x.x2 from m join s on m.m1=s.s1 join x on s.s1=x.x1;

------------[hr]-------------
select * from EMPLOYEES;
select * from DEPARTMENTS;
select * from LOCATIONS;


--사번. 이름, 부서번호, 부서이름 출력
select e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME 
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID; --106
--문제점: 사원 수(1명이) 누락되었다. >>등가조인의 문제 >> outer join으로 해야한다.
select count(*) from EMPLOYEES; --107

--사번, 이름, 부서번호, 부서이름, 지역번호, 지역 출력
select e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID, l.STREET_ADDRESS 
from EMPLOYEES e join departments d on e.DEPARTMENT_ID=d.DEPARTMENT_ID 
                join LOCATIONS l on d.LOCATION_ID=l.LOCATION_ID;

----------------
--2. [비등가조인]-------non-euqi join => 의미만 존재 => 문법은 등가조인 문법 사용
--원테이블과 대응되는 테이블에 있는 컬럼이 1:1매핑이 되지 않는 경우
--ex)emp, salgrade

select * from emp;
select * from salgrade;
select e.empno, e.ename, e.sal, s.grade from emp e join salgrade s on e.sal between s.losal and s.hisal; 


---3. [외부조인] outer join (equi join +null)
--outer join(주 종관계의 파악) >> 주가 되는 테이블의 데이터를 가져오는 방법 (equi join하고 남는 데이터)
--문법) left outer join(왼쪽이 주), right outer join(오른쪽이 주), full outer join(둘다 주)
select * from m join s on m.m1=s.s1; --일반조인
select * from m left join s on m.m1=s.s1;
select * from m right join s on m.m1=s.s1;
select * from m full join s on m.m1=s.s1;

--사번. 이름, 부서번호, 부서이름 출력
select e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME 
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID; --106
--문제점: 사원 수(1명이) 누락되었다. >>등가조인의 문제 >> outer join으로 해야한다.
select count(*) from EMPLOYEES; --107

--널이 어디테이블에 있는지 확인한다.
select * from employees where DEPARTMENT_ID is null;
--178	Kimberely	Grant	KGRANT	011.44.1644.429263	07/05/24	SA_REP	7000	0.15	149	

select e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME 
from EMPLOYEES e left join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID;

---------------------------------
--4. self join 자기참조
--하나의 테이블에서 특정컬럼이 다른 컬럼을 참조하는 경우 (자기테이블에서 컬럼이 컬럼을 참조할때)
select * from emp;
--문제점: 테이블이 하나 ...  >> 가명칭을 사용하면 테이블을 여러개처럼 사용할 수 있다.
select * from emp e join emp m on e.mgr = m.empno; -- 그리고 나서 뽑아쓰는거
select e.empno, e.ename, m.empno, m.ename from emp e left join emp m on e.mgr = m.empno;

--natural join : 모든 나올수있는 가지수를 다 출력하는거 (조건없이 출력가능)
select * from m ,s;


--test
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
select e.ENAME, e.DEPTNO, d.DNAME from EMP e join DEPT d on e.DEPTNO=d.DEPTNO;

-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을 출력하라.
select * from emp;
select * from dept;
select e.ename, e.job, e.DEPTNO, d.dname from emp e join dept d on e.DEPTNO=d.DEPTNO where d.loc='DALLAS'; 
 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
select * from emp;
select e.ename, d.dname from emp e join dept d on e.DEPTNO=d.DEPTNO where e.ename like '%A%'; 

-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을 출력하는데 월급이 3000이상인 사원을 출력하라.
select e.ename, d.dname, e.sal from emp e join dept d on e.DEPTNO=d.DEPTNO where sal>=3000;
 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고 그 사원이 속한 부서 이름을 출력하라.
select e.job, e.ename, d.dname from emp e join dept d on e.DEPTNO=d.DEPTNO where job='SALESMAN';
 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션, 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
select * from salgrade;
select e.empno as "사원번호", e.ename as "사원이름" , e.sal*12 as "연봉", e.sal+nvl(comm,0)*12 as "실급여", s.GRADE as "급여등급" 
from emp e join salgrade s on e.SAL between s.losal and s.hisal 
where comm is not null;

-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,월급, 급여등급을 출력하라.
select e.deptno, d.dname, e.ename, e.sal, s.grade 
from emp e join dept d on e.DEPTNO=d.DEPTNO join SALGRADE s on e.SAL between s.losal and s.hisal 
where d.deptno=10;
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,사원이름, 월급, 급여등급을 출력하라. 
--그리고 그 출력된 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로 정렬하라.
select e.deptno, d.dname, e.sal, s.GRADE 
from emp e join dept d on e.DEPTNO=d.DEPTNO join SALGRADE s on e.SAL between s.losal and s.HISAL 
where e.deptno in (10,20) 
order by e.deptno, e.sal desc;
 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의 사원번호와 사원이름을 출력
--각각의 컬럼명을 '사원번호', '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
select * from emp;
select m.empno as "사원번호" , m.ename as "사원이름" , e.empno as "관리자번호" , e.ename as "관리자이름" 
from emp e RIGHT join emp m on e.empno=m.mgr;

select *
from emp e RIGHT join emp m on e.empno=m.mgr;

----------------------------
---------[서브쿼리]----------

--1.함수
--2.조인
--3.서브쿼리

--사원테이블에서 사원들의 평균월급보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력하세요.
select avg(sal) from emp;
select * from emp where sal > 2073;
select * from emp where sal > (select avg(sal) from emp);

--subquery
--1. single row subquery : subquery의 결과가 1개의 row를 가질 때 (단일컬럼)
--2. multi row subquery : subquery의 결과가 1개 이상의 row (단일컬럼)
--구분하는 이유는: 사용되는 연산자의 차이때문에
--multi row(in, not in)(any, all)
--all: sal > 1000 and sal > 2000 and ..
--any: sal > 1000 or sal > 2000 or ..

--정의 서브쿼리 정의
--1. 괄호안에 있어야 한다. (select avg(sal) from emp)
--2. 단일 컬럼으로 구성 >> 이런건 아니다 select sal, deptno from emp (x) >> 서브쿼리는 하나의 단일컬럼에만 값을 메긴다.
--3. 단독으로 실행가능하여야 한다.

--서브쿼리 실행순서
--1. 서브쿼리가 먼저 실행
--2. subquery의 결과를 가지고 main query를 실행

--사원테이블에서 jones의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력
select sal from emp where ename like 'JONES';
select * from emp where sal > 2975;
select empno, ename, sal from emp where sal > (select sal from emp where ename like 'JONES');

--급여가 2000달러 이상인..
select sal from emp where sal >=2000; --결과row가 1개 이상
select * from emp where sal in (select sal from emp where sal >=2000); --멀티로우는 in을 사용
--sal = 2001 or sal=3000 or ..
select * from emp where sal not in (select sal from emp where sal >=2000);
--sal!= 2001 and sal!=3000 and ..

--부하직원이 있는 사원의 사번과 이름 출력
select mgr from emp;
select empno, ename from emp where empno in (select mgr from emp);
--empno=7902 or empno=7698 or empno=7839 or empno is null
select mgr from emp where mgr is not null;
select empno, ename from emp where empno not in(select mgr from emp where mgr is not null);
--empno!=7902 and empno!=7698 and empno!=7839 and empno is null

--조건식에 null이 하나라도 있으면 null
--not in사용 시 null값을 확인해야한다.

--직속상관이 king인 사원의 사번, 이름, 직종, 관리자 사번을 출력
select empno from emp where ename like 'KING';
select empno, ename, job, mgr from emp where mgr = (select empno from emp where ename like 'KING');

--20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 사번, 이름, 급여, 부서번호를 출력
select max(sal) from emp where deptno=20;
select empno, ename, sal, deptno from emp where sal > (select max(sal) from emp where deptno=20);


--
select *
from emp
where deptno in (select deptno from emp where job='SALESMAN')
and sal in (select sal from emp where job='SALESMAN');
--

--Quiz
--자기 부서의 평균월급보다 더 많은 월급을 받는 사원의 사번, 이름, 부서번호, 부서별평균월급을 구하세요
--1: 부서번호, 부서평균월급을 담고 있는 테이블
select deptno, avg(sal) from emp group by deptno;

select empno, ename, deptno from emp where sal in (select avg(sal) from emp group by deptno);
select  empno, ename, deptno, avg(sal) from emp where sal in (select avg(sal) from emp group by deptno) group by deptno;
select  empno, ename, deptno, avg(sal) from emp group by deptno;

select * from (select deptno, avg(sal) from emp group by deptno);

select * from emp e join (select deptno, avg(sal) from emp group by deptno) d on emp.DEPTNO=d.deptno;

where e.sal > s.d

select e.empno, e.ename, e.deptno, e.sal, s.avgsal 
from emp e join (select deptno, round(avg(sal),0) as avgsal from emp group by deptno) s on e.deptno=s.deptno 
where e.sal >s.avgsal;

------Quiz
--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
select sal from emp where ename like 'SMITH';
select ename, sal from emp where sal > (select sal from emp where ename like 'SMITH');
 
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급, 부서번호를 출력하라.
select sal from emp where deptno=10;
select ename, sal, deptno from emp where sal in (select sal from emp where deptno=10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데 'BLAKE'는 빼고 출력하라.
select deptno from emp where ename like 'BLAKE';
select ename, hiredate from emp where deptno = (select deptno from emp where ename like 'BLAKE') and ename != 'BLAKE';

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을 출력하되, 월급이 높은 사람 순으로 출력하라.
select trunc(avg(sal),0) from emp;
select empno, ename, sal from emp where sal > (select trunc(avg(sal),0) from emp) order by sal desc;
 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고 있는 사원의 사원번호와 이름을 출력하라.
select deptno from emp where ename like '%T%';
select empno, ename from emp where deptno in (select deptno from emp where ename like '%T%');

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
select max(sal) from emp where deptno=30;
select ename, deptno, sal from emp where sal > (select max(sal) from emp where deptno=30);
--all
select ename, deptno, sal from emp where sal > all(select sal from emp where deptno=30);
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의 이름, 부서번호, 직업을 출력하라.
select deptno from dept where loc = 'DALLAS';
select ename, deptno, job from emp where deptno = (select deptno from dept where loc = 'DALLAS'); 
select e.ename, e.deptno, e.job from emp e join dept d on e.deptno=d.deptno where d.deptno = (select deptno from dept where loc = 'DALLAS'); 
select ename, deptno, job from emp where deptno in (select deptno from dept where loc='DALLAS');

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.
select deptno from dept where dname like 'SALES';
select d.deptno, e.ename, e.job from emp e join dept d on e.deptno=d.deptno where d.deptno=(select deptno from dept where dname like 'SALES');
select deptno, ename, job from emp where deptno in (select deptno from dept where dname like 'SALES');
 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라 / king 이 사수인 사람 (mgr 데이터가 king 사번)
select * from emp;
select empno from emp where ename like 'KING'; --7839
select ename, sal from emp where mgr = (select empno from emp where ename like 'KING');
 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,급여를 출력하라.
select round(avg(sal),0) from emp;
select ename from emp where ename like '%S%';
select empno, ename, sal from emp where sal > (select round(avg(sal),0) from emp) and ename in(select ename from emp where ename like '%S%');
 
--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의 이름, 월급, 부서번호를 출력하라.
select deptno from emp where comm is not null;
select sal from emp where comm is not null;
select deptno, sal from emp where deptno in (select deptno from emp where comm is not null) and sal in (select sal from emp where comm is not null);

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은 사원들의 이름, 월급, 커미션을 출력하라.
select sal from emp where deptno=30;
select nvl(comm,0) from emp where deptno=30;
select ename, sal, comm from emp where sal not in(select sal from emp where deptno=30) and comm not in(select nvl(comm,0) from emp where deptno=30);

------------------------------------------
--insert, update, delete,
/*
DDL(데이터 정의어): create, alter, drop, truncate(저장공간까지 없애는거), rename, modify
DML(데이터 조작어): insert, update, delete
DQL(데이터 질의어): select
DCL(데이터 제어어): grant, revike
TCL(트랙젠션): commit, rollback, savepoint
*/

--DML은 트랜젝션을 동반한다.
--(A은행에서 출금해서 B라는 은행에 입금하는 일 ) 하나의 단위로 친다. : 트랜젝션
--A라는 계좌에 100만원을 출금한다: update..
--B라는 계좌에 100만원을 입금한다: update..
--둘다 성공:commit
--둘 중 하나라도 실패: rollback

--테이블 정보보기
desc emp;
select * from tab; --tab정보 다봄
select * from tab where tname='BOARD'; --데이터가 있다는것은 이미 값이 존재한다는 것
select * from col; --col정보 다봄
select * from col where tname='EMP';
select * from user_tables;
select * from user_tables where table_name='DEPT';

----------------------------------------
--DML 오라클 168.p
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])]
VALUES (value1[, value2, . . . . . . ]);
*/

create table temp(
  id number primary key, --id 컬럼에는 null(x), 중복데이터(x),유일한 데이터1건보장,where id=10
  name varchar2(20) --default null허용
);
desc temp;

--1. 일반적인 insert
insert into temp (id,name) values (100,'홍길동');
select * from temp;
commit;

--2. 컬럼목록을 생략 (안쓰면 컬럼 전체가 순서대로 들어간다)
insert into temp values (200,'김유신');
select * from temp;
commit;

select * from temp;

--Quiz
insert into temp(id, name) values (100,'아무개'); --unique constraint (%s.%s) violated
insert into temp(name) values ('아무개'); --cannot insert NULL into (%s)

--일반 sql은 프로그램적인 요소 (x)
--PL-SQL (변수, 제어문)

-- pl-sql
create table temp2(
id varchar2(20)
);
desc temp2;

--begin
--  for i in 1..1000 loop
--    insert into temp2(id) values('A' || to_char(i));
--  end loop;
--end;

select * from temp2;
-----------------------------

create table temp3(
  memberid number(3) not null,
  name varchar2(10),
  regdate date default sysdate --default값 설정
);

select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid, name, regdate) values (100, '홍길동', '2019-03-21');

select * from temp3;
commit;

insert into temp3(memberid, name) values (200, '아무개');
insert into temp3(memberid) values (300);
insert into temp3(name) values ('아무개');


---------------------------------










