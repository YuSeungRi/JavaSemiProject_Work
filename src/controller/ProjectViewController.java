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
import dto.ProjectUserDto;

@WebServlet("/project/projectView.do")
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
		List<ProjectTechDto> techList = projectService.techList(projectno);
		request.setAttribute("project", projectDto);
		request.setAttribute("techList", techList);
		
//		System.out.println(projectDto);
		
		//참가자 수 
		ProjectDto participate = new ProjectDto();
		participate.setProjectNo(projectno);
		participate.setProjectLead((String) request.getSession().getAttribute("userId"));
		
		//참가 상태 정보 전달 
		request.setAttribute("participate", projectService.participateCheck(participate));
		
		//참가자 닉네임 & 이메일 가져오기 
		
		List<ProjectUserDto> participateUserList = projectService.participateList(projectno);
		request.setAttribute("userList", participateUserList);
		
		
//		System.out.println(participateUserList);
		
				
		request.getRequestDispatcher("/project/projectBoard_detail.jsp").forward(request, response);
	}

}
