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

/*
 * 작성일 : 2018.09.07
 * 작성자 : 권미현
 *  댓글 삭제
 */

@WebServlet("/reply/delete.do")
public class ReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReplyService service = new ReplyService();
	private BoardService boardService = new BoardService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// replyno 파라미터 받아오기
		int replyNo = Integer.parseInt(request.getParameter("replyno"));
//		System.out.println("ReplyDelteController_replyNo : " + replyNo);
		
		// 삭제할 댓글번호 넘기기
		@SuppressWarnings("unused")
		boolean success = service.deleteReply(replyNo);
//		System.out.println("ReplyDelteController_success : " + success);
		
		
		// --- 리다이렉트 설정 ---
		// boardno 파라미터 받아오기
		int boardNo = Integer.parseInt(request.getParameter("boardno"));
//		System.out.println("ReplyDelteController_boardNo : " + replyNo);
		
		
		// 리다이렉트할 카테고리 가져오기
		BoardDto boardDto = boardService.getBoard(boardNo);
		String category = boardDto.getBoardCategory();
		String reController = null;
		
		if (category.equals("FreeBoard")) {
			reController = "Freeboard";
		} else if (category.equals("Recruit")) {
			reController = "recruit";
		} // TODO 나머지 게시판들도 리다이렉트 설정해주세요!
		
//		System.out.println("ReplyDeleteController_category : " + category);
//		System.out.println("ReplyDeleteController_reController : " + reController);
//		System.out.println("ReplyDeleteController_redirect : /" + reController + "/detail.do?boardno=" + boardNo);
		
		response.sendRedirect("/" + reController + "/detail.do?boardno=" + boardNo);
		// ------------------
		
	}

}
