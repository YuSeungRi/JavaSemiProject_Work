package Service;

import java.util.List;

import board.util.Paging;
import dao.UserInfoDao;
import dao.UserInfoDaoImpl;
import dto.UserInfoDto;

public class UserInfoService {
	
	private UserInfoDao dao = new UserInfoDaoImpl();
	
	public int join(UserInfoDto dto) {
		return dao.createUser(dto);
	}
	
	public boolean login(UserInfoDto dto) {
		return dao.login(dto);
	}
	
	public UserInfoDto getUserInfo(String userEmail) {
		return dao.getUserInfo(userEmail);
	}
	
	public String getUserNick(UserInfoDto dto) {
		return dao.getUserNick(dto);
	}
	
	public boolean updateUserIn(UserInfoDto dto) {
		return dao.updateUserInfo(dto);
	}
	
	public boolean updateUserIn2(UserInfoDto dto) {
		return dao.updateUserInfo2(dto);
	}
	
	public boolean changeLevel(String userEmail, String newLevel) {
		return dao.changeLevel(userEmail, newLevel);
	}
	
	public UserInfoDto searchpwd(UserInfoDto dto) {
		return dao.searchpwd(dto);
	}
	
	public int getTotal() {
		return dao.getAllUserInfoCnt();
	}
	
	public int getEmailSearchTotal(String searchString) {
		return dao.getEmailSearchUserInfoCnt(searchString);
	}
	
	public int getNickSearchTotal(String searchString) {
		return dao.getNickSearchUserInfoCnt(searchString);
	}
	
	public List<UserInfoDto> getAllUserInfoList(Paging paging) {
		return dao.getAllUserInfoList(paging);
	}
	
	public List<UserInfoDto> getUserEmailSearchList(Paging paging, String searchString) {
		return dao.getUserEmailSearchList(paging, searchString);
	}
	
	public List<UserInfoDto> getUserNickSearchList(Paging paging, String searchString) {
		return dao.getUserNickSearchList(paging, searchString);
	}
}
