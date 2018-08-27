package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbutil.DBConn;
import dto.BoardDto;
import board.util.Paging;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
 * 
 * 수정일 : 2018.08.27
 * 수정자 : 권미현
 *  - '내가 작성한 게시글 조회' 메소드 삭제
 *  	public ArrayList<BoardDto> getUserBoard(String boardUser){}
 *  - '카테고리별 게시글 수 조회', '카테고리별 페이징 리스트 조회' 메소드 추가
 *  	public int getTotal(String categoryName){}
 *  	public List<BoardDto> getPagingList(Paging paging, String categoryName){}
 */

public class BoardDaoImpl implements BoardDao {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	@Override
	public BoardDto getBoard(int boardNo) {

		conn = DBConn.getConnection();
		
		BoardDto dto = null;
		
		String sql = "SELECT * FROM board"
				+ " WHERE board_no=?"; // 1. no
		
		try {
			ps = conn.prepareStatement(sql);
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
				dto.setBoardCreate(rs.getDate("board_create"));
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
		
		String sql = "SELECT * FROM board"
				+ " WHERE board_category=?"; // 1. category
		
		try {
			ps = conn.prepareStatement(sql);
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
				dto.setBoardCreate(rs.getDate("board_create"));
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
	public int getTotal(String categoryName) {
		int total = 0;
		
		conn = DBConn.getConnection();
		
		String sql = "SELECT count(*) FROM board"
				+ " WHERE board_category=?"; // 1. category
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, categoryName);
			
			rs = ps.executeQuery();
			
			rs.next();
			total = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return total;
	}
	@Override
	public ArrayList<BoardDto> getPagingList(Paging paging, String categoryName) {
		ArrayList<BoardDto> list = new ArrayList<>();
		BoardDto dto = null;
		
		conn = DBConn.getConnection();
		
		String sql = "SELECT * FROM (" + 
				"    SELECT rownum rnum, B.* FROM (" + 
				"        SELECT * FROM board" + 
				"        WHERE board_category=?" +  // 1. category
				"        ORDER BY board_no DESC" + 
				"    ) B" + 
				"    ORDER BY rnum" + 
				")" + 
				"WHERE rnum BETWEEN ?" // 2. paging.getStartNo()
				+ " AND ?"; // 3. paging.getEndNo()
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, categoryName);
			ps.setInt(2, paging.getStartNo());
			ps.setInt(3, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new BoardDto();
				
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setBoardCategory(rs.getString("board_category"));
				dto.setBoardTitle(rs.getString("board_title"));
				dto.setBoardUser(rs.getString("board_user"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardRecommand(rs.getInt("board_recommand"));
				dto.setBoardCreate(rs.getDate("board_create"));
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
		boolean result = false;	// 데이터베이스 저장 성공 여부
		
		conn = DBConn.getConnection();
		
		String sql = "INSERT INTO board"
				+ " VALUES (BOARD_SEQ.nextval,"
				+ " ?," // 1. category
				+ " ?," // 2. title
				+ " ?," // 3. user
				+ " 0," // read
				+ " 0," // recommand
				+ " TO_CHAR(sysdate, 'YYYY-MM-DD')," // create
				+ " null," // modify
				+ " ?," // 4. content
				+ " ?" // 5.tech
				+ ")";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getBoardCategory());
			ps.setString(2, dto.getBoardTitle());
			ps.setString(3, dto.getBoardUser());
			ps.setString(4, dto.getBoardContent());
			ps.setInt(5, dto.getBoardTech());
			
			ps.executeUpdate();
			
			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public boolean updateBoard(String boardUser, int boardNo, BoardDto dto) {
		boolean result = false;	// 데이터베이스 저장 성공 여부
		
		conn = DBConn.getConnection();
		
		String sql = "UPDATE board SET"
				+ " board_title=?" // 1. title
				+ ", board_modify=TO_CHAR(sysdate, 'YYYY-MM-DD')" // modify
				+ ", board_content=?" // 2. content
				+ " WHERE board_user=?" // 3. user
				+ " and board_no=?"; // 4. no
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getBoardTitle());
			ps.setString(2, dto.getBoardContent());
			ps.setString(3, boardUser);
			ps.setInt(4, boardNo);
			
			ps.executeUpdate();
			
			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public boolean deleteBoard(String boardUser, int boardNo) {
		boolean result = false;	// 데이터베이스 저장 성공 여부
		
		conn = DBConn.getConnection();
		
		String sql = "DELETE FROM board"
				+ " WHERE board_user=?" // 1. user
				+ " and board_no=?"; // 2. no
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, boardUser);
			ps.setInt(2, boardNo);
			
			ps.executeUpdate();
			
			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public boolean deleteBoardManager(int boardNo) {
		boolean result = false;	// 데이터베이스 저장 성공 여부
		
		conn = DBConn.getConnection();
		
		String sql = "DELETE FROM board"
				+ " WHERE board_no=?"; // 1. no
		
		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, boardNo);
			
			ps.executeUpdate();
			
			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
