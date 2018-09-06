package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbutil.DBConn;
import dto.UserInfoDto;

public class UserInfoDaoImpl implements UserInfoDao {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public boolean login(UserInfoDto dto) {
		
	
		boolean result = false;
		
		conn = DBConn.getConnection();
		
		String query = "SELECT COUNT(*) FROM userInfo" 
				+ " WHERE user_email = ? and user_pw=?";
		
		String afterQuery = "INSERT INTO login_log(user_email, login_time, login_result) VALUES ("
				+ " ?,"	//1. user_email
				+ " sysdate," //2. login_time
				+ " ?)";//3. login_result
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getUserEmail());
			ps.setString(2, dto.getUserPw());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				if(rs.getInt(1)>0) result = true;
				else result = false;
			}
			//afterQuery : logging
			ps = conn.prepareStatement(afterQuery);
			ps.setString(1, dto.getUserEmail());
			ps.setString(2, result?"Success":"Fail");
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	@Override
	public int createUser(UserInfoDto dto) {
		int result = 0;
		
		conn = DBConn.getConnection();
		
		String query = "INSERT INTO userInfo VALUES ("
				+ " ?," // 1. user_email
				+ " ?," // 2. user_nick
				+ " ?," // 3. user_pw
				+ " '1'," // 4. user_level
				+ " SYSDATE," // 5. user_registDate
				+ " 'ddd'," // 6. user_intro
				+ " 'asd'" // 7. user_photo
				+ " )";
		
		try {
			ps = conn.prepareStatement(query);
			System.out.println(dto.getUserEmail());
			System.out.println(dto.getUserNick());
			System.out.println(dto.getUserPw());
			
			ps.setString(1, dto.getUserEmail());
			ps.setString(2, dto.getUserNick());
			ps.setString(3, dto.getUserPw());
//			ps.setString(4, dto.getUserLevel());
//			ps.setDate(4, new Date(dto.getUserRegistDate().getTime()));
//			ps.setString(6, dto.getUserIntro());
//			ps.setString(7, dto.getUserPhoto());
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	@Override
	public boolean pwChange(String userEmail, String newPassword) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean changeLevel(String userEmail, String newLevel) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateUserInfo(UserInfoDto dto) {
		
		boolean result = false;
		
		conn = DBConn.getConnection();
		
		String query = "UPDATE userinfo SET"
				+ " user_nick=?,"
				+ " user_pw=?,"
				+ " user_intro=?"
				+ " WHERE user_email=?";
		
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getUserNick());
			ps.setString(2, dto.getUserPw());
			ps.setString(3, dto.getUserIntro());
			ps.setString(4, dto.getUserEmail());
			
			System.out.println(dto.getUserNick());
			System.out.println(dto.getUserPw());
			System.out.println(dto.getUserIntro());
			System.out.println(dto.getUserEmail());
			ps.executeUpdate();
			
			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	

	@Override
	public UserInfoDto getUserInfo(String userEmail) {
		
		conn = DBConn.getConnection();
		
		UserInfoDto dto= null;
		
		String query = "SELECT * FROM userInfo"
				+ " WHERE user_email=?";
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, userEmail);
			rs = ps.executeQuery();
	
			while(rs.next()) {
				dto = new UserInfoDto();
				dto.setUserEmail(rs.getString("user_email"));
				dto.setUserNick(rs.getString("user_nick"));
				dto.setUserPw(rs.getString("user_pw"));
				dto.setUserLevel(rs.getString("user_level"));
				dto.setUserRegistDate(rs.getDate("user_registdate"));
				dto.setUserIntro(rs.getString("user_intro"));
				dto.setUserPhoto(rs.getString("user_photo"));
				
				
				return dto;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;

	}

	@Override
	public ArrayList<UserInfoDto> getAllUserInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUserNick(UserInfoDto dto) {

		conn = DBConn.getConnection();
		
		String nick=null;
		
		String query = "SELECT * FROM userInfo"
				+ " WHERE user_email=?";
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getUserEmail());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				nick=rs.getString("user_nick");

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return nick;

	}

	@Override
	public UserInfoDto searchpwd(UserInfoDto dto) {
		
		conn = DBConn.getConnection();
		
		UserInfoDto userdto= null;
		
		String query = "SELECT user_email, user_pw FROM userInfo"
				+ " WHERE user_email=?";
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getUserEmail());

			rs = ps.executeQuery();
			
			while(rs.next()) {
				userdto = new UserInfoDto();
				userdto.setUserEmail(rs.getString("user_email"));
				userdto.setUserPw(rs.getString("user_pw"));
				

				return userdto;

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

}
