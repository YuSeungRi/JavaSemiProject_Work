package Service;

import dao.UserInfoDao;
import dao.UserInfoDaoImpl;
import dto.UserInfoDto;

public class UserInfoService {
	
	private UserInfoDao dao = new UserInfoDaoImpl();
	
	public int join(UserInfoDto dto) {
		
		return dao.createUser(dto);
	}
	
	public boolean login(String userEmail, String userPw) {
		
		return dao.login(userEmail, userPw);
		
	}
	
	
}
