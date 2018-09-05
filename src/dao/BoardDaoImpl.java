package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.util.Paging;
import dbutil.DBConn;
import dto.BoardDto;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
 * 
 * 수정일 : 2018.09.04
 * 수정자 : 권미현
 *  - getBoard, getCategoryBoard, getPagingList(정렬 있는거), getboards 쿼리문 수정 및 set 문 추가
 *  - createBoard : INSERT 문 수정
 *  
 * 수정일 : 2018.09.04
 * 수정자 : 안희민
 *  - getSearchList 추가
 */

public class BoardDaoImpl implements BoardDao {

	private Connection conn = DBConn.getConnection();
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	@Override
	public BoardDto getBoard(int boardNo) {
		
		BoardDto dto = null;
		
		String sql = "SELECT"
				+ " 	B.board_no,"
				+ " 	B.board_category,"
				+ " 	B.board_title,"
				+ " 	B.board_user,"
				+ " 	B.board_read,"
				+ " 	(SELECT COUNT(*) FROM recommend R WHERE R.board_no=B.board_no) board_recommend,"
				+ " 	B.board_create,"
				+ " 	B.board_modify,"
				+ " 	B.board_content,"
				+ " 	B.board_tech,"
				+ " 	U.user_nick"
				+ " FROM board B, userInfo U"
				+ " WHERE B.board_user = U.user_email AND board_no=?"; // 1. no
		
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
				dto.setBoardNick(rs.getString("user_nick"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardRecommend(rs.getInt("board_recommend"));
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}

		return dto;
	}
	
	@Override
	public ArrayList<BoardDto> getCategoryBoard(String boardCategory) {
		
		ArrayList<BoardDto> list = new ArrayList<>();
		BoardDto dto = null;
		String sql = "SELECT"
				+ " 	B.board_no,"
				+ " 	B.board_category,"
				+ " 	B.board_title,"
				+ " 	B.board_user,"
				+ " 	B.board_read,"
				+ " 	(SELECT COUNT(*) FROM recommend R WHERE R.board_no=B.board_no) board_recommend,"
				+ " 	B.board_create,"
				+ " 	B.board_modify,"
				+ " 	B.board_content,"
				+ " 	B.board_tech,"
				+ "		U.user_nick" 
				+ " FROM board B, userInfo U" 
				+ " WHERE B.board_user = U.user_email AND board_category=?"; // 1. category

		
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
				dto.setBoardNick(rs.getString("user_nick"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardRecommend(rs.getInt("board_recommend"));
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}

		return list;
	}
	
	@Override
	public int getTotal(String categoryName) {
		int total = 0;
		
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
		String sql = "SELECT * FROM (" + 
				"    SELECT rownum rnum, B.* FROM (" + 
				"        SELECT * FROM board" + 
				"        WHERE board_category=?" +  // 1. category
				"        ORDER BY board_create DESC, board_no DESC" +
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
				dto.setBoardRecommend(rs.getInt("board_recommend"));
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	@Override
	public ArrayList<BoardDto> getPagingList(Paging paging, String categoryName, String order) {
		ArrayList<BoardDto> list = new ArrayList<>();
		BoardDto dto = null;
		String sql = null;
		
		if (order.equals("create")) { // 최신순
			
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT"
					+ " 		B.board_no,"
					+ " 		B.board_category,"
					+ " 		B.board_title,"
					+ " 		B.board_user,"
					+ " 		B.board_read,"
					+ " 		(SELECT COUNT(*) FROM recommend R WHERE board_no=B.board_no) board_recommend,"
					+ " 		B.board_create,"
					+ " 		B.board_modify,"
					+ " 		B.board_content,"
					+ " 		B.board_tech,"
					+ "			U.user_nick"
					+ "        FROM board B, userInfo U" 
					+ "        WHERE B.board_user = U.user_email AND board_category=?" // 1. category
					+ "        ORDER BY board_create DESC, board_no DESC" +
					"    ) B" + 
					"    ORDER BY rnum" + 
					")" + 
					"WHERE rnum BETWEEN ?" // 2. paging.getStartNo()
					+ " AND ?"; // 3. paging.getEndNo()
			
		} else if (order.equals("read")) { // 조회순
			
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT"
					+ " 		B.board_no,"
					+ " 		B.board_category,"
					+ " 		B.board_title,"
					+ " 		B.board_user,"
					+ " 		B.board_read,"
					+ " 		(SELECT COUNT(*) FROM recommend R WHERE R.board_no=B.board_no) board_recommend,"
					+ " 		B.board_create,"
					+ " 		B.board_modify,"
					+ " 		B.board_content,"
					+ " 		B.board_tech,"
					+ "			U.user_nick"
					+ "        FROM board B, userInfo U" 
					+ "        WHERE B.board_user = U.user_email AND board_category=?" // 1. category
					+ "        ORDER BY board_read DESC, board_no DESC" +
					"    ) B" 
					+ "    ORDER BY rnum" 
					+ ")" 
					+ "WHERE rnum BETWEEN ?" // 2. paging.getStartNo()
					+ " AND ?"; // 3. paging.getEndNo()
			
		} else if (order.equals("recommend")) { // 추천순
			
			sql = "SELECT * FROM (" + 
					"    SELECT rownum rnum, B.* FROM (" + 
					"        SELECT"
					+ " 		B.board_no,"
					+ " 		B.board_category,"
					+ " 		B.board_title,"
					+ " 		B.board_user,"
					+ " 		B.board_read,"
					+ " 		(SELECT COUNT(*) FROM recommend R WHERE R.board_no=B.board_no) board_recommend,"
					+ " 		B.board_create,"
					+ " 		B.board_modify,"
					+ " 		B.board_content,"
					+ " 		B.board_tech,"
					+ "			U.user_nick"
					+ "        FROM board B, userInfo U" 
					+ "        WHERE B.board_user = U.user_email AND board_category=?" // 1. category
					+ "        ORDER BY board_recommend DESC, board_no DESC" 
					+ "    ) B" 
					+ "    ORDER BY rnum" 
					+ ")" 
					+ "WHERE rnum BETWEEN ?" // 2. paging.getStartNo()
					+ " AND ?"; // 3. paging.getEndNo()
		}
		
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
				dto.setBoardNick(rs.getString("user_nick"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardRecommend(rs.getInt("board_recommend"));
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	// getSearchList 추가
		@Override
		public ArrayList<BoardDto> getSearchList(Paging paging, String categoryName, String order, String searchString) {
			ArrayList<BoardDto> list = new ArrayList<>();
			BoardDto dto = null;
			String sql = null;
			
			if (order.equals("create")) { // 최신순
				
				sql = "SELECT * FROM (" + 
						"    SELECT rownum rnum, B.* FROM (" + 
						"        SELECT"
						+ " board_no,"
						+ " board_category,"
						+ " board_title,"
						+ " board_user,"
						+ " board_read,"
						+ " (SELECT COUNT(*) FROM recommend WHERE board_no=board.board_no) board_recommend,"
						+ " board_create,"
						+ " board_modify,"
						+ " board_content,"
						+ " board_tech" +
						" FROM board" + 
						"        WHERE board_category=?" +  // 1. category
						" 		 AND board_title like '%'||?||'%'" +		// 2. searchString 
						"        ORDER BY board_create DESC, board_no DESC" +
						"    ) B" + 
						"    ORDER BY rnum" + 
						")" + 
						"WHERE rnum BETWEEN ?" // 3. paging.getStartNo()
						+ " AND ?"; // 4. paging.getEndNo()
				
			} else if (order.equals("read")) { // 조회순
				
				sql = "SELECT * FROM (" + 
						"    SELECT rownum rnum, B.* FROM (" + 
						"        SELECT"
						+ " board_no,"
						+ " board_category,"
						+ " board_title,"
						+ " board_user,"
						+ " board_read,"
						+ " (SELECT COUNT(*) FROM recommend WHERE board_no=board.board_no) board_recommend,"
						+ " board_create,"
						+ " board_modify,"
						+ " board_content,"
						+ " board_tech" +
						" FROM board" + 
						"        WHERE board_category=?" +  // 1. category
						"        AND board_title like '%'||?||'%'" +		// 2. searchString	
						"        ORDER BY board_read DESC, board_no DESC" +
						"    ) B" + 
						"    ORDER BY rnum" + 
						")" + 
						"WHERE rnum BETWEEN ?" // 3. paging.getStartNo()
						+ " AND ?"; // 4. paging.getEndNo()
				
			} else if (order.equals("recommend")) { // 추천순
				
				sql = "SELECT * FROM (" + 
						"    SELECT rownum rnum, B.* FROM (" + 
						"        SELECT"
						+ " board_no,"
						+ " board_category,"
						+ " board_title,"
						+ " board_user,"
						+ " board_read,"
						+ " (SELECT COUNT(*) FROM recommend WHERE board_no=board.board_no) board_recommend,"
						+ " board_create,"
						+ " board_modify,"
						+ " board_content,"
						+ " board_tech" +
						" FROM board" + 
						"        WHERE board_category=?" +  // 1. category
						"		 AND board_title like '%'||?||'%'" +		// 2. searchString 
						"        ORDER BY board_recommend DESC, board_no DESC" +
						"    ) B" + 
						"    ORDER BY rnum" + 
						")" + 
						"WHERE rnum BETWEEN ?" // 3. paging.getStartNo()
						+ " AND ?"; // 4. paging.getEndNo()
			}
			
			try {
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, categoryName);
				ps.setString(2, searchString);
				ps.setInt(3, paging.getStartNo());
				ps.setInt(4, paging.getEndNo());
				
				rs = ps.executeQuery();
				
				while (rs.next()) {
					dto = new BoardDto();
					
					dto.setBoardNo(rs.getInt("board_no"));
					dto.setBoardCategory(rs.getString("board_category"));
					dto.setBoardTitle(rs.getString("board_title"));
					dto.setBoardUser(rs.getString("board_user"));
					dto.setBoardRead(rs.getInt("board_read"));
					dto.setBoardRecommend(rs.getInt("board_recommend"));
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
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			System.out.println(list.size());
			return list;
		}
		
	@Override
	public boolean createBoard(BoardDto dto) {
		boolean result = false;	// 데이터베이스 저장 성공 여부
		
		String sql = "INSERT INTO board"
				+ " VALUES ("
				+ " ?," // 1. no
				+ " ?," // 2. category
				+ " ?," // 3. title
				+ " ?," // 4. user
				+ " 0," // read
				+ " 0," // recommend
				+ " TO_CHAR(sysdate, 'YYYY-MM-DD')," // create
				+ " null," // modify
				+ " ?," // 5. content
				+ " ?" // 6.tech
				+ ")";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, dto.getBoardNo());
			ps.setString(2, dto.getBoardCategory());
			ps.setString(3, dto.getBoardTitle());
			ps.setString(4, dto.getBoardUser());
			ps.setString(5, dto.getBoardContent());
			ps.setInt(6, dto.getBoardTech());
			
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
	public boolean updateBoard(BoardDto dto) {
		boolean result = false;	// 데이터베이스 저장 성공 여부
		
		String sql = "UPDATE board SET"
				+ " board_title=?" // 1. title
				+ ", board_modify=TO_CHAR(sysdate, 'YYYY-MM-DD')" // modify
				+ ", board_content=?" // 2. content
				+ " WHERE board_no=?"; // 3. no
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getBoardTitle());
			ps.setString(2, dto.getBoardContent());
			ps.setInt(3, dto.getBoardNo());
			
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
	public boolean deleteBoard(int boardNo) {
		boolean result = false;	// 데이터베이스 저장 성공 여부
		
		String sql = "DELETE FROM board"
				+ " WHERE board_no=?"; // 1. no
		
		try {
			ps = conn.prepareStatement(sql);
			
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
	
	@Override
	public void boardRead(int boardNo) {
		String sql = "UPDATE board SET board_read=board_read+1"
				+ " WHERE board_no = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardNo);
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)	ps.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@Override
	public ArrayList<BoardDto> getboards(String categoryName, int listnum) {
		ArrayList<BoardDto> list = new ArrayList<>();
		BoardDto dto = null;
		
		String sql = " SELECT * FROM (SELECT"
				+ " 		B.board_no,"
				+ " 		B.board_category,"
				+ " 		B.board_title,"
				+ " 		B.board_user,"
				+ " 		B.board_read,"
				+ " 		(SELECT COUNT(*) FROM recommend R WHERE R.board_no=B.board_no) board_recommend,"
				+ " 		B.board_create,"
				+ " 		B.board_modify,"
				+ " 		B.board_content,"
				+ " 		B.board_tech,"
				+ "			U.user_nick"	
				+ "        FROM board B, userInfo U" 
				+ "        WHERE B.board_user = U.user_email AND board_category = ? ORDER BY board_no DESC) " // 1. categoryName
				+ " WHERE rownum <= ? "; // 2. listnum
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, categoryName);
			ps.setInt(2, listnum);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new BoardDto();
				
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setBoardCategory(rs.getString("board_category"));
				dto.setBoardTitle(rs.getString("board_title"));
				dto.setBoardUser(rs.getString("board_user"));
				dto.setBoardNick(rs.getString("user_nick"));
				dto.setBoardRead(rs.getInt("board_read"));
				dto.setBoardRecommend(rs.getInt("board_recommend"));
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
				if (rs!= null)  rs.close();
				if (ps!= null)  ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return list;
	}

	@Override
	public ArrayList<BoardDto> getMyBoard(String userNick, int listnum) {
		ArrayList<BoardDto> list = new ArrayList<>();
		BoardDto dto = null;
		String sql = "SELECT * FROM (SELECT"
				+ " board_no,"
				+ " board_category,"
				+ " board_title,"
				+ " board_create" 
				+ " FROM board" 
				+ " WHERE board_user=?)"
				+ " WHERE rownum <= ? "; 

		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNick);
			ps.setInt(2, listnum);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new BoardDto();
				
				dto.setBoardNo(rs.getInt("board_no"));
				dto.setBoardCategory(rs.getString("board_category"));
				dto.setBoardTitle(rs.getString("board_title"));
				dto.setBoardCreate(rs.getDate("board_create"));

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
	public int newBoardNo() {
		int result = 0;	
		
		String sql = "SELECT board_seq.nextval FROM dual"; 
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
