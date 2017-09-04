-- DDL

-- ***********************
-- 1.Major
-- 2017.08.02
-- major_id,title
-- ***********************

CREATE TABLE Major(
	major_id VARCHAR2(10),
	title VARCHAR2(30),
	PRIMARY KEY(major_id)
	);


-- ***********************
-- 2.Subject
-- 2017.08.02
-- subj_id,title,major_id
-- ***********************
CREATE TABLE Subject(
	subj_id VARCHAR2(10),
	title VARCHAR2(10),
	major_id VARCHAR2(10),
	PRIMARY KEY(subj_id),
	FOREIGN KEY(subj_id) REFERENCES Major(major_id) ON DELETE CASCADE
);
-- ***********************
-- 3.Member
-- 2017.08.02
-- member_id,name,password,ssn,regdate,major_id,phone,email,profile
-- ***********************

CREATE TABLE Member(
	member_id VARCHAR2(10),
	name VARCHAR2(10),
	password VARCHAR2(10),
	ssn VARCHAR2(15),
	regdate DATE,
	major_id VARCHAR2(10),
	phone VARCHAR2(20),
	email VARCHAR2(20),
	profile VARCHAR2(20),
	PRIMARY KEY(member_id)
	);
	FOREIGN KEY(major_id) REFERENCES Major(major_id) ON DELETE CASCADE

-- ***********************
-- 4.prof
-- 2017.08.02
-- member_id,salary
-- ***********************
CREATE TABLE Prof(
	member_id VARCHAR2(10),
	salary VARCHAR2(10),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);

-- ***********************
-- 5.student
-- 2017.08.02
-- member_id,stu_no
-- ***********************

CREATE TABLE Student(
	member_id VARCHAR2(10),
	stu_no VARCHAR2(8),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);

-- ***********************
-- 6.GRADE
-- 2017.08.02
-- grade_seq,score,exam,date,subj_id,member_id
-- ***********************
CREATE TABLE Grade(
	grade_seq NUMBER,
	score VARCHAR2(3),
	exam_date VARCHAR2(12),
	subj_id VARCHAR2(10),
	member_id VARCHAR2(10),
	PRIMARY KEY(grade_seq),
	FOREIGN KEY(member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
	FOREIGN KEY(Subj_id) REFERENCES Subject(subj_id) ON DELETE CASCADE
);
-- ***********************
-- 7.board
-- 2017.08.02
-- 
-- ***********************
INSERT INTO BOARD(article_seq,id,title,content,hitcount,regdate) VALUES(articles_seq.nextval,'DANNY','날씨가 좋다',
'무한한 가슴이 기쁘며, 힘있다. 일월과 피고, 발휘하기 없으면, ? 풀이 얼마나 모래뿐일 천고에 인간에 찾아 석가는 예가 때문이다. 방황하였으며, 이상 곧 만천하의 살 이것이다. 것은 피에 우리 이것이야말로 가장 가치를 이는 과실이 그리하였는가?',57,SYSDATE);
CREATE TABLE Board(
	article_seq NUMBER,
	member_id VARCHAR2(20),
	title VARCHAR2(20),
	content VARCHAR2(3000),
	hitcount VARCHAR2(10),
	regdate DATE,
	PRIMARY KEY(article_seq),
	FOREIGN KEY(member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);

DELETE MEMBER WHERE MEMBER_ID LIKE '___';
SELECT * FROM member;
UPDATE MAJOR SET MAJOR_ID=4 WHERE TITLE='english';
INSERT INTO subject VALUES(seq.nextval,'c++',1);

DROP TABLE MAJOR CASCADE CONSTRAINTS PURGE;


SELECT * FROM Board;

-- DML

INSERT INTO MAJOR VALUES ('4','english'); 
VALUES(seq.nextval,'90','2017-03','java','hong');






select distinct
m.member_id,m.name,mj.title as major,q.score,sj.title
from member m,student s,grade g,subject sj,major mj
where
	m.member_id=s.member_id
	and m.member_id=g.member_id
	and sj.major_id=mj.major_id
	and sj.subj_id=g.subj_id;
	
	
select avg(score)
from (select distinct
m.member_id,m.name,mj.title as major,g.score,sj.title
from member m,student s,grade g,subject sj,major mj
where
	m.member_id=s.member_id
	and m.member_id=g.member_id
	and sj.major_id=mj.major_id
	and sj.subj_id=g.subj_id) t
where t.member_id='yr';


select t3.*
from
(select rownum No,t2.*
from
(select t.id id,avg(score) average
from (select distinct
	m.member_id id,m.name name,
	g.score score,s.title subject,g.exam_date
from Grade g
inner join Subject s on g.subj_id=s.subj_id
	  join Member m on m.member_id=g.member_id
) t
group by t.id
having avg(score)>=50
order by avg(score) desc) t2) t3
where No>5 and No<10;


select tt.id,tt.score
from
(select * from
(select m.member_id id,m.name,g.score,s.title as subject,b.title,b.content
from Board b 
inner join Grade g on g.member_id=b.member_id
	  join Member m on m.member_id=b.member_id
	  join Subject s on s.subj_id=g.subj_id) t
where t.subject='java'
order by t.score desc) tt
where rownum<=10;



create table male(
	seq number primary key,
	name varchar2(10)
);

create table female(
	seq number primary key,
	name varchar2(10)
);

drop table female;
select * from male;
delete male where seq=3;
insert into male values(2,'공유');
update male set seq=3 where name='이상순';

insert into male values(1,'송중기');
insert into male values(3,'공유');
insert into male values(2,'이상순');
insert into male values(4,'박보검');

insert into female values(1,'송혜교');
insert into female values(3,'이효리');

select m.seq No,m.name husband,f.name wife
from male m
	left outer join female f on m.seq=f.seq;
	
create table dep(
	seq number primary key,
	name varchar2(10)
);	

create table emp(
	id varchar2(10) primary key,
	name varchar2(10),
	seq number
);

insert into dep values(1,'영업부');
insert into dep values(2,'관리부');
insert into dep values(3,'생산부');
insert into dep values(4,'미래부');

insert into emp values('s','송중기',1);
insert into emp values('g','공유',2);
insert into emp values('l','이상순',3);
insert into emp(id,name) values('p','박보검');

select e.name,e.id,d.name
from emp e
full join dep d on d.seq=e.seq;

select * 
from emp e
where e.seq in
(select e.seq seq
from emp e
left join dep d on d.seq=e.seq);

create table stu(
	num number primary key,
	name varchar2(10),
	grade varchar2(10)
);

insert into stu values (4,'박보검','4');


create table emp(
	empno number primary key,
	ename varchar2(10),
	job number(10),
	mgr number(10),
	hiredate date,
	sal number(10),
	comm number(10),
	deptno number(10)
);

create table dep(
	deptno number primary key,
	dname varchar2(10),
	loc varchar2(10)
);

select * from emp;

insert into emp values(8,'렙몬',1000,null,'2011-02-07',2500,0,40);
insert into emp values(9,'슈가',4000,1,'2008-02-08',13000,0,40);
insert into emp values(10,'진',5000,1,'2017-02-08',2500,0,null);
update emp set mgr=null where empno=10;

insert into dep values(30,'영업부','수원');
insert into dep values(40,'생산부','분당');
insert into dep values(50,'기획부','서울');

select ename from (select * from emp order by hiredate asc) where rownum=1; 
select count(*) count from emp where deptno=30;

select job, avg(sal) salary 
from
(select job,sal from emp
where ename in
(select ename
from
(select * from emp
where job not in
(select job from emp where job=2000))
where sal>=3000))
group by job
order by salary desc;



select job, avg(sal) salary 
from
(select job,sal from emp
where ename in
(select ename
from
(select * from emp
where job not like
'salesman')
where sal>=3000))
group by job
order by salary desc;




select job,avg(sal) salary from
(select * from emp
where job not in
(select job from emp where job=2000)) t
group by job having avg(t.sal)>=3000
order by salary asc;

select max(sal)-min(sal) difference from emp;


select count(*) from emp where mgr=null;

select t1.ename,t2.deptno from emp t1,(select * from emp where not emp=null) t2;

select t1.ename, t2.dept
from emp t1
join (select * from emp where not mgr=null) t2 on t1.empno=t2.empno;

select ename from emp t1 where sal>=(select avg(sal) from emp group by sal where t1.ename);

select ename from emp where mgr is null;

select e.ename, d.dname 
from emp e
right join dep d on d.deptno=e.deptno;


select * from emp;
drop table emp;

select count(*) count,sum(sal) sum,avg(sal) avg from emp where deptno=30;

select count(*) from emp where mgr is not null;

select t1.ename
from emp t1
join (select avg(sal) from emp group by deptno)

select a.ename ename from emp a ,(select avg(sal) salary, deptno from emp group by deptno) b
where a.sal >= b.salary and a.deptno=b.deptno;

select ename from emp where deptno is null;


-- ---------------------------------------------------------------------------------------------

create table deleteStudent(
	stuno number primary key,
	name varchar2(20),
	userid varchar2(20),
	grade varchar2(20),
	birthday varchar2(20),
	tel varchar2(20),
	deptno number,
	profno varchar2(20)
	);

create table deleteProfessor(
	profno number primary key,
	name varchar2(20),
	userid varchar2(20),
	position varchar2(20),
	sal number,
	hiredate varchar2(20),
	comm number,
	deptno number
);

create table deletedept(
	deptno number primary key,
	dname varchar2(20),
	college number,
	loc varchar2(20)
);

create table deletesalgrade(
	grade number primary key,
	losal number,
	hisal number
);

insert into deletedept(deptno,dname,college,loc) values(101,'컴공',100,'1호관');
insert into deletedept(deptno,dname,college,loc) values(102,'멀티미디어',100,'2호관');
insert into deletedept(deptno,dname,college,loc) values(201,'전자공학',200,'3호관');
insert into deletedept(deptno,dname,college,loc) values(202,'기계공학',200,'4호관');
insert into deletedept(deptno,dname,college,loc) values(100,'정보미디어',10,null);
insert into deletedept(deptno,dname,college,loc) values(200,'메카',10,null);
insert into deletedept(deptno,dname,college,loc) values(10,'공과대학',0,null);

insert into deletesalgrade(grade,losal,hisal) values(1,100,300);
insert into deletesalgrade(grade,losal,hisal) values(2,301,400);
insert into deletesalgrade(grade,losal,hisal) values(3,401,500);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9001,'김유신','kim','교수',500,2014,20,101);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9002,'홍길동','hong','조교수',320,2013,0,201);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9003,'이순신','lee','전임강사',240,2015,0,102);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9004,'유관순','yoo','부교수',400,2010,17,202);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9005,'윤봉길','wan','교수',500,2010,30,101);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9006,'안중근','ahn','조교수',320,2011,40,201);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9007,'이봉창','bong','전임강사',240,2012,50,102);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9008,'김구','kim','부교수',400,2013,10,202);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9009,'이봉주','kim','부교수',400,2013,10,100);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9010,'김구라','gura','부교수',400,2013,10,10);

insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9011,'솔비','sol','부교수',400,2017,10,200);

update deleteprofessor set profno=9009 where name='이봉주';

insert into deletestudent(stuno,name,userid,grade,birthday,tel,deptno,profno)
values(5000,'이기붕','',2,'1990','01012345678',101,9001);

select * from deletestudent;
update deletestudent set height=175 where name='송중기';
alter table member add(
	height number
);
drop table deletestudent;

drop sequence student_seq;

CREATE SEQUENCE student_seq
START WITH 1002
INCREMENT BY 1
NOCACHE
NOCYCLE;

alter table deletestudent add(height number);

delete deletestudent where grade=4;

select * from tab;
desc deletedept;

select d.dname "부서명",p.name || '교수님' "교수 이름"  from deleteprofessor p
join deletedept d on d.deptno like p.deptno
where d.dname like '정보미디어';

select dname "NO.",deptno "부서 명"  from deletedept order by dname asc;

select * from deleteprofessor;
update deleteprofessor set comm=null where comm=0;
select distinct d.dname "학생등록부서" from deletestudent s 
join deletedept d on d.deptno=s.deptno;

select p.name || '  직급 :'  || position "공과대학 교수진" from deleteprofessor p 
join deletedept d on d.deptno=p.deptno
where d.dname='공과대학';

select p.name "이름",sal "급여",sal*12+100 "연봉" from deleteprofessor p 
join deletedept d on d.deptno=p.deptno
where d.dname='공과대학';


select d.dname "학과",s.stuno "학번",s.grade "학년", s.name "이름" from deletestudent s
join deletedept d on d.deptno=s.deptno
where s.deptno in
(select deptno from deletedept where college=10) and s.grade=1;


select s.grade "학년",d.dname "학과",s.stuno "학번", s.name "이름" from deletestudent s
join deletedept d on d.deptno=s.deptno
where s.deptno in
(select deptno from deletedept where college=10)
and s.grade>1
order by s.stuno asc;

select s.grade "학년",d.dname "학과",s.stuno "학번", s.name "이름" from deletestudent s
join deletedept d on d.deptno=s.deptno
where d.dname='메카' and s.grade=4;

select s.grade "학년",d.dname "학과",s.stuno "학번", s.name "이름",s.height "키" from deletestudent s
join deletedept d on d.deptno=s.deptno
where s.deptno in
(select deptno from deletedept where college=10) and s.height between 160 and 180;

select s.grade "학년",d.dname "학과",s.stuno "학번", s.name "이름" from deletestudent s
join deletedept d on d.deptno=s.deptno
where s.deptno in
(select deptno from deletedept where dname='컴공' or dname='메카');

select s.grade "학년",d.dname "학과",s.stuno "학번", s.name "이름" from deletestudent s
join deletedept d on d.deptno=s.deptno
where s.deptno in
(select deptno from deletedept where college=10)
or s.name like '송%';

select userid "아이디", name "이름", position "직책", comm "커미션" from deleteprofessor
where comm is null;

-- -----------------------------------------------
--15
select * from deleteprofessor;

select d.dname "학과", f.profno "No.",f.name || '교수' "이름" from deleteprofessor f
join deletedept d on d.deptno like f.deptno
where d.dname like '메카'
union all
(select d.dname "학과", s.stuno "No.",s.name || '학생' "이름" from deletestudent s
join deletedept d on d.deptno like s.deptno
where d.dname like '메카');
-- 16
select d.dname from deletedept d 
join deletestudent s on s.deptno=d.deptno
where s.name like '송중기'
intersect
select d.dname from deletedept d 
join deletestudent s on s.deptno=d.deptno
where s.name like '톕쀧솴';

-- 17 교수진중 정교수가 되지 못한 교수진 목록 minus 연산자를 사용할 것
select name "이름" from deleteprofessor
minus
select name from deleteprofessor where position like '교수';

--18. 전체 학생들의 학번과 이름은 성만 표기된 상태로 목록 rpad()과 substr() 내장함수 사용
select stuno "학번",rpad(substr(name,1,1),4,'*') "이름" from deletestudent;

--19. 전체 학생들의 학번과 이름, 생년이 표기된 목록 instr()과 substr() 내장함수 사용
select stuno "학번",name "이름", substr(birthday,1,instr(birthday,'-',1,1)-1) "생년" from deletestudent;


--------------------------------------
select to_char(sysdate,'yyyy/MM/dd')
from dual;
select to_date(sysdate)
from dual;
select
floor(months_between(sysdate,to_date('19840213','YYYYMMDD'))/12) 나이 from dual;

select stuno "학번", name "이름", (select floor(months_between(sysdate,to_date('19840213','YYYYMMDD'))/12) "나이")
from deletestudent;

-- 만나이 계산
select stuno "학번", name "이름",floor(months_between(sysdate,to_date(birthday,'YYYY-MM-DD'))/12) "나이"
from deletestudent where name='뇑핚쬅';

-- null값은 0으로 치환하는 내장함수
select name,position "POS",sal, nvl2(comm,comm/100,0)  "COMMISTION",nvl(sal+comm/sal,0) "TOTAL" from deleteprofessor;

select * from deleteprofessor;

-- decode 함수
select f.name "교수",f.deptno "학과번호", d.dname "부서명", 
decode(f.deptno,100,'학부',200,'학부','학과') "부서" 
from deleteprofessor f
join deletedept d on d.deptno=f.deptno;

-- case 함수
select stuno, name,height,
	case 
		when height<160 then 'D'
		when height between 160 and 179 then 'C'
		when height between 179 and 180 then 'B'
		else 'A'
		end height_grade
from deletestudent;
-------------------------------------------------
-- groupby-----------------------------------------

select d.deptno, d.dname, s.avg from deletedept d,(select deptno, avg(height) avg from deletestudent group by deptno) s
where d.deptno=s.deptno;


select deptno, count(*), count(comm) from deleteprofessor group by deptno;
-------------------------------------------------

select rownum No, t.*
from
(select d.dname,s.grade,count(*) "인원수",avg(s.height) "평균키" from deletestudent s
join deletedept d on d.deptno=s.deptno
group by d.dname,s.grade
order by dname,grade) t;

select rownum No, t.*
from
(select d.dname,s.grade,count(*) "인원수",avg(s.height) "평균키" from deletestudent s
join deletedept d on d.deptno like s.deptno
group by d.dname,s.grade having s.grade > 2
order by dname,grade) t;

select * from deleteprofessor;
insert into deleteprofessor values(9012,'정현석','jun','전임강사',100,2017,10,103);
insert into deleteprofessor values(9013,'제임스','james','부교수',100,2017,10,103);

select floor(max(t.avg)) || 'cm' "최대 평균키"
from
(select avg(height) avg from deletestudent
group by deptno) t;

select deptno,grade,count(*) from deletestudent group by rollup(deptno,grade);

select deptno,grade,count(*) from deletestudent group by cube(deptno,grade);

--join 을 간결하게 하기 위해 using을 쓰면 된다
select * from deletestudent s
right join deleteprofessor f using (deptno);

select s.name,s.grade,f.name,f.position from deletestudent s
right join deleteprofessor f using (deptno) order by s.name desc;

select * from deletestudent s
join deleteprofessor f using (deptno);

-- self join
select t1.dname || '>' || t2.dname 소속 from deletedept t1
join deletedept t2 on t1.deptno=t2.college;
order by t1.college,t2.college,t2.dname;

-----------------------------------------------------------
select * from deletedept;
-- 유관순이랑 같은 직급 교수 추출
select name,position from deleteprofessor where position like (select position from deleteprofessor where name like '유관순');
-- id가 song인 학생과 같은 학년인 학생들 목록
select * from deletestudent where grade=(select grade from deletestudent where userid like 'song');
-- 컴공과 학생들의 평균키보다 작은 전교 학생들의 집합
select * from deletestudent where height<
(select floor(avg(height)) from deletestudent s 
join deletedept d on s.deptno like d.deptno where d.dname like '컴공');
--37
select s.stuno,s.name,d.dname from deletestudent s
join deletedept d on d.deptno like s.deptno
where s.deptno in (select deptno from deletedept where college like 100) order by s.stuno asc;
--38
select stuno,grade,name,height from deletestudent where height>any(select height from deletestudent where grade like 4);
--39
select stuno,name,height from deletestudent where height>all(select height from deletestudent where grade like 4);
--40
select * from deleteprofessor where exists (select comm from deleteprofessor where comm is not null);
--41
select 0 id_exist
from dual where not exists (select userid from deletestudent where userid like 'hong');
--42
select * from deletestudent s1,(select grade,min(height) min from deletestudent group by grade) s2
where s1.height like s2.min and s1.grade like s2.grade;
--43
select name,grade,height from deletestudent where height>(select avg(height) from deletestudent);

-- 각 부서별 평균키보다 큰 학생들 출력
select deptno,grade,name,height from deletestudent s1
where height > (select avg(height) from deletestudent s2 where s1.deptno like s2.deptno);

-- 고용일 입력
insert into deleteprofessor(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9008,'팀','tim','전임강사',260,to_date('2015/01/01','yyyy/MM/dd'),null,101);

-- grade 서브 테이블 작성하고 일괄 값 입력하기

create table grade_one(
	userid varchar2(20) primary key,
	grade number);
create table grade_two(
	userid varchar2(20) primary key,
	grade number);
create table grade_thr(
	userid varchar2(20) primary key,
	grade number);
create table grade_four(
	userid varchar2(20) primary key,
	grade number);
insert all
when grade like 4 then
	into grade_four values(stuno,grade)
when grade like 3 then
	into grade_four values(stuno,grade)
when grade like 2 then
	into grade_four values(stuno,grade)
when grade like 1 then
	into grade_four values(stuno,grade)
	select stuno,grade
	from deletestudent
	where grade<5;
	
select * from grade_one;
truncate table grade_one;

rollback;
select * from deleteprofessor;
delete from deleteprofessor where profno like 9013;

update deleteprofessor set comm=(select comm from deleteprofessor where name like '윤봉길') where name like '김유신';

-- 부서번호 101번의 교수를 전부 삭제
delete from deleteprofessor where deptno like
(select deptno from deletedept where deptno like 101);


--------------------------------------------------------------
