package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.ProjectService;
import dto.ProjectDto;
import dto.ProjectTechDto;

@WebServlet("/project/projectview.do")
public class ProjectViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProjectService projectService = new ProjectService();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String param = request.getParameter("projectno");
		
		int projectno=0;
		if(!"".equals(param) && param != null) {
			projectno = Integer.parseInt(param);
		}
		
		ProjectDto projectDto = projectService.getProjectBoard(projectno);
		List<ProjectTechDto> techList = projectService.techList();
		request.setAttribute("project", projectDto);
		request.setAttribute("techList", techList);
		
		
		request.getRequestDispatcher("/project/projectBoard_detail.jsp").forward(request, response);
	}

}
