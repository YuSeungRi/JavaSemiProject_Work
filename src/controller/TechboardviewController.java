package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.TechBoardService;
import Service.ReplyService;
import dto.BoardDto;
import dto.ReplyDto;

/*
 * 작성일 : 08월 30일
 * 작성자 : 안희민
 * 
 */
@WebServlet("/tech/detail.do")
public class TechboardviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private TechBoardService techBoardService = new TechBoardService();
//	private ReplyService rsvc = new ReplyService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("boardno");
		
		int boardno=0;
		if(!"".equals(param) && param != null) {
			boardno = Integer.parseInt(param);
		}
		
		BoardDto dto = techBoardService.getBoard(boardno);
		
		request.setAttribute("board", dto);	
		
		request.getRequestDispatcher("/tech/techboard_detail.jsp").forward(request, response);
		
	}
}
