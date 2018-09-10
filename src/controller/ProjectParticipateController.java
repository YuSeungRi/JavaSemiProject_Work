package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.ProjectService;
import dto.BoardDto;
import dto.ProjectDto;

@WebServlet("/project/participate.do")
public class ProjectParticipateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProjectService projectService = new ProjectService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("projectno");
		
		int projectno = 0;
		if( !"".equals(param) && param != null ) {
			projectno = Integer.parseInt(param);
		}
		
		ProjectDto projectDto = new ProjectDto();
		projectDto.setProjectNo(projectno);
		projectDto.setProjectLead((String) request.getSession().getAttribute("userId"));
		
		boolean result = projectService.participate(projectDto);
		int participate = projectService.getParticipate(projectDto);
		
		System.out.println(participate);
		
		response.getWriter().println(
				"{"
				+ "\"participate\": "+participate
				+ ", \"result\": "+result
				+ "}");
				
				
	}

}
