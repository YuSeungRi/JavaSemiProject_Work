package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConn;
import dto.ProjectDto;
import dto.ProjectUserDto;

public class ProjectParticipateDaoImpl implements ProjectParticipateDao {

	// DB 연결 객체
	private Connection conn = DBConn.getConnection();
	
	// JDBC 객체
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	@Override
	public int selectCountParticipate(ProjectDto projectDto) {
		
		String sql = "SELECT COUNT(*) FROM project_participant "
				+ " WHERE user_email=? "
				+ " AND project_no=? "; 
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, projectDto.getProjectLead());
			ps.setInt(2, projectDto.getProjectNo());
			
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
	public void insertParticipate(ProjectDto projectDto) {

		String sql = "INSERT INTO project_participant (user_email, project_no )"
				+ " VALUES( ?,? )";
		
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, projectDto.getProjectLead());
			ps.setInt(2, projectDto.getProjectNo());
			
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
	public void deleteParticipate(ProjectDto projectDto) {

		String sql = "DELETE project_participant"
				+ " WHERE user_email=?"
				+ " AND project_no=?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, projectDto.getProjectLead());
			ps.setInt(2, projectDto.getProjectNo());
			
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
	public int selectTotalParticipate(ProjectDto projectDto) {
		
		String sql = "SELECT COUNT(*) FROM project_participant"
				+ "	WHERE project_no=?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, projectDto.getProjectNo());
			
			rs = ps.executeQuery();			
			
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
		}  catch (SQLException e) {
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
	public List<ProjectUserDto> participateList(int projectNo) {
		
		String sql = "SELECT p.*, "
				+ " u.user_nick"
				+ " FROM project_participant p "
				+ " JOIN userinfo u "
				+ " ON p.user_email = u.user_email"
				+ " WHERE p.project_no = ? "
				+ " ORDER BY u.user_nick ASC";
		
		List<ProjectUserDto> pList = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, projectNo);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				
				ProjectUserDto projectUserDto = new ProjectUserDto();
				
				projectUserDto.setProjectUserMail( rs.getString("user_email"));
				projectUserDto.setProjectUserNick( rs.getString("user_nick"));
				projectUserDto.setParticipate( rs.getInt("participate"));				
				projectUserDto.setProjectNo( rs.getInt("project_no"));
				
				pList.add(projectUserDto);
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
		
		return pList;
	}

}
