/*
[1���� ����]

1. ����Ŭ ����Ʈ���� �ٿ�ε�
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html 

2. Oracle Database 11g Release 2 Express Edition for Windows 64

3. Oracle ��ġ (SYS, SYSTEM ���� ��ȣ ����) : 1004

4. Sqlplus ���α׷� ����(CMD) : GUI ȯ���� �ƴ϶� ����ϱ� ����..

5. ������ ���� ��ġ�ؼ� ���
����: sqlDeveloper, ����: ���, ������, SqlDate

6. SqlDeveloper ���� ���ؼ� Oracle Server ����..
  >> HR����: ��ȣ1004, Unlook 2���� ���� .. (������� �ǽ����̺� ���)
  >> ���ο� ���� ����: bituser
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

7. ���� ���� ���� Ȯ��: show uaer;

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

--1. ������̺����� ��� �����͸� ����ϼ���.
select * from emp;
SELECT * FROM dept;
select * from SALGRADE;

--2. Ư�� �÷� ������ ����ϱ�
SELECT EMPNO, ENAME, JOB,MGR, HIREDATE, sal, COMM, DEPTNO FROM EMP;

--3. �÷��� ����Ī �ο��ϱ� ���� ǥ�� as
select empno ���, ENAME "��   ��", job as "����" from emp;

--4. Oracle ������ ���ڿ�(���ڿ��� ��ҹ��� ����) 
--���ڿ� ǥ�� ''
select empno, ename from emp where ename='king';
select empno, ename from emp where ename='KING';

--Oracle SQL: ������(���տ����� != ��������� :����)
--JAVA: + (�������(����+����), ���տ���(���ڿ�+���ڿ�)
--ORACLE: ���տ�����|| , ���������+
select '����� �̸���' || ename || '�Դϴ�' as "�������" from emp;


--���̺� �÷��� �⺻Ÿ��
--�÷��� Ÿ�� ����, ����, ��¥ ...
desc emp; --���̺��� Ÿ�� �⺻����
select empno  || ename from emp; --number + varchar ����������ȯ
select empno+ename from emp; --The specified number was invalid (��������� �Ұ�)

--�����: �츮ȸ�翡 ������ � �ֳ�
--distinct �ߺ� ������ ����
select DISTINCT job from emp;
--��̻�Ƽ�(group�� group�� ��Ƽ� ������ ���)
--��̻�Ƽ�(group�� group�� ��Ƽ� ������ ���)
SELECT job, deptno from emp order by job;
SELECT DISTINCT job, deptno from emp order by job;
SELECT job, deptno from emp order by deptno;
SELECT DISTINCT deptno, job from emp order by deptno;

-----------------------
--Oracle (sql���)
--java ���(������)
--java ���� ����(+,-,*,/) : %������ >> %�˻����� >> ����Ŭ: �������� ���ϴ� �����ڰ� ����. >>�Լ��� ����� ����Ѵ�. .Mod():�������� ���ϴ� �Լ�

--�������(*+,-,*,/) : Mod() 

--������̺����� ����� �޿��� 100$�λ��� ����� ����غ�����.
desc emp;
select empno, ename, sal, sal+100 as "100$�λ���" from emp;

select 100+100 from dual; --dual �������̺�
select 100||100 from dual; --����������ȯ(���ڿ�)
select mod(100,100) from dual;
select '100'+100 from dual; --*����Ŭ�� ���հ� ����� �и��Ǿ� �ִ�.
select 'a'||('100'+100) from dual;

--�񱳿�����
-- >,<,<=
-- java ���� ==, �Ҵ�=
-- oracle ����=, �����ʴ�!=

--����������
--AND, OR, NOT

--������(���ϴ� row ������ ���ڴ�)
select * from emp where sal>=3000;
select empno, ename, sal from emp where sal>=3000;

--�̻�, ���� (=)���� 
--�ʰ�, �̸� (=)������

--����� 7788���� ����� ���, �̸�, ����, �Ի����� ����ϼ���.
select empno, ename, job, HIREDATE  --3
from emp --1
where empno=7788; --2

--����� �̸��� king �� ����� ���, �̸�, �޿��� ����ϼ���
select empno, ename, sal from emp where ename='KING'; --���ڿ������ʹ� '' �̱������̼�

--�޿��� 2000�޷��̻��̰ų� ������ �Ŵ����� ����� ��������� ����ϼ��� (�ΰ��� ������ ��� �����Ѵ�)
select * from emp;
select * from emp where sal >= 2000 or job='MANAGER';

--�޿��� 2000�޷��̻��̰� ������ �Ŵ����� ����� ��������� ����ϼ��� (�ΰ��� ������ ��� �����Ѵ�)
select * from emp;
select * from emp where sal >= 2000 and job='MANAGER';

----------
--����Ŭ��¥(DB������ ��¥)
--����Ŭ�� ��¥���� sysdate
select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select hiredate from emp;

--�Խ��� �۾���
--insert into board(writer, title, content, regdate) values('ȫ�浿','�氡�氡', '����Ŀ�",sysdate);


--����Ŭ�ý������̺�
select * from SYS.NLS_SESSION_PARAMETERS; --�ý���ȯ�� ���̺� ��ȸ Ȯ��  --����Ŭ�� ������ �ִ� ����
--NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
--NLS_DATE_LANGUAGE	KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF

--����Ŭ ��¥ ��ȸ: '2019-12-12'
select * from emp where hiredate='1980-12-17'; --��¥ ã������ '' �� ����Ѵ�.
select * from emp where hiredate='1980/12/17'; -- (-, /) �Ѵ� ��������

select * from emp where hiredate='80-12-17'; --������ �ٲ���� ��ȸ�ȵ�

--����� �޿��� 2000$ �̻��̰�, 4000$������ ��� ����� ������ ����ϼ���
select * from emp where sal >=2000 and sal <=4000; 
select * from emp where sal between 2000 and 4000; --between and �̻�, ���� == (�����ڽ��� �����Ѵ�)

--�μ���ȣ�� 10 �Ǵ� 20 �Ǵ� 30���� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select empno, ename, sal, deptno from emp where deptno=10 or deptno=20 or deptno=30;
--in ������(���� or ���� or ����..)
select empno, ename, sal, deptno from emp where deptno in(10,20,30);
--�μ���ȣ�� 10 �Ǵ� 20�� �ƴ�  ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select empno, ename, sal, deptno from emp where deptno!= 10 and deptno !=20;
--not in ������(������ and ������ ..)
select empno, ename, sal, deptno from emp where deptno not in(10,20);

--**null
--Oracle���� ���� ���ٴ� ǥ���� null�̶�� �Ѵ�.
--null (�ʿ��)

create table member(
  userid varchar2(20) not null, --�ʼ�
  name varchar2(20) not null, --�ʼ�
  hobby varchar2(50)  --default null (�ƹ��͵� ���������� null���� ����ϰڴ�)
);

desc member;
insert into member (userid, hobby) values ('rhak','�޸���'); --cannot insert NULL into
insert into member (userid, name, hobby) values ('rhak','�켼��','�޸���');
insert into member (userid, name) values ('asdasd','�������');
select * from member;

--�����ݿ�
commit;

--����(COMM)�� �����ʴ� ��� ����� ������ ����ϼ���.
--0�� ������������ּ���
select * from emp where comm is null;
--null�� �񱳴� is null, is not null)
select * from emp where comm is not null;
select * from emp where comm is not null and comm !=0;

--������̺����� ���, �̸�, �޿�, ����, �ѱ޿��� ����ϼ���
--�ѱ޿� (�޿�+����)
select empno, ename, sal, comm, sal+comm from emp;
--**point 
--null
--1. null�� ��� ������ null�̴�.
--2. �����ذ� : �Լ�nvl(), nvl2()        --���� ���) ms-sql: convert(), my-sql: ifnull() 
select empno, ename, sal, comm, sal+nvl(comm, 0) from emp;

select 1000 + null from dual;
select 1000 + nvl(null,0) from dual;
select comm, nvl(comm,111) from emp; --ġȯ���� ���� ��

--����� �޿��� 1000�̻��̰� ������ ���� �ʴ� ����� ���, �̸�, ����, �޿�, ������ ����ϼ���
select empno, ename, sal, comm from emp where sal >=1000 and comm is null;
select * from emp;


----------------------
--DQL(data query language) : select
--DDL(���������Ǿ�) : create, alter, drop .. (��ü����, ����, ����)

--create Board (boardno number ...
--JAVA : class Board {private boardno int}

create table Board (
  boardid number not null, --����, �ʼ��Է�
  title varchar2(20) not null, --�ѱ�10��, �ʼ��Է�
  content varchar2(2000) not null, --�ʼ��Է�
  hp varchar2(20) --default null �ʼ��Է»��� �ƴϴ�
);

desc board;

--DML(������ ���۾�) �ݿ����ο��� ����(�ǹ���(commi), ���(rollback)) �ݵ�� ����
--insert, update, delete �۾�

insert into board(boardid, title, content) values (100,'Ÿ��Ʋ', '����');
select * from board;
--�ǻ���� : �����ݿ�(commit), �����ݿ� ���Ѵ�(rollback)
rollback;
commit;

insert into board(boardid, title, content) values (200,'�ڹ�','�׸���');
insert into board(boardid, title, content) values (300,'�ڹ�','�׸���');
commit; --�Ѵ� �ݿ�, �Ѵ� ���

select boardid, nvl(hp,'EMPTY') as "hp" from board;
--nvl �Լ��� ����, ��¥, ���ڿ� ��� ���� �����ϴ�.

--------------
--���ڿ� �˻�
--�ּҰ˻�: �˻��� : '����' -> �����̶�� �ܾ �ִ� ��� ���� like�˻�
--���ڿ� ���� �˻� (Like ������)

--like ������ (���ϵ� ī�� ���� (%: ��� ��, _:�� ����))
select * from emp where ename like '%A%'; --ename�÷��� �����Ϳ� A�� ����ִ� ��� �̸� �˻�
select * from emp where ename like '%a%'; --��ҹ��� ����

select ename from emp where ename like 'A%'; --�̸��� ù���ڰ� A�� ����
select * from emp where ename like '%S';
select * from emp where ename like '%LL%';
select * from emp where ename like '%A%A%';

select ename from emp where ename like '_A%'; --ù���� ����� �͵� ������� �ι��� ���ڴ� A

--����Ŭ ����: reqexp_like �󼼰˻� ����'
select * from emp where REGEXP_LIKE(ename,'[A-C]');
--java > oracle > jacascript
--����: ����ǥ������ 5���� �����


----------
--�����������ϱ�
--order by �÷���: ����, ����, ��¥ ���İ���
--��������(1,2,3) asc default , �������� (4,3,2) desc
select * from emp order by sal;
select * from emp order by sal asc;
select * from emp order by sal desc;

select ename from emp order by ename asc; --a-z
--�Ի����� ���� ���� ������ �����ؼ� ���, �̸�, �޿�, �Ի��� ���
select empno, ename, sal, HIREDATE from emp order by HIREDATE desc;

/*
select --3
from --1
where --2
order by --4 (select ����� ����)
*/

select empno, ename, sal, job, hiredate 
from emp 
where job='MANAGER' 
order by hiredate desc;

--order by �÷��� desc, �÷��� asc, �÷��� desc --���, �𼾵�
select job, deptno
from emp
order by job asc, deptno desc;


-----------
--������(union): ���̺��� ���̺��� �����͸� ��ġ�� �� (�ߺ����� ����)
--������(union all): �ߺ��� ���

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

--union �ߺ�����
select * from ut
union
select * from uta;


--union all ��ü �ٺ���
select * from ut
union all
select * from uta;

--union ��Ģ
--1. ����� �÷��� Ÿ���� ����
select empno, ename from emp
union
select deptno, dname from dept; --�����Ǵ� Į���� Ÿ���� Ʋ���� ����. --�տ��ִ� ������ ����, --���ڹ濡 ���ڵ���, ���ڹ濡 ���ڵ���

--�ǹ� > subquery (in line view)
select empno, ename from (
  select empno, ename from emp
  union
  select deptno, dname from dept
) order by empno desc;

--2. �����Ǵ� �÷��� ������ ���� (null�� ���� ���� �Ѵ�)
select empno, ename, job, sal from emp
union
select deptno, dname, loc, null from dept;



--����Ŭ �Լ�
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET : AL32UTF8 �ѱ� 3byte �ν�
--K016KSC5601
select * from nls_database_parameters where parameter like '%CHAR%';


------------------------------
---------------------------
---------���� ���̺�--------
---------------------------
---------------------------
--[2����]
/*
1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�.
2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�.
3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ��� �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�.
4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�.
5) �Ϲ����� �Լ� : NVL, DECODE
*/

--���ڿ� �Լ�
--initcap() : �ܾ��� ù���ڸ� �빮�ڷ� ����� �ش�
select initcap('the super man') from dual; 
--lower() : �빮�ڸ� �ҹ��ڷ� �ٲ�
--upper() : �ҹ��ڸ� �빮�ڷ� �ٲ�
select lower('AAA'), upper('aaa') from dual;
select ename, lower(ename) as "ename" from emp;
select * from emp where lower(ename)='king'; --where�������� ����Ѵ�.

--���ڿ���������
--length() : �ܾ���̰� ���ΰ���(���ڿ��� ����)
select length('abcd') from dual; 
select length('ȫ�浿') from dual;
select length(':A12a ���� �� ') from dual;

--���տ����� || 
--concat() : ���ڸ� �����Ѵ� (2����)
select 'a' || 'b' || 'c' as "data" from dual;
select concat('a','b') from dual;
select concat(ename,job) from emp; --���⸦ ���Ѵ�

--�κй��ڿ� ����
--java(substring)
--oracle(substr) (���ڿ�������, 1����:�����ε���, ���ڼ�)
select substr('abcde',2,3) from dual;
select substr('abcde',1,1) from dual;
select substr('abcde',3,1) from dual;
select substr('abcde',3) from dual; --�ڿ����� ��
select substr('abcde',-2,1) from dual; -- -���̸� �ں��� ���� �ű�
select substr('abcde',-1) from dual;
select substr('abcde',-5,2) from dual;

--������̺����� ename�÷� �����Ϳ� ���� ù���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮��ȣ ����ϵ�
--�ϳ��� �÷����� ����ϼ���
--�÷��� ����Ī�� fullname
--ù���ڿ� ������ ���ڻ��̿� ���� �ϳ��� ��������
select INITCAP(ename) from emp;
select lower(substr(ename,1,1))|| ' ' || upper(substr(ename,2)) as "fullname" from emp;

--lpad, rpad (ä���)
select lpad('ABC',10,'*') from dual; --�տ� ä���
select rpad('ABC',10,'%') from dual; --�ڿ� ä���

--Quiz
--����ں�� : hong1006
--ȭ��: ho****** ���

select substr('hong1006',1,2)|| lpad('hong1006',length('hong1006')-2,'*') from dual;
select rpad(substr('hong1006',1,2), length('hong1006'),'*') from dual;
select rpad(substr('1004',1,2), length('1004'),'*') from dual;

--emp ���̺����� ename�÷��� �����͸� ����ϴµ� ù���ڸ� ����ϰ� �������� *�� ǥ���ϼ���.
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
--��°��
--�ϳ��� �÷����� ���
--100 : 123456-*******
--200 : 123456-*******
--�÷��� ����Ī "juminnumber"
select id || ' : ' || rpad(substr(jumin,1,7),length(JUMIN),'*') as "jumin" from member2;

--rtrim �Լ� : ������ ���ڸ� ������
select rtrim('MILLER', 'ER') from dual; --MILL
select ltrim('MILLLLLLLLLLLLLER', 'MIL') from dual; --ER
select '>' || rtrim('MILLER    ','') || '<' from dual; --��������

--ġȯ�Լ�
select ename, replace(ename, 'A', '�Ϳ�') from emp;


--�����Լ�
--round (�ݿø��Լ�)
--trunc (�����Լ�)
--������ ���ϴ� �Լ� (mod())

-- -3 -2 -1 0 1 2 3
--round
select round(12.345,0) as "r" from dual; --12
select round(12.567,0) as "r" from dual; --�����κ� �ݿø� 13
select round(12.345,1) as "r" from dual; -- 12.3
select round(12.567,1) as "r" from dual; -- 12.6
select round(12.345,-1) as "r" from dual; --10
select round(15.345,-1) as "r" from dual; --20
select round(15.345,-2) as "r" from dual; --0

--trunc (�����Լ�)
select trunc(12.345,0) as "t" from dual; --12
select trunc(12.567,0) as "t" from dual; --12
select trunc(12.345,1) as "t" from dual; -- 12.3
select trunc(12.567,1) as "t" from dual; -- 12.5
select trunc(12.345,-1) as "t" from dual; --10
select trunc(15.345,-1) as "t" from dual; --10
select trunc(15.345,-2) as "t" from dual; --0

--������
select 12/10 from dual; --���ϰ� ������ ���� ����
select mod(12,10) from dual;
select mod(0,0) from dual; --0

--��¥ �Լ�

select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--��¥ ����(POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date >> Number

select * from SYS.NLS_SESSION_PARAMETERS;
--NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS

select hiredate from emp;
select MONTHS_BETWEEN('2018-02-27','2010-02-27') from dual; --������ ��
select round(MONTHS_BETWEEN(sysdate, '2010-01-01'),1) from dual; --110.6
select trunc(MONTHS_BETWEEN(sysdate, '2010-01-01'),1) from dual; --110.6

--to_date() : ���ڸ� ��¥�� �ٲ��ش�.
select to_date('2019-03-20')+100 from dual;
select to_date('2019-03-20')+1000 from dual;
select sysdate +1000 from dual;

--Quiz
select * from emp;
--1.������̺����� ������� �Ի��Ͽ��� ������ ������ �ټӿ����� ���ϼ���. 
--�� �ϼ��� ������ ����ϼ���
select trunc(MONTHS_BETWEEN(sysdate, hiredate),0) as "���� �ټ� ����" from emp;
select ename, hiredate, trunc(months_between(sysdate,hiredate),0) as "���� �ټ� ����" from emp;

--2.�Ѵ��� 31���̶�� ���ؿ��� �ټӿ����� ���ϼ���.
select hiredate-31 as "���� �ټ� ����" from emp;
select ename, hiredate, trunc((sysdate-hiredate)/31,0) as "���� �ټ� ����" from emp;

--------------------
---���ݱ��� ����----
--����, ����, ��¥ ---
----�� ���� ��Ģ------
---------------------


--**��ȯ�Լ� Today Point
--Oracle : ����, ����, ��¥
--to_char() : ���� > ���� (1000 > $1000)�� �ٲ���, 
--            ��¥ > ���� (2019-03=03) > 2019��03��03�� 
--to_date() : ���� > ��¥ select '2019-03-03'+1000 > select to_date('2019-03-03') +1000
--to_number() : ���� > ���� (��������� �ڵ�����ȯ ��)
select to_number('100')+100 from dual;



/*
����Ŭ �⺻ ������ Ÿ��
create table ���̺��� (�÷��� Ÿ��)
create table member (age number); >> insert�� ����̳� �� ������

java : class person.. >> person p = new person(); 1��
      List<person> personlist = new ArrayList();
      personlist.add(new person);
oracle : create person.. >> ...

����Ÿ��
char(20) >>20byte >>�ѱ�10��, ����.Ư��.����20�� : �������� ���ڿ�
varchar2(20) >>20byte >> �ѱ�10��, ����.Ư��.����20�� : �������� ���ڿ�

char(20) >> 'ȫ�浿' >> 6byte >> ȫ�浿 20byte�ȿ� ����
varchar2(20) >> 'ȫ�浿' >> ������ ũ�⸸ŭ ���� Ȯ�� >>6byte

�ᱹ ������ �ѱ�..
unicode (2byte) : �ѱ�, ������, Ư������, ���� >> 2byte
nchar(20) >> 20���� --�տ� n�� ������ �����ڵ�
nvarchar2(30) >> 30����
*/

--1. to_number : ���ڸ� ���ڷ�
select '1' +1 from dual;
select to_number('1')+1 from dual;

--2. to_char() : ���� > ���Ĺ���, ��¥ > ���Ĺ���
select sysdate || '��' from dual;
select to_char(sysdate) || '��' from dual;

select sysdate, to_char(sysdate,'YYYY') from dual; --������ �̱� (���ڷ� ���´�)

select sysdate, to_char(sysdate,'YYYY') || '��' as "YYYYY",
to_char(sysdate,'year'),
to_char(sysdate,'MM'),
to_char(sysdate,'DD'),
to_char(sysdate,'DAY'),
to_char(sysdate,'Dy')
from dual;

--Quiz
--�Ի����� 12���� ������� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ���
select empno, ename, hiredate, to_char(hiredate,'YYYY'), to_char(hiredate,'MM') from emp where to_char(HIREDATE,'MM') = '12';

select * from emp;
select empno, ename, hiredate, to_char(hiredate, 'YYYY') as "�Ի�⵵", to_char(hiredate,'MM') as "�Ի��" from emp where to_char(hiredate,'MM')=12;

select to_char(hiredate, 'YYYY"��" MM"��" DD"��"') from emp;

--to_char() :���� > ���� ����
--10000 > $10000 (�������·� �ٲ㼭 ó��)

-- ǥ ����Ŭ.pdf 71
select '>' || To_char(12345,'9999999999') || '<' from dual;
select '>' || To_char(12345,'09999999999') || '<' from dual; --> 00000012345<

select '>' || To_char(12345,'$9,999,999,999') || '<' from dual;
select sal, TO_CHar(sal,'$999,999') from EMP;


/*
��� ���̺����� ����� �̸��� last_name, first_name ���ļ� fullname ��Ī�ο��ؼ� ����ϰ�
�Ի����� yyyy-mm-dd�������� ����ϰ� ����(�޿�*12)�� ���ϰ� ������ 10%(����*1.1)�λ��� ���� ����ϰ�
�� ��� 1000���� �޸�ó���ؼ� ����ϼ���.
�� 2005�� ���� �Ի��ڸ� ����ϼ���. ������ ���� �� ���
*/
select last_name || ' '|| first_name as "�̸�", to_char(hiredate,'yyyy-MM-dd'), sal*12 from EMPLOYEES;

select * from employees;
select LAST_NAME||FIRST_NAME as "fullname", to_char(hire_date,'YYYY-MM-DD') as "�Ի���", SALARY, SALARY*12 as "����", to_char(SALARY*12*1.1,'999,999') as "�����λ�" 
from EMPLOYEES 
where to_char(hire_date,'YYYY') >= 2005--where HIRE_DATE>='2005-01-01' 
order by "����" desc;


-------------------------------------------------
--to_date() ���ڸ� ��¥��
select '2019-03-03' + 100 from daul;
select to_date('2019-03-03') + 100 from dual;

------------��ȯ �Լ� �� --------------
-------------------------------------

--�Ϲ��Լ�
--nbl(), nvl2() >> nulló�� �Լ�
--decode() �Լ� >> java if��
--case() �Լ� >> java switch��

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
--nvl2(��, null�� �ƴϸ�, null�̸�)
select id,job, nvl2(job, job || '�Դϴ�', 'empty') from t_emp;

--3
--decode (��赥���Ϳ��� ���� ���) if, switch �� ���
--decode(ǥ����, ����1, ���1, ����2, ���2, ����3, ���3 ...,default)
select id, job, decode(id, 100, 'It..', 200, 'sales..', 300, 'mgr..','etc..') from t_emp;

select job, decode(job,'it',1) from t_emp; --default �Ⱦ��� null�γ���
select count(decode(job,'it',1)) as "it",
        count(decode(job,'sales',1)) as "sales",
        count(decode(job,'mgr',1)) as "mgr" 
from t_emp;

--Quiz
--emp���̺����� �μ���ȣ�� 10�̸� '�λ��' 20�̸� '������', 30�̸� 'ȸ���' �������� ��Ÿ�μ� ��� ���
select * from emp;
select deptno, decode(deptno,10,'�λ��',20,'������',30,'ȸ���','��Ÿ�μ�') from emp;

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

--t_emp2 ���̺����� id�� jumin�����͸� ����ϵ� jumin�÷��� ���ڸ��� 1�̸� ����, 2�̸� ����, 3�̸� �߼� �׿� ��Ÿ ��� ���
select id, jumin, decode(substr(jumin,1,1),'1','����','2','����','3','�߼�','��Ÿ') as "����" from t_emp2;
select jumin, substr(jumin,1,1) from t_emp2;


--�μ���ȣ�� 20���� ����� smith�̸��̸� hello ���
--�μ���ȣ�� 20���� ����� smith�̸��ƴϸ� world ���
--20���� �ƴϸ� etc
select ename, deptno, decode(deptno, 20, decode(ename, 'SMITH', 'hello','world'),'etd') as "result" from emp;


--case��
--java: switch
/*
case ���ǽ�, when ���1 then ���1
            when ���2 then ���2
            when ���3 then ���3
            else ���4
end "�÷���"
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

select '0'|| to_char(zipcode), case zipcode when 2 then '����'
                    when 31 then '���'
                    when 32 then '����'
                    when 41 then '����'
                    else '��Ÿ����'
                    end as "region name" 
from t_zip;                    

--������̺����� ����޿��� 1000$���ϸ� '4��',1001�޷�~2000�޷����ϸ� '3��',2001�޷�~3000�޷����ϸ� '2��',3001�޷�~4000�޷����ϸ� '1��' 4000�̻��̸� 'Ư��'�� ���
select * from emp;
--1. case �÷��� when ��� then ��� 
--2. case when �÷��� ���� �񱳽� then **
select empno, ename, sal, case when sal <= 1000 then '4��'
                              when sal > 1000 and sal <=2000 then '3��'
                              when sal > 2000 and sal <=3000 then '2��'
                              when sal > 3000 and sal <= 4000 then '1��'
                              else 'Ư��'
                              end as "result"
from emp;

select empno, ename, sal, case when sal <= 1000 then '4��'
                              when sal between 1001 and 2000 then '3��'
                              when sal between 2001 and 3000 then '2��'
                              when sal between 3001 and 4000 then '1��'
                              else 'Ư��'
                              end as "result"
from emp;

-----------------------------------------------------------
----�����Լ�
----�����Լ�
----��¥�Լ�
----��ȯ�Լ� to_chat(), to_date(), to_number()
----�Ϲ��Լ� nvl(), nvl2(), decode(), case() ..
-----------------------------------------------------------


--�����Լ�
--1. count(*) �ƽ�Ʈ��ī  row ��, count(�÷���) >> �����ͰǼ� (null�� �������� �ʴ´�)
--2. sum()
--3. avg()
--4. max()
--5. min()

--1. �����Լ� Ư¡ group by���� ���� ���
--2. ��� �����Լ��� null���� �����Ѵ�.
--3. select ���� �����Լ� �̿ܿ� �ٸ� �÷��� ���� �ݵ�� �� �÷��� group by���� ���õǾ�� �Ѵ�.

select count(*) from emp; --14
select count(comm) from emp; --6 (null���� ���� ����)
select * from emp;
select count(empno) from emp; --14


select count(nvl(comm,0)) from emp;
--select nvl(comm,0) from emp;


--�޿��� ��
select sum(sal) as "�޿��� ��" from emp; --29025

--�޿��� ���
select round(avg(sal),0) as "�޿����" from emp;

--������� ȸ�� �� ������ �󸶳� ���޵���? (�������)
select trunc(avg(comm),0) from emp; --721
select trunc(sum(comm)/count(empno),0) from emp; --309
select trunc(avg(nvl(comm,0)),0) from emp; --309
--ȸ�� ������ ���� �ٸ���

--desc �� null���� �۾��� �۾��ϱ�
desc emp;
--�÷� is null�� Ȯ��
select count(*) from emp where comm is null;

select max(sal) from emp;
select min(sal) from emp;
--***point �����Լ��� ����� 1�� (1�Ǵ� �÷�1���� ��ȯ�ȴ�)

select empno, count(empno) from emp;-- group by empno; --empno 14��, ���� 1��
select sum(sal), avg(sal), max(sal), min(sal), count(sal), count(*) from emp; --1�ǿ� 1�ο� ���� �־

--------------
--�μ��� ��ձ޿�
select deptno, avg(sal) from emp group by deptno;
--������ ��� �޿��� ���ϼ���
select job, avg(sal) from emp group by job;

--������ ��ձ޿�, �޿� ��, �ִ�޿�, �ּұ޿�, �Ǽ��� ���ϼ���
select avg(sal), sum(sal), max(sal), min(sal), count(sal) from emp group by job;

/*
grouping ����
distinct �÷���1, �÷���2
order by �÷���1, �÷���2
group by �÷���1, �÷���2
*/

--�μ���, ������ �޿��� ���� ���ϼ���
select deptno, job, sum(sal), count(*) from emp group by deptno, job order by deptno;
select * from emp;

/*
select 4
from 1
where 2
group by 3
order by 5
*/

--������ ��ձ޿��� 3000�޷� �̻��� ����� ������ ��ձ޿��� ����ϼ���.
select * from emp;
--group by ������ - having  (��������� �޶� )
select job, avg(sal) from emp group by job;
select job, avg(sal) from emp group by job having avg(sal) >= 3000;

--from������ where
--group by ������ having

/*
select    5
from      1
where     2
group by  3
having    4
order by  6
*/

select * from emp;
--������̺����� ������ �޿����� ����ϵ� ������ ���޹ް� �޿��� ���� 5000�̻��� ������� ����� ����ϼ���
--�޿��� ���� ���� ������ ����ϼ���
--select sum(sal) from emp group by job having sum(sal+nvl(comm,0))>=5000 order by sum(sal) asc;
select job, sum(sal) from emp where comm is not null group by job having sum(sal)>=5000 order by sum(sal) asc;

--������̺����� �μ��ο��� 4������ ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����ϼ���.
select deptno, count(deptno), sum(sal) from emp group by deptno having count(deptno) >4;

--������̺����� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���
--��, �Ǹ�����(salesman)�� �����ϰ� �޿������γ����������� �����ϼ���
select job, sum(sal) from emp where job != 'SALESMAN' group by job having sum(sal) >5000 order by sum(sal) desc;


---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------

--190321
--[join] ���� ���̺� �˻�
--����Ŭ.pdf 85p

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

--join�� ����
--1. ����� (equui join) 70%
--�����̺��� �����Ǵ� ���̺��� �ִ� �÷��� �����͸� 1:1�� ����
--sql join����
--ansi���� (����) [inner] join on~ ������

select * from m, s where m.m1= s.s1; --null���� �񱳴���� �ƴϴ�
--����Ŭ ����
select m.m1, m.m2, s.s2 from m, s where m.m1= s.s1;
--ansi ����
select * from m inner join s on m.m1=s.s1; 

--where �� = ������
--where���� ���ι����� ����ϸ�, ����� join�̰��� ����� �������� ȥ��
--ansi������ ������ ���ǹ��� on�� ��´�.

select m.m1, s.s1, s.s2 from m join s on m.m1=s.s1; --inner��������

select * from m join x on m.m1=x.x1; --���εǴ� ���� ������(inner)
select m.m1, x.x1 from m join x on m.m1=x.x1;

--�����ȣ, ����̸�, ����μ���ȣ, ����μ��� ���
select * from emp join dept on emp.deptno=dept.DEPTNO;
select empno, ename, emp.deptno, dname from emp join dept on emp.deptno=dept.deptno;
select * from dept;

--join������ ��Ī�� ����Ҽ� �ִ�
select e.empno, e.ename, e.deptno, d.dname from emp e join dept d on e.deptno=d.deptno;

select * from m join s on m.m1=s.s1 join x on s.s1=x.x1;
select * from m, s, x where m.m1=s.s1 and s.s1=x.x1;

select m.m1, m.m2, s.s2, x.x2 from m join s on m.m1=s.s1 join x on s.s1=x.x1;

------------[hr]-------------
select * from EMPLOYEES;
select * from DEPARTMENTS;
select * from LOCATIONS;


--���. �̸�, �μ���ȣ, �μ��̸� ���
select e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME 
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID; --106
--������: ��� ��(1����) �����Ǿ���. >>������� ���� >> outer join���� �ؾ��Ѵ�.
select count(*) from EMPLOYEES; --107

--���, �̸�, �μ���ȣ, �μ��̸�, ������ȣ, ���� ���
select e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID, l.STREET_ADDRESS 
from EMPLOYEES e join departments d on e.DEPARTMENT_ID=d.DEPARTMENT_ID 
                join LOCATIONS l on d.LOCATION_ID=l.LOCATION_ID;

----------------
--2. [������]-------non-euqi join => �ǹ̸� ���� => ������ ����� ���� ���
--�����̺��� �����Ǵ� ���̺��� �ִ� �÷��� 1:1������ ���� �ʴ� ���
--ex)emp, salgrade

select * from emp;
select * from salgrade;
select e.empno, e.ename, e.sal, s.grade from emp e join salgrade s on e.sal between s.losal and s.hisal; 


---3. [�ܺ�����] outer join (equi join +null)
--outer join(�� �������� �ľ�) >> �ְ� �Ǵ� ���̺��� �����͸� �������� ��� (equi join�ϰ� ���� ������)
--����) left outer join(������ ��), right outer join(�������� ��), full outer join(�Ѵ� ��)
select * from m join s on m.m1=s.s1; --�Ϲ�����
select * from m left join s on m.m1=s.s1;
select * from m right join s on m.m1=s.s1;
select * from m full join s on m.m1=s.s1;

--���. �̸�, �μ���ȣ, �μ��̸� ���
select e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME 
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID; --106
--������: ��� ��(1����) �����Ǿ���. >>������� ���� >> outer join���� �ؾ��Ѵ�.
select count(*) from EMPLOYEES; --107

--���� ������̺��� �ִ��� Ȯ���Ѵ�.
select * from employees where DEPARTMENT_ID is null;
--178	Kimberely	Grant	KGRANT	011.44.1644.429263	07/05/24	SA_REP	7000	0.15	149	

select e.EMPLOYEE_ID, e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME 
from EMPLOYEES e left join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID;

---------------------------------
--4. self join �ڱ�����
--�ϳ��� ���̺����� Ư���÷��� �ٸ� �÷��� �����ϴ� ��� (�ڱ����̺����� �÷��� �÷��� �����Ҷ�)
select * from emp;
--������: ���̺��� �ϳ� ...  >> ����Ī�� ����ϸ� ���̺��� ������ó�� ����� �� �ִ�.
select * from emp e join emp m on e.mgr = m.empno; -- �׸��� ���� �̾ƾ��°�
select e.empno, e.ename, m.empno, m.ename from emp e left join emp m on e.mgr = m.empno;

--natural join : ��� ���ü��ִ� �������� �� ����ϴ°� (���Ǿ��� ��°���)
select * from m ,s;


--test
-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
select e.ENAME, e.DEPTNO, d.DNAME from EMP e join DEPT d on e.DEPTNO=d.DEPTNO;

-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸��� ����϶�.
select * from emp;
select * from dept;
select e.ename, e.job, e.DEPTNO, d.dname from emp e join dept d on e.DEPTNO=d.DEPTNO where d.loc='DALLAS'; 
 
-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
select * from emp;
select e.ename, d.dname from emp e join dept d on e.DEPTNO=d.DEPTNO where e.ename like '%A%'; 

-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������ ����ϴµ� ������ 3000�̻��� ����� ����϶�.
select e.ename, d.dname, e.sal from emp e join dept d on e.DEPTNO=d.DEPTNO where sal>=3000;
 
-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸��� �� ����� ���� �μ� �̸��� ����϶�.
select e.job, e.ename, d.dname from emp e join dept d on e.DEPTNO=d.DEPTNO where job='SALESMAN';
 
-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�, �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
select * from salgrade;
select e.empno as "�����ȣ", e.ename as "����̸�" , e.sal*12 as "����", e.sal+nvl(comm,0)*12 as "�Ǳ޿�", s.GRADE as "�޿����" 
from emp e join salgrade s on e.SAL between s.losal and s.hisal 
where comm is not null;

-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,����, �޿������ ����϶�.
select e.deptno, d.dname, e.ename, e.sal, s.grade 
from emp e join dept d on e.DEPTNO=d.DEPTNO join SALGRADE s on e.SAL between s.losal and s.hisal 
where d.deptno=10;
 
-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,����̸�, ����, �޿������ ����϶�. 
--�׸��� �� ��µ� ������� �μ���ȣ�� ���� ������, ������ ���� ������ �����϶�.
select e.deptno, d.dname, e.sal, s.GRADE 
from emp e join dept d on e.DEPTNO=d.DEPTNO join SALGRADE s on e.SAL between s.losal and s.HISAL 
where e.deptno in (10,20) 
order by e.deptno, e.sal desc;
 
-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� �������� �����ȣ�� ����̸��� ���
--������ �÷����� '�����ȣ', '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)
select * from emp;
select m.empno as "�����ȣ" , m.ename as "����̸�" , e.empno as "�����ڹ�ȣ" , e.ename as "�������̸�" 
from emp e RIGHT join emp m on e.empno=m.mgr;

select *
from emp e RIGHT join emp m on e.empno=m.mgr;

----------------------------
---------[��������]----------

--1.�Լ�
--2.����
--3.��������

--������̺����� ������� ��տ��޺��� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ����ϼ���.
select avg(sal) from emp;
select * from emp where sal > 2073;
select * from emp where sal > (select avg(sal) from emp);

--subquery
--1. single row subquery : subquery�� ����� 1���� row�� ���� �� (�����÷�)
--2. multi row subquery : subquery�� ����� 1�� �̻��� row (�����÷�)
--�����ϴ� ������: ���Ǵ� �������� ���̶�����
--multi row(in, not in)(any, all)
--all: sal > 1000 and sal > 2000 and ..
--any: sal > 1000 or sal > 2000 or ..

--���� �������� ����
--1. ��ȣ�ȿ� �־�� �Ѵ�. (select avg(sal) from emp)
--2. ���� �÷����� ���� >> �̷��� �ƴϴ� select sal, deptno from emp (x) >> ���������� �ϳ��� �����÷����� ���� �ޱ��.
--3. �ܵ����� ���డ���Ͽ��� �Ѵ�.

--�������� �������
--1. ���������� ���� ����
--2. subquery�� ����� ������ main query�� ����

--������̺����� jones�� �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ���
select sal from emp where ename like 'JONES';
select * from emp where sal > 2975;
select empno, ename, sal from emp where sal > (select sal from emp where ename like 'JONES');

--�޿��� 2000�޷� �̻���..
select sal from emp where sal >=2000; --���row�� 1�� �̻�
select * from emp where sal in (select sal from emp where sal >=2000); --��Ƽ�ο�� in�� ���
--sal = 2001 or sal=3000 or ..
select * from emp where sal not in (select sal from emp where sal >=2000);
--sal!= 2001 and sal!=3000 and ..

--���������� �ִ� ����� ����� �̸� ���
select mgr from emp;
select empno, ename from emp where empno in (select mgr from emp);
--empno=7902 or empno=7698 or empno=7839 or empno is null
select mgr from emp where mgr is not null;
select empno, ename from emp where empno not in(select mgr from emp where mgr is not null);
--empno!=7902 and empno!=7698 and empno!=7839 and empno is null

--���ǽĿ� null�� �ϳ��� ������ null
--not in��� �� null���� Ȯ���ؾ��Ѵ�.

--���ӻ���� king�� ����� ���, �̸�, ����, ������ ����� ���
select empno from emp where ename like 'KING';
select empno, ename, job, mgr from emp where mgr = (select empno from emp where ename like 'KING');

--20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� ���, �̸�, �޿�, �μ���ȣ�� ���
select max(sal) from emp where deptno=20;
select empno, ename, sal, deptno from emp where sal > (select max(sal) from emp where deptno=20);


--
select *
from emp
where deptno in (select deptno from emp where job='SALESMAN')
and sal in (select sal from emp where job='SALESMAN');
--

--Quiz
--�ڱ� �μ��� ��տ��޺��� �� ���� ������ �޴� ����� ���, �̸�, �μ���ȣ, �μ�����տ����� ���ϼ���
--1: �μ���ȣ, �μ���տ����� ��� �ִ� ���̺�
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
--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
select sal from emp where ename like 'SMITH';
select ename, sal from emp where sal > (select sal from emp where ename like 'SMITH');
 
--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����, �μ���ȣ�� ����϶�.
select sal from emp where deptno=10;
select ename, sal, deptno from emp where sal in (select sal from emp where deptno=10);
 
--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� �������� �̴µ� 'BLAKE'�� ���� ����϶�.
select deptno from emp where ename like 'BLAKE';
select ename, hiredate from emp where deptno = (select deptno from emp where ename like 'BLAKE') and ename != 'BLAKE';

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������ ����ϵ�, ������ ���� ��� ������ ����϶�.
select trunc(avg(sal),0) from emp;
select empno, ename, sal from emp where sal > (select trunc(avg(sal),0) from emp) order by sal desc;
 
--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ� �ִ� ����� �����ȣ�� �̸��� ����϶�.
select deptno from emp where ename like '%T%';
select empno, ename from emp where deptno in (select deptno from emp where ename like '%T%');

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� ������� ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)
select max(sal) from emp where deptno=30;
select ename, deptno, sal from emp where sal > (select max(sal) from emp where deptno=30);
--all
select ename, deptno, sal from emp where sal > all(select sal from emp where deptno=30);
 
--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� ����� �̸�, �μ���ȣ, ������ ����϶�.
select deptno from dept where loc = 'DALLAS';
select ename, deptno, job from emp where deptno = (select deptno from dept where loc = 'DALLAS'); 
select e.ename, e.deptno, e.job from emp e join dept d on e.deptno=d.deptno where d.deptno = (select deptno from dept where loc = 'DALLAS'); 
select ename, deptno, job from emp where deptno in (select deptno from dept where loc='DALLAS');

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.
select deptno from dept where dname like 'SALES';
select d.deptno, e.ename, e.job from emp e join dept d on e.deptno=d.deptno where d.deptno=(select deptno from dept where dname like 'SALES');
select deptno, ename, job from emp where deptno in (select deptno from dept where dname like 'SALES');
 
--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶� / king �� ����� ��� (mgr �����Ͱ� king ���)
select * from emp;
select empno from emp where ename like 'KING'; --7839
select ename, sal from emp where mgr = (select empno from emp where ename like 'KING');
 
--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ���� ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,�޿��� ����϶�.
select round(avg(sal),0) from emp;
select ename from emp where ename like '%S%';
select empno, ename, sal from emp where sal > (select round(avg(sal),0) from emp) and ename in(select ename from emp where ename like '%S%');
 
--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� ����� �̸�, ����, �μ���ȣ�� ����϶�.
select deptno from emp where comm is not null;
select sal from emp where comm is not null;
select deptno, sal from emp where deptno in (select deptno from emp where comm is not null) and sal in (select sal from emp where comm is not null);

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ���� ������� �̸�, ����, Ŀ�̼��� ����϶�.
select sal from emp where deptno=30;
select nvl(comm,0) from emp where deptno=30;
select ename, sal, comm from emp where sal not in(select sal from emp where deptno=30) and comm not in(select nvl(comm,0) from emp where deptno=30);

------------------------------------------
--insert, update, delete,
/*
DDL(������ ���Ǿ�): create, alter, drop, truncate(����������� ���ִ°�), rename, modify
DML(������ ���۾�): insert, update, delete
DQL(������ ���Ǿ�): select
DCL(������ �����): grant, revike
TCL(Ʈ������): commit, rollback, savepoint
*/

--DML�� Ʈ�������� �����Ѵ�.
--(A���࿡�� ����ؼ� B��� ���࿡ �Ա��ϴ� �� ) �ϳ��� ������ ģ��. : Ʈ������
--A��� ���¿� 100������ ����Ѵ�: update..
--B��� ���¿� 100������ �Ա��Ѵ�: update..
--�Ѵ� ����:commit
--�� �� �ϳ��� ����: rollback

--���̺� ��������
desc emp;
select * from tab; --tab���� �ٺ�
select * from tab where tname='BOARD'; --�����Ͱ� �ִٴ°��� �̹� ���� �����Ѵٴ� ��
select * from col; --col���� �ٺ�
select * from col where tname='EMP';
select * from user_tables;
select * from user_tables where table_name='DEPT';

----------------------------------------
--DML ����Ŭ 168.p
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])]
VALUES (value1[, value2, . . . . . . ]);
*/

create table temp(
  id number primary key, --id �÷����� null(x), �ߺ�������(x),������ ������1�Ǻ���,where id=10
  name varchar2(20) --default null���
);
desc temp;

--1. �Ϲ����� insert
insert into temp (id,name) values (100,'ȫ�浿');
select * from temp;
commit;

--2. �÷������ ���� (�Ⱦ��� �÷� ��ü�� ������� ����)
insert into temp values (200,'������');
select * from temp;
commit;

select * from temp;

--Quiz
insert into temp(id, name) values (100,'�ƹ���'); --unique constraint (%s.%s) violated
insert into temp(name) values ('�ƹ���'); --cannot insert NULL into (%s)

--�Ϲ� sql�� ���α׷����� ��� (x)
--PL-SQL (����, ���)

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
  regdate date default sysdate --default�� ����
);

select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid, name, regdate) values (100, 'ȫ�浿', '2019-03-21');

select * from temp3;
commit;

insert into temp3(memberid, name) values (200, '�ƹ���');
insert into temp3(memberid) values (300);
insert into temp3(name) values ('�ƹ���');


---------------------------------
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
select * from temp4;

--[�뷮������ ����]
--�䱸����: temp4�� �ִ� ��� �����͸� temp5�� �ְ� �;��
--insert into ���̺���(�÷�����Ʈ..) values(������Ʈ..);
--values �������� select ���� ���� �ִ�.
--insert into ���̺���(�÷�����Ʈ) select ���� .. (�� �÷��� ������ Ÿ���� �����ؾ��Ѵ�)

insert into temp5(num) select id from temp4; -- �� �÷������� Ÿ�� ���� 
select * from temp5;

--2. insert
--���̺��� ���� ��Ȳ���� [���̺�����]+[�뷮�����ͻ���]
--�� ���簳�� (���������� ���� �ȵǿ� (pk, fk)
--������ �������� (�÷��̸�, Ÿ��) ����

--create table ���̺��� (�÷��� Ÿ������)
create table copyemp as select * from emp;
select * from copyemp;
--as select *from ���̺� :  ����(��Ű��)+������ ���� ���� insert�Ѵ�.

create table copyemp2 as select empno, ename, sal from emp where deptno=30;
select * from copyemp2;

--����) ������ �����ϰ� �����ʹ� �����ϰ� ���� ������,,?
create table copyemp3 as select * from emp where 1=2; --1=2 �����϶�
select * from copyemp3;
desc copyemp3;

--tip
--����Ŭ �ý��� ���̺� (�پ��� ����)
--�������� (pk, fk..)�� �ɷ��ִ��� Ȯ���ؾ��Ѵ�.
select * from user_constraints where table_name='EMP'; --�����ʹ� ��� �빮�ڷ� �����Ѵ�.
select * from user_constraints where table_name='COPYEMP3';

create table pktest (id number primary key); --not null, unique
select * from user_constraints where table_name='PKTEST';
insert into pktest(id) values(100);
select * from pktest;

--���������� ������� �ʴ´�.
--���������� ������� �ʴ��� ����
create table pktest2 as select * from pktest;
select * from pktest2;
select * from user_constraints where table_name='PKTEST2';

-------------------------------
where ���� 
-----------

select * from copyemp;
update copyemp set sal=0;

select * from copyemp;
rollback;

update copyemp set sal=0 where deptno=20;

----update (set������ subquery���)
update copyemp set sal = (select sum(sal) from emp);
select * from copyemp;
rollback;

update copyemp set ename='AAA', job='BBB', hiredate=sysdate, sal = (select sum(sal) from emp) where deptno=10;
select * from copyemp where deptno=10;
commit;

---------------------------------------------------------------------------------
--[delete]
--��Ģ: delete > commit > �����Ұ� > ��������Ͱ� �ִٸ� ����
delete from copyemp;
select * from copyemp;
rollback;

delete from copyemp where deptno in (10,20);
select * from copyemp;
rollback;
------------------------------------------------------------
/*
 APP(JAVA) -> JDBC API -> DB�۾�(Oracle)
 
 CRUD
 
 Create : insert
 Read : select (��ü��ȸ, ������ȸ)
 Update : update
 Dellte : delete
 
 (DML: create, update, delete) Ʈ������� commit, rollback�� �����ؾ��Ѵ�.
 
 JDBC -> Oracle
 --��ü��ȸ(�Լ�), ������ȸ(�Լ�), ����(�Լ�), ����(�Լ�), ����(�Լ�)
 
 --public List<Emp> getEmpAllList(){ select * from emp ..}
 --public Emp getEmpListByEmpno(int empno){ select * from emp where empno=7788 }
 --public int insertEmp(Emp emp) {insert into emp(..) values (..)}
*/

-----------------------------------------------
--[DDL}
--create, alter, drop (���̺�����)

select * from user_tables where lower(table_name)='board';

drop table board;
create table board(
  boardid number,
  title varchar2(50),
  content varchar2(4000),
  regdate date
)

--------------------------------------------
--������ ���ϰ� ���..
--���̺���������
select * from user_tables where lower(table_name)='board';
--���̺�������������
select * from user_constraints where lower(table_name)='board';

--Oracle 11g �����÷�(�����÷�)
--�л� ������ ��� ���̺� : ����, ����, ����, �����÷�
--����, ����, ���� �����͸� insert�ϸ� �ڵ����� ������ ����������...

create table vtable(
 no1 number,
 no2 number,
 no3 number GENERATED ALWAYS as (no1+no2) VIRTUAL
);

insert into vtable(no1, no2) values (100,50);
select * from vtable;
insert into vtable (no1, no2) values(80,60);
-- no3���� ���� ���� ���� ����.

--�÷��� ���� ����
select * from user_tab_columns where table_name='VTABLE'; --DATA_DEFAULT ���� ��� Ȯ��

--�ǹ����� Ȱ���ϴ� �ڵ�
--��ǰ���� (�԰���) �б⺰ ������ (4�б�)
--�԰��� : 2019-03-01 >> 1�б�

create table vtable2(
  no number, --����
  p_code char(4), --��ǰ�ڵ�(A001, B002)
  p_date char(8), --�԰���(20190303)
  p_qty number, --����
  p_bungi number(1) GENERATED ALWAYS as (
    case when substr(p_date, 5,2) in ('01','02','03') then 1
        when substr(p_date, 5,2) in ('04','05','06') then 2
        when substr(p_date, 5,2) in ('07','08','09') then 3
        else 4
    end
  ) VIRTUAL
);

select * from vtable2;
desc vtable2;
select column_name, data_type, data_default from user_tab_columns where table_name='VTABLE2';

insert into vtable2(p_date) values ('20180101');
insert into vtable2(p_date) values ('20180406');
insert into vtable2(p_date) values ('20180301');
insert into vtable2(p_date) values ('20181201');

select * from vtable2;
commit;

---------------------------
--DDL ���̺� �ٷ��
--1. ���̺� �����ϱ�
create table temp6 (
  id number
);

insert into temp6 (username) values ('aa');
select * from temp6;

--2. ���̺� �����ߴµ� �÷� �߰��ϱ�
--�������̺��� �÷� �߰��ϱ�
desc temp6;
alter table temp6 add ename varchar2(20); 

--3. �������̺��� �ִ� �÷��� �̸��� �߸� ǥ�� (ename > username)
--���� ���̺��� �ִ� �÷��̸� �ٲٱ� (rename)
alter table temp6 rename column ename to username;
desc temp6;

--4. �������̺��� ���� �÷�Ÿ���� �߸� ���� ���
--�������̺��� Ÿ������ �����ϱ� (modify)
alter table temp6 modify(username varchar2(2000));
desc temp6;

--5. �������̺��� �ִ� ���� �÷� �����ϱ�
alter table temp6 drop column username;
desc temp6;

--6. �������̺��� �����ϰ� �ʹ�.
--6.1 �����͸� ����: delete
--���̺� ó�� ����� ó�� ũ�⸦ �ο� >> �����͸� �������� >> ������ũ�� ���� 
--ex) ó�� 1m >> 10���� >> 100m >> delete10���� ���� >> ������ ���̺��� ũ��� 100m
--??? ���̺� ������ �����ϸ� ������ ũ�Ⱑ �ٿ����� ���ϳ���?
-->> truncate (where�� ����), ������ �����ִ�. ���̺��� ����..
--ex) ó�� 1m >> 10���� >> 100m >> delete10���� ���� >> ������ ���̺��� ũ��� 1m

--7. ���̺����� (drop)
--�����͵� �����, ������ �����, ���̺��� �����.
drop table temp6;

select * from user_constraints where table_name='EMP'; --����ů not null������ ����
--**
create table temp7(
  --id number primary key --�������� ����(����ǥ��) SYS_Coo7oo9 �����̸��� ����� ����
  id number CONSTRAINT pk_temp7_id primary key, --������ ǥ�� : pk_���̺���_�÷���
  name varchar2(20) not null,
  addr varchar2(50)
);

select * from user_constraints where table_name='TEMP7';

insert into temp7(id, name, addr) values(10,'ȫ�浿','����� ������');
insert into temp7(id, name, addr) values(10,'������','����� ���ϱ�'); --unique constraint (%s.%s) violated
select * from temp7;
commit;

--1. primary key�� ���̺��� ����� �ɼ� �ֳ���? 
--A: 1�� (�������� ��� 1���� ����)

create table temp8(
 id number constraint pk_temp8_id primary key,
 name varchar2(20) not null,
 jumin char(6) constraint uk_temp8_jumin unique ,   -- �ߺ��� (x) >> null �� ��� >>   not null constraint uk_temp8_jumin ....
 addr varchar2(20)
 
);

select * from user_constraints where table_name='TEMP8';  

insert into temp8(id, name, jumin , addr)
values(10,'ȫ�浿','123456','��⵵');
commit;

insert into temp8(id, name, jumin , addr)
values(20,'����','123456','��⵵');   --"unique constraint (%s.%s) violated"   (x)


--null �� ����ұ�
insert into temp8(id, name, addr)
values(20,'����','��⵵');  --null ������ ���  (�ߺ�üũ �ɱ� ????)

select * from temp8;

insert into temp8(id, name, addr)
values(30,'�ƹ���','������');  -- null �ߺ�üũ �ȵǳ׿� �Ф�  (not null  unique �ΰ��� ������ ���� ���)

---------------------------------------------------------------------------------------------
--���̺� ���� �Ŀ� ���� �ɱ�

create table temp9 (id number);

--���� ���̺��� ���� �߰��ϱ�
--���� ) ���� �����Ͱ� ������ �����Ѵٸ� ������ �߰����� �ʾƿ�  >> �ߺ��� ������ >> ������ ���� >> ����
--���� �ɱ����� ������ �˻� �۾� ����

alter table temp9
add constraint pk_temp9_id primary key(id);
--add constraint pk_temp9_id_name primary key(id , name);
--2�� �÷��� ���� ���ļ� �ߺ����� �ƴϸ� �ǿ� 


select * from user_constraints where table_name='TEMP9';  

alter table temp9
add ename varchar2(20);

desc temp9;

--not null ���� �߰��ϱ�
alter table temp9
modify (ename not null);

desc temp9;
select * from user_constraints where table_name='TEMP9';  

--------------------------------------------------------------
-- [check ]����
-- where ���ǰ� ������ ������ ���� >> where gender in ('��','��');
create table temp10(
  id number constraint pk_temp10_id primary key,
  name varchar2(20) not null,
  jumin char(6) constraint uk_temp10_jumin unique,
  addr varchar2(20),
  age number constraint ck_temp10_age check(age >= 19) -- where age >= 19
);

select * from user_constraints where table_name='TEMP10';  

insert into temp10(id, name , jumin , addr , age)
values(100,'ȫ�浿','123456','�����',25);

select * from temp10;

insert into temp10(id, name , jumin , addr , age)
values(200,'������','123456','�λ��',18); --check constraint (BITUSER.CK_TEMP10_AGE) violated

commit;

---------------------------------------------------------------------------------------
--�������� : ���̺��� ���̺����� ���� >>
--EMP (deptno) �÷��� DEPT (deptno) �÷��� �����Ѵ�

create table c_emp
as
    select empno , ename, deptno from emp where 1=2;

create table c_dept
as
   select deptno , dname from dept where 1=2;
   
select * from c_emp;
select * from c_dept;

--1. �������� ( c_emp ���̺��� �ִ� deptno �÷��� ..... deptno �÷� insert  �Ǵ� �����ʹ�  c_dept ���̺� deptno ������
--�������߿� �ϳ��� insert , update ����

alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) references c_dept(deptno);
--�� �ڵ� ���� ERROR �߻�
--c_dept >> deptno ���� �����͸� ���� ���ž� ... (�� �ſ��־ ������ �ּ��� ....)
--deptno ������ �����ʹ� �ߺ������� ���� null �� ����� Primary key 

--c_dept >> deptno >> primary key ����

--1)
alter table c_dept
add constraint pk_dept_deptno primary key(deptno);

--2)
alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) references c_dept(deptno);

insert into c_dept(deptno , dname) values(100,'�λ���');
insert into c_dept(deptno , dname) values(200,'������');
insert into c_dept(deptno , dname) values(300,'ȸ����');
commit;


select * from c_dept;

--���Ի�� �Ի�
insert into c_emp(empno, ename)
values(100,'ȫ�浿'); -- FK �� not null ���� �ʾƿ� (null ���)
--���Ի���� �μ��� ���� ���� �� �ִ� 

--��Ģ : ���Ի���� ������ �μ��� ������ �Ѵ�   ( deptno not null  constaint ... FK...
------------------------------
insert into c_emp(empno , ename, deptno)
values(200, '�ƹ���',500);
--integrity constraint (BITUSER.FK_EMP_DEPTNO) violated - parent key not found

insert into c_emp(empno , ename, deptno)
values(200, '�ƹ���',300);


------------------------------
--���̺� (�θ�  , �ڽ� ���̺�)
--���̺� (master , detail)

--�ΰ� ���̺� deptno ���迡�� ..... (�θ�: c_dept(PK) , master)
--                                       (�ڽ� : c_emp(FK) , detail)
--c_emp ���̺�
--c_dept ���̺�

--������
select * from c_emp;
select * from c_dept;

--�̶� : c_dept ���̺����� 300 ������ ���� �Ұ��� (�������� �ִ� ������)\
delete from c_dept where deptno=300; --integrity constraint (BITUSER.FK_EMP_DEPTNO) violated - child record found
delete from c_dept where deptno=100; -- ���������� �ʴ� �����ʹ� ���� ����
rollback;
commit;


------------------------
------------------------
--�л� ���� ���̺�
--�й��� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�
--�̸� NULL ���� ������� �ʴ´�
--����
--����
--���� ���� �÷��� ���� Ÿ���̰� NULL ���� ���
--�� ���� �Է����� ������  default�� 0���� ���´�
--���� ,��� �÷��� �����÷�����(�����÷�) �����Ѵ�
--�а��ڵ�� �а� ���̺��� �а��ڵ带 �����Ѵ�
--�й� , �̸� , ���� , ���� , ���� , ���� , ��� , �а��ڵ�

--�а� ���̺�
--�а��ڵ� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�,
--�а��� �� null���� ������� �ʴ´�
--�а��ڵ� , �а���

--�׸��� select ����� �й� , �̸�  ����, ��� , �а��ڵ� , �а��� �� ����ϼ���

drop table student;
drop table major;

create table major(
  mid number constraint pk_major_mid primary key,
  mname varchar2(20)
);
desc major;
insert into major (mid, mname) values (100, '�濵��');
insert into major (mid, mname) values (200, '���а�');
insert into major (mid, mname) values (300, 'ȭ�а�');
select * from major;
commit;

create table student(
  sid number constraint pk_student_sid primary key,
  name varchar2(10) not null,
  kor number default 0,
  eng number default 0,
  mat number default 0,
  total number GENERATED ALWAYS as (kor+eng+mat) VIRTUAL,
  avg number GENERATED ALWAYS as (round((kor+eng+mat)/3,0)) VIRTUAL,
  mid number
);
desc student;

insert into student (sid, name, kor, eng, mat, mid) values (1, '�켼��', 100, 100, 98, 100);
insert into student (sid, name, kor, eng, mat, mid) values (2, '�赿��', 60, 30, 10, 200);
insert into student (sid, name, kor, eng, mat, mid) values (3, '������', 80, 90, 88, 300);
select * from student;
commit;

alter table student
add CONSTRAINT FK_student_mid foreign key(mid) references major(mid);

select * from student s join major m on s.mID=m.MID;


-----------------------------
--------------------------------
--190325
---View  ����Ŭ 192.pdf
--view��ü ... (�������̺�)
--create view ���̸� as [select����](view�� ���ؼ� �� �� �ִ� �����͸��)
--view�� ���̺�ó�� ��밡�� (�������̺�) -> emp, dept ���� ������ ���� ���
--view �޸𸮻󿡸� �����ϴ� �������̺� (subquery -> in line view -> from (select deptno from emp..))

--view�������̺�
--������ ���̺������� �����ϴ�. (select .. where .. )
--dml: insert, update, delete -> view�� ���ؼ� dml���� -> view�� �������ִ� (�� �� �ִ�) �� ���̺������͸� ����

--view�� ������ ������ �ʿ��ϴ�.
--GRANT CREATE VIEW TO "BITUSER" WITH ADMIN OPTION;
create view v_001
as
  select empno, ename from emp;
select* from v_001; --view�� ������ �ִ� sql������ �����Ѵ�.

--view������
--1.�������� ������ (join, subquert) �������̺�����
--2.������ (������ �ܼ�ȭ) -> ������ ������ �̸� ����� �ΰ� ���.
--3. ���ȼ� (����ó���� ���ؼ� �����ϰ� ���� �����͸� ��Ƽ� view�� �����. -> view������ �ο�
create view v_emp
as
  select empno, ename, job, hiredate from emp;
select * from v_emp;

--�ʿ��� �÷��� ��ȸ�ϱ�(����)
select * from v_emp;
select empno, ename from v_emp;
select * from v_emp where empno=7788;

--������(���� �ܼ�ȭ)
create view v_002
as
  select e.empno, e.ename, d.deptno, d.dname
  from emp e join dept d 
  on e.deptno=d.deptno; 
select * from v_002;
select * from v_002 where deptno=30;

create view v_003 --view�� �������̺��̴� (������: �� �÷��� �������->���۵� �÷��� �÷����� ������ ������ �ȵȴ�.)
as
  select deptno, avg(sal) as avgsal
  from emp
  group by deptno;


select * 
from emp e join v_003 s --������ from (..) �ζ������� ���
on e.deptno=s.deptno
where e.sal > s.avgsal;

--���̺��� 1���̻��̸� �ذ� ����
--����
--��������
--�� (�������̺��� ����)

/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]

OR REPLACE �̹� �����Ѵٸ� �ٽ� �����Ѵ�.
FORCE Base Table ������ ������� VIEW �� �����.
NOFORCE �⺻ ���̺��� ������ ��쿡�� VIEW �� �����Ѵ�.
view_name VIEW �� �̸�
Alias Subquery �� ���� ���õ� ���� ���� Column ���� �ȴ�.
Subquery SELECT ������ ����Ѵ�.
WITH CHECK OPTION VIEW �� ���� �׼��� �� �� �ִ� �ุ�� �Է�,���ŵ� �� �ִ�.
Constraint CHECK OPTON ���� ���ǿ� ���� ������ �̸��̴�.
WITH READ ONLY �� VIEW ���� DML �� ����� �� ���� �Ѵ�.
*/

--�� ����
--drop view v_007;
drop view v_007;

create or replace view v_007
as
  select avg(sal)as avgsal 
  from emp;

create or replace view v_007
as
  select round(avg(sal),0) as avgsal 
  from emp;
select * from v_007;

--view�� ���� dml�۾��� �����մϱ� (insert, update, delete)
--��, view�� ���ؼ� ���� �ִ� �����Ϳ� ���ؼ���
--���� view (1�� �̻��� ���̺� ����) -> dml�۾� �Ұ���� ����
--�ܼ� view (���̺� 1���� ���� view 


select * from v_emp; --view���ؼ� �� �� �ִ� ������ (empno, ename, job, hiredate)
update v_emp set sal=0; --view�� ���ؼ� sal�����͸� ���� ����. (xxx)
update v_emp set job='IT'; --�������̺��� ���� ������Ʈ �����ع�����..
select * from emp; --���������Ͱ� �ٲ�� ������...!
rollback;

create or replace view v_emp2
as
  select *
  from emp
  where deptno=20;
select * from v_emp2;

update v_emp2 set sal=0; --������ �ִ� ������ �� ������ �����ִ� �����͸� �ٲ��ش�.
select * from v_emp2;
select * from emp;
rollback;

select * from user_tables; --���̺���Ϻ���
select * from user_views; --�� ��� ����


------------------------------
--1. 30�� �μ� ������� ����, �̸�, ������ ��� view�� ���緯��
create view v_emp3
as
  select job, ename, sal from emp where deptno=30;
select * from v_emp3;

--2. 30�� �μ� �������  ����, �̸�, ������ ��� VIEW�� ����µ�, ������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������ 300���� ���� ����鸸 �����ϵ��� �϶�.
-- create or replace view view001 (�÷���, �÷���, .....)  
create or replace view v_emp4
as
  select job as "����", ename as "����̸�", sal as "����" from emp where sal > 300;
select *from v_emp4;

create or replace view v_emp8 (����, ����̸�, ����)
as
  select job, ename, sal
  from emp
  where deptno=30 and sal > 300;

--3. �μ��� �ִ����, �ּҿ���, ��տ����� ��� VIEW�� ������.
create or replace view v_emp5
as
  select max(sal) as "max", min(sal) as "min", avg(sal) as "avg" from emp;
select * from v_emp5;
       
--4. �μ��� ��տ����� ��� VIEW�� �����, ��տ����� 2000 �̻���
-- �μ��� ����ϵ��� �϶�.
create or replace view v_emp6
as
  select avg(sal) as "�μ��� ��� ����" from emp group by deptno having avg(sal)>2000;
select * from v_emp6;

--5. ������ �ѿ����� ��� VIEW�� �����, ������ MANAGER��
-- ������� �����ϰ� �ѿ����� 3000�̻��� ������ ����ϵ��� �϶�.
create or replace view v_emp7
as
  select sum(sal) as "������ �� ����" from emp where job != 'MANAGER' group by job having sum(sal)>3000;
select * from v_emp7;


--------------------------
---����Ŭ 11��  178.p--------
----������-----------------
-------------------------

--����
--���� �����ϱ�
--�ڵ����� ��ȣ�� �����ϴ� ��ü

/*
CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];


sequence_name SEQUENCE �� �̸��Դϴ�.
INCREMENT BY n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
START WITH n �����ϱ� ���� ù��° SEQUENCE �� ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
MAXVALUE n SEQUENCE �� ������ �� �ִ� �ִ� ���� ����.
NOMAXVALUE ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����.
MINVALUE n �ּ� SEQUENCE ���� ����.
NOMINVALUE ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����.
CYCLE | NOCYCLE �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ�
����. NOCYCLE �� ����Ʈ.
CACHE | NOCACHE �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ����
�ϴ°��� ����. ����Ʈ�� ����Ŭ ������ 20 �� CACHE.
*/

create table board(
  boardid number constraint pk_board_id primary key,
  title varchar2(100)
);

--boardidĮ�� (not null, unique, index �����ȴ�)
--������: boardid�����ʹ� 
--������: where boardid =? ������ 1���� return

--insert into board(boardid, title) values (..
--�׷��� �ߺ����� �ʰ�, null���� �ƴϴ� ��� ����

/*create table board(
  boardid number constraint pk_board_id primary key,
  title varchar2(100)
);
*/
--����: ó�� ���� ���� 1�̶�� ���� insert., �״������� 2��3��4 �������� ���� insert

create table board(
  boardid number constraint pk_board_id primary key ,
  title varchar2(100)
);

insert into board(boardid,title) values ((select count(boardid) +1 from board), '����');
insert into board(boardid,title) values ((select count(boardid) +1 from board), '����2');
select * from board;

delete from board where boardid=1; --1���� �������� �ߺ���
insert into board(boardid,title) values ((select count(boardid) +1 from board), '����3');
rollback;

insert into board(boardid, title) values ((select max(boardid)+1 from board), 'ó��');
insert into board(boardid, title) values ((select max(boardid)+1 from board), 'ó��2');
insert into board(boardid, title) values ((select max(boardid)+1 from board), 'ó��3');
select * from board;

delete from board where boardid=1; --1���� �������� �ߺ��ȵ�, ���ο� �ε��� â�� �Ұ�
select * from board;
insert into board(boardid, title) values ((select max(boardid)+1 from board), 'ó��4');


----------------------------
--sequence ��ȣ ����(��Ģ) : �ߺ����� ���� �������� �����͸� ���� �� �ִ�.
----------------------------
create sequence board_num;

select * from USER_SEQUENCES;
/*
1.4.1 NEXTVAL �� CURRVAL �ǻ翭

1) NEXTVAL �� ���� ��� ������ SEQUENCE ���� ��ȯ �Ѵ�.
2) SEQUENCE �� ������ �� ����, �ٸ� ����ڿ��� ������ ������ ���� ��ȯ�Ѵ�.
3) CURRVAL �� ���� SEQUENCE ���� ��´�.
4) CURRVAL �� �����Ǳ� ���� NEXTVAL �� ���Ǿ�� �Ѵ�.
*/

select board_num.nextval from dual; --return 1
select board_num.nextval from dual; --return 2

--������� �޴��� �򰥸� ��, ä������ �ʰ� ������ �˷��ش�
select board_num.currval from dual; --��������� ������ �˷��ش�.

create sequence kboard_num;

create table kboard(
  num number constraint pk_kboard_id primary key ,
  title varchar2(100)
);
select * from kboard;

insert into kboard(num, title) values (kboard_num.nextval, 'ó����');
insert into kboard(num, title) values (kboard_num.nextval, '�ι�°��');
insert into kboard(num, title) values (kboard_num.nextval, '����°��');
select * from kboard;
select kboard_num.currval from dual; --������� ��ȣ �˷���

--------------------
--1. sequence ��ü�ϳ� (���̺��� ������ü) >> �������� ���̺����� ��� ����(�����ϴ�)
--A(1)(4), B(2), C(3)

--����Ʈ(�Խ���)10��
--��ǰ�Խ���, �����ڰԽ���, ȸ���Խ���
--sequence ���� ���� ��� .. �ϳ��� sequence�� �����ص� �ȴ�.

--TIP)
--ms-sql : create table board(boardnum int identity(1,1), tutle varchar(20))
--insert into board(title) values('�氡') --> boardnum 1���� �ڵ� insert
--ms-sql 2012��������(sequence)
--my-sql:  create table board(boardnum int auto_increment, titlt varchar2(20))

-------------------------------------------
--sequence ��ü �ɼ�
create sequence seq_num
start with 10 --������ 10
increment by 2; --2�� �ö�

select seq_num.nextval from dual;
select seq_num.currval from dual;

--�Խ��� ���� insert
--�Խ��� �ֽű� ������ ���̱�
--select * from board order by boardnum desc;
-----------------------------------------------------
--������ �ʼ� 2
--rownum �ǻ��÷�: ���� ���������� �����ϴ� �÷��� �ƴϰ� ���������� �����ϴ� �÷� select�� ����� �������
--rownum: ������ ���̺��� �÷����� �������� ������, ���������� �࿡ ��ȣ�� �ο��� �� �ִ� �����÷�
--rowid: �ּҰ� (���� ������ ����Ǵ� ���� �ּҰ�) -> ���ؽ� ���� �� ���

select * from emp;
select rownum as "����", empno, ename from emp; --select�� ����� ������ ������ �ٿ��ش�.

--Top-n ����
--���̺����� ���ǿ� �´� ����(TOP)���ڵ� (row) ����
--MS-SQL ����
--select top 10, * from emp order by sal desc;
--Oracle
--rownum (�ǻ��÷� ����) : ��������
-----------------------------------
--rownum ���
--1. ������ ������ �����ϴ� �۾��� ���� ����Ǿ�� �Ѵ�.
--2. ������ �� ��Ȳ���� �տ� ������ ���δ�.
--3. ���ϴ� �������� �����Ͽ� �����͸� �����Ѵ�.

--1�ܰ�
select *
from(
  select * from emp order by sal desc
) e;
--2�ܰ�
select rownum as "num", e.*
from(
  select * from emp order by sal desc
) e;
--3�ܰ� (�޿� ���� �޴� ��� 5��)
select rownum as "num", e.*
from(
  select * from emp order by sal desc
) e where rownum <= 5;
---------------------------------
--alius����ϱ�
select *
from (
  select rownum as num, e.*
  from(
    select * from emp order by sal desc
  ) e
) n 
where num/3 <= 5;

---------------------------------------------
--emp ���̺����� �޿��� ���� �޴� ��� 5��
select * from(select * from emp order by sal desc) where rownum <=5;

--�Խ���
--1000�� ������
--10�Ǿ� ����� �����ֱ�
--��100��
--pagesize =10 ��ȭ�鿡 ������ ������ ������ �Ǽ� row��
--page���� >> 10
--1~10 1page (DB���� 1~10���� select ������ �� ���), 11~20 2page
--91~100 10page ������..

---------------------------------------------
--hr����
select * from EMPLOYEES;

--41~50��° ��������� ��� (���� ����� ���� ��)
--pagesize�� 10���� ��Ҵٴ� ����
--1~10, 11~20, 21~30, 31~40, 41~50 

select * 
from(select * from (select * from employees order by employee_id asc )where rownum <=50)
where rownum <=10;

select * 
from (
  select rownum as num, e.*
  from (
    select * from employees order by employee_id asc  --������
  ) e where rownum <=50
) s where num > 40;

select * 
from (
  select rownum as num, e.*
  from (
    select * from employees order by employee_id asc  --������
  ) e where rownum <=10
)s where num >0;

select * 
from (
  select rownum as num, e.*
    from (
      select * from employees order by employee_id asc  --������
    ) e 
)where num between 3 and 20;
    
--�Ǵ� between A and B >> where rownum between 10 and 20 ����
--------------------
--------------------
--3�� ������Ʈ����
--����, ���, Ŀ��, �Լ�, ���ν���, Ʈ����, ������ ���

-------------------------
--1�� ���� TEST50
--1> �μ����̺��� ��� �����͸� ����϶�.
 select * from emp;
 
--2> EMP���̺����� �� ����� ����, �����ȣ, �̸�, �Ի����� ����϶�.
 select job, empno, ename, hiredate from emp;
 
--3> EMP���̺����� ������ ����ϵ�, �� �׸�(ROW)�� �ߺ����� �ʰ� ����϶�.
 select distinct job from emp;
 
--4> �޿��� 2850 �̻��� ����� �̸� �� �޿��� ����϶�.
 select ename, sal from emp where sal>=2850;
 
--5> �����ȣ�� 7566�� ����� �̸� �� �μ���ȣ�� ����϶�.
 select ename, deptno from emp where empno=7566;
 
--6> �޿��� 1500�̻� ~ 2850������ ������ ������ �ʴ� ��� ����� �̸� �� �޿��� ����϶�.
select ename, sal from emp where sal not between 1500 and 2850;
 
--7> 1981�� 2�� 20�� ~ 1981�� 5�� 1�Ͽ� �Ի��� ����� �̸�,���� �� 
--�Ի����� ����϶�. �Ի����� �������� �ؼ� ������������ �����϶�.
 select ename, job, to_char(hiredate,'yyyy-MM-dd') as "��¥" 
 from emp 
 where hiredate between '1981-02-20' and '1981-05-01'
 order by hiredate;
 
--8> 10�� �� 30�� �μ��� ���ϴ� ��� ����� �̸��� �μ� ��ȣ��
-- ����ϵ�, �̸��� ���ĺ������� �����Ͽ� ����϶�.
 select ename, deptno from emp where deptno in (10,30) order by ename asc;
 
--9> 10�� �� 30�� �μ��� ���ϴ� ��� ��� �� �޿��� 1500�� �Ѵ�
-- ����� �̸� �� �޿��� ����϶�.
--(�� �÷����� ���� employee �� Monthly Salary�� �����Ͻÿ�)
 select ename as "employee", sal as "Monthly Salary" from emp where deptno in (10,30) and sal >1500;
 
--10> �����ڰ� ���� ��� ����� �̸� �� ������ ����϶�.
 select ename, job from emp where mgr is null;
 
--11> Ŀ�̼��� �޴� ��� ����� �̸�, �޿� �� Ŀ�̼��� ����ϵ�, 
-- �޿��� �������� ������������ �����Ͽ� ����϶�.
 select ename, sal, comm from emp where comm is not null order by sal desc;
 
--12> �̸��� �� ��° ���ڰ� A�� ��� ����� �̸��� ����϶�.
 select ename from emp where ename like '__A%';
 
--13> �̸��� L�� �� �� ���� �μ� 30�� �����ִ� ����� �̸��� ����϶�.
 select ename from emp where ename like '%L%L%' and deptno=30;
 
--14> ������ Clerk �Ǵ� Analyst �̸鼭 �޿��� 1000,3000,5000 �� 
-- �ƴ� ��� ����� �̸�, ���� �� �޿��� ����϶�.
select ename, job, sal from emp where job in ('CLERK','ANALYST') and sal not in (1000,3000,5000);
--select * from emp where job='ANALYST';

--15> �����ȣ, �̸�, �޿� �׸��� 15%�λ�� �޿��� ������ ǥ���ϵ� 
--�÷����� New Salary�� �����Ͽ� ����϶�.
select empno, ename, sal, round(sal*15,0) as "new salary" from emp;
 
--16> 15�� ������ ������ ����Ÿ���� �޿� �λ��(�� �޿����� ���� 
-- �޿��� �� ��)�� �߰��ؼ� ����϶�.(�÷����� Increase�� �϶�). 
select empno, ename, sal, round(sal*15,0) as "new salary", round(sal*15,0)-sal as "increase" from emp;
 
--18> ��� ����� �̸�(ù ���ڴ� 
-- �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸� ���̸� ǥ���ϴ�
-- ������ �ۼ��ϰ� �÷� ��Ī�� ������ �־ ����϶�.
select upper(substr(ename,1,1))||lower(substr(ename,2)) as "�̸�", length(ename) as "�̸�����" from emp;
 
--19> ����� �̸��� Ŀ�̼��� ����ϵ�, Ŀ�̼��� å������ ���� 
-- ����� Ŀ�̼��� 'no commission'���� ����϶�.
select ename, nvl(to_char(comm),'no commission') from emp;
 
--20> ��� ����� �̸�,�μ���ȣ,�μ��̸��� ǥ���ϴ� ���Ǹ� �ۼ��϶�.
select e.ename, d.deptno, d.dname from emp e join dept d on e.deptno=d.deptno;
 select empno, deptno, decode(deptno,10,'ACCOUNTING',20,'RESEARCH',30,'SALES',40,'OPERATIONS') as "dname" from emp;
 
--21> 30�� �μ��� ���� ����� �̸��� �μ���ȣ �׸��� �μ��̸��� ����϶�.
select e.ename, d.deptno, d.dname from emp e join dept d on e.deptno=d.deptno where d.deptno=30;
 
--22> 30�� �μ��� ���� ������� ��� ������ �μ���ġ�� ����϶�.
--(��, ���� ����� �ߺ����� �ʰ� �϶�.)
 select distinct e.job, d.loc from emp e join dept d on e.deptno=d.deptno where d.deptno=30;
 
--23> Ŀ�̼��� å���Ǿ� �ִ� ��� ����� �̸�, �μ��̸� �� ��ġ�� ����϶�.
select e.ename, d.dname, d.loc from emp e join dept d on e.deptno=d.deptno where comm is not null;
 
--24> �̸��� A�� ���� ��� ����� �̸��� �μ� �̸��� ����϶�.
select e.ename, d.dname from emp e join dept d on e.deptno=d.deptno where e.ename like '%A%';
 
--25> Dallas���� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ��̸��� ����϶�.
select e.ename, e.job, d.deptno, d.dname from emp e join dept d on e.deptno=d.deptno where d.loc='DALLAS';
 
--26> ����̸� �� �����ȣ, �ش� �������̸� �� ������ ��ȣ�� ����ϵ�,
-- �� �÷����� employee,emp#,manager,mgr#���� ǥ���Ͽ� ����϶�.
 select e.ename as "employee" , e.empno as "emp#" , m.ename as "manager" , m.empno as "mgr#" from emp e left join emp m on e.mgr=m.empno;
 select * from emp;
 
--27> ��� ����� �̸�,����,�μ��̸�,�޿� �� ����� ����϶�.
select * from salgrade;
 select e.ename, e.job, d.dname, e.sal, s.grade from emp e join dept d on e.deptno=d.deptno join salgrade s on e.sal between s.losal and s.hisal;
 
--28> Smith���� �ʰ� �Ի��� ����� �̸� �� �Ի����� ����϶�.
 select hiredate from emp where ename='SMITH';
 select ename, hiredate from emp where hiredate > ( select hiredate from emp where ename='SMITH');
 
--29> �ڽ��� �����ں��� ���� �Ի��� ��� ����� �̸�, �Ի���, 
-- �������� �̸�, �������� �Ի����� ����ϵ� ���� �÷����� 
-- Employee,EmpHiredate, Manager,MgrHiredate�� ǥ���Ͽ� ����϶�.
 select e.ename as "Employee" , e.hiredate as "EmpHiredate" , m.ename as "Manager" , m.hiredate as "MgrHiredate" 
 from emp e join emp m on e.mgr=m.empno 
 where e.hiredate < m.hiredate;
 
--30> ��� ����� �޿� �ְ���,������,�Ѿ� �� ��վ��� ����ϵ� 
-- �� �÷����� Maximum,Minimum,Sum,Average�� �����Ͽ� ����϶�.
 select max(sal) as "Maximum" , min(sal) as "Minimum" , sum(sal) as "Sum" , round(avg(sal),0) as "Average" from emp;
 
--31> �� �������� �޿� ������.�ְ���,�Ѿ� �� ��վ��� ����϶�.
 select job, min(sal), max(sal), sum(sal), trunc(avg(sal),0) from emp group by job;
 
--32> ������ ������ ��� ���� ������ ���� ����϶�.
 select job, count(job) from emp group by job;
 
--33> *******�������� ���� ����ϵ�, ������ ��ȣ�� �ߺ����� �ʰ��϶�.
-- �׸���, �÷����� Number of Manager�� �����Ͽ� ����϶�.
 select count(distinct(mgr)) as "Number of Manager" from emp;
 
--34> �ְ� �޿��� ���� �޿��� ������ ����϶�.
 select max(sal), min(sal), max(sal)-min(sal) from emp;
 
--35> *******������ ��ȣ �� �ش� �����ڿ� ���� ������� ���� �޿��� ����϶�.
-- ��, �����ڰ� ���� ��� �� ���� �޿��� 1000 �̸��� �׷��� ���ܽ�Ű�� 
-- �޿��� �������� ��� ����� ������������ �����϶�.
--select distinct mgr from emp where mgr is not null;
--select min(sal) from emp where mgr in (select distinct mgr from emp where mgr is not null);
select mgr, min(sal) from emp where mgr is not null group by mgr having min(sal)>1000 order by min(sal) desc;

select m.empno  as "������",  min(e.sal) as "�����޿�" 
from emp e, emp m 
where e.MGR = m.empno and e.sal > 1000 group by m.empno;

--36> �μ����� �μ��̸�, �μ���ġ, ��� �� �� ��� �޿��� ����϶�.
-- �׸��� ������ �÷����� �μ���,��ġ,����� ��,��ձ޿��� ǥ���϶�.
 select d.dname, d.loc, count(empno), avg(sal) from emp e join dept d on e.deptno=d.deptno group by d.dname, d.loc;
 
--37> Smith�� ������ �μ��� ���� ��� ����� �̸� �� �Ի����� ����϶�.
-- ��, Smith�� �����ϰ� ����Ͻÿ�
 select deptno from emp where ename like 'SMITH'; 
 select ename, hiredate from emp 
 where deptno =(select deptno from emp where ename like 'SMITH') and ename != 'SMITH';
 
--38> �ڽ��� �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ, �̸�, �޿��� 
--    ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �޿��� �������� ����� ������������ �����϶�.
 select round(avg(sal),0) from emp;
 select empno, ename, sal from emp where sal > ( select round(avg(sal),0) from emp) order by sal desc;
 
--39> �̸��� T�� ���� ����� ���� �μ����� �ٹ��ϴ� ��� ����� �����ȣ
-- �� �̸��� ����϶�.
 select deptno from emp where ename like '%T%';
 select empno, ename from emp where deptno in (select deptno from emp where ename like '%T%');
 
--40> �μ���ġ�� Dallas�� ��� ����� �̸�,�μ���ȣ �� ������ ����϶�.
 select e.ename, d.deptno, e.job from emp e join dept d on e.deptno=d.deptno where d.loc='DALLAS';
 
--41> KING���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�.
 select empno from emp where ename='KING';
 select ename, sal from emp where mgr=( select empno from emp where ename='KING');
 
--42> Sales �μ��� ��� ����� ���� �μ���ȣ, �̸� �� ������ ����϶�.
 select e.deptno, e.ename, e.job, d.DNAME from emp e join dept d on e.deptno=d.deptno where d.dname='SALES';
 
--43> �ڽ��� �޿��� ��� �޿����� ���� �̸��� T�� ���� ����� ������
-- �μ��� �ٹ��ϴ� ��� ����� ��� ��ȣ, �̸� �� �޿��� ����϶�.
 select round(avg(sal),0) from emp;
 select deptno from emp where ename like '%T%'; --20,30
 select * 
 from emp where sal > (select round(avg(sal),0) from emp) and deptno in ( select deptno from emp where ename like '%T%');
 
--44> Ŀ�̼��� �޴� ����� �޿��� ��ġ�ϴ� ����� �̸�,�μ���ȣ,�޿��� ����϶�.
 select sal from emp where comm is not null;
 select ename, deptno, sal 
 from emp 
 where sal in (select sal from emp where comm is not null);
 
--45> *****Dallas���� �ٹ��ϴ� ����� ������ ��ġ�ϴ� ����� �̸�,�μ��̸�,�� �޿��� ����Ͻÿ�
 select e.ename, d.dname, e.sal 
 from emp e join dept d on e.deptno=d.deptno 
 where d.deptno = (select deptno from dept where loc ='DALLAS');
 
 --select e.job from emp e join dept d on e.deptno=d.deptno where d.loc='DALLAS';
 select e.ename, d.dname, e.sal, d.loc, e.job
 from emp e join dept d on e.deptno=d.deptno
 where e.job in ( select e.job from emp e join dept d on e.deptno=d.deptno where d.loc='DALLAS');
 
--46> Scott�� ������ �޿� �� Ŀ�̼��� �޴� ��� ����� �̸�, �Ի��� �� �޿��� ����Ͻÿ�
 select sal from emp where ename ='SCOTT';
 select nvl(comm,0) from emp where ename='SCOTT';
 select ename, hiredate from emp where sal =( select sal from emp where ename ='SCOTT') and nvl(comm,0)=(select nvl(comm,0) from emp where ename='SCOTT');
 
 select * from emp;
--47> ������ Clerk �� ����麸�� �� ���� �޿��� �޴� ����� �����ȣ, �̸�, �޿��� ����ϵ�, ����� �޿��� ���� ������ �����϶�.
 select max(sal) from emp where job='CLERK'; --1300
 select empno, ename, sal from emp where sal > ( select max(sal) from emp where job='CLERK') order by sal desc;
  
--all : �ִ밪�� ��
--any : �ּҰ��� ��
select * from emp where sal > all(select sal from emp where job='CLERK') order by sal desc;

--48> �̸��� A�� ���� ����� ���� ������ ���� ����� �̸��� ����, �μ���ȣ�� ����϶�.
 select job from emp where ename like '%A%';
 select ename, sal, deptno from emp where job in ( select job from emp where ename like '%A%');
 
--49> New  York ���� �ٹ��ϴ� ����� �޿� �� Ŀ�̼��� ���� �����  ����̸��� �μ����� ����϶�.
--select sal from emp where deptno = (select deptno from dept where loc='NEW YORK');
--select nvl(comm,0) from emp where deptno = (select deptno from dept where loc='NEW YORK');
select ename, job, sal, comm 
from emp 
where sal in (select sal from emp where deptno = (select deptno from dept where loc='NEW YORK')) and
nvl(comm,0) in (select nvl(comm,0) from emp where deptno = (select deptno from dept where loc='NEW YORK'));

SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE
e.deptno= d.deptno
AND E.SAL IN(
          SELECT E.SAL
                FROM EMP E, DEPT D
                WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK'
                  )
AND NVL(COMM,0) IN(
               SELECT NVL(COMM,0)
               FROM EMP E, DEPT D
               WHERE E.DEPTNO=D.DEPTNO
                              AND LOC='NEW YORK');

--50> Dallas���� �ٹ��ϴ� ����� ���� �� �����ڰ� ���� ����� �����ȣ,����̸�, ����,����,�μ���,Ŀ�̼��� ����ϵ� 
--Ŀ�̼��� å������ ���� ����� NoCommission ���� ǥ���ϰ�, Ŀ�̼��� �÷����� Comm���� ������ ����Ͻÿ�.
--    ��, �ְ����޺��� ��µǰ� �Ͻÿ�
select deptno from dept where loc='DALLAS';
select job from emp where deptno = (select deptno from dept where loc='DALLAS');
select mgr from emp where deptno = (select deptno from dept where loc='DALLAS');
select empno, ename, job, sal, nvl(to_char(comm),'NoCommission') as "Comm" from emp where job in (select job from emp where deptno = (select deptno from dept where loc='DALLAS')) and
mgr in (select mgr from emp where deptno = (select deptno from dept where loc='DALLAS'));

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME,
NVL((TO_CHAR(E.COMM)),'NoCommision') AS "COMM"
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND JOB IN(SELECT JOB
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS')
AND MGR IN(SELECT MGR
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS');




