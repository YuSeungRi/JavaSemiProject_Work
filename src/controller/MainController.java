package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import dto.BoardDto;


@WebServlet("/main/main.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardserve = new BoardService();
	private String categoryName[] = {"FreeBoard", "NoticeBoard", "RecruitBoard", "QuestionBoard"} ;
	private String category;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				// 자유게시판
				category = categoryName[0];
				
				List<BoardDto> FreeList
					= boardserve.getboards(category, 5);
				
				// JSP에 전달할 MODEL 처리
				request.setAttribute("FreeList", FreeList);
				
				// 공지사항
				category = categoryName[1];
			
				List<BoardDto> NoticeList
					= boardserve.getboards(category, 5);
				
				// JSP에 전달할 MODEL 처리
				request.setAttribute("NoticeList", NoticeList);
				
				// 구인구직 게시판
				category = categoryName[2];
				
				List<BoardDto> RecruitList
					= boardserve.getboards(category, 5);
				
				// JSP에 전달할 MODEL 처리
				request.setAttribute("RecruitList", RecruitList);
				
				// Q&A 게시판
				category = categoryName[3];
				
				List<BoardDto> QuestionList
					= boardserve.getboards(category, 5);
				
				// JSP에 전달할 MODEL 처리
				request.setAttribute("QuestionList", QuestionList);
				
				
				request.getRequestDispatcher("/main/Mainview.jsp").forward(request, response);
	}
}

