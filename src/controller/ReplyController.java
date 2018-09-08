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
 * 수정일 : 2018.09.07
 * 수정자 : 권미현
 *  - 댓글 개행(줄바꿈) 처리
 */

@WebServlet("/reply/reply.do")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReplyService replyService = new ReplyService();
	private BoardService boardService = new BoardService();
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
//		System.out.println("ReplyController_boardNo : " + boardNo);
		
		ReplyDto dto = new ReplyDto();
		
		dto.setBoardNo(boardNo);
		dto.setUserEmail((String) request.getSession().getAttribute("userId"));
		dto.setReplyContent(request.getParameter("replyContent").replace("\r\n", "<br>")); // .replace("\r\n", "<br>") : 개행(줄바꿈) 처리
		
//		System.out.println("ReplyController_" + dto);
		replyService.addNewReply(dto);
		
		
		// --- 리다이렉트 설정 ----
		BoardDto boardDto = boardService.getBoard(boardNo);
		String category = boardDto.getBoardCategory();
		String reController = null;
		if (category.equals("FreeBoard")) {
			reController = "Freeboard";
		} else if (category.equals("Recruit")) {
			reController = "recruit";
		} // TODO 나머지 게시판들도 리다이렉트 설정해주세요!
		
//		System.out.println("ReplyController_category : " + category);
//		System.out.println("ReplyController_reController : " + reController);
//		System.out.println("ReplyController_redirect : /" + reController + "/detail.do?boardno=" + boardNo);
		
		response.sendRedirect("/" + reController + "/detail.do?boardno=" + boardNo);
		// -------------------
		
	}

}
