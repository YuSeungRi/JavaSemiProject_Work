package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import dto.BoardDto;

/*
 * 작성일 : 2018.08.27
 * 작성자 : 권미현
 */

@WebServlet("/Freeboard/free_write.do")
public class FreeboardWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService service = new BoardService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Freeboard/freeboard_write.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BoardDto dto = new BoardDto();
		
		dto.setBoardCategory("자유게시판");
		dto.setBoardTitle(request.getParameter("title"));
		dto.setBoardUser((String) request.getSession().getAttribute("user"));
		dto.setBoardContent(request.getParameter("summernote"));
		
		boolean success = service.createBoard(dto);
		System.out.println(success);
		
		// 리다이렉트
		response.sendRedirect("/Freeboard/free.do");
	}

}
