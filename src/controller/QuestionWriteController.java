package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import dto.BoardDto;


@WebServlet("/question/write.do")
public class QuestionWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = (String) request.getSession().getAttribute("userId"); // UserInfoDao 메소드 구현할 때까지 임시로 쓰기
//		String user = (String) request.getSession().getAttribute("userNick"); // 아직 UserInfoDao 에 메소드 구현 x

		System.out.println("FreeboardWriteController_작성자(userId) : " + user); // UserInfoDao 메소드 구현할 때까지 임시로 쓰기
//		System.out.println("FreeboardWriteController_작성자(userNick) : " + user); // 아직 UserInfoDao 에 메소드 구현 x
		
		request.getRequestDispatcher("/QA/QAboard_write.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		BoardDto dto = new BoardDto();
		
		dto.setBoardCategory("FreeBoard");
		dto.setBoardTitle(request.getParameter("title"));
		
		dto.setBoardUser((String) request.getSession().getAttribute("userId")); // UserInfoDao 메소드 구현할 때까지 임시로 쓰기
//		dto.setBoardUser((String) request.getSession().getAttribute("userNick")); // 아직 UserInfoDao 에 메소드 구현 x
		
		dto.setBoardContent(request.getParameter("summernote"));
		
		boolean success = service.createBoard(dto);
//		System.out.println("FreeboardWriteController_" + success);
//		System.out.println("FreeboardWriteController_" + dto);
		
		// 리다이렉트
		response.sendRedirect("/question/Q&A.do");
		
	}

}
