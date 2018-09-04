package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.util.Paging;
import dbutil.DBConn;
import dto.ProjectDto;
import dto.ProjectTechDto;

public class ProjectDaoImpl implements ProjectDao {
	
	private Connection conn = DBConn.getConnection();;
	private PreparedStatement ps;
	private ResultSet rs;
	
	@Override
	public int selectCntAll() {
		
		String sql = "SELECT count(*) FROM "+"\"project\"";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return cnt;
	}
	
	@Override
	public List<ProjectDto> selectPagingList(Paging paging) {
		
		String sql = "SELECT * FROM ("
				+ " SELECT rownum rnum, B.* FROM("
				+ " SELECT l.location_name, p.*"
				+ " FROM \"project\"p"
				+ " LEFT JOIN \"location\" l"
				+ " ON l.location_no = p.location_no"
				+ " ORDER BY p.project_no DESC"						
						+ " ) B"
						+ " ORDER BY rnum"
						+ " )"
						+ " WHERE rnum BETWEEN ? AND ? ";
		
		List<ProjectDto> projectList = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				
				ProjectDto projectDto = new ProjectDto();
				
				projectDto.setProjectNo( rs.getInt("project_no") );
				projectDto.setLocationNo( rs.getInt("location_no"));
				projectDto.setProjectTitle( rs.getString("project_title"));
				projectDto.setProjectStart( rs.getDate("project_start"));
				projectDto.setProjectEnd( rs.getDate("project_end"));
				projectDto.setProjectContent( rs.getString("project_content"));
				projectDto.setProjectParticpant( rs.getInt("project_participant"));
				projectDto.setProjectLead( rs.getString("project_lead"));
				projectDto.setLocationName( rs.getString("location_name"));				
				
//				System.out.println(projectDto);
				projectList.add(projectDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return projectList;
	}
	
	
	
	@Override
	public List<ProjectTechDto> techList() {
		
		String sql = "SELECT t.tech_name, p1.* FROM"
				+ " (SELECT pt.tech_no, p.* FROM \"project\"p"
				+ " LEFT JOIN project_tech pt"
				+ " ON pt.project_no = p.project_no) p1"
				+ " LEFT JOIN tech t"
				+ " ON p1.tech_no = t.tech_no"
				+ " ORDER BY p1.project_no DESC";
		
		List<ProjectTechDto> techList = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				
				ProjectTechDto techDto = new ProjectTechDto();
				
				techDto.setProjectNo( rs.getInt("project_no"));
				techDto.setTechNo( rs.getInt("tech_no"));
				techDto.setTechName( rs.getString("tech_name"));
				
//				System.out.println(techDto);
				techList.add(techDto);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return techList;
	}
	
	
	@Override
	public ProjectDto getProjectBoard(int projectNo) {

		ProjectDto projectDto = null;
		
		String sql = "SELECT l.location_name, p.* FROM \"project\"p "
				+ " LEFT JOIN \"location\" l"
				+ " ON l.location_no = p.location_no"
				+ " WHERE p.project_no=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, projectNo);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				projectDto = new ProjectDto();
				
				projectDto.setProjectNo(rs.getInt("project_no"));
				projectDto.setLocationNo(rs.getInt("location_no"));
				projectDto.setProjectTitle( rs.getString("project_title"));
				projectDto.setProjectStart( rs.getDate("project_start"));
				projectDto.setProjectEnd( rs.getDate("project_end"));
				projectDto.setProjectContent( rs.getString("project_content"));
				projectDto.setProjectParticpant( rs.getInt("project_participant"));
				projectDto.setProjectLead( rs.getString("project_lead"));
				projectDto.setLocationName( rs.getString("location_name"));					
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
		return projectDto;
	}
	
}
