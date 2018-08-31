package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.TechBoardService;
import dto.BoardDto;

/**
 * 기술동향 게시판 글 수정
 * 작성일 : 08월31일
 * 작성자: 안희민
 * 
 */
@WebServlet("/tech/update.do")
public class TechboardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private TechBoardService tbsvc = new TechBoardService();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = request.getParameter("boardno");
		
		int boardno = 0;
		if(!"".equals(param) && param != null) {
			boardno = Integer.parseInt(param);
		}
		
		BoardDto dto = tbsvc.getBoard(boardno);
		
		request.setAttribute("board", dto);
		
		request.getRequestDispatcher("/tech/techboard_update.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		BoardDto boarddto = new BoardDto();
		
		boarddto.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
		boarddto.setBoardTitle(request.getParameter("title"));
		boarddto.setBoardContent(request.getParameter("content"));
		
		
		tbsvc.update(boarddto);
		
		response.sendRedirect("/tech/tech.do");
	}

}
