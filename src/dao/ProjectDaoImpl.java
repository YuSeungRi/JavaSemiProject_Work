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
	
	
//	@Override
//	public List<TechDto> techList(Paging paging) {
//		
//		String sql = "SELECT * FROM ("
//				+ " SELECT rownum rnum, B.* FROM("
//				+ " SELECT t.tech_name, p1.* FROM"
//				+ " (SELECT pt.tech_no, p.* FROM \"project\"p"
//				+ " LEFT JOIN project_tech pt"
//				+ " ON pt.project_no = p.project_no) p1"
//				+ " LEFT JOIN tech t"
//				+ " ON p1.tech_no = t.tech_no"
//				+ " ORDER BY p1.project_no DESE"						
//						+ " ) B"
//						+ " ORDER BY rnum"
//						+ " )"
//						+ " WHERE rnum BETWEEN ? AND ? ";
//		
//		List<TechDto> techList = new ArrayList<>();
//		
//		try {
//			ps = conn.prepareStatement(sql);
//			
//			ps.setInt(1, paging.getStartNo());
//			ps.setInt(2, paging.getEndNo());
//			
//			rs = ps.executeQuery();
//			
//			while( rs.next() ) {
//				
//				TechDto techDto = new TechDto();
//				
//				techDto.setProjectNo( rs.getInt("project_no"));
//				techDto.setTechNo( rs.getInt("tech_no"));
//				techDto.setTechName( rs.getString("tech_name"));
//				
//				System.out.println(techDto);
//				techList.add(techDto);			
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}		
//		return techList;
//	}
	
//	@Override
//	public List<ProjectDto> selectPagingList(Paging paging) {
//		
//		String sql = "SELECT * FROM ("
//				+ " SELECT rownum rnum, B.* FROM("
//				+ " SELECT l.location_name, p2.* FROM"
//				+ " (SELECT t.tech_name, p1.* FROM"
//				+ "	(SELECT pt.tech_no, p.* FROM \"project\" p"
//						+ " LEFT JOIN project_tech pt"
//						+ "	ON pt.project_no = p.project_no) p1"
//						+ " LEFT JOIN tech t"
//						+ " ON p1.tech_no = t.tech_no"
//						+ " ) p2"
//						+ " LEFT JOIN \"location\" l"
//								+ " ON l.location_no = p2.location_no"
//								+ " ORDER BY p2.project_no DESC"						
//						+ " ) B"
//						+ " ORDER BY rnum"
//						+ " )"
//						+ " WHERE rnum BETWEEN ? AND ? ";
//		
//		List<ProjectDto> projectList = new ArrayList<>();
//		List<TechDto> techList = new ArrayList<>();
//		
//		try {
//			ps = conn.prepareStatement(sql);
//			
//			ps.setInt(1, paging.getStartNo());
//			ps.setInt(2, paging.getEndNo());
//			
//			rs = ps.executeQuery();
//			
//			while( rs.next() ) {
//				
//				ProjectDto projectDto = new ProjectDto();
//				TechDto techDto = new TechDto();
//				
//				projectDto.setProjectNo( rs.getInt("project_no") );
//				projectDto.setLocationNo( rs.getInt("location_no"));
//				projectDto.setProjectTitle( rs.getString("project_title"));
//				projectDto.setProjectStart( rs.getDate("project_start"));
//				projectDto.setProjectEnd( rs.getDate("project_end"));
//				projectDto.setProjectContent( rs.getString("project_content"));
//				projectDto.setProjectParticpant( rs.getInt("project_participant"));
//				projectDto.setProjectLead( rs.getString("project_lead"));
//				projectDto.setLocationName( rs.getString("location_name"));				
//				projectDto.setTechName( rs.getString("tech_name"));
//				
//				techDto.setProjectNo( rs.getInt("project_no"));
//				techDto.setTechNo( rs.getInt("tech_no"));
//				techDto.setTechName( rs.getString("tech_name"));
//				
//				System.out.println(projectDto);
//				System.out.println(techDto);
//				
//				projectList.add(projectDto);
//				techList.add(techDto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}		
//		return projectList;
//	}
	
	
	
//	
//	@Override
//	public int selectCntAllSearch(String search) {
//		String sql = "SELECT count(*) From " +"\"project\""
//				+ " WHERE project_title LIKE '%'||?||'%'";
//		
//		int cnt = 0;
//		try {
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, search);
//			rs = ps.executeQuery();
//			rs.next();
//			cnt = rs.getInt(1);
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				rs.close();
//				ps.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		return cnt;
//	}
//	
//	@Override
//	public List selectPagingListSearch(Paging paging) {
//		
//		String sql = "SELECT * FROM ("
//				+ " SELECT rownum rnum, P.* FROM("
//				+ " SELECT * FROM "+"\"project\""
//				+ " WHERE project_title Like '%'||?||'%'"
//				+ " ORDER BY project_no DESC"
//				+ " )P"
//				+ " ORDER BY rnum"
//				+ " )"
//				+ " WHERE rnum BETWEEN ? AND ?";
//		
//		List<ProjectDto> projectList = new ArrayList<>();
//		
//		try {
//			ps = conn.prepareStatement(sql);
//			
//			ps.setString(1,  paging.getSearch());
//			ps.setInt(2, paging.getStartNo());
//			ps.setInt(3,  paging.getEndNo());
//			
//			rs = ps.executeQuery();
//			
//			while( rs.next() ) {
//				ProjectDto projectDto = new ProjectDto();
//				
//				projectDto.setProjectNo( rs.getInt("project_no") );
//				projectDto.setLocationNo( rs.getInt("location_no"));
//				projectDto.setProjectTitle( rs.getString("project_title"));
//				projectDto.setProjectStart( rs.getDate("project_start"));
//				projectDto.setProjectEnd( rs.getDate("project_end"));
//				projectDto.setProjectContent( rs.getString("project_content"));
//				projectDto.setProjectParticpant( rs.getInt("project_participant"));
//				projectDto.setProjectLead( rs.getString("project_lead"));
//				
//				projectList.add(projectDto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				rs.close();
//				ps.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		
//		return projectList;
//	}
	
}
