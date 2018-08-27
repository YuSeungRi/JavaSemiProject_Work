package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbutil.DBConn;
import dto.BoardDto;
import dto.ReplyDto;

public class ReplyDaoImpl implements ReplyDao {

	private Connection conn = DBConn.getConnection();
	private PreparedStatement ps;
	private ResultSet rs;
	
	ArrayList<ReplyDto> dtos; 
	ReplyDto dto;
	
	@Override
	public ArrayList<ReplyDto> getReplyList(int boardNo) {
		dtos = new ArrayList<>();
		
		String sql = "SELECT * FROM reply"
				+ " WHERE board_no=?"; // 1. no
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNo);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new ReplyDto();
				
				dto.setReplyNo(rs.getInt("reply_no"));
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setUserEmail(rs.getString("user_email"));
				dto.setReplyCreate(rs.getDate("reply_create"));
				dto.setReplyContent(rs.getString("reply_content"));
				
				dtos.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}

	@Override
	public ArrayList<ReplyDto> getMyReply(String userEmail) {	
		dtos = new ArrayList<>();
		
		String sql = "SELECT * FROM reply"
				+ " WHERE userEmail=?"; // 1. userEmail
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userEmail);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new ReplyDto();
				
				dto.setReplyNo(rs.getInt("reply_no"));
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setUserEmail(rs.getString("user_email"));
				dto.setReplyCreate(rs.getDate("reply_create"));
				dto.setReplyContent(rs.getString("reply_content"));
				
				dtos.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}

	@Override
	public int addNewReply(ReplyDto dto) {
		int result = 0;
		
		String sql = "INSERT INTO reply (reply_no, board_no, user_email, reply_create, reply_content) VALUES ("
				+ " reply_seq.nextval, "
				+ " ?," // 1. board_no
				+ " ?," // 2. user_email
				+ " sysdate,"
				+ " ?"; // 3. reply_content
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getBoardNo());
			ps.setString(2, dto.getUserEmail());
			ps.setString(3, dto.getReplyContent());
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public int deleteReply(int replyNo) {
		int result = 0;
		
		String sql = "DELETE reply WHERE "
				+ " replyNo = ?"; // 3. reply_content
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, replyNo);
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
