package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import Service.ReplyService;
import dto.BoardDto;
import dto.ReplyDto;

/*
 * 수정일 : 2018.09.06
 * 수정자 : 권미현
 *  - 댓글 입력 기능 추가
 */

@WebServlet("/reply/reply.do")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReplyService replyService = new ReplyService();
	private BoardService boardService = new BoardService();
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		System.out.println("ReplyController_boardNo : " + boardNo);
		
		ReplyDto dto = new ReplyDto();
		
		dto.setBoardNo(boardNo);
		dto.setUserEmail((String) request.getSession().getAttribute("userId"));
		dto.setReplyContent(request.getParameter("replyContent"));
		
		System.out.println("ReplyController_" + dto);
		replyService.addNewReply(dto);
		
		
		// 리다이렉트 설정
		BoardDto boardDto = boardService.getBoard(boardNo);
		String category = boardDto.getBoardCategory();
		String reController = null;
		if (category.equals("FreeBoard")) {
			reController = "Freeboard";
		}
		
		System.out.println("ReplyController_category : " + category);
		System.out.println("ReplyController_reController : " + reController);
		
		response.sendRedirect("/" + reController + "/detail.do?boardno=" + boardNo);
		
	}

}
