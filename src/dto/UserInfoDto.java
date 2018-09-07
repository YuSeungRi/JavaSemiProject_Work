package dto;

import java.util.Date;

public class UserInfoDto {
	private String 	userEmail;
	private String 	userNick; 
	private String 	userPw;
	private String 	userLevel;
	private Date	userRegistDate; 
	private String	userIntro;
	private String 	userPhoto; //photopath(?)
	private int cntboard;
	private int cntreply;
	private Date logintime;
	
	public Date getLogintime() {
		return logintime;
	}
	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}
	public int getCntboard() {
		return cntboard;
	}
	public void setCntboard(int cntboard) {
		this.cntboard = cntboard;
	}
	public int getCntreply() {
		return cntreply;
	}
	public void setCntreply(int cntreply) {
		this.cntreply = cntreply;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public Date getUserRegistDate() {
		return userRegistDate;
	}
	public void setUserRegistDate(Date userRegistDate) {
		this.userRegistDate = userRegistDate;
	}
	public String getUserIntro() {
		return userIntro;
	}
	public void setUserIntro(String userIntro) {
		this.userIntro = userIntro;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	
	@Override
	public String toString() {
		return "UserInfoDto [userEmail=" + userEmail + ", userNick=" + userNick + ", userPw=" + userPw + ", userLevel="
				+ userLevel + ", userRegistDate=" + userRegistDate + ", userIntro=" + userIntro + ", userPhoto="
				+ userPhoto + ", cntboard=" + cntboard + ", cntreply=" + cntreply + ", logintime=" + logintime + "]";
	}
	
	
	
}
