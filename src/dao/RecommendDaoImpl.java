package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbutil.DBConn;
import dto.BoardDto;

public class RecommendDaoImpl implements RecommendDao{
	
	// DB 연결 객체
	private Connection conn = DBConn.getConnection();
	
	// JDBC 객체
	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public int selectCountRecommend(BoardDto dto) {

		String sql = "SELECT COUNT(*) FROM recommend"
				+ " WHERE user_email=?"
				+ " AND board_no=?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getBoardUser());
			ps.setInt(2, dto.getBoardNo());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
			
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
	public void insertRecommend(BoardDto dto) {
		String sql = "INSERT INTO recommend (user_email, board_no)"
				+ " VALUES( ?, ? )";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getBoardUser());
			ps.setInt(2, dto.getBoardNo());
			
			ps.executeUpdate();
			
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
	}

	@Override
	public void deleteRecommend(BoardDto dto) {
		String sql = "DELETE recommend"
				+ " WHERE user_email=?"
				+ "	AND board_no=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getBoardUser());
			ps.setInt(2, dto.getBoardNo());
			
			ps.executeUpdate();
			
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
	}

	@Override
	public int selectTotalRecommend(BoardDto dto) {
		String sql = "SELECT COUNT(*) FROM recommend"
				+ " WHERE board_no=?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getBoardNo());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
			
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

}
