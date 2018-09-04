package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.util.Paging;
import dbutil.DBConn;
import dto.RecruitDto;

/*
 * 작성일 : 2018.08.30
 * 작성자 : 권미현
 * 
 *  구인구직 DAO_구현
 * 
 * 수정일 : 2018.09.04
 * 수정자 : 권미현
 *  - SELECT 문 모두 수정 (userinfo 랑 조인되게끔)
 *  - createBoardRecruit : INSERT 문 모두 수정
 */

public class RecruitDaoImpl implements RecruitDao {

	private Connection conn = DBConn.getConnection();
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	@Override
	public RecruitDto getBoardRecruit(int boardNo) {
		RecruitDto dto = null;
		
		String sql = "SELECT" + 
				"    board_no," + 
				"    B.board_category," + 
				"    B.board_title," + 
				"    B.board_user," + 
				"    U.user_nick," + 
				"    B.board_read," + 
				"    B.board_create," + 
				"    B.board_modify," + 
				"    B.board_content," + 
				"    r.recruit_status" + 
				" FROM board B" + 
				"  JOIN recruit R" + 
				"    USING (board_no)" + 
				"  JOIN userInfo U" + 
				"    ON B.board_user = U.user_email" + 
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
				dto.setBoardNick(rs.getString("user_nick"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardCreate(rs.getDate("board_create"));
				dto.setBoardModify(rs.getDate("board_modify"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setRecruitStatus(rs.getString("recruit_status"));
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
	public int getTotalStatus(String status) {
		int total = 0;
		
		String sql = "SELECT COUNT(*) FROM recruit"
				+ " WHERE recruit_status=?"; // 1. status
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, status);
			
			rs = ps.executeQuery();
			
			rs.next();
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return total;
	}
	
	@Override
	public ArrayList<RecruitDto> getPagingListRecruit(Paging paging, String order) {
		ArrayList<RecruitDto> list = new ArrayList<>();
		RecruitDto dto = null;
		String sql = null;
		
		if (order.equals("create")) { // 최신순
			
			sql = "SELECT * FROM (" + 
				"    SELECT rownum rnum, B.* FROM (" + 
				"        SELECT" + 
				"            board_no," + 
				"            B.board_category," + 
				"            B.board_title," + 
				"            B.board_user," + 
				"            U.user_nick," + 
				"            B.board_read," + 
				"            B.board_create," + 
				"            B.board_modify," + 
				"            B.board_content," + 
				"            r.recruit_status" + 
				"        FROM board B" + 
				"         JOIN recruit R" + 
				"            USING (board_no)" + 
				"         JOIN userInfo U" + 
				"            ON B.board_user = U.user_email" +
				"        ORDER BY board_create DESC, board_no DESC" +
				"    ) B" + 
				"    ORDER BY rnum" + 
				")" + 
				" WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
				+ " AND ?"; // 2. paging.getEndNo()
			
		} else if (order.equals("read")) { // 조회순
			
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT" + 
					"            board_no," + 
					"            B.board_category," + 
					"            B.board_title," + 
					"            B.board_user," + 
					"            U.user_nick," + 
					"            B.board_read," + 
					"            B.board_create," + 
					"            B.board_modify," + 
					"            B.board_content," + 
					"            r.recruit_status" + 
					"        FROM board B" + 
					"         JOIN recruit R" + 
					"            USING (board_no)" + 
					"         JOIN userInfo U" + 
					"            ON B.board_user = U.user_email" +
					"        ORDER BY board_read DESC, board_no DESC" +
					"    ) B" + 
					"    ORDER BY rnum" + 
					")" + 
					" WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
					+ " AND ?"; // 2. paging.getEndNo()
			
		} else if (order.equals("recommend")) { // 추천순
			
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT" + 
					"            board_no," + 
					"            B.board_category," + 
					"            B.board_title," + 
					"            B.board_user," + 
					"            U.user_nick," + 
					"            B.board_read," + 
					"            B.board_create," + 
					"            B.board_modify," + 
					"            B.board_content," + 
					"            r.recruit_status" + 
					"        FROM board B" + 
					"         JOIN recruit R" + 
					"            USING (board_no)" + 
					"         JOIN userInfo U" + 
					"            ON B.board_user = U.user_email" +
					"        ORDER BY board_recommend DESC, board_no DESC" +
					"    ) B" + 
					"    ORDER BY rnum" + 
					")" + 
					" WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
					+ " AND ?"; // 2. paging.getEndNo()
			
		} else if (order.equals("jobOffer")) { 
			// 상태(구인)
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT" + 
					"            board_no," + 
					"            B.board_category," + 
					"            B.board_title," + 
					"            B.board_user," + 
					"            U.user_nick," + 
					"            B.board_read," + 
					"            B.board_create," + 
					"            B.board_modify," + 
					"            B.board_content," + 
					"            r.recruit_status" + 
					"        FROM board B" + 
					"         JOIN recruit R" + 
					"            USING (board_no)" + 
					"         JOIN userInfo U" + 
					"            ON B.board_user = U.user_email" +
					"		 WHERE recruit_status='구인'" +
					"        ORDER BY board_create DESC, board_no DESC" +
					"    ) B" + 
					"    ORDER BY rnum" + 
					")" + 
					" WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
					+ " AND ?"; // 2. paging.getEndNo()
			
		} else if (order.equals("jobOfferComplete")) {
			// 상태(구인완료)
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT" + 
					"            board_no," + 
					"            B.board_category," + 
					"            B.board_title," + 
					"            B.board_user," + 
					"            U.user_nick," + 
					"            B.board_read," + 
					"            B.board_create," + 
					"            B.board_modify," + 
					"            B.board_content," + 
					"            r.recruit_status" + 
					"        FROM board B" + 
					"         JOIN recruit R" + 
					"            USING (board_no)" + 
					"         JOIN userInfo U" + 
					"            ON B.board_user = U.user_email" +
					"		 WHERE recruit_status='구인완료'" +
					"        ORDER BY board_create DESC, board_no DESC" +
					"    ) B" + 
					"    ORDER BY rnum" + 
					")" + 
					" WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
					+ " AND ?"; // 2. paging.getEndNo()
			
		} else if (order.equals("jobHunt")) {
			// 상태(구직)
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT" + 
					"            board_no," + 
					"            B.board_category," + 
					"            B.board_title," + 
					"            B.board_user," + 
					"            U.user_nick," + 
					"            B.board_read," + 
					"            B.board_create," + 
					"            B.board_modify," + 
					"            B.board_content," + 
					"            r.recruit_status" + 
					"        FROM board B" + 
					"         JOIN recruit R" + 
					"            USING (board_no)" + 
					"         JOIN userInfo U" + 
					"            ON B.board_user = U.user_email" +
					"		 WHERE recruit_status='구직'" +
					"        ORDER BY board_create DESC, board_no DESC" +
					"    ) B" + 
					"    ORDER BY rnum" + 
					")" + 
					" WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
					+ " AND ?"; // 2. paging.getEndNo()
			
		} else if (order.equals("jobHuntComplete")) {
			// 상태(구직완료)
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT" + 
					"            board_no," + 
					"            B.board_category," + 
					"            B.board_title," + 
					"            B.board_user," + 
					"            U.user_nick," + 
					"            B.board_read," + 
					"            B.board_create," + 
					"            B.board_modify," + 
					"            B.board_content," + 
					"            r.recruit_status" + 
					"        FROM board B" + 
					"         JOIN recruit R" + 
					"            USING (board_no)" + 
					"         JOIN userInfo U" + 
					"            ON B.board_user = U.user_email" +
					"		 WHERE recruit_status='구직완료'" +
					"        ORDER BY board_create DESC, board_no DESC" +
					"    ) B" + 
					"    ORDER BY rnum" + 
					")" + 
					" WHERE rnum BETWEEN ?" // 1. paging.getStartNo()
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
				dto.setBoardNick(rs.getString("user_nick"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardCreate(rs.getDate("board_create"));
				dto.setBoardModify(rs.getDate("board_modify"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setRecruitStatus(rs.getString("recruit_status"));
				
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
		String sql = "INSERT INTO board (board_no, board_category, board_title, board_user,"
				+ " board_read, board_create, board_content)"
				+ " VALUES ("
				+ " ?," // 1. no
				+ " ?," // 2. category
				+ " ?," // 3. title
				+ " ?," // 4. user
				+ " 0," // read
				+ " TO_CHAR(sysdate, 'YYYY-MM-DD')," // create
				+ " ?" // 5. content
				+ ")";
		
		// Recruit
		String sql2 = "INSERT INTO recruit"
				+ " VALUES ("
				+ " ?," // 1. no
				+ " ?" // 2. status
				+ ")";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, dto.getBoardNo());
			ps.setString(2, dto.getBoardCategory());
			ps.setString(3, dto.getBoardTitle());
			ps.setString(4, dto.getBoardUser());
			ps.setString(5, dto.getBoardContent());
			
			ps.executeUpdate();
			
			// 두번째 쿼리 (구인구직_상태)
			ps = conn.prepareStatement(sql2);
			
			ps.setInt(1, dto.getBoardNo());
			ps.setString(2, dto.getRecruitStatus());
			
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
				+ " recruit_status=?" // 1. status
				+ " WHERE board_no=?"; // 2. no
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getBoardTitle());
			ps.setString(2, dto.getBoardContent());
			ps.setInt(3, dto.getBoardNo());
			
			ps.executeUpdate();
			
			// 두번째 쿼리 (구인구직_상태)
			ps = conn.prepareStatement(sql2);
			
			ps.setString(1, dto.getRecruitStatus());
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
