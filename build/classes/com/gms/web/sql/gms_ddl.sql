-- *********************

-- 1. major
-- 2. subject
-- 3. member
-- 4. prof
-- 5. student
-- 6. grade
-- 7. board


drop table board;

create table major(
	major_id char(10),
	title char(30),
	primary key(major_id)
);

create table subject(
	subj_id char(10),
	title char(10),
	major_id char(10),
	primary key(subj_id)
);

create table member(
	member_id char(20),
	name char(20),
	password char(20),
	ssn char(20),
	regdate date,
	major_id char(10),
	phone char(20),
	email char(20),
	profile char(20),
	primary key(member_id)
);

create table grade(
	grade_seq int auto_increment,
	score char(10),
	exam_date char(20),
	subj_id char(20),
	member_id char(20),
	primary key(grade_seq)
);

create table board(
	article_seq int auto_increment,
	member_id char(20),
	title char(30),
	content char(225),
	hitcount int,
	regdate date,
	primary key(article_seq)
);


