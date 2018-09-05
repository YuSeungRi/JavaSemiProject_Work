package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbutil.DBConn;
import dto.BoardDto;
import dto.CodeCategoryDto;
import dto.CodeDto;

public class CodeDaoImpl implements CodeDao {
	private Connection conn = DBConn.getConnection();;
	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public ArrayList<CodeCategoryDto> getAllCategory(String userEmail) {
		
		ArrayList<CodeCategoryDto> dtos = new ArrayList<>();
		CodeCategoryDto dto = null;
		String sql = "SELECT"
				+ " C.category_no,"
				+ " C.category_name,"
				+ " (SELECT COUNT(*) FROM code WHERE category_no=C.category_no AND user_email = ?) category_count"
				+" FROM code_category C"
				+ " WHERE C.user_email = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userEmail);
			ps.setString(2, userEmail);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new CodeCategoryDto();
				dto.setCategoryNo(rs.getInt("category_no"));
				dto.setCategoryName(rs.getString("category_name"));
				dto.setCategoryCount(rs.getInt("category_count"));
				
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
	public int getAllCount(String userEmail) {
		String sql = "SELECT COUNT(*) FROM code WHERE user_email=?";
		int result = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userEmail);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				result = rs.getInt(1);
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
		return result;
	}

	@Override
	public ArrayList<CodeDto> getCodeList(int categoryNo, String userEmail) {
		ArrayList<CodeDto> dtos = new ArrayList<>();
		CodeDto dto = null;
		
		String sql = "SELECT * FROM code WHERE category_no = ? AND user_email =? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, categoryNo);
			ps.setString(2, userEmail);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new CodeDto();
				dto.setCodeNo(rs.getInt("code_no"));
				dto.setCategoryNo(rs.getInt("category_no"));
				dto.setCodeTitle(rs.getString("code_title"));
				dto.setCodeContent(rs.getString("code_content"));
				dto.setCodeSource(rs.getString("code_source"));
				dto.setUserEmail(rs.getString("user_email"));
				
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
	public ArrayList<CodeDto> getCodeList(String userEmail) {
		ResultSet rs2 = null;
		
		ArrayList<CodeDto> dtos = new ArrayList<>();
		CodeDto dto = null;
		
		ArrayList<String> arrTech = null;
		String sql = "SELECT * FROM code WHERE user_email =? ";
		String afterSql = "SELECT T.tech_name FROM code_tech C, tech T WHERE C.tech_no = T.tech_no AND"
				+ " C.code_no = ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userEmail);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				dto = new CodeDto();
				dto.setCodeNo(rs.getInt("code_no"));
				dto.setCategoryNo(rs.getInt("category_no"));
				dto.setCodeTitle(rs.getString("code_title"));
				dto.setCodeContent(rs.getString("code_content"));
				dto.setCodeSource(rs.getString("code_source"));
				dto.setUserEmail(rs.getString("user_email"));
				
				ps = conn.prepareStatement(afterSql);
				ps.setInt(1, dto.getCodeNo());
				rs2 = ps.executeQuery();
				arrTech = new ArrayList<>();
				
				while(rs2.next()) {
					arrTech.add(rs2.getString("tech_name"));
				}
				
				dto.setTech(arrTech);
				
				dtos.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (rs2!= null) rs2.close();
				if (ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return dtos;
	}
}
