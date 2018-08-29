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
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getUserEmail());
			ps.setString(2, dto.getUserPw());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				if(rs.getInt(1)>0) result = true;
				else result = false;
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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UserInfoDto getUserInfo(String userEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<UserInfoDto> getAllUserInfo() {
		// TODO Auto-generated method stub
		return null;
	}

}
