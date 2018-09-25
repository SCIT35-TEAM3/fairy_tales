
/* Drop Tables */

DROP TABLE reply_1to1 CASCADE CONSTRAINTS;
DROP TABLE board_1to1 CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

-- Drop sequence
DROP sequence board_1to1_seq;
DROP sequence notice_seq;
DROP sequence reply_1to1_seq;

/* Create Tables */

--고객게시판
CREATE TABLE board_1to1
(
	user_id varchar2(30) NOT NULL,
	board_num number NOT NULL,
	hitcount  number,
	new_date date DEFAULT sysdate,
	title varchar2(200),
             text varchar2(4000),
	secret varchar2(20) DEFAULT 'no',
	origin_file_name varchar2(2000),
	save_file_name varchar2(2000),
	PRIMARY KEY (board_num)
);

--고객게시판 시퀀스 생성
create sequence board_1to1_seq;

-- 회원
CREATE TABLE member
(
	user_name varchar2(20) NOT NULL,
	user_id varchar2(30) NOT NULL,
	user_pwd varchar2(30) NOT NULL,
	user_age number(2,0) NOT NULL,
	phone_num varchar2(20) NOT NULL,
	user_email varchar2(30) NOT NULL,
	address varchar2(200),
	-- 관리자 or 사용자 선택
	user_level number(2,0) DEFAULT 2,
	new_date date DEFAULT sysdate,
	-- 일어동화, 퍼즐코딩
	subject varchar2(100),
	PRIMARY KEY (user_id)
);

--공지사항
CREATE TABLE notice
(
	user_id varchar2(30) NOT NULL,
	board_num number(3,0),
	title varchar2(100),
	hitcount number DEFAULT 0,
	new_date date DEFAULT sysdate,
	content varchar2(2000)
);

--공지사항 시퀀스 생성
create sequence notice_seq;

--고객게시판 댓글
CREATE TABLE reply_1to1
(
           reply_num number PRIMARY KEY ,
           board_num number not null,
           user_id VARCHAR2(50) not null,
           reply_title VARCHAR2(200) not null,
           text VARCHAR2(2000),
           new_date date DEFAULT sysdate
);

--댓글 시퀀스 생성
create sequence reply_1to1_seq;

/* Create Foreign Keys */

ALTER TABLE reply_1to1
	ADD FOREIGN KEY (board_num)
	REFERENCES board_1to1 (board_num)
;


ALTER TABLE board_1to1
	ADD FOREIGN KEY (user_id)
	REFERENCES member (user_id)
;

ALTER TABLE notice
	ADD FOREIGN KEY (user_id)
	REFERENCES member (user_id)
;



/* Comments */
COMMENT ON COLUMN member.user_level IS '관리자 or 사용자 선택';
COMMENT ON COLUMN member.subject IS '일어동화, 퍼즐코딩';

insert into member (user_id,user_pwd,user_name,	user_age,phone_num	,user_email,address,user_level)
		values('manager','1234'	,'관리자1',33,'010-1111-1111','nam7318@naver.com','서울시 삼성동 scit master',1);

/* 로그인 이력 */
DROP TABLE member_log CASCADE CONSTRAINTS;

CREATE TABLE member_log
(
	-- 사용자 ID
	user_id varchar2(30) NOT NULL,
	-- 회원 접속일
	member_access date DEFAULT sysdate NOT NULL
);

ALTER TABLE member_log
	ADD FOREIGN KEY (user_id)
	REFERENCES member (user_id)
;



COMMENT ON COLUMN member_log.user_id IS '사용자 ID';
COMMENT ON COLUMN member_log.member_access IS '회원 접속일';

/******************               GAME               *************************/

DROP TABLE wrong CASCADE CONSTRAINTS;
DROP sequence wrong_seq;
DROP TABLE member_fairy CASCADE CONSTRAINTS;
DROP sequence member_fairy_seq;
DROP TABLE question CASCADE CONSTRAINTS;
DROP sequence question_seq;
DROP TABLE fairytales CASCADE CONSTRAINTS;
DROP sequence fairytales_seq;

/* Create Tables */

--동화
CREATE TABLE fairytales
(
	fairy_pk number NOT NULL,
	fairy_name varchar2(100) NOT NULL,
	-- 01 : IT
	-- 02 : 일본어
	fairy_code varchar2(10) NOT NULL,
	fairy_chapter number NOT NULL,
	fairy_position varchar2(200) NOT NULL,
	fairy_level number NOT NULL,
	PRIMARY KEY (fairy_pk)
);
create sequence fairytales_seq;

-- 회원 동화
CREATE TABLE member_fairy
(
	mf_pk number NOT NULL,
	user_id varchar2(30) NOT NULL,
	fairy_pk number NOT NULL,
	-- 해당 동화를 처음 접속한 날짜(통계)
	in_date date DEFAULT sysdate NOT NULL,
	-- 해당 동화를 마지막으로 접속한 날짜(통계)
	last_date date DEFAULT sysdate NOT NULL,
	-- 문제의 진행률 삭제예정
	progress number DEFAULT 0 NOT NULL,
	-- 진행된 챕터
	chapter number DEFAULT 0 NOT NULL,
	PRIMARY KEY (mf_pk)
);

--문제 시퀀스 생성
create sequence member_fairy_seq;

--문제
CREATE TABLE question
(
	question_pk number NOT NULL,
	fairy_pk number NOT NULL,
	-- 문제의 답
	answer varchar2(200) NOT NULL,
	chapter number NOT NULL,
	-- 챕터의 몇번째 화면
	screen number NOT NULL,
	PRIMARY KEY (question_pk)
);

--문제 시퀀스 생성
create sequence question_seq;

--틀린문제
CREATE TABLE wrong
(
	wrong_pk number NOT NULL,
	mf_pk number NOT NULL,
	question_pk number NOT NULL,
	PRIMARY KEY (wrong_pk)
);

--틀린문제 시퀀스 생성
create sequence wrong_seq;

/* Create Foreign Keys */

ALTER TABLE member_fairy
	ADD FOREIGN KEY (fairy_pk)
	REFERENCES fairytales (fairy_pk)
;

ALTER TABLE question
	ADD FOREIGN KEY (fairy_pk)
	REFERENCES fairytales (fairy_pk)
;

ALTER TABLE member_fairy
	ADD FOREIGN KEY (user_id)
	REFERENCES member (user_id)
;

ALTER TABLE wrong
	ADD FOREIGN KEY (mf_pk)
	REFERENCES member_fairy (mf_pk)
;

ALTER TABLE wrong
	ADD FOREIGN KEY (question_pk)
	REFERENCES question (question_pk)
;

/* Comments */

COMMENT ON COLUMN fairytales.fairy_code IS '01 : IT
02 : 일본어';
COMMENT ON COLUMN member_fairy.in_date IS '해당 동화를 처음 접속한 날짜(통계)';
COMMENT ON COLUMN member_fairy.last_date IS '해당 동화를 마지막으로 접속한 날짜(통계)';
COMMENT ON COLUMN member_fairy.progress IS '문제의 진행률 삭제예정';
COMMENT ON COLUMN member_fairy.chapter IS '진행된 챕터';
COMMENT ON COLUMN question.answer IS '문제의 답';
COMMENT ON COLUMN question.screen IS '챕터의 몇번째 화면';

commit;

