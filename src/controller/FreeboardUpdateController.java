package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import dto.BoardDto;

@WebServlet("/Freeboard/update.do")
public class FreeboardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService bsvc = new BoardService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

String param = request.getParameter("boardno");
		
		int boardno=0;
		if(!"".equals(param) && param != null) {
			boardno = Integer.parseInt(param);
		}
		
		BoardDto dto = bsvc.getBoard(boardno);
		
		request.setAttribute("board", dto);

		request.getRequestDispatcher("/Freeboard/freeboard_update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		BoardDto boarddto = new BoardDto();
		boarddto.setBoardNo(Integer.parseInt(request.getParameter("boardno")));
		boarddto.setBoardTitle(request.getParameter("title"));
		boarddto.setBoardContent(request.getParameter("content"));
		boarddto.setBoardUser((String) request.getSession().getAttribute("writer")); 
		
		System.out.println(boarddto);
		
		bsvc.update(boarddto);
		
		response.sendRedirect("/Freeboard/free.do");

	}

}
