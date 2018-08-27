package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.ReplyService;
import dto.ReplyDto;

@WebServlet("/reply/reply.do")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReplyService rsvc = new ReplyService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		ArrayList<ReplyDto> dtos = rsvc.getReplyList(boardNo);
		
		request.setAttribute("replyList", dtos);
		
		request.getRequestDispatcher("/reply/reply.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
