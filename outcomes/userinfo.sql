SELECT * FROM userinfo;

INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user1@naver.com','nick1','1234','1','asdasd');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user2@naver.com','nick2','1234','1','asdasd');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user3@naver.com','nick3','1234','1','asdasd');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user4@naver.com','nick4','1234','1','asdasd');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user5@naver.com','nick5','1234','1','asdasd');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user6@naver.com','nick6','1234','1','asdasd');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user7@naver.com','nick7','1234','1','asdasd');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user8@naver.com','nick8','1234','1','asdasd');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user9@naver.com','nick9','1234','1','asdasd');
INSERT INTO userinfo (user_email, user_nick, user_pw, user_level, user_intro) VALUES ('user10@naver.com','nick10','1234','1','asdasd');

CREATE TABLE recommend (
	user_email 	VARCHAR2(50) 	NOT NULL,
	board_no	NUMBER 			NOT NULL,
	
	CONSTRAINT recommend_PK PRIMARY KEY (user_email, board_no)
);

CREATE TABLE login_log 
(
    user_email      VARCHAR2(50),
    login_time      DATE,
    login_result	VARCHAR2(20),
    
    CONSTRAINT login_log_PK PRIMARY KEY (user_email)
);
--DELETE userinfo;

