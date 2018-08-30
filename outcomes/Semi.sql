
--테이블 초기화
DROP TABLE board;
DROP TABLE userInfo;
DROP TABLE recruit;
DROP TABLE reply; 
DROP TABLE login_log;
DROP TABLE tech;
DROP TABLE "project";
DROP TABLE project_tech; 
DROP TABLE "location";
DROP TABLE code;
DROP TABLE code_category;
DROP TABLE code_tech;
DROP TABLE attach_file;
DROP TABLE file_type;
DROP SEQUENCE board_seq; 
DROP SEQUENCE reply_seq;
DROP SEQUENCE tech_seq;
DROP SEQUENCE project_seq;
DROP SEQUENCE location_seq;
DROP SEQUENCE code_seq;
DROP SEQUENCE code_category_seq;
DROP SEQUENCE attach_file_seq;

-- 게시판
CREATE TABLE board (
    board_no        NUMBER NOT NULL,
    board_category  VARCHAR2(50),
    board_title     VARCHAR2(100),
    board_user      VARCHAR2(50),
    board_read      NUMBER,
    board_recommend NUMBER,
    board_create    DATE,
    board_modify    DATE,
    board_content   VARCHAR2(1500),
    board_tech      NUMBER,
    
    CONSTRAINT board_pk PRIMARY KEY (board_no)
);
CREATE SEQUENCE board_seq START WITH 10000;

--회원정보
CREATE TABLE userInfo (
    user_email      VARCHAR2(50) NOT NULL,
    user_nick       VARCHAR2(100),
    user_pw         VARCHAR2(50),
    user_level      VARCHAR2(50),
    user_registdate DATE,
    user_intro      VARCHAR2(500),
    user_photo      VARCHAR2(500),
    
    CONSTRAINT user_PK  PRIMARY KEY (user_email)
);

--구인구직
CREATE TABLE recruit (
    board_no    NUMBER NOT NULL,
    recurit_status  VARCHAR2(50),
    
    CONSTRAINT recruit_PK   PRIMARY KEY (board_no)
);

-- 댓글
CREATE TABLE reply (
    reply_no        NUMBER NOT NULL, 
    board_no        NUMBER,
    user_email      VARCHAR2(50), 
    reply_create    DATE,
    reply_content   VARCHAR(500),
    
    CONSTRAINT reply_PK PRIMARY KEY (reply_no)
);
CREATE SEQUENCE reply_seq START WITH 10000;

--로그인 로그
CREATE TABLE login_log (
    user_email      VARCHAR2(50),
    login_time      DATE,
    login_result	VARCHAR2(20),
    
    CONSTRAINT login_log_PK PRIMARY KEY (user_email)
);

--사용기술
CREATE TABLE tech (
    tech_no     NUMBER NOT NULL,
    tech_name   VARCHAR2(50),
    
    CONSTRAINT tech_PK PRIMARY KEY (tech_no)
);
CREATE SEQUENCE tech_seq START WITH 10000;

--프로젝트
CREATE TABLE "project" (
    project_no   NUMBER NOT NULL,
    location_no NUMBER,
    --tech_no     NUMBER, -- N:M  relation : 프로젝트-사용기술 테이블로 정규화
    project_title    VARCHAR2(100),
    project_start   DATE, 
    project_end     DATE,
    project_content VARCHAR2(1500),
    project_participant  NUMBER,
    project_lead    VARCHAR2(50),
    
    CONSTRAINT project_PK   PRIMARY KEY (project_no)
);
CREATE SEQUENCE project_seq START WITH 10000;

-- 프로젝트_사용기술
CREATE TABLE project_tech (
    project_no  NUMBER NOT NULL,
    tech_no     NUMBER NOT NULL,
    
    CONSTRAINT project_tech PRIMARY KEY (project_no, tech_no)    
);

--지역
CREATE TABLE "location" (
    location_no     NUMBER NOT NULL,
    location_name   VARCHAR2(50),
    
    CONSTRAINT location_PK PRIMARY KEY (location_no)
);
CREATE SEQUENCE location_seq START WITH 10000;

--코드
CREATE TABLE code (
    code_no         NUMBER NOT NULL,
    --tech_no       NUMBER, -- N:M  relation : 코드-사용기술 테이블로 정규화
    category_no     NUMBER,
    code_title      VARCHAR2(100),
    code_content    VARCHAR2(1500),
    code_source     VARCHAR2(1500),
    user_email      VARCHAR2(50),
    
    CONSTRAINT code_PK PRIMARY KEY (code_no)
);
CREATE SEQUENCE code_seq START WITH 10000;

--코드 카테고리 
CREATE TABLE code_category (
    category_no     NUMBER,
    category_name   VARCHAR(50),
    
    CONSTRAINT code_category_PK PRIMARY KEY (category_no)
);
CREATE SEQUENCE code_category_seq START WITH 10000;

--코드_사용기술
CREATE TABLE code_tech (
    code_no     NUMBER NOT NULL,
    tech_no     NUMBER NOT NULL,
    
    CONSTRAINT code_tech_PK PRIMARY KEY (code_no, tech_no)
);

--첨부 파일
CREATE TABLE attach_file (
    file_no     NUMBER NOT NULL,
    board_no    NUMBER,
    uploader_email	VARCHAR2(50),
    file_name   	VARCHAR2(250),
    file_storedname VARCHAR2(300),
    file_type   	VARCHAR2(100),
    
    CONSTRAINT attach_file_PK PRIMARY KEY (file_no)
);
CREATE SEQUENCE attach_file_seq START WITH 10000;

--파일 타입 : 파일 확장자에 따른 파일 타입 지정 (예: jpeg, png - image, java, py - source )
CREATE TABLE file_type (
    file_typename  VARCHAR2(100), 
    file_desc       VARCHAR2(200),
    
    CONSTRAINT file_type_PK PRIMARY KEY (file_typename)
);

-- 추천목록 : 보드_유저 테이블 
CREATE TABLE recommend (
	user_email 	VARCHAR2(50) 	NOT NULL,
	board_no	NUMBER 			NOT NULL,
	
	CONSTRAINT recommend_PK PRIMARY KEY (user_email, board_no)
);

-- TODO : Foreign key
-- 구인구직
ALTER TABLE recruit
ADD CONSTRAINT recruit_FK 
    FOREIGN KEY(board_no) REFERENCES board(board_no);
