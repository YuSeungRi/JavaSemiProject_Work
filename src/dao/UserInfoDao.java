package dao;

import java.util.ArrayList;
import java.util.List;

import board.util.Paging;
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
	 * Compare Login input data and Database 
	 * @param userEmail
	 * @return 1: login success, 0: login fail
	 */
	public boolean socialLogin(UserInfoDto dto);
	
	/**
	 * Create new user 
	 * @param dto
	 * @return 1: create success, 0: create fail
	 */
	public int createUser(UserInfoDto dto);
	
	/**
	 * Create new user 
	 * @param dto
	 * @return 1: create success, 0: create fail
	 */
	public int socialcreateUser(UserInfoDto dto);
	
	/**
	 * Change userPassword 
	 * @param userEmail
	 * @param newPassword
	 * @return 1: password change success, 0: password change fail
	 */
	
	
	public boolean checkUser(UserInfoDto dto);
	/*
	 * Check userEmail
	 * @param userEmail
	 * @return false: userEmail not exist true: userEmail exist
	 * */
	
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
	 * 
	 * @param dto
	 * @return
	 */
	public boolean updateUserInfo2(UserInfoDto dto);

	/**
	 * get single user info
	 * @param userEmail
	 * @return UserInfoDto
	 */
	public UserInfoDto getUserInfo(String userEmail);
	
	/** 
	 * @param dto
	 * @return
	 */
	public String getUserNick(UserInfoDto dto);
	
	/**
	 * 
	 * @param dto
	 * @return
	 */	
	public UserInfoDto searchpwd(UserInfoDto dto);
	
	/**
	 * AllUserInfoCnt
	 * @return
	 */
	public int getAllUserInfoCnt();
	
	/**
	 * 
	 * @param searchString
	 * @return
	 */
	public int getEmailSearchUserInfoCnt(String searchString);
	
	/**
	 * 
	 * @param searchString
	 * @return
	 */
	public int getNickSearchUserInfoCnt(String searchString);
	
	/**
	 * 
	 * @param paging
	 * @return
	 */
	public ArrayList<UserInfoDto> getAllUserInfoList(Paging paging);	
	
	
	/**
	 * UserSearchList
	 * @param paging
	 * @return
	 */
	public ArrayList<UserInfoDto> getUserEmailSearchList(Paging paging, String searchString);
	
	/**
	 * 
	 * @param paging
	 * @param searchString
	 * @return
	 */
	public ArrayList<UserInfoDto> getUserNickSearchList(Paging paging, String searchString);
}
