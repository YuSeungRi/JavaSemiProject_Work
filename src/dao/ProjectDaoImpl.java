package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
				projectDto.setProjectStart(rs.getString("project_start"));
				projectDto.setProjectEnd(rs.getString("project_end"));
				projectDto.setProjectContent( rs.getString("project_content"));
				projectDto.setProjectParticpant( rs.getInt("project_participant"));
				projectDto.setProjectLead( rs.getString("project_lead"));
				projectDto.setLocationName( rs.getString("location_name"));				
				
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
				
				techList.add(techDto);		
//				System.out.println("리스트 띄우기 techDto : " + techDto);
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
				projectDto.setProjectStart( rs.getString("project_start"));
				projectDto.setProjectEnd( rs.getString("project_end"));
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

	@Override
	public void deleteProject(int projectNo) {

		String sql = "DELETE FROM \"project\""
				+ " WHERE project_no=?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, projectNo);
			
			ps.executeQuery();
			
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
		
	}
	
	@Override
	public void deleteTech(int projectNo) {
		
		String sql = "DELETE FROM project_tech WHERE project_no=?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, projectNo);
			
			System.out.println(projectNo);
			
			ps.executeQuery();
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
		
	}

	@Override
	public int newProjectNo() {
		int result = 0;
		
		String sql = "SELECT project_seq.nextval FROM dual";
		
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

	@Override
	public void createProject(ProjectDto projectDto) {
		String sql = "INSERT INTO \"project\""
				+ " ( project_no, location_no, project_title, project_start, project_end, project_content, project_lead )"
				+ " VALUES ("
				+ " ?, " //1.project_no
				+ " ?, " //2.location_no
				+ " ?, " //3.project_title
				+ " TO_DATE(?, 'yyyy-MM-dd'), " //4.project_start
				+ " TO_DATE(?, 'yyyy-MM-dd'), " //5.project_end
				+ " ?, " //6.project_content
				+ " ? )"; //7.project_lead
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, projectDto.getProjectNo());
			ps.setInt(2, projectDto.getLocationNo());
			ps.setString(3, projectDto.getProjectTitle());
			ps.setString(4, projectDto.getProjectStart());
			ps.setString(5, projectDto.getProjectEnd());
			ps.setString(6, projectDto.getProjectContent());
			ps.setString(7, projectDto.getProjectLead());

			ps.executeUpdate();
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
		
	}

	@Override
	public void createProjectTech(ProjectTechDto techDto) {

		String sql = "INSERT INTO project_tech "
				+ " VALUES ("
				+ " ?," //1.project_no
				+ " ?" //2.tech_no
				+ " )";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, techDto.getProjectNo());
			ps.setInt(2, techDto.getTechNo());;
			
			ps.executeUpdate();
			
//			System.out.println("게시글 작성 techDTO : " + techDto);			
			
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
		
	}


	
}
