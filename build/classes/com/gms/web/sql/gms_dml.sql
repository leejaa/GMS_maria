-- String id,pw,ssn,name,regdate;
SELECT * from MEMBER;
SELECT * FROM GRADE;
INSERT INTO MEMBER(id,name,password,ssn,regdate)
VALUES('JOJO','조조','1','570619-1336491',SYSDATE);
SELECT COUNT(*) AS COUNT FROM MEMBER;
SELECT * from BOARD;
INSERT INTO BOARD(article_seq,id,title,content,hitcount,regdate) VALUES(articles_seq.nextval,'DANNY','날씨가 좋다',
'무한한 가슴이 기쁘며, 힘있다. 일월과 피고, 발휘하기 없으면, ? 풀이 얼마나 모래뿐일 천고에 인간에 찾아 석가는 예가 때문이다. 방황하였으며, 이상 곧 만천하의 살 이것이다. 것은 피에 우리 이것이야말로 가장 가치를 이는 과실이 그리하였는가?',57,SYSDATE);
SELECT id FROM BOARD WHERE title LIKE '%장비%';
SELECT SUM(article_seq) sum FROM BOARD;
SELECT * FROM Member m,Board b
WHERE m.id=b.id
ORDER BY b.article_seq DESC;
SELECT * FROM MEMBER m,GRADE g,BOARD b
WHERE m.id=g.id AND m.id=g.id;
SELECT * FROM STUDENT;
SELECT * FROM member;
select * from subject;
update member set subj_id='2005';
select * from member order by regdate desc;
delete from member where rownum>300;
select * from subject;
select count(*) as count from student where name like '%';
select major_id, listagg(title,',') within group (order by title) title from subject group by major_id;
select * from student where name like 't';

-- 회원 리스트 수강과목까지 가지고 오기 !
select rownum no, t3.*
from
(select m.*,t2.title from member m
join
(select t.member_id,listagg(t.title,',') within group (order by t.title) title 
from 
(select m.*,s.title from member m
join MEMBER_SUBJECT ms on ms.member_id=m.member_id
join SUBJECT s on s.subj_id=ms.subj_id) t 
group by t.member_id) t2 on t2.member_id=m.member_id order by regdate asc) t3
order by no desc;

select rownum no, t3.* from (select m.*,t2.title from member m join (select t.member_id,listagg(t.title,',') within group (order by t.title) title from (select m.*,s.title from member m join MEMBER_SUBJECT ms on ms.member_id=m.member_id join SUBJECT s on s.subj_id=ms.subj_id) t group by t.member_id) t2 on t2.member_id=m.member_id order by regdate desc) t3;

select * from member;

create view student (num,member_id,name,password,ssn,regdate,major_id,phone,email,profile,gender,title)
as
select rownum no, t3.*
from
(select m.*,t2.title from member m
join
(select t.member_id,listagg(t.title,',') within group (order by t.title) title 
from 
(select m.*,s.title from member m
join MEMBER_SUBJECT ms on ms.member_id=m.member_id
join SUBJECT s on s.subj_id=ms.subj_id) t 
group by t.member_id) t2 on t2.member_id=m.member_id order by regdate asc) t3
order by no desc;

-- rownum 안쓰고 추출
select t.* from (select * from student where num>(select count(*) from student)-5) t;

SELECT ROWNUM num, t.* from (SELECT * FROM STUDENT) t where num between 6 and 10;

select t.* from (select rownum rnum,s.* from student s)t where t.rnum between 6 and 10;


select t2.*
from (select rownum seq,t.*
	from (select *
	from student
	order by num desc)t)t2
where t2.seq between ? and ?;

select t2.* from (select rownum seq,t.* from (select * from student order by num desc)t)t2 where t2.seq between ? and ?;


