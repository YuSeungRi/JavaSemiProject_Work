package dao;

import java.util.ArrayList;

import dto.UserInfoDto;

public interface UserInfoDao {
	
	/**
	 * Compare Login input data and Database 
	 * @param userEmail
	 * @param userPw
	 * @return 1: login success, 0: login fail
	 */
	public boolean login(UserInfoDto dto);
	
	/**
	 * Create new user 
	 * @param dto
	 * @return 1: create success, 0: create fail
	 */
	public int createUser(UserInfoDto dto);
	
	/**
	 * Change userPassword 
	 * @param userEmail
	 * @param newPassword
	 * @return 1: password change success, 0: password change fail
	 */
	public boolean pwChange(String userEmail, String newPassword);
	
	/**
	 * Change user level
	 * @param userEmail
	 * @param newLevel
	 * @return 1: change success, 0: change fail 
	 */
	public boolean changeLevel (String userEmail, String newLevel);
	
	/**
	 * Update user Info 
	 * @param dto
	 * @return 1: update success, 0: update fail
	 */
	public boolean updateUserInfo(UserInfoDto dto);

	/**
	 * get single user info
	 * @param userEmail
	 * @return UserInfoDto
	 */
	public UserInfoDto getUserInfo(String userEmail);
	/** 
	 * get all user info
	 * @return UserInfoDto array
	 */
	public ArrayList<UserInfoDto> getAllUserInfo();
	
	/** 
	 * @param dto
	 * @return
	 */
	public String getUserNick(UserInfoDto dto);
	
	
	public UserInfoDto searchpwd(UserInfoDto dto);
	
}
