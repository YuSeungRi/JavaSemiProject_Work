package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbutil.DBConn;
import dto.BoardDto;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
 */

public class BoardDaoImpl implements BoardDao {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	@Override
	public BoardDto getBoard(int boardNo) {

		conn = DBConn.getConnection();
		
		BoardDto dto = null;
		
		String query = "SELECT * FROM board"
				+ " WHERE board_no=?";
		
		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, boardNo);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new BoardDto();
				
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setBoardCategory(rs.getString("board_category"));
				dto.setBoardTitle(rs.getString("board_title"));
				dto.setBoardUser(rs.getString("board_user"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardRecommand(rs.getInt("board_recommand"));
				dto.setBoardCreate(rs.getDate("boare_create"));
				dto.setBoardModify(rs.getDate("board_modify"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardTech(rs.getInt("board_tech"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}

		return dto;
		
	}
	@Override
	public ArrayList<BoardDto> getCategoryBoard(String boardCategory) {

		conn = DBConn.getConnection();
		
		ArrayList<BoardDto> list = new ArrayList<>();
		BoardDto dto = null;
		
		String query = "SELECT * FROM board"
				+ " WHERE board_category=?";
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, boardCategory);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new BoardDto();
				
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setBoardCategory(rs.getString("board_category"));
				dto.setBoardTitle(rs.getString("board_title"));
				dto.setBoardUser(rs.getString("board_user"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardRecommand(rs.getInt("board_recommand"));
				dto.setBoardCreate(rs.getDate("boare_create"));
				dto.setBoardModify(rs.getDate("board_modify"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardTech(rs.getInt("board_tech"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}

		return list;
		
	}
	@Override
	public ArrayList<BoardDto> getUserBoard(String boardUser) {
		
		conn = DBConn.getConnection();
		
		ArrayList<BoardDto> list = new ArrayList<>();
		BoardDto dto = null;
		
		String query = "SELECT * FROM board"
				+ " WHERE board_user=?";
		
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, boardUser);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new BoardDto();
				
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setBoardCategory(rs.getString("board_category"));
				dto.setBoardTitle(rs.getString("board_title"));
				dto.setBoardUser(rs.getString("board_user"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardRecommand(rs.getInt("board_recommand"));
				dto.setBoardCreate(rs.getDate("boare_create"));
				dto.setBoardModify(rs.getDate("board_modify"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardTech(rs.getInt("board_tech"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}

		return list;
		
	}
	@Override
	public boolean createBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return false;
	}

}
