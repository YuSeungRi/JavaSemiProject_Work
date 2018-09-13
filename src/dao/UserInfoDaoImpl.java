package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.util.Paging;
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
	public boolean socialLogin(UserInfoDto dto) {
		
		boolean result = false;
		
		conn = DBConn.getConnection();
		
		String query = "SELECT COUNT(*) FROM userInfo" 
				+ " WHERE user_email = ? ";
		
		String afterQuery = "INSERT INTO login_log(user_email, login_time, login_result) VALUES ("
				+ " ?,"	//1. user_email
				+ " sysdate," //2. login_time
				+ " ?)";//3. login_result
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getUserEmail());
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
				+ " 'new'," // 6. user_intro
				+ " 'mm1.jpg'" // 7. user_photo
				+ " )";
		
		try {
			ps = conn.prepareStatement(query);

			ps.setString(1, dto.getUserEmail());
			ps.setString(2, dto.getUserNick());
			ps.setString(3, dto.getUserPw());

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
	public int socialcreateUser(UserInfoDto dto) {
		int result = 0;
		
		conn = DBConn.getConnection();
		
		String query = "INSERT INTO userInfo VALUES ("
				+ " ?," // 1. user_email
				+ " ?," // 2. user_nick
				+ " '1234'," // 3. user_Pw 
				+ " '1'," // 4. user_level
				+ " SYSDATE," // 5. user_registDate
				+ " 'new'," // 6. user_intro
				+ " 'mm1.jpg'" // 7. user_photo
				+ " )";
		
		try {
			ps = conn.prepareStatement(query);

			ps.setString(1, dto.getUserEmail());
			ps.setString(2, dto.getUserNick());

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
	public boolean checkUser(UserInfoDto dto) {
		boolean result = false;
		
		conn = DBConn.getConnection();
		
		String query =" SELECT COUNT(*) FROM USERINFO "
				+ " WHERE USER_EMAIL = ? ";//1. userEmail
		
		try {
			ps = conn.prepareStatement(query);
			
			ps.setString(1, dto.getUserEmail());
			 
			ps.executeUpdate();
			
			result = true;
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

		boolean result = false;
		
		conn = DBConn.getConnection();
		
		String query = "UPDATE userinfo SET"
				+ " user_level=? "
				+ " WHERE user_email=?";
		
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, newLevel);
			ps.setString(2, userEmail);

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
	public boolean updateUserInfo2(UserInfoDto dto) {
		
		boolean result = false;
		
		conn = DBConn.getConnection();
		
		String query = "UPDATE userinfo SET"
				+ " user_nick=?,"
				+ " user_pw=?,"
				+ " user_intro=?,"
				+ " user_photo=?"
				+ " WHERE user_email=?";
		
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getUserNick());
			ps.setString(2, dto.getUserPw());
			ps.setString(3, dto.getUserIntro());
			ps.setString(4, dto.getUserPhoto());
			ps.setString(5, dto.getUserEmail());
			
			System.out.println(dto.getUserNick());
			System.out.println(dto.getUserPw());
			System.out.println(dto.getUserIntro());
			System.out.println(dto.getUserPhoto());
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

	@Override
	public int getAllUserInfoCnt() {
		
		conn = DBConn.getConnection();
		
		String sql = "SELECT count(*) FROM userinfo";
		
		int cnt = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;

	}

	
	
	@Override
	public int getEmailSearchUserInfoCnt(String searchString) {
	
		conn = DBConn.getConnection();
		
		String sql = "SELECT count(*) FROM userinfo WHERE user_email like '%'||?||'%'";
		
		int cnt = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}
	
	
	@Override
	public int getNickSearchUserInfoCnt(String searchString) {

		conn = DBConn.getConnection();
		
		String sql = "SELECT count(*) FROM userinfo WHERE user_nick like '%'||?||'%'";
		
		int cnt = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}
	
	@Override
	public ArrayList<UserInfoDto> getAllUserInfoList(Paging paging) {
		
		conn = DBConn.getConnection();
		
		String sql
		= "SELECT * FROM (" + 
		"	SELECT rownum rnum, B.* FROM (" + 
		"		SELECT " + 
		"		u.user_email," + 
		"		u.user_nick," + 
		"		u.user_level," + 
		"		(SELECT count(*) FROM board b WHERE u.user_email = b.board_user) cntboard," + 
		"		(SELECT count(*) FROM reply r WHERE u.user_email = r.user_email) cntreply," + 
		"		u.user_registdate," + 
		"		(SELECT MAX(login_time) FROM login_log g WHERE u.user_email = g.user_email) login_time " + 
		"		FROM userinfo u ORDER BY user_registdate DESC) B" + 
		"		ORDER BY rnum)" + 
		" WHERE rnum BETWEEN ? AND ? ";
	
		ArrayList<UserInfoDto> UserList = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());

			// ResultSet 반환
			rs = ps.executeQuery();

			while (rs.next()) {
				UserInfoDto dto = new UserInfoDto();

				dto.setUserEmail(rs.getString("user_email"));
				dto.setUserNick(rs.getString("user_nick"));
				dto.setUserLevel(rs.getString("user_level"));
				dto.setCntboard(rs.getInt("cntboard"));
				dto.setCntreply(rs.getInt("cntreply"));
				dto.setUserRegistDate(rs.getDate("user_registdate"));
				dto.setLogintime(rs.getDate("login_time"));

				UserList.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	
	return UserList;
	}

	@Override
	public ArrayList<UserInfoDto> getUserEmailSearchList(Paging paging, String searchString) {
		
		conn = DBConn.getConnection();
		
		String sql
		= "SELECT * FROM (" + 
		"	SELECT rownum rnum, B.* FROM (" + 
		"		SELECT " + 
		"		u.user_email," + 
		"		u.user_nick," + 
		"		u.user_level," + 
		"		(SELECT count(*) FROM board b WHERE u.user_email = b.board_user) cntboard," + 
		"		(SELECT count(*) FROM reply r WHERE u.user_email = r.user_email) cntreply," + 
		"		u.user_registdate," + 
		"		(SELECT MAX(login_time) FROM login_log g WHERE u.user_email = g.user_email) login_time " + 
		"		FROM userinfo u " + 
		"     	WHERE user_email like '%'||?||'%' ORDER BY user_registdate DESC) B" + 
		"		ORDER BY rnum)" + 
		" WHERE rnum BETWEEN ? AND ?";
	
		ArrayList<UserInfoDto> UserList = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, searchString);
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());

			// ResultSet 반환
			rs = ps.executeQuery();

			while (rs.next()) {
				UserInfoDto dto = new UserInfoDto();

				dto.setUserEmail(rs.getString("user_email"));
				dto.setUserNick(rs.getString("user_nick"));
				dto.setUserLevel(rs.getString("user_level"));
				dto.setCntboard(rs.getInt("cntboard"));
				dto.setCntreply(rs.getInt("cntreply"));
				dto.setUserRegistDate(rs.getDate("user_registdate"));
				dto.setLogintime(rs.getDate("login_time"));

				UserList.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return UserList;

	}

	@Override
	public ArrayList<UserInfoDto> getUserNickSearchList(Paging paging, String searchString) {
		
		conn = DBConn.getConnection();
		
		String sql
		= "SELECT * FROM (" + 
		"	SELECT rownum rnum, B.* FROM (" + 
		"		SELECT " + 
		"		u.user_email," + 
		"		u.user_nick," + 
		"		u.user_level," + 
		"		(SELECT count(*) FROM board b WHERE u.user_email = b.board_user) cntboard," + 
		"		(SELECT count(*) FROM reply r WHERE u.user_email = r.user_email) cntreply," + 
		"		u.user_registdate," + 
		"		(SELECT MAX(login_time) FROM login_log g WHERE u.user_email = g.user_email) login_time " + 
		"		FROM userinfo u" + 
		"     	WHERE user_nick like '%'||?||'%' ORDER BY user_registdate DESC) B" + 
		"		ORDER BY rnum)" + 
		" WHERE rnum BETWEEN ? AND ?";
	
		ArrayList<UserInfoDto> UserList = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, searchString);
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());

			// ResultSet 반환
			rs = ps.executeQuery();

			while (rs.next()) {
				UserInfoDto dto = new UserInfoDto();

				dto.setUserEmail(rs.getString("user_email"));
				dto.setUserNick(rs.getString("user_nick"));
				dto.setUserLevel(rs.getString("user_level"));
				dto.setCntboard(rs.getInt("cntboard"));
				dto.setCntreply(rs.getInt("cntreply"));
				dto.setUserRegistDate(rs.getDate("user_registdate"));
				dto.setLogintime(rs.getDate("login_time"));

				UserList.add(dto);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return UserList;

	}

}




