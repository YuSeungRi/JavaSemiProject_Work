package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;

/*
 * 작성일 : 2018.09.03
 * 작성자 : 권미현
 * 
 *  구인구직_삭제 
 */

@WebServlet("/recruit/delete.do")
public class RecruitmentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService service = new BoardService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("boardno");
		int boardNo=0;
		if(!"".equals(param) && param != null) {
			boardNo = Integer.parseInt(param);
		}
		
//		System.out.println("RecruitmentDeleteController_boardNo : " + boardNo);
		
		/*boolean success = */service.deleteBoardRecruit(boardNo);
//		System.out.println("RecruitmentDeleteController_success" + success);
		
		response.sendRedirect("/recruit/recruit.do");
	}

}
