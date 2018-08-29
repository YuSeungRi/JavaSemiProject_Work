package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import Service.ReplyService;
import dto.BoardDto;
import dto.ReplyDto;


@WebServlet("/Freeboard/detail.do")
public class FreeboardviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardservice = new BoardService();
	private ReplyService rsvc = new ReplyService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("boardno");
		
		int boardno=0;
		if(!"".equals(param) && param != null) {
			boardno = Integer.parseInt(param);
		}
		
		BoardDto dto = boardservice.getBoard(boardno);
		
		request.setAttribute("board", dto);
		
		ArrayList<ReplyDto> dtos = rsvc.getReplyList(boardno);
		
		request.setAttribute("replyList", dtos);
		
		request.getRequestDispatcher("/Freeboard/freeboard_detail.jsp").forward(request, response);
	}
}
