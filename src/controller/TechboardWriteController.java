package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.TechBoardService;
import dto.BoardDto;

/*
 * 기술동향 게시판 글 작성 기능
 * 작성일 : 2018.08.31
 * 작성자 : 안희민
 * 
 * 수정일 : 2018.09.04
 * 수정자 : 안희민
 *  - 파일업로드 추가
 * 
 */

@WebServlet("/tech/write.do")
public class TechboardWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private TechBoardService service = new TechBoardService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = (String) request.getSession().getAttribute("userId");
//		String user = (String) request.getSession().getAttribute("userNick");
		
		System.out.println("TechboardWriteController_작성자(userId) : " + user);
		
		request.getRequestDispatcher("/tech/techboard_write.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BoardDto dto = new BoardDto();
		
		dto.setBoardCategory("TechBoard");
		
		dto.setBoardUser((String) request.getSession().getAttribute("userId"));
		dto.setBoardUser((String) request.getSession().getAttribute("userNick"));
		
		dto.setBoardContent(request.getParameter("summernote"));
		dto.setBoardTitle(request.getParameter("title"));
		
		boolean success = service.createBoard(dto);
		System.out.println("TechboardWriteController_" + success);
		System.out.println("TechboardWriteController_" + dto);
		
		// 리다이렉트
		response.sendRedirect("/tech/tech.do");
		
		
	}

}
