package controller;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/project/projectUpdate.do")
public class ProjectUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		private ProjectService projectService = new ProjectService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = request.getParameter("projectno");
		
		int projectno = 0;
		if (!"".equals(param) && param != null) {
			projectno = Integer.parseInt(param);
		}
		
		String user = (String) request.getSession().getAttribute("userId");
		
		ProjectDto projectDto = projectService.getProjectBoard(projectno);
		List<ProjectLocationDto> locationList = projectService.getAllLocation();
		List<ProjectTechDto> allTechList = projectService.getAlltech();
		
		List<ProjectTechDto> selectTechList = projectService.techList(projectno);
		
		request.setAttribute("project", projectDto);		
		request.setAttribute("location", locationList);
		request.setAttribute("tech", allTechList);
		request.setAttribute("selectTech", selectTechList);
		
//		System.out.println(selectTechList);
		
		request.getRequestDispatcher("/project/projectBoard_update.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		ProjectDto projectDto = new ProjectDto();
		ProjectTechDto techDto = null;
		
		int projectNo = Integer.parseInt(request.getParameter("projectno"));
		
//		List<ProjectTechDto> techList = projectService.techList(projectNo);	
//		
//		for(ProjectTechDto tech2 : techList) {			
//			int techno = tech2.getTechNo();
//			techDto.setUpdateTechNo(techno);
//		}
//		
//		String[] Checkedtech = request.getParameterValues("checkbox");
//		for(String tech : Checkedtech) {
//			techDto = new ProjectTechDto();
//			techDto.setTechNo(Integer.parseInt(tech));
//
//			techDto.setProjectNo(projectNo);
//			projectService.techUpdate(techDto);
//		}
		
		
		
//		System.out.println(techList);
		
		
//		String[] Checkedtech = request.getParameterValues("checkbox");
//		for(ProjectTechDto dto : techList) {
//			int ccounter = 0;
//			int tcounter = 0;
//			for(String tech : Checkedtech) {
//				int cTechNo = Integer.parseInt(tech);
////				if(cTechNo != dto.getTechNo()) 
//				if(cTechNo == dto.getTechNo()) {
//					ccounter++;
//				}
//				
//			}	
//			
//			if(ccounter==0) {
//				//delete tech
//			} 
//			
//			ccounter = 0; 
//			
//		}

//		techDto = new ProjectTechDto();
//		techDto.setTechNo(Integer.parseInt(tech));
//		
//		techDto.setProjectNo(projectNo);
//	projectService.techUpdate(techDto);

		
		projectDto.setProjectNo(projectNo);
		projectDto.setProjectLead((String) request.getSession().getAttribute("userId"));
		projectDto.setProjectTitle(request.getParameter("title"));
		projectDto.setLocationNo(Integer.parseInt(request.getParameter("location")));		
		projectDto.setProjectStart(request.getParameter("startday"));
		projectDto.setProjectEnd(request.getParameter("endday"));		
		projectDto.setProjectContent(request.getParameter("summernote"));
		projectDto.setProjectParticpant(Integer.parseInt(request.getParameter("participant")));
		
		// 서비스 호출
		projectService.update(projectDto);
		
		// 리다이렉트 
		response.sendRedirect("/project/project.do");	
	}

}
