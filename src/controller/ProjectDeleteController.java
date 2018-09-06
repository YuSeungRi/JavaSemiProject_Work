package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.ProjectService;
import dto.ProjectDto;

@WebServlet("/project/projectDelete.do")
public class ProjectDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProjectService projectService = new ProjectService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String param = request.getParameter("projectno");
		int projectNo=0;
		if(!"".equals(param) && param != null) {
			projectNo = Integer.parseInt(param);
		}
		
		ProjectDto projectDto = new ProjectDto();
		projectDto.setProjectNo(projectNo);
		
		projectService.deleteProject(projectNo);
		projectService.deleteTech(projectNo);
		
		response.sendRedirect("/project/project.do");
		
	}

}
