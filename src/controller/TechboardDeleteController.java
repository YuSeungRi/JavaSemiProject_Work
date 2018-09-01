package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.TechBoardService;
import dto.BoardDto;

@WebServlet("/tech/delete.do")
public class TechboardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private TechBoardService Service = new TechBoardService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//보드넘버 파라미터 얻어오기
		String param = request.getParameter("boardno");
		int boardNo=0;
		if(!"".equals(param) && param != null) {
			boardNo = Integer.parseInt(param);
		}
		
		System.out.println(param);
		
		//BoardDto객체생성
		BoardDto boarddto = new BoardDto();
		boarddto.setBoardNo(boardNo);
		
		//서비스에 매개변수로 보드넘버 전달
		Service.deleteBoard(boardNo);
		
		//리다이렉트 - 기술동향게시판 화면으로
		response.sendRedirect("/tech/tech.do");
	}

}
