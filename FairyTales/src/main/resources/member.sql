
/* Drop Tables */

DROP TABLE reply_1to1 CASCADE CONSTRAINTS;
DROP TABLE board_1to1 CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board_1to1
(
	user_id varchar2(30) NOT NULL,
	board_num number NOT NULL,
	hitcount  number,
	new_date date,
	title varchar2(2000),
	secret varchar2(20) DEFAULT 'no',
	origin_file_name varchar2(2000),
	save_file_name varchar2(2000),
	PRIMARY KEY (board_num)
);


CREATE TABLE member
(
	nser_name varchar2(20) NOT NULL,
	user_id varchar2(30) NOT NULL,
	user_pwd varchar2(30) NOT NULL,
	user_age number(2,0) NOT NULL,
	phone_num number(10,0) NOT NULL,
	address varchar2(200),
	-- 관리자 or 사용자 선택
	level number(2,0) NOT NULL,
	date date DEFAULT sysdate,
	-- 일어동화, 퍼즐코딩
	subject varchar2(20),
	PRIMARY KEY (user_id)
);


CREATE TABLE notice
(
	user_id varchar2(30) NOT NULL,
	board_num number(3,0),
	title varchar2(100),
	hitcount number(3,0),
	date date DEFAULT sysdate,
	content varchar2(2000)
);


CREATE TABLE reply_1to1
(
	reply_num number NOT NULL,
	boar_num number NOT NULL,
	boar_num number,
	user_id  varchar2(50) NOT NULL,
	text varchar2(2000),
	PRIMARY KEY (reply_num)
);



/* Create Foreign Keys */

ALTER TABLE reply_1to1
	ADD FOREIGN KEY (boar_num)
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

COMMENT ON COLUMN member.level IS '관리자 or 사용자 선택';
COMMENT ON COLUMN member.subject IS '일어동화, 퍼즐코딩';



