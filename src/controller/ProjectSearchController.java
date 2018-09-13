package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.ProjectService;
import board.util.Paging;
import dto.ProjectDto;
import dto.ProjectLocationDto;
import dto.ProjectTechDto;

@WebServlet("/project/search.do")
public class ProjectSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProjectService projectService = new ProjectService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");		
		
		ProjectDto projectDto = new ProjectDto();
		
		List<ProjectDto> projectList = null;
		
		String title = request.getParameter("title");		
		String location = null;
		if(request.getParameter("location").equals("지역을 선택하세요")) {
			location = "0";			
		} else {			
			location = request.getParameter("location");
		}	
		
		
		projectDto.setProjectStart(request.getParameter("startday"));
		String startday = request.getParameter("startday");
		projectDto.setProjectEnd(request.getParameter("endday"));
		String endday = request.getParameter("enddday"); 
		
		String tech = null;		
		if(request.getParameter("Searchtech") == null || request.getParameter("Searchtech").equals("기술을 선택하세요")) {
			tech = "0";	
			projectList = projectService.search(title, location, startday,  endday);	
			
		} else {			
			tech = request.getParameter("Searchtech");
			projectList = projectService.search(title, location, tech, startday,  endday);
		}
		
		// 서비스 호출		
//		List<ProjectDto> projectList = projectService.search(title, location, tech, startday,  endday);
		List<ProjectTechDto> techList = projectService.techList();
		List<ProjectLocationDto> locationList = projectService.getAllLocation();
		List<ProjectTechDto> techListAll = projectService.getAlltech();
		
		// JSP에 전달할 MODEL 처리
		request.setAttribute("projectList", projectList);
		request.setAttribute("techList", techList);		
		request.setAttribute("location", locationList);
		request.setAttribute("tech", techListAll);
		
		// 포워딩
		request.getRequestDispatcher("/project/projectBoard_search.jsp").forward(request,response);
	}

}
