package Service;

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
	
	public UserInfoDto searchpwd(UserInfoDto dto) {
		
		return dao.searchpwd(dto);
		
	}
	
}
