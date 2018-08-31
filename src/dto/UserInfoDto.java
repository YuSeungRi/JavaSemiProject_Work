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
		return "userEmail: " + userEmail +", userPw: "+ userPw + ", nick: " + userNick + ", userLevel: " + userLevel;
	}
	
}
