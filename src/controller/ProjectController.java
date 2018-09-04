package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import Service.ProjectService;
import board.util.Paging;
import dto.BoardDto;
import dto.ProjectDto;
import dto.ProjectTechDto;

@WebServlet("/project/project.do")
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ProjectService projectService = new ProjectService();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

		// 게시글 조회 결과
		List<ProjectDto> projectList = projectService.getPagingList(paging);
		List<ProjectTechDto> techList = projectService.techList();

		// JSP에 전달할 MODEL 처리
		request.setAttribute("projectList", projectList);
		request.setAttribute("techList", techList);		
		request.setAttribute("paging", paging);
		
		// 포워딩
		request.getRequestDispatcher("/project/projectBoard.jsp").forward(request,response);
	}

}
