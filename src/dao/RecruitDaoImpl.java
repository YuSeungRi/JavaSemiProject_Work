package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.util.Paging;
import dbutil.DBConn;
import dto.BoardDto;
import dto.RecruitDto;

/*
 * 작성일 : 2018.08.30
 * 작성자 : 권미현
 * 
 *  구인구직 DAO_구현
 * 
 * 수정일 : 2018.09.03
 * 수정자 : 권미현
 *  - '게시글 상제 조회(내용)_구인구직' 추가
 *  - 메소드명 수정
 *  - '게시글 수정_구인구직', '게시글 삭제_구인구직' 추가
 */

public class RecruitDaoImpl implements RecruitDao {

	private Connection conn = DBConn.getConnection();
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	@Override
	public RecruitDto getBoardRecruit(int boardNo) {
		RecruitDto dto = null;
		
		String sql = "SELECT * FROM board" + 
				" JOIN recruit" + 
				" USING (board_no)" + 
				" WHERE board_no=?"; // 1. no
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNo);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new RecruitDto();
				
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setBoardCategory(rs.getString("board_category"));
				dto.setBoardTitle(rs.getString("board_title"));
				dto.setBoardUser(rs.getString("board_user"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardCreate(rs.getDate("board_create"));
				dto.setBoardModify(rs.getDate("board_modify"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardTech(rs.getInt("board_tech"));
				dto.setRecuritStatus(rs.getString("recurit_status"));
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

		return dto;
	}
	
	@Override
	public ArrayList<RecruitDto> getPagingListRecruit(Paging paging, String order) {
		ArrayList<RecruitDto> list = new ArrayList<>();
		RecruitDto dto = null;
		String sql = null;
		
		if (order.equals("create")) { // 최신순
			
			sql = "SELECT * FROM (" + 
				"    SELECT rownum rnum, B.* FROM (" + 
				"        SELECT * FROM board" + 
				"        JOIN recruit" +  
				"		 USING (board_no)"+
				"        ORDER BY board_create DESC, board_no DESC" +
				"    ) B" + 
				"    ORDER BY rnum" + 
				")" + 
				"WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
				+ " AND ?"; // 2. paging.getEndNo()
			
		} else if (order.equals("read")) { // 조회순
			
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT * FROM board" + 
					"        JOIN recruit" +  
					"		 USING (board_no)"+
					"        ORDER BY board_read DESC, board_no DESC" +
					"    ) B" + 
					"    ORDER BY rnum" + 
					")" + 
					"WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
					+ " AND ?"; // 2. paging.getEndNo()
			
		} else if (order.equals("recommend")) { // 추천순
			
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT * FROM board" + 
					"        JOIN recruit" +  
					"		 USING (board_no)"+
					"        ORDER BY board_recommend DESC, board_no DESC" +
					"    ) B" + 
					"    ORDER BY rnum" + 
					")" + 
					"WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
					+ " AND ?"; // 2. paging.getEndNo()
			
		}
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new RecruitDto();
				
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setBoardCategory(rs.getString("board_category"));
				dto.setBoardTitle(rs.getString("board_title"));
				dto.setBoardUser(rs.getString("board_user"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardCreate(rs.getDate("board_create"));
				dto.setBoardModify(rs.getDate("board_modify"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardTech(rs.getInt("board_tech"));
				dto.setRecuritStatus(rs.getString("recurit_status"));
				
				list.add(dto);
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
		
		return list;
	}

	@Override
	public boolean createBoardRecruit(RecruitDto dto) {
		boolean result = false;
		
		// Board
		String sql = "INSERT INTO board"
				+ " VALUES (BOARD_SEQ.nextval,"
				+ " ?," // 1. category
				+ " ?," // 2. title
				+ " ?," // 3. user
				+ " 0," // read
				+ " 0," // recommend
				+ " TO_CHAR(sysdate, 'YYYY-MM-DD')," // create
				+ " null," // modify
				+ " ?," // 4. content
				+ " ?" // 5.tech
				+ ")";
		
		// Recruit
		String sql2 = "INSERT INTO recruit"
				+ " VALUES (BOARD_SEQ.currval,"
				+ " ?" // 1. status
				+ ")";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getBoardCategory());
			ps.setString(2, dto.getBoardTitle());
			ps.setString(3, dto.getBoardUser());
			ps.setString(4, dto.getBoardContent());
			ps.setInt(5, dto.getBoardTech());
			
			ps.executeUpdate();
			
			// 두번째 쿼리 (구인구직_상태)
			ps = conn.prepareStatement(sql2);
			
			ps.setString(1, dto.getRecuritStatus());
			
			ps.executeQuery();
			
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
	public boolean updateBoardRecruit(RecruitDto dto) {
		boolean result = false;	// 데이터베이스 저장 성공 여부
		
		// Board
		String sql = "UPDATE board SET"
				+ " board_title=?" // 1. title
				+ ", board_modify=TO_CHAR(sysdate, 'YYYY-MM-DD')" // modify
				+ ", board_content=?" // 2. content
				+ " WHERE board_no=?"; // 3. no
		
		// Recruit
		String sql2 = "UPDATE recruit SET"
				+ " recurit_status=?" // 1. status
				+ " WHERE board_no=?"; // 2. no
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getBoardTitle());
			ps.setString(2, dto.getBoardContent());
			ps.setInt(3, dto.getBoardNo());
			
			ps.executeUpdate();
			
			// 두번째 쿼리 (구인구직_상태)
			ps = conn.prepareStatement(sql2);
			
			ps.setString(1, dto.getRecuritStatus());
			ps.setInt(2, dto.getBoardNo());
			
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
	public boolean deleteBoardRecruit(int boardNo) {
		boolean result = false;	// 데이터베이스 저장 성공 여부
		
		String sql = "DELETE FROM recruit"
				+ " WHERE board_no=?"; // 1. no
		
		String sql2 = "DELETE FROM board"
				+ " WHERE board_no=?"; // 1. no
		
		try {
			// recruit
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNo);
			ps.executeUpdate();
			
			// board
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, boardNo);
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

}
