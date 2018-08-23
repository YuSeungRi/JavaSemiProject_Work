package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConn;
import dto.ProjectDto;

public class ProjectDaoImpl implements ProjectDao {
	
	private Connection conn = DBConn.getConnection();;
	private PreparedStatement ps;
	private ResultSet rs;

	// 게시글 조회	
	@Override
	public List selectAll() {
		
		// 전체조회 쿼리
		String sql =
				"SELECT" + 
				"    project_no," + 
				"    location_no," + 
				"    project_title," + 
				"    project_start," + 
				"    project_end," + 
				"    project_content," + 
				"    project_participant," + 
				"    project_lead" + 
				" FROM project" + 
				" ORDER BY project_no";
		
		// 결과 List
		List projectList = new ArrayList();
		try {
			// PreparedStatement 생성
			ps = conn.prepareStatement(sql);
			
			// ResultSet 반환
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				ProjectDto dto = new ProjectDto();
				
				dto.setProjectNo( rs.getInt("project_no"));
				dto.setLocationNo( rs.getInt("location_no"));
				dto.setProjectTitle( rs.getString("project_title"));
				dto.setProjectStart( rs.getDate("project_start"));
				dto.setProjectEnd( rs.getDate("project_end"));
				dto.setProjectContent( rs.getString("project_content"));
				dto.setProjectParticpant( rs.getInt("project_participant"));
				dto.setProjectLead( rs.getString("project_lead"));
				
				projectList.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)	rs.close();
				if(ps!=null)	ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return projectList;
	}

		
}
