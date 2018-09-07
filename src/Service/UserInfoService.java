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
	
	public UserInfoDto searchpwd(UserInfoDto dto) {
		return dao.searchpwd(dto);
	}
	
	public int getTotal() {
		return dao.getAllUserInfoCnt();
	}
	
	public List getPagingList(Paging paging) {
		return dao.getPagingList(paging);
	}
	
}
