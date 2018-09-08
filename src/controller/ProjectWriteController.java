package controller;

import java.io.IOException;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.ProjectService;
import dto.ProjectDto;
import dto.ProjectLocationDto;
import dto.ProjectTechDto;

@WebServlet("/project/projectWrite.do")
public class ProjectWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ProjectService projectService = new ProjectService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String user = (String) request.getSession().getAttribute("userId");
		
		List<ProjectLocationDto> locationList = projectService.getAllLocation();
		List<ProjectTechDto> techList = projectService.getAlltech();
		
		request.setAttribute("location", locationList);
		request.setAttribute("tech", techList);
		
		request.getRequestDispatcher("/project/projectBoard_write.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ProjectDto projectDto = new ProjectDto();
		ProjectTechDto techDto = null;
		
		int projectNo = projectService.getNewProjectNo();		
		
		String[] Checkedtech = request.getParameterValues("checkbox");
		for(String tech : Checkedtech) {
			techDto = new ProjectTechDto();
			techDto.setTechNo(Integer.parseInt(tech));

			techDto.setProjectNo(projectNo);
			projectService.techWrite(techDto);
//			System.out.println("기술번호 :" + tech);
		}
		
		projectDto.setProjectNo(projectNo);
		projectDto.setProjectLead((String) request.getSession().getAttribute("userId"));
		projectDto.setProjectTitle(request.getParameter("title"));
		projectDto.setLocationNo(Integer.parseInt(request.getParameter("location")));		
		projectDto.setProjectStart(request.getParameter("startday"));
		projectDto.setProjectEnd(request.getParameter("endday"));		
		projectDto.setProjectContent(request.getParameter("summernote"));
		projectDto.setProjectParticpant(Integer.parseInt(request.getParameter("participant")));
		
		// 서비스 호출
		projectService.write(projectDto);
		
		// 리다이렉트 
		response.sendRedirect("/project/project.do");	
	}

}
