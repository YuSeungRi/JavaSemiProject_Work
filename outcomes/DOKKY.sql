-- semi project SQL (team : dokky)

--테이블 초기화
DROP TABLE board;
DROP TABLE userInfo;
DROP TABLE recruit;
DROP TABLE reply; 
DROP TABLE recommend;
DROP TABLE login_log;
DROP TABLE tech;
DROP TABLE "project";
DROP TABLE project_tech; 
DROP TABLE "location";
DROP TABLE project_participant;
DROP TABLE code;
DROP TABLE code_category;
DROP TABLE code_tech;
DROP TABLE attach_file;
DROP TABLE file_type;

--시퀀스 초기화 
DROP SEQUENCE board_seq; 
DROP SEQUENCE reply_seq;
DROP SEQUENCE tech_seq;
DROP SEQUENCE project_seq;
DROP SEQUENCE location_seq;
DROP SEQUENCE code_seq;
DROP SEQUENCE code_category_seq;
DROP SEQUENCE attach_file_seq;

--게시판 (공지사항, Q&A, 구인구직, 자유게시판, 기술동향)
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
    recruit_status  VARCHAR2(50),
    
    CONSTRAINT recruit_PK   PRIMARY KEY (board_no)
);

--댓글
CREATE TABLE reply (
    reply_no        NUMBER NOT NULL, 
    board_no        NUMBER,
    user_email      VARCHAR2(50), 
    reply_create    DATE,
    reply_content   VARCHAR(500),
    
    CONSTRAINT reply_PK PRIMARY KEY (reply_no)
);
CREATE SEQUENCE reply_seq START WITH 10000;

--추천목록 : 보드_유저 테이블 
CREATE TABLE recommend (
	user_email 	VARCHAR2(50) 	NOT NULL,
	board_no	NUMBER 			NOT NULL,
	
	CONSTRAINT recommend_PK PRIMARY KEY (user_email, board_no)
);

--로그인 로그
CREATE TABLE login_log (
    user_email      VARCHAR2(50),
    login_time      DATE,
    login_result	VARCHAR2(20),
    
    CONSTRAINT login_log_PK PRIMARY KEY (user_email, login_time)
);

--사용기술
CREATE TABLE tech (
    tech_no     NUMBER NOT NULL,
    tech_name   VARCHAR2(50),
    
    CONSTRAINT tech_PK PRIMARY KEY (tech_no)
);
CREATE SEQUENCE tech_seq START WITH 10000;

--프로젝트 게시판
CREATE TABLE "project" (
    project_no   NUMBER NOT NULL,
    location_no NUMBER,
    project_title    VARCHAR2(100),
    project_start   DATE, 
    project_end     DATE,
    project_content VARCHAR2(1500),
    project_participant  NUMBER,
    project_lead    VARCHAR2(50),
    
    CONSTRAINT project_PK   PRIMARY KEY (project_no)
);
CREATE SEQUENCE project_seq START WITH 10000;

--프로젝트_사용기술
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

-- 프로젝트 참가 테이블 
CREATE TABLE project_participant (
	user_email 	VARCHAR2(50) 	NOT NULL,
	project_no	NUMBER 			NOT NULL,
	participate NUMBER,          
	CONSTRAINT project_participant_pk PRIMARY KEY (user_email, project_no)
);    

--코드
CREATE TABLE code (
    code_no         NUMBER NOT NULL,
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
    user_email		VARCHAR(50),
    
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



-- TEST DATA 

-- FreeBoard
INSERT INTO board VALUES ( 1, 'FreeBoard', '제목1', 'User1', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용1', 0 );
INSERT INTO board VALUES ( 2, 'FreeBoard', '제목2', 'User2', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용2', 0 );
INSERT INTO board VALUES ( 3, 'FreeBoard', '제목3', 'User3', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용3', 0 );
INSERT INTO board VALUES ( 4, 'FreeBoard', '제목4', 'User4', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용4', 0 );
INSERT INTO board VALUES ( 5, 'FreeBoard', '제목5', 'User5', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용5', 0 );
INSERT INTO board VALUES ( 6, 'FreeBoard', '제목6', 'User6', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용6', 0 );
INSERT INTO board VALUES ( 7, 'FreeBoard', '제목7', 'User7', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용7', 0 );
INSERT INTO board VALUES ( 8, 'FreeBoard', '제목8', 'User8', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용8', 0 );
INSERT INTO board VALUES ( 9, 'FreeBoard', '제목9', 'User9', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용9', 0 );
INSERT INTO board VALUES ( 10, 'FreeBoard', '제목10', 'User10', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용10', 0 );
INSERT INTO board VALUES ( 11, 'FreeBoard', '제목11', 'User11', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용11', 0 );
INSERT INTO board VALUES ( 12, 'FreeBoard', '제목12', 'User12', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용12', 0 );
INSERT INTO board VALUES ( 13, 'FreeBoard', '제목13', 'User13', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용13', 0 );
INSERT INTO board VALUES ( 14, 'FreeBoard', '제목14', 'User14', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용14', 0 );
INSERT INTO board VALUES ( 15, 'FreeBoard', '제목15', 'User15', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용15', 0 );
INSERT INTO board VALUES ( 16, 'FreeBoard', '제목16', 'User16', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용16', 0 );
INSERT INTO board VALUES ( 17, 'FreeBoard', '제목17', 'User17', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용17', 0 );
INSERT INTO board VALUES ( 18, 'FreeBoard', '제목18', 'User18', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용18', 0 );
INSERT INTO board VALUES ( 19, 'FreeBoard', '제목19', 'User19', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용19', 0 );
INSERT INTO board VALUES ( 20, 'FreeBoard', '제목20', 'User20', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용20', 0 );
INSERT INTO board VALUES ( 21, 'FreeBoard', '제목21', 'User21', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용21', 0 );
INSERT INTO board VALUES ( 22, 'FreeBoard', '제목22', 'User22', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용22', 0 );
INSERT INTO board VALUES ( 23, 'FreeBoard', '제목23', 'User23', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용23', 0 );
INSERT INTO board VALUES ( 24, 'FreeBoard', '제목24', 'User24', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용24', 0 );
INSERT INTO board VALUES ( 25, 'FreeBoard', '제목25', 'User25', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용25', 0 );
INSERT INTO board VALUES ( 26, 'FreeBoard', '제목26', 'User26', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용26', 0 );
INSERT INTO board VALUES ( 27, 'FreeBoard', '제목27', 'User27', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용27', 0 );
INSERT INTO board VALUES ( 28, 'FreeBoard', '제목28', 'User28', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용28', 0 );
INSERT INTO board VALUES ( 29, 'FreeBoard', '제목29', 'User29', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용29', 0 );
INSERT INTO board VALUES ( 30, 'FreeBoard', '제목30', 'User30', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용30', 0 );
-- DELETE FROM board WHERE board_no BETWEEN 1 AND 30;


-- FreeBoard (추천수, 조회수 추가된 데이터)
INSERT INTO board VALUES( 31, 'FreeBoard', '제목31', 'user1@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용31', 0 );
INSERT INTO board VALUES( 32, 'FreeBoard', '제목32', 'user1@naver.com', 20, 4, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용32', 0 );
INSERT INTO board VALUES( 33, 'FreeBoard', '제목33', 'user1@naver.com', 15, 4, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용33', 0 );
INSERT INTO board VALUES( 34, 'FreeBoard', '제목34', 'user1@naver.com', 16, 5, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용34', 0 );
INSERT INTO board VALUES( 35, 'FreeBoard', '제목35', 'user1@naver.com', 17, 6, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용35', 0 );
INSERT INTO board VALUES( 36, 'FreeBoard', '제목36', 'user2@naver.com', 18, 7, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용36', 0 );
INSERT INTO board VALUES( 37, 'FreeBoard', '제목37', 'user3@naver.com', 19, 8, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용37', 0 );
INSERT INTO board VALUES( 38, 'FreeBoard', '제목38', 'user4@naver.com', 34, 10, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용38', 0 );
INSERT INTO board VALUES( 39, 'FreeBoard', '제목39', 'user5@naver.com', 21, 10, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용39', 0 );
INSERT INTO board VALUES( 40, 'FreeBoard', '제목40', 'user6@naver.com', 22, 11, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용40', 0 );
INSERT INTO board VALUES( 41, 'FreeBoard', '제목41', 'user3@naver.com', 11, 2, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용41', 0 );
INSERT INTO board VALUES( 42, 'FreeBoard', '제목42', 'user9@naver.com', 24, 13, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용42', 0 );
INSERT INTO board VALUES( 43, 'FreeBoard', '제목43', 'user10@naver.com', 25, 14, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용43', 0 );
INSERT INTO board VALUES( 44, 'FreeBoard', '제목44', 'user4@naver.com', 26, 15, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용44', 0 );
INSERT INTO board VALUES( 45, 'FreeBoard', '제목45', 'user1@naver.com', 27, 16, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용45', 0 );
INSERT INTO board VALUES( 46, 'FreeBoard', '제목46', 'user5@naver.com', 63, 3, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용46', 0 );
INSERT INTO board VALUES( 47, 'FreeBoard', '제목47', 'user10@naver.com', 29, 18, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용47', 0 );
INSERT INTO board VALUES( 48, 'FreeBoard', '제목48', 'user2@naver.com', 30, 19, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용48', 0 );
INSERT INTO board VALUES( 49, 'FreeBoard', '제목49', 'user8@naver.com', 31, 20, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용49', 0 );
INSERT INTO board VALUES( 50, 'FreeBoard', '제목50', 'user4@naver.com', 50, 31, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용50', 0 );
INSERT INTO board VALUES( 51, 'FreeBoard', '제목51', 'user8@naver.com', 22, 2, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용51', 0 );
INSERT INTO board VALUES( 52, 'FreeBoard', '제목52', 'user8@naver.com', 16, 4, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용52', 0 );
INSERT INTO board VALUES( 53, 'FreeBoard', '제목53', 'user10@naver.com', 20, 19, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용53', 0 );
INSERT INTO board VALUES( 54, 'FreeBoard', '제목54', 'user9@naver.com', 36, 25, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용54', 0 );
INSERT INTO board VALUES( 55, 'FreeBoard', '제목55', 'user10@naver.com', 44, 4, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용55', 0 );
INSERT INTO board VALUES( 56, 'FreeBoard', '제목56', 'user1@naver.com', 50, 27, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용56', 0 );
INSERT INTO board VALUES( 57, 'FreeBoard', '제목57', 'user5@naver.com', 39, 10, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용57', 0 );
INSERT INTO board VALUES( 58, 'FreeBoard', '제목58', 'user4@naver.com', 29, 15, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용58', 0 );
INSERT INTO board VALUES( 59, 'FreeBoard', '제목59', 'user5@naver.com', 41, 7, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용59', 0 );
INSERT INTO board VALUES( 60, 'FreeBoard', '제목60', 'user2@naver.com', 91, 41, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용60', 0 );
INSERT INTO board VALUES( 61, 'FreeBoard', '제목61', 'user10@naver.com', 25, 24, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용61', 0 );
INSERT INTO board VALUES( 62, 'FreeBoard', '제목62', 'user6@naver.com', 2, 0, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용62', 0 );
INSERT INTO board VALUES( 63, 'FreeBoard', '제목63', 'user4@naver.com', 74, 6, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용63', 0 );
INSERT INTO board VALUES( 64, 'FreeBoard', '제목64', 'user3@naver.com', 41, 20, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용64', 0 );
INSERT INTO board VALUES( 65, 'FreeBoard', '제목65', 'user7@naver.com', 30, 16, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용65', 0 );
INSERT INTO board VALUES( 66, 'FreeBoard', '제목66', 'user2@naver.com', 5, 1, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용66', 0 );
INSERT INTO board VALUES( 67, 'FreeBoard', '제목67', 'user7@naver.com', 80, 5, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용67', 0 );
INSERT INTO board VALUES( 68, 'FreeBoard', '제목68', 'user5@naver.com', 50, 40, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용68', 0 );
INSERT INTO board VALUES( 69, 'FreeBoard', '제목69', 'user4@naver.com', 22, 15, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용69', 0 );
INSERT INTO board VALUES( 70, 'FreeBoard', '제목70', 'user2@naver.com', 11, 2, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용70', 0 );
-- DELETE FROM board WHERE board_no BETWEEN 31 AND 70;


-- NoticeBoard											
INSERT INTO board VALUES( 1001, 'NoticeBoard', '제목1001', 'user1@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1001', 0 );
INSERT INTO board VALUES( 1002, 'NoticeBoard', '제목1002', 'user2@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1002', 0 );
INSERT INTO board VALUES( 1003, 'NoticeBoard', '제목1003', 'user3@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1003', 0 );
INSERT INTO board VALUES( 1004, 'NoticeBoard', '제목1004', 'user4@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1004', 0 );
INSERT INTO board VALUES( 1005, 'NoticeBoard', '제목1005', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1005', 0 );
INSERT INTO board VALUES( 1006, 'NoticeBoard', '제목1006', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1006', 0 );
INSERT INTO board VALUES( 1007, 'NoticeBoard', '제목1007', 'user7@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1007', 0 );
INSERT INTO board VALUES( 1008, 'NoticeBoard', '제목1008', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1008', 0 );
INSERT INTO board VALUES( 1009, 'NoticeBoard', '제목1009', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1009', 0 );
INSERT INTO board VALUES( 1010, 'NoticeBoard', '제목1010', 'user10@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1010', 0 );
INSERT INTO board VALUES( 1011, 'NoticeBoard', '제목1011', 'user1@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1011', 0 );
INSERT INTO board VALUES( 1012, 'NoticeBoard', '제목1012', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1012', 0 );
INSERT INTO board VALUES( 1013, 'NoticeBoard', '제목1013', 'user3@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1013', 0 );
INSERT INTO board VALUES( 1014, 'NoticeBoard', '제목1014', 'user4@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1014', 0 );
INSERT INTO board VALUES( 1015, 'NoticeBoard', '제목1015', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1015', 0 );
INSERT INTO board VALUES( 1016, 'NoticeBoard', '제목1016', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1016', 0 );
INSERT INTO board VALUES( 1017, 'NoticeBoard', '제목1017', 'user7@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1017', 0 );
INSERT INTO board VALUES( 1018, 'NoticeBoard', '제목1018', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1018', 0 );
INSERT INTO board VALUES( 1019, 'NoticeBoard', '제목1019', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1019', 0 );
INSERT INTO board VALUES( 1020, 'NoticeBoard', '제목1020', 'user20@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1020', 0 );
INSERT INTO board VALUES( 1021, 'NoticeBoard', '제목1021', 'user1@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1021', 0 );
INSERT INTO board VALUES( 1022, 'NoticeBoard', '제목1022', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1022', 0 );
INSERT INTO board VALUES( 1023, 'NoticeBoard', '제목1023', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1023', 0 );
INSERT INTO board VALUES( 1024, 'NoticeBoard', '제목1024', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1024', 0 );
INSERT INTO board VALUES( 1025, 'NoticeBoard', '제목1025', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1025', 0 );
INSERT INTO board VALUES( 1026, 'NoticeBoard', '제목1026', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1026', 0 );
INSERT INTO board VALUES( 1027, 'NoticeBoard', '제목1027', 'user17@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1027', 0 );
INSERT INTO board VALUES( 1028, 'NoticeBoard', '제목1028', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1028', 0 );
INSERT INTO board VALUES( 1029, 'NoticeBoard', '제목1029', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1029', 0 );
INSERT INTO board VALUES( 1030, 'NoticeBoard', '제목1030', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1030', 0 );
INSERT INTO board VALUES( 1031, 'NoticeBoard', '제목1031', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1031', 0 );
INSERT INTO board VALUES( 1032, 'NoticeBoard', '제목1032', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1032', 0 );
INSERT INTO board VALUES( 1033, 'NoticeBoard', '제목1033', 'user10@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1033', 0 );
INSERT INTO board VALUES( 1034, 'NoticeBoard', '제목1034', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1034', 0 );
INSERT INTO board VALUES( 1035, 'NoticeBoard', '제목1035', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1035', 0 );
INSERT INTO board VALUES( 1036, 'NoticeBoard', '제목1036', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1036', 0 );
INSERT INTO board VALUES( 1037, 'NoticeBoard', '제목1037', 'user17@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1037', 0 );
INSERT INTO board VALUES( 1038, 'NoticeBoard', '제목1038', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1038', 0 );
INSERT INTO board VALUES( 1039, 'NoticeBoard', '제목1039', 'user1@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1039', 0 );
INSERT INTO board VALUES( 1040, 'NoticeBoard', '제목1040', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1040', 0 );
INSERT INTO board VALUES( 1041, 'NoticeBoard', '제목1041', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1041', 0 );
INSERT INTO board VALUES( 1042, 'NoticeBoard', '제목1042', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1042', 0 );
INSERT INTO board VALUES( 1043, 'NoticeBoard', '제목1043', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1043', 0 );
INSERT INTO board VALUES( 1044, 'NoticeBoard', '제목1044', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1044', 0 );
INSERT INTO board VALUES( 1045, 'NoticeBoard', '제목1045', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1045', 0 );
INSERT INTO board VALUES( 1046, 'NoticeBoard', '제목1046', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1046', 0 );
INSERT INTO board VALUES( 1047, 'NoticeBoard', '제목1047', 'user17@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1047', 0 );
INSERT INTO board VALUES( 1048, 'NoticeBoard', '제목1048', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1048', 0 );
INSERT INTO board VALUES( 1049, 'NoticeBoard', '제목1049', 'user19@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1049', 0 );
INSERT INTO board VALUES( 1050, 'NoticeBoard', '제목1050', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1050', 0 );
INSERT INTO board VALUES( 1051, 'NoticeBoard', '제목1051', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1051', 0 );
INSERT INTO board VALUES( 1052, 'NoticeBoard', '제목1052', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1052', 0 );
INSERT INTO board VALUES( 1053, 'NoticeBoard', '제목1053', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1053', 0 );
INSERT INTO board VALUES( 1054, 'NoticeBoard', '제목1054', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1054', 0 );
INSERT INTO board VALUES( 1055, 'NoticeBoard', '제목1055', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1055', 0 );
INSERT INTO board VALUES( 1056, 'NoticeBoard', '제목1056', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1056', 0 );
INSERT INTO board VALUES( 1057, 'NoticeBoard', '제목1057', 'user17@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1057', 0 );
INSERT INTO board VALUES( 1058, 'NoticeBoard', '제목1058', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1058', 0 );
INSERT INTO board VALUES( 1059, 'NoticeBoard', '제목1059', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1059', 0 );
INSERT INTO board VALUES( 1060, 'NoticeBoard', '제목1060', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1060', 0 );
INSERT INTO board VALUES( 1061, 'NoticeBoard', '제목1061', 'user10@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1061', 0 );
INSERT INTO board VALUES( 1062, 'NoticeBoard', '제목1062', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1062', 0 );
INSERT INTO board VALUES( 1063, 'NoticeBoard', '제목1063', 'user10@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1063', 0 );
INSERT INTO board VALUES( 1064, 'NoticeBoard', '제목1064', 'user10@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1064', 0 );
INSERT INTO board VALUES( 1065, 'NoticeBoard', '제목1065', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1065', 0 );
INSERT INTO board VALUES( 1066, 'NoticeBoard', '제목1066', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1066', 0 );
INSERT INTO board VALUES( 1067, 'NoticeBoard', '제목1067', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1067', 0 );
INSERT INTO board VALUES( 1068, 'NoticeBoard', '제목1068', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1068', 0 );
INSERT INTO board VALUES( 1069, 'NoticeBoard', '제목1069', 'user19@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1069', 0 );
INSERT INTO board VALUES( 1070, 'NoticeBoard', '제목1070', 'user10@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1070', 0 );
INSERT INTO board VALUES( 1071, 'NoticeBoard', '제목1071', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1071', 0 );
INSERT INTO board VALUES( 1072, 'NoticeBoard', '제목1072', 'user17@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1072', 0 );
INSERT INTO board VALUES( 1073, 'NoticeBoard', '제목1073', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1073', 0 );
INSERT INTO board VALUES( 1074, 'NoticeBoard', '제목1074', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1074', 0 );
INSERT INTO board VALUES( 1075, 'NoticeBoard', '제목1075', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1075', 0 );
INSERT INTO board VALUES( 1076, 'NoticeBoard', '제목1076', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1076', 0 );
INSERT INTO board VALUES( 1077, 'NoticeBoard', '제목1077', 'user17@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1077', 0 );
INSERT INTO board VALUES( 1078, 'NoticeBoard', '제목1078', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1078', 0 );
INSERT INTO board VALUES( 1079, 'NoticeBoard', '제목1079', 'user19@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1079', 0 );
INSERT INTO board VALUES( 1080, 'NoticeBoard', '제목1080', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1080', 0 );
INSERT INTO board VALUES( 1081, 'NoticeBoard', '제목1081', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1081', 0 );
INSERT INTO board VALUES( 1082, 'NoticeBoard', '제목1082', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1082', 0 );
INSERT INTO board VALUES( 1083, 'NoticeBoard', '제목1083', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1083', 0 );
INSERT INTO board VALUES( 1084, 'NoticeBoard', '제목1084', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1084', 0 );
INSERT INTO board VALUES( 1085, 'NoticeBoard', '제목1085', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1085', 0 );
INSERT INTO board VALUES( 1086, 'NoticeBoard', '제목1086', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1086', 0 );
INSERT INTO board VALUES( 1087, 'NoticeBoard', '제목1087', 'user17@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1087', 0 );
INSERT INTO board VALUES( 1088, 'NoticeBoard', '제목1088', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1088', 0 );
INSERT INTO board VALUES( 1089, 'NoticeBoard', '제목1089', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1089', 0 );
INSERT INTO board VALUES( 1090, 'NoticeBoard', '제목1090', 'user19@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1090', 0 );
INSERT INTO board VALUES( 1091, 'NoticeBoard', '제목1091', 'user10@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1091', 0 );
INSERT INTO board VALUES( 1092, 'NoticeBoard', '제목1092', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1092', 0 );
INSERT INTO board VALUES( 1093, 'NoticeBoard', '제목1093', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1093', 0 );
INSERT INTO board VALUES( 1094, 'NoticeBoard', '제목1094', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1094', 0 );
INSERT INTO board VALUES( 1095, 'NoticeBoard', '제목1095', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1095', 0 );
INSERT INTO board VALUES( 1096, 'NoticeBoard', '제목1096', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1096', 0 );
INSERT INTO board VALUES( 1097, 'NoticeBoard', '제목1097', 'user17@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1097', 0 );
INSERT INTO board VALUES( 1098, 'NoticeBoard', '제목1098', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1098', 0 );
INSERT INTO board VALUES( 1099, 'NoticeBoard', '제목1099', 'user19@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용1099', 0 );
-- DELETE FROM board WHERE board_no BETWEEN 1000 AND 1999; Notice

-- QuestionBoard
INSERT INTO board VALUES( 2000, 'QuestionBoard', '제목2000', 'user20@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2000', 0 );
INSERT INTO board VALUES( 2001, 'QuestionBoard', '제목2001', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2001', 0 );
INSERT INTO board VALUES( 2002, 'QuestionBoard', '제목2002', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2002', 0 );
INSERT INTO board VALUES( 2003, 'QuestionBoard', '제목2003', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2003', 0 );
INSERT INTO board VALUES( 2004, 'QuestionBoard', '제목2004', 'user4@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2004', 0 );
INSERT INTO board VALUES( 2005, 'QuestionBoard', '제목2005', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2005', 0 );
INSERT INTO board VALUES( 2006, 'QuestionBoard', '제목2006', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2006', 0 );
INSERT INTO board VALUES( 2007, 'QuestionBoard', '제목2007', 'user7@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2007', 0 );
INSERT INTO board VALUES( 2008, 'QuestionBoard', '제목2008', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2008', 0 );
INSERT INTO board VALUES( 2009, 'QuestionBoard', '제목2009', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2009', 0 );
INSERT INTO board VALUES( 2010, 'QuestionBoard', '제목2010', 'user20@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2010', 0 );
INSERT INTO board VALUES( 2011, 'QuestionBoard', '제목2011', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2011', 0 );
INSERT INTO board VALUES( 2012, 'QuestionBoard', '제목2012', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2012', 0 );
INSERT INTO board VALUES( 2013, 'QuestionBoard', '제목2013', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2013', 0 );
INSERT INTO board VALUES( 2014, 'QuestionBoard', '제목2014', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2014', 0 );
INSERT INTO board VALUES( 2015, 'QuestionBoard', '제목2015', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2015', 0 );
INSERT INTO board VALUES( 2016, 'QuestionBoard', '제목2016', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2016', 0 );
INSERT INTO board VALUES( 2017, 'QuestionBoard', '제목2017', 'user7@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2017', 0 );
INSERT INTO board VALUES( 2018, 'QuestionBoard', '제목2018', 'user28@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2018', 0 );
INSERT INTO board VALUES( 2019, 'QuestionBoard', '제목2019', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2019', 0 );
INSERT INTO board VALUES( 2020, 'QuestionBoard', '제목2020', 'user20@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2020', 0 );
INSERT INTO board VALUES( 2021, 'QuestionBoard', '제목2021', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2021', 0 );
INSERT INTO board VALUES( 2022, 'QuestionBoard', '제목2022', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2022', 0 );
INSERT INTO board VALUES( 2023, 'QuestionBoard', '제목2023', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2023', 0 );
INSERT INTO board VALUES( 2024, 'QuestionBoard', '제목2024', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2024', 0 );
INSERT INTO board VALUES( 2025, 'QuestionBoard', '제목2025', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2025', 0 );
INSERT INTO board VALUES( 2026, 'QuestionBoard', '제목2026', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2026', 0 );
INSERT INTO board VALUES( 2027, 'QuestionBoard', '제목2027', 'user7@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2027', 0 );
INSERT INTO board VALUES( 2028, 'QuestionBoard', '제목2028', 'user2@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2028', 0 );
INSERT INTO board VALUES( 2029, 'QuestionBoard', '제목2029', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2029', 0 );
INSERT INTO board VALUES( 2030, 'QuestionBoard', '제목2030', 'user20@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2030', 0 );
INSERT INTO board VALUES( 2031, 'QuestionBoard', '제목2031', 'user1@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2031', 0 );
INSERT INTO board VALUES( 2032, 'QuestionBoard', '제목2032', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2032', 0 );
INSERT INTO board VALUES( 2033, 'QuestionBoard', '제목2033', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2033', 0 );
INSERT INTO board VALUES( 2034, 'QuestionBoard', '제목2034', 'user4@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2034', 0 );
INSERT INTO board VALUES( 2035, 'QuestionBoard', '제목2035', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2035', 0 );
INSERT INTO board VALUES( 2036, 'QuestionBoard', '제목2036', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2036', 0 );
INSERT INTO board VALUES( 2037, 'QuestionBoard', '제목2037', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2037', 0 );
INSERT INTO board VALUES( 2038, 'QuestionBoard', '제목2038', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2038', 0 );
INSERT INTO board VALUES( 2039, 'QuestionBoard', '제목2039', 'user3@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2039', 0 );
INSERT INTO board VALUES( 2040, 'QuestionBoard', '제목2040', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2040', 0 );
INSERT INTO board VALUES( 2041, 'QuestionBoard', '제목2041', 'user1@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2041', 0 );
INSERT INTO board VALUES( 2042, 'QuestionBoard', '제목2042', 'user2@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2042', 0 );
INSERT INTO board VALUES( 2043, 'QuestionBoard', '제목2043', 'user3@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2043', 0 );
INSERT INTO board VALUES( 2044, 'QuestionBoard', '제목2044', 'user4@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2044', 0 );
INSERT INTO board VALUES( 2045, 'QuestionBoard', '제목2045', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2045', 0 );
INSERT INTO board VALUES( 2046, 'QuestionBoard', '제목2046', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2046', 0 );
INSERT INTO board VALUES( 2047, 'QuestionBoard', '제목2047', 'user7@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2047', 0 );
INSERT INTO board VALUES( 2048, 'QuestionBoard', '제목2048', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2048', 0 );
INSERT INTO board VALUES( 2049, 'QuestionBoard', '제목2049', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2049', 0 );
INSERT INTO board VALUES( 2050, 'QuestionBoard', '제목2050', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2050', 0 );
INSERT INTO board VALUES( 2051, 'QuestionBoard', '제목2051', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2051', 0 );
INSERT INTO board VALUES( 2052, 'QuestionBoard', '제목2052', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2052', 0 );
INSERT INTO board VALUES( 2053, 'QuestionBoard', '제목2053', 'user3@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2053', 0 );
INSERT INTO board VALUES( 2054, 'QuestionBoard', '제목2054', 'user4@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2054', 0 );
INSERT INTO board VALUES( 2055, 'QuestionBoard', '제목2055', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2055', 0 );
INSERT INTO board VALUES( 2056, 'QuestionBoard', '제목2056', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2056', 0 );
INSERT INTO board VALUES( 2057, 'QuestionBoard', '제목2057', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2057', 0 );
INSERT INTO board VALUES( 2058, 'QuestionBoard', '제목2058', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2058', 0 );
INSERT INTO board VALUES( 2059, 'QuestionBoard', '제목2059', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2059', 0 );
INSERT INTO board VALUES( 2060, 'QuestionBoard', '제목2060', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2060', 0 );
INSERT INTO board VALUES( 2061, 'QuestionBoard', '제목2061', 'user1@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2061', 0 );
INSERT INTO board VALUES( 2062, 'QuestionBoard', '제목2062', 'user12@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2062', 0 );
INSERT INTO board VALUES( 2063, 'QuestionBoard', '제목2063', 'user3@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2063', 0 );
INSERT INTO board VALUES( 2064, 'QuestionBoard', '제목2064', 'user14@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2064', 0 );
INSERT INTO board VALUES( 2065, 'QuestionBoard', '제목2065', 'user5@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2065', 0 );
INSERT INTO board VALUES( 2066, 'QuestionBoard', '제목2066', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2066', 0 );
INSERT INTO board VALUES( 2067, 'QuestionBoard', '제목2067', 'user20@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2067', 0 );
INSERT INTO board VALUES( 2068, 'QuestionBoard', '제목2068', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2068', 0 );
INSERT INTO board VALUES( 2069, 'QuestionBoard', '제목2069', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2069', 0 );
INSERT INTO board VALUES( 2070, 'QuestionBoard', '제목2070', 'user20@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2070', 0 );
INSERT INTO board VALUES( 2071, 'QuestionBoard', '제목2071', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2071', 0 );
INSERT INTO board VALUES( 2072, 'QuestionBoard', '제목2072', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2072', 0 );
INSERT INTO board VALUES( 2073, 'QuestionBoard', '제목2073', 'user13@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2073', 0 );
INSERT INTO board VALUES( 2074, 'QuestionBoard', '제목2074', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2074', 0 );
INSERT INTO board VALUES( 2075, 'QuestionBoard', '제목2075', 'user11@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2075', 0 );
INSERT INTO board VALUES( 2076, 'QuestionBoard', '제목2076', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2076', 0 );
INSERT INTO board VALUES( 2077, 'QuestionBoard', '제목2077', 'user7@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2077', 0 );
INSERT INTO board VALUES( 2078, 'QuestionBoard', '제목2078', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2078', 0 );
INSERT INTO board VALUES( 2079, 'QuestionBoard', '제목2079', 'user7@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2079', 0 );
INSERT INTO board VALUES( 2080, 'QuestionBoard', '제목2080', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2080', 0 );
INSERT INTO board VALUES( 2081, 'QuestionBoard', '제목2081', 'user20@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2081', 0 );
INSERT INTO board VALUES( 2082, 'QuestionBoard', '제목2082', 'user2@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2082', 0 );
INSERT INTO board VALUES( 2083, 'QuestionBoard', '제목2083', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2083', 0 );
INSERT INTO board VALUES( 2084, 'QuestionBoard', '제목2084', 'user2@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2084', 0 );
INSERT INTO board VALUES( 2085, 'QuestionBoard', '제목2085', 'user15@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2085', 0 );
INSERT INTO board VALUES( 2086, 'QuestionBoard', '제목2086', 'user16@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2086', 0 );
INSERT INTO board VALUES( 2087, 'QuestionBoard', '제목2087', 'user17@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2087', 0 );
INSERT INTO board VALUES( 2088, 'QuestionBoard', '제목2088', 'user18@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2088', 0 );
INSERT INTO board VALUES( 2089, 'QuestionBoard', '제목2089', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2089', 0 );
INSERT INTO board VALUES( 2090, 'QuestionBoard', '제목2090', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2090', 0 );
INSERT INTO board VALUES( 2091, 'QuestionBoard', '제목2091', 'user1@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2091', 0 );
INSERT INTO board VALUES( 2092, 'QuestionBoard', '제목2092', 'user2@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2092', 0 );
INSERT INTO board VALUES( 2093, 'QuestionBoard', '제목2093', 'user3@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2093', 0 );
INSERT INTO board VALUES( 2094, 'QuestionBoard', '제목2094', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2094', 0 );
INSERT INTO board VALUES( 2095, 'QuestionBoard', '제목2095', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2095', 0 );
INSERT INTO board VALUES( 2096, 'QuestionBoard', '제목2096', 'user6@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2096', 0 );
INSERT INTO board VALUES( 2097, 'QuestionBoard', '제목2097', 'user7@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2097', 0 );
INSERT INTO board VALUES( 2098, 'QuestionBoard', '제목2098', 'user8@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2098', 0 );
INSERT INTO board VALUES( 2099, 'QuestionBoard', '제목2099', 'user9@naver.com', 13, 5, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용2099', 0 );
-- DELETE FROM board WHERE board_no BETWEEN 2000 AND 2999; Question


-- Recruit
INSERT INTO board VALUES( 4000, 'Recruit', '제목_구인구직1', 'user1@naver.com', 0, 0, TO_CHAR( sysdate-4, 'YYYY-MM-DD' ), null, '내용_구인구직1', 0 );
INSERT INTO board VALUES( 4001, 'Recruit', '제목_구인구직2', 'user3@naver.com', 0, 0, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용_구인구직2', 0 );
INSERT INTO board VALUES( 4002, 'Recruit', '제목_구인구직3', 'user5@naver.com', 0, 0, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용_구인구직3', 0 );
INSERT INTO board VALUES( 4003, 'Recruit', '제목_구인구직4', 'user6@naver.com', 0, 0, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용_구인구직4', 0 );
INSERT INTO board VALUES( 4004, 'Recruit', '제목_구인구직5', 'user3@naver.com', 0, 0, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용_구인구직5', 0 );
INSERT INTO board VALUES( 4005, 'Recruit', '제목_구인구직6', 'user1@naver.com', 0, 0, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용_구인구직6', 0 );
INSERT INTO board VALUES( 4006, 'Recruit', '제목_구인구직7', 'user6@naver.com', 0, 0, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용_구인구직7', 0 );
INSERT INTO board VALUES( 4007, 'Recruit', '제목_구인구직8', 'user7@naver.com', 0, 0, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용_구인구직8', 0 );
INSERT INTO board VALUES( 4008, 'Recruit', '제목_구인구직9', 'user2@naver.com', 0, 0, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용_구인구직9', 0 );
INSERT INTO board VALUES( 4009, 'Recruit', '제목_구인구직10', 'user4@naver.com', 0, 0, TO_CHAR( sysdate-3, 'YYYY-MM-DD' ), null, '내용_구인구직10', 0 );
INSERT INTO board VALUES( 4010, 'Recruit', '제목_구인구직11', 'user5@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직11', 0 );
INSERT INTO board VALUES( 4011, 'Recruit', '제목_구인구직12', 'user3@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직12', 0 );
INSERT INTO board VALUES( 4012, 'Recruit', '제목_구인구직13', 'user4@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직13', 0 );
INSERT INTO board VALUES( 4013, 'Recruit', '제목_구인구직14', 'user7@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직14', 0 );
INSERT INTO board VALUES( 4014, 'Recruit', '제목_구인구직15', 'user2@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직15', 0 );
INSERT INTO board VALUES( 4015, 'Recruit', '제목_구인구직16', 'user1@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직16', 0 );
INSERT INTO board VALUES( 4016, 'Recruit', '제목_구인구직17', 'user3@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직17', 0 );
INSERT INTO board VALUES( 4017, 'Recruit', '제목_구인구직18', 'user5@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직18', 0 );
INSERT INTO board VALUES( 4018, 'Recruit', '제목_구인구직19', 'user6@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직19', 0 );
INSERT INTO board VALUES( 4019, 'Recruit', '제목_구인구직20', 'user3@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직20', 0 );
INSERT INTO board VALUES( 4020, 'Recruit', '제목_구인구직21', 'user2@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직21', 0 );
INSERT INTO board VALUES( 4021, 'Recruit', '제목_구인구직22', 'user1@naver.com', 0, 0, TO_CHAR( sysdate-2, 'YYYY-MM-DD' ), null, '내용_구인구직22', 0 );
INSERT INTO board VALUES( 4022, 'Recruit', '제목_구인구직23', 'user5@naver.com', 0, 0, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용_구인구직23', 0 );
INSERT INTO board VALUES( 4023, 'Recruit', '제목_구인구직24', 'user6@naver.com', 0, 0, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용_구인구직24', 0 );
INSERT INTO board VALUES( 4024, 'Recruit', '제목_구인구직25', 'user2@naver.com', 0, 0, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용_구인구직25', 0 );
INSERT INTO board VALUES( 4025, 'Recruit', '제목_구인구직26', 'user1@naver.com', 0, 0, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용_구인구직26', 0 );
INSERT INTO board VALUES( 4026, 'Recruit', '제목_구인구직27', 'user3@naver.com', 0, 0, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용_구인구직27', 0 );
INSERT INTO board VALUES( 4027, 'Recruit', '제목_구인구직28', 'user5@naver.com', 0, 0, TO_CHAR( sysdate-1, 'YYYY-MM-DD' ), null, '내용_구인구직28', 0 );
INSERT INTO board VALUES( 4028, 'Recruit', '제목_구인구직29', 'user3@naver.com', 0, 0, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용_구인구직29', 0 );
INSERT INTO board VALUES( 4029, 'Recruit', '제목_구인구직30', 'user2@naver.com', 0, 0, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용_구인구직30', 0 );
INSERT INTO board VALUES( 4030, 'Recruit', '제목_구인구직31', 'user4@naver.com', 0, 0, TO_CHAR( sysdate, 'YYYY-MM-DD' ), null, '내용_구인구직31', 0 );
-- DELETE FROM board WHERE board_category='Recruit';


-- recruit
INSERT INTO recruit VALUES( 4000, '구인' );
INSERT INTO recruit VALUES( 4001, '구인' );
INSERT INTO recruit VALUES( 4002, '구인' );
INSERT INTO recruit VALUES( 4003, '구인' );
INSERT INTO recruit VALUES( 4004, '구직' );
INSERT INTO recruit VALUES( 4005, '구인' );
INSERT INTO recruit VALUES( 4006, '구인' );
INSERT INTO recruit VALUES( 4007, '구인' );
INSERT INTO recruit VALUES( 4008, '구인' );
INSERT INTO recruit VALUES( 4009, '구인' );
INSERT INTO recruit VALUES( 4010, '구인' );
INSERT INTO recruit VALUES( 4011, '구인' );
INSERT INTO recruit VALUES( 4012, '구직' );
INSERT INTO recruit VALUES( 4013, '구직' );
INSERT INTO recruit VALUES( 4014, '구직' );
INSERT INTO recruit VALUES( 4015, '구인' );
INSERT INTO recruit VALUES( 4016, '구인' );
INSERT INTO recruit VALUES( 4017, '구인' );
INSERT INTO recruit VALUES( 4018, '구직' );
INSERT INTO recruit VALUES( 4019, '구인' );
INSERT INTO recruit VALUES( 4020, '구인' );
INSERT INTO recruit VALUES( 4021, '구인' );
INSERT INTO recruit VALUES( 4022, '구인' );
INSERT INTO recruit VALUES( 4023, '구인' );
INSERT INTO recruit VALUES( 4024, '구인' );
INSERT INTO recruit VALUES( 4025, '구직' );
INSERT INTO recruit VALUES( 4026, '구인' );
INSERT INTO recruit VALUES( 4027, '구직' );
INSERT INTO recruit VALUES( 4028, '구직' );
INSERT INTO recruit VALUES( 4029, '구직' );
INSERT INTO recruit VALUES( 4030, '구인' );
-- DELETE recruit;


-- TechBoard
INSERT INTO board VALUES ( 3001, 'TechBoard', '제목1', 'user1@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '아무의미없다123123123123', 0 );
INSERT INTO board VALUES ( 3002, 'TechBoard', '제목2', 'user2@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '아무의미없다123123123123', 0 );
INSERT INTO board VALUES ( 3003, 'TechBoard', '제목3', 'user3@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '아무의미없다123123123123', 0 );
INSERT INTO board VALUES ( 3004, 'TechBoard', '제목4', 'user4@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '아무의미없다123123123123', 0 );
INSERT INTO board VALUES ( 3005, 'TechBoard', '제목5', 'user5@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '아무의미없다123123123123', 0 );
INSERT INTO board VALUES ( 3006, 'TechBoard', '제목6', 'user6@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용6', 0 );
INSERT INTO board VALUES ( 3007, 'TechBoard', '제목7', 'user7@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용7', 0 );
INSERT INTO board VALUES ( 3008, 'TechBoard', '제목8', 'user8@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용8', 0 );
INSERT INTO board VALUES ( 3009, 'TechBoard', '제목9', 'user9@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용9', 0 );
INSERT INTO board VALUES ( 3010, 'TechBoard', '제목10', 'user10@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용10', 0 );
INSERT INTO board VALUES ( 3011, 'TechBoard', '제목11', 'user1@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용11', 0 );
INSERT INTO board VALUES ( 3012, 'TechBoard', '제목12', 'user2@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용12', 0 );
INSERT INTO board VALUES ( 3013, 'TechBoard', '제목13', 'user3@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용13', 0 );
INSERT INTO board VALUES ( 3014, 'TechBoard', '제목14', 'user4@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용14', 0 );
INSERT INTO board VALUES ( 3015, 'TechBoard', '제목15', 'user5@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용15', 0 );
INSERT INTO board VALUES ( 3016, 'TechBoard', '제목16', 'user6@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용16', 0 );
INSERT INTO board VALUES ( 3017, 'TechBoard', '제목17', 'user7@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용17', 0 );
INSERT INTO board VALUES ( 3018, 'TechBoard', '제목18', 'user8@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용18', 0 );
INSERT INTO board VALUES ( 3019, 'TechBoard', '제목19', 'user9@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용19', 0 );
INSERT INTO board VALUES ( 3020, 'TechBoard', '제목20', 'user10@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용20', 0 );
INSERT INTO board VALUES ( 3021, 'TechBoard', '제목21', 'user1@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용21', 0 );
INSERT INTO board VALUES ( 3022, 'TechBoard', '제목22', 'user2@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용22', 0 );
INSERT INTO board VALUES ( 3023, 'TechBoard', '제목23', 'user3@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용23', 0 );
INSERT INTO board VALUES ( 3024, 'TechBoard', '제목24', 'user4@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용24', 0 );
INSERT INTO board VALUES ( 3025, 'TechBoard', '제목25', 'user5@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용25', 0 );
INSERT INTO board VALUES ( 3026, 'TechBoard', '제목26', 'user6@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용26', 0 );
INSERT INTO board VALUES ( 3027, 'TechBoard', '제목27', 'user7@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용27', 0 );
INSERT INTO board VALUES ( 3028, 'TechBoard', '제목28', 'user8@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용28', 0 );
INSERT INTO board VALUES ( 3029, 'TechBoard', '제목29', 'user9@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용29', 0 );
INSERT INTO board VALUES ( 3030, 'TechBoard', '제목30', 'user10@naver.com', 0, 0, TO_CHAR( sysdate,  'YYYY-MM-DD' ), null, '내용30', 0 );
--DELETE FROM board WHERE board_category='TechBoard'; 


-- userinfo
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user1@naver.com','nick1','1234','1','18/08/01','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user2@naver.com','nick2','1234','2','18/08/02','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user3@naver.com','nick3','1234','3','18/08/03','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user4@naver.com','nick4','1234','4','18/08/04','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user5@naver.com','nick5','1234','5','18/08/05','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user6@naver.com','nick6','1234','6','18/08/06','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user7@naver.com','nick7','1234','7','18/08/07','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user8@naver.com','nick8','1234','8','18/08/08','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user9@naver.com','nick9','1234','7','18/08/09','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user10@naver.com','nick10','1234','6','18/08/10','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user11@naver.com','nick11','1234','5','18/09/01','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user12@naver.com','nick12','1234','4','18/09/02','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user13@naver.com','nick13','1234','3','18/09/03','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user14@naver.com','nick14','1234','2','18/09/04','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user15@naver.com','nick15','1234','1','18/09/05','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user16@naver.com','nick16','1234','2','18/09/06','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user17@naver.com','nick17','1234','3','18/09/07','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user18@naver.com','nick18','1234','4','18/09/06','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user19@naver.com','nick19','1234','5','18/09/05','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user20@naver.com','nick20','1234','6','18/09/04','asdasd','mm1.jpg');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_registdate, user_intro, user_photo) VALUES ('user99@naver.com','관리자','qwe123QWE','9','18/09/01','asdasd','mm1.jpg');
--DELETE userinfo;


--login_log
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user1@naver.com', '18/08/18', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user2@naver.com', '18/08/19', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user3@naver.com', '18/08/20', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user4@naver.com', '18/08/21', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user5@naver.com', '18/08/22', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user6@naver.com', '18/08/23', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user7@naver.com', '18/08/24', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user8@naver.com', '18/08/25', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user9@naver.com', '18/08/26', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user10@naver.com', '18/08/28', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user11@naver.com', '18/08/29', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user12@naver.com', '18/08/30', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user13@naver.com', '18/08/31', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user14@naver.com', '18/09/01', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user15@naver.com', '18/09/02', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user16@naver.com', '18/09/03', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user17@naver.com', '18/09/04', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user18@naver.com', '18/09/05', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user19@naver.com', '18/09/06', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user20@naver.com', '18/09/07', 'Success');
INSERT INTO login_log (user_email, login_time, login_result) VALUES ('user99@naver.com', '18/09/08', 'Success');
-- DELETE FROM login_log; 


-- reply
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (1, 31, 'user1@naver.com', sysdate,  '댓글1');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (2, 31, 'user2@naver.com', sysdate,  '댓글2');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (3, 31, 'user3@naver.com', sysdate,  '댓글3');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (4, 31, 'user4@naver.com', sysdate, '댓글4');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (5, 31, 'user5@naver.com', sysdate, '댓글5');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (6, 32, 'user6@naver.com', sysdate, '댓글6');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (7, 32, 'user7@naver.com', sysdate, '댓글7');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (8, 32, 'user8@naver.com', sysdate, '댓글8');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (9, 32, 'user9@naver.com', sysdate, '댓글9');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (10, 32, 'user10@naver.com', sysdate, '댓글10');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (11, 33, 'user1@naver.com', sysdate, '댓글11');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (12, 33, 'user2@naver.com', sysdate, '댓글12');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (13, 33, 'user3@naver.com', sysdate, '댓글13');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (14, 33, 'user4@naver.com', sysdate, '댓글14');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (15, 33, 'user5@naver.com', sysdate, '댓글15');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (16, 34, 'user6@naver.com', sysdate, '댓글16');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (17, 34, 'user7@naver.com', sysdate, '댓글17');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (18, 34, 'user8@naver.com', sysdate, '댓글18');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (19, 34, 'user9@naver.com', sysdate, '댓글19');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (20, 34, 'user10@naver.com', sysdate, '댓글20');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (21, 35, 'user1@naver.com', sysdate, '댓글21');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (22, 35, 'user2@naver.com', sysdate, '댓글22');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (23, 35, 'user3@naver.com', sysdate, '댓글23');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (24, 35, 'user4@naver.com', sysdate, '댓글24');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (25, 35, 'user5@naver.com', sysdate, '댓글25');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (26, 36, 'user6@naver.com', sysdate, '댓글26');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (27, 36, 'user7@naver.com', sysdate, '댓글27');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (28, 36, 'user8@naver.com', sysdate, '댓글28');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (29, 36, 'user9@naver.com', sysdate, '댓글29');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (30, 36, 'user10@naver.com', sysdate, '댓글30');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (31, 37, 'user1@naver.com', sysdate, '댓글31');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (32, 37, 'user2@naver.com', sysdate, '댓글32');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (33, 37, 'user3@naver.com', sysdate, '댓글33');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (34, 37, 'user4@naver.com', sysdate, '댓글34');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (35, 37, 'user5@naver.com', sysdate, '댓글35');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (36, 38, 'user6@naver.com', sysdate, '댓글36');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (37, 38, 'user7@naver.com', sysdate, '댓글37');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (38, 38, 'user8@naver.com', sysdate, '댓글38');
INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES (39, 38, 'user9@naver.com', sysdate, '댓글39');
-- DELETE FROM reply;


-- "location"
INSERT INTO "location" VALUES( 1 ,'서울');
INSERT INTO "location" VALUES( 2 ,'부산');
INSERT INTO "location" VALUES( 3 ,'대구');
INSERT INTO "location" VALUES( 4 ,'인천');
INSERT INTO "location" VALUES( 5 ,'광주');
INSERT INTO "location" VALUES( 6 ,'대전');
INSERT INTO "location" VALUES( 7 ,'울산');
INSERT INTO "location" VALUES( 8 ,'세종');
INSERT INTO "location" VALUES( 9 ,'경기');
INSERT INTO "location" VALUES( 10 ,'강원');
INSERT INTO "location" VALUES( 11 ,'충청');
INSERT INTO "location" VALUES( 12 ,'전라');
INSERT INTO "location" VALUES( 13 ,'경상');
INSERT INTO "location" VALUES( 14 ,'제주');
--DELETE FROM "location";

-- "project"
INSERT INTO "project" VALUES( 1 , 1 ,'프로젝트명1', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용1', 10 ,'user1@naver.com');
INSERT INTO "project" VALUES( 2 , 2 ,'프로젝트명2', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용2', 10 ,'user2@naver.com');
INSERT INTO "project" VALUES( 3 , 3 ,'프로젝트명3', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용3', 10 ,'user3@naver.com');
INSERT INTO "project" VALUES( 4 , 4 ,'프로젝트명4', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용4', 10 ,'user4@naver.com');
INSERT INTO "project" VALUES( 5 , 5 ,'프로젝트명5', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용5', 10 ,'user5@naver.com');
INSERT INTO "project" VALUES( 6 , 6 ,'프로젝트명6', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용6', 10 ,'user6@naver.com');
INSERT INTO "project" VALUES( 7 , 7 ,'프로젝트명7', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용7', 10 ,'user7@naver.com');
INSERT INTO "project" VALUES( 8 , 8 ,'프로젝트명8', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용8', 10 ,'user8@naver.com');
INSERT INTO "project" VALUES( 9 , 9 ,'프로젝트명9', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용9', 10 ,'user9@naver.com');
INSERT INTO "project" VALUES( 10 , 10 ,'프로젝트명10', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용10', 10 ,'user10@naver.com');
INSERT INTO "project" VALUES( 11 , 11 ,'프로젝트명11', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용11', 10 ,'user1@naver.com');
INSERT INTO "project" VALUES( 12 , 12 ,'프로젝트명12', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용12', 10 ,'user2@naver.com');
INSERT INTO "project" VALUES( 13 , 13 ,'프로젝트명13', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용13', 10 ,'user3@naver.com');
INSERT INTO "project" VALUES( 14 , 14 ,'프로젝트명14', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용14', 10 ,'user4@naver.com');
INSERT INTO "project" VALUES( 15 , 1 ,'프로젝트명15', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용15', 10 ,'user5@naver.com');
INSERT INTO "project" VALUES( 16 , 2 ,'프로젝트명16', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용16', 10 ,'user6@naver.com');
INSERT INTO "project" VALUES( 17 , 3 ,'프로젝트명17', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용17', 10 ,'user7@naver.com');
INSERT INTO "project" VALUES( 18 , 4 ,'프로젝트명18', TO_CHAR( sysdate, 'YYYY-MM-DD' ), TO_CHAR( sysdate, 'YYYY-MM-DD' ),'프로젝트 내용18', 10 ,'user8@naver.com');
-- DELETE FROM "project";


-- tech
INSERT INTO tech VALUES( 1 ,'JAVA');
INSERT INTO tech VALUES( 2 ,'C++');
INSERT INTO tech VALUES( 3 ,'C#');
INSERT INTO tech VALUES( 4 ,'javaScript');
INSERT INTO tech VALUES( 5 ,'CSS');
INSERT INTO tech VALUES( 6 ,'HTML');
INSERT INTO tech VALUES( 7 ,'Node.js');
INSERT INTO tech VALUES( 8 ,'Oracle');
INSERT INTO tech VALUES( 9 ,'MySQL');
INSERT INTO tech VALUES( 10 ,'JSP/Servlet');
INSERT INTO tech VALUES( 11 ,'Python');
INSERT INTO tech VALUES( 12 ,'PHP');
INSERT INTO tech VALUES( 13 ,'Ruby');
INSERT INTO tech VALUES( 14 ,'Angular.js');
INSERT INTO tech VALUES( 15 ,'react');
INSERT INTO tech VALUES( 16 ,'vue.js');
-- DELETE FROM tech;


--project_tech
INSERT INTO project_tech VALUES( 1 , 1 );
INSERT INTO project_tech VALUES( 2 , 2 );
INSERT INTO project_tech VALUES( 3 , 3 );
INSERT INTO project_tech VALUES( 4 , 4 );
INSERT INTO project_tech VALUES( 5 , 5 );
INSERT INTO project_tech VALUES( 6 , 6 );
INSERT INTO project_tech VALUES( 7 , 7 );
INSERT INTO project_tech VALUES( 8 , 8 );
INSERT INTO project_tech VALUES( 9 , 9 );
INSERT INTO project_tech VALUES( 10 , 10 );
INSERT INTO project_tech VALUES( 11 , 11 );
INSERT INTO project_tech VALUES( 12 , 12 );
INSERT INTO project_tech VALUES( 13 , 13 );
INSERT INTO project_tech VALUES( 14 , 14 );
INSERT INTO project_tech VALUES( 15 , 15 );
INSERT INTO project_tech VALUES( 16 , 16 );
INSERT INTO project_tech VALUES( 17 , 1 );
INSERT INTO project_tech VALUES( 18 , 2 );
INSERT INTO project_tech VALUES( 1 , 2 );
INSERT INTO project_tech VALUES( 2 , 3 );
INSERT INTO project_tech VALUES( 3 , 4 );
INSERT INTO project_tech VALUES( 4 , 5 );
INSERT INTO project_tech VALUES( 5 , 6 );
INSERT INTO project_tech VALUES( 6 , 7 );
INSERT INTO project_tech VALUES( 7 , 8 );
INSERT INTO project_tech VALUES( 8 , 9 );
INSERT INTO project_tech VALUES( 9 , 10 );
INSERT INTO project_tech VALUES( 10 , 11 );
INSERT INTO project_tech VALUES( 11 , 12 );
INSERT INTO project_tech VALUES( 12 , 13 );
INSERT INTO project_tech VALUES( 13 , 14 );
INSERT INTO project_tech VALUES( 14 , 15 );
INSERT INTO project_tech VALUES( 15 , 16 );
INSERT INTO project_tech VALUES( 16 , 1 );
INSERT INTO project_tech VALUES( 17 , 2 );
INSERT INTO project_tech VALUES( 18 , 3 );
-- DELETE FROM project_tech; 


-- code table data
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (1,1,'title1','console log1','console.log("hi")//1','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (2,1,'title2','console log2','console.log("hi")//2','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (3,1,'title3','console log3','console.log("hi")//3','user3@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (4,1,'title4','console log4','console.log("hi")//4','user4@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (5,1,'title5','console log5','console.log("hi")//5','user5@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (6,1,'title6','console log6','console.log("hi")//6','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (7,2,'title7','console log7','console.log("hi")//7','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (8,2,'title8','console log8','console.log("hi")//8','user3@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (9,2,'title9','console log9','console.log("hi")//9','user4@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (10,2,'title10','console log10','console.log("hi")//10','user5@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (11,2,'title11','console log11','console.log("hi")//11','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (12,2,'title12','console log12','console.log("hi")//12','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (13,2,'title13','console log13','console.log("hi")//13','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (14,3,'title14','console log14','console.log("hi")//14','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (15,3,'title15','console log15','console.log("hi")//15','user3@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (16,3,'title16','console log16','console.log("hi")//16','user4@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (17,3,'title17','console log17','console.log("hi")//17','user5@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (18,3,'title18','console log18','console.log("hi")//18','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (19,3,'title19','console log19','console.log("hi")//19','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (20,3,'title20','console log20','console.log("hi")//20','user3@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (21,4,'title21','console log21','console.log("hi")//21','user4@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (22,4,'title22','console log22','console.log("hi")//22','user5@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (23,4,'title23','console log23','console.log("hi")//23','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (24,4,'title24','console log24','console.log("hi")//24','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (25,4,'title25','console log25','console.log("hi")//25','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (26,4,'title26','console log26','console.log("hi")//26','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (27,5,'title27','console log27','console.log("hi")//27','user3@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (28,5,'title28','console log28','console.log("hi")//28','user4@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (29,5,'title29','console log29','console.log("hi")//29','user5@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (30,5,'title30','console log30','console.log("hi")//30','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (31,5,'title31','console log31','console.log("hi")//31','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (32,5,'title32','console log32','console.log("hi")//32','user3@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (33,5,'title33','console log33','console.log("hi")//33','user4@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (34,6,'title34','console log34','console.log("hi")//34','user5@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (35,6,'title35','console log35','console.log("hi")//35','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (36,6,'title36','console log36','console.log("hi")//36','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (37,6,'title37','console log37','console.log("hi")//37','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (38,6,'title38','console log38','console.log("hi")//38','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (39,6,'title39','console log39','console.log("hi")//39','user3@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (40,6,'title40','console log40','console.log("hi")//40','user4@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (41,7,'title41','console log41','console.log("hi")//41','user5@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (42,7,'title42','console log42','console.log("hi")//42','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (43,7,'title43','console log43','console.log("hi")//43','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (44,7,'title44','console log44','console.log("hi")//44','user3@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (45,7,'title45','console log45','console.log("hi")//45','user4@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (46,7,'title46','console log46','console.log("hi")//46','user5@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (47,7,'title47','console log47','console.log("hi")//47','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (48,7,'title48','console log48','console.log("hi")//48','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (49,7,'title49','console log49','console.log("hi")//49','user1@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (50,7,'title50','console log50','console.log("hi")//50','user2@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (51,7,'title51','console log51','console.log("hi")//51','user3@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (52,7,'title52','console log52','console.log("hi")//52','user4@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (53,7,'title53','console log53','console.log("hi")//53','user5@naver.com');
INSERT INTO code(code_no, category_no, code_title, code_content, code_source, user_email) VALUES (54,7,'title54','console log54','console.log("hi")//54','user1@naver.com');
-- DELETE FROM code;


-- code_category 
INSERT INTO code_category(category_no, category_name, user_email) VALUES (1,'Java', 'user1@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (2,'C#', 'user1@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (3,'Javascript', 'user1@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (4,'jQuery', 'user1@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (5,'PHP', 'user1@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (6,'C/C++', 'user1@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (7,'Oracle', 'user1@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (8,'Java', 'user2@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (9,'C#', 'user2@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (10,'Javascript', 'user2@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (11,'jQuery', 'user2@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (12,'PHP', 'user2@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (13,'C/C++', 'user2@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (14,'Oracle', 'user2@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (15,'Java', 'user3@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (16,'C#', 'user3@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (17,'Javascript', 'user3@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (18,'jQuery', 'user3@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (19,'PHP', 'user3@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (20,'C/C++', 'user3@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (21,'Oracle', 'user3@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (22,'Java', 'user4@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (23,'C#', 'user4@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (24,'Javascript', 'user4@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (25,'jQuery', 'user4@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (26,'PHP', 'user4@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (27,'C/C++', 'user4@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (28,'Oracle', 'user4@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (29,'Java', 'user5@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (30,'C#', 'user5@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (31,'Javascript', 'user5@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (32,'jQuery', 'user5@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (33,'PHP', 'user5@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (34,'C/C++', 'user5@naver.com');
INSERT INTO code_category(category_no, category_name, user_email) VALUES (35,'Oracle', 'user5@naver.com');
-- DELETE FROM code_category;

-- code_tech
INSERT INTO code_tech (code_no, tech_no) VALUES (1,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (1,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (1,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (1,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (1,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (2,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (2,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (2,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (2,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (2,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (3,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (3,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (3,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (3,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (3,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (4,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (5,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (6,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (7,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (8,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (9,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (10,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (11,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (12,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (13,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (14,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (15,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (16,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (17,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (18,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (19,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (20,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (21,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (22,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (23,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (24,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (25,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (26,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (27,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (28,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (29,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (30,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (31,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (32,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (33,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (34,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (35,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (36,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (37,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (38,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (39,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (40,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (41,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (42,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (43,5);
INSERT INTO code_tech (code_no, tech_no) VALUES (44,1);
INSERT INTO code_tech (code_no, tech_no) VALUES (45,2);
INSERT INTO code_tech (code_no, tech_no) VALUES (46,3);
INSERT INTO code_tech (code_no, tech_no) VALUES (47,4);
INSERT INTO code_tech (code_no, tech_no) VALUES (48,5); 
-- DELETE FROM code_tech; 


--SELECT * FROM board;
--SELECT * FROM userInfo;
--SELECT * FROM recruit;
--SELECT * FROM reply; 
--SELECT * FROM recommend;
--SELECT * FROM login_log;
--SELECT * FROM tech;
--SELECT * FROM "project";
--SELECT * FROM project_tech; 
--SELECT * FROM "location";
--SELECT * FROM project_participant;
--SELECT * FROM code;
--SELECT * FROM code_category;
--SELECT * FROM code_tech;
--SELECT * FROM attach_file;
--SELECT * FROM file_type;

-- commit