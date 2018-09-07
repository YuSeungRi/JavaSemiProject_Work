SELECT * FROM userinfo;

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

--- 여기서 부터 쓰세요 !!!!!!!!!!!!!!!!!!!!

--DELETE userinfo;

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


--- DELETE FROM login_log; 


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

commit;
