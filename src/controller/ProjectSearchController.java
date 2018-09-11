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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		// 현재 페이지 
		String param = request.getParameter("curPage");

		int curPage = 0;
		if( !"".equals(param) && param != null ) {
			curPage = Integer.parseInt(
				request.getParameter("curPage") );
		}
		
		// 총 게시글 수
		int totalCount = projectService.getTotal();
				
		// Paging Class 계산하기
		Paging paging = new Paging(totalCount, curPage);
		
		ProjectDto projectDto = new ProjectDto();
		
		String[] Checkedtech = request.getParameterValues("checkbox");
		String sCheckedtech = ""; 

		if( Checkedtech != null ) {
			sCheckedtech += "'";
			sCheckedtech += String.join("','", Checkedtech);
			sCheckedtech += "'";
		}
		
		projectDto.setProjectTitle(request.getParameter("title"));
		
		if(request.getParameter("location").equals("지역을 선택하세요")) {
			projectDto.setLocationNo(0);
			
		} else {			
			projectDto.setLocationNo(Integer.parseInt(request.getParameter("location")));
		}		
		
		projectDto.setProjectStart(request.getParameter("startday"));
		projectDto.setProjectEnd(request.getParameter("endday"));		
		
		// 서비스 호출		
		List<ProjectDto> projectList = projectService.search(paging, projectDto);
		
//		System.out.println(projectDto);
		List<ProjectTechDto> techList = projectService.techList();
		List<ProjectLocationDto> locationList = projectService.getAllLocation();
		List<ProjectTechDto> techListAll = projectService.getAlltech();	
		
		
		// JSP에 전달할 MODEL 처리
		request.setAttribute("projectList", projectList);
		request.setAttribute("techList", techList);		
		request.setAttribute("paging", paging);
		request.setAttribute("location", locationList);
		request.setAttribute("tech", techListAll);
		
		// 포워딩
		request.getRequestDispatcher("/project/projectBoard_search.jsp").forward(request,response);
	}

}
