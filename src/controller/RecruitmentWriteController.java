package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import dto.RecruitDto;

/*
 * 작성일 : 2018.08.30
 * 작성자 : 권미현
 * 
 * 	구인구직_작성
 * 
 * 수정일 : 2018.09.03
 * 수정자 : 권미현
 *  - 구인구직 상태 수정
 */

@WebServlet("/recruit/write.do")
public class RecruitmentWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = (String) request.getSession().getAttribute("userNick"); // 아직 UserInfoDao 에 메소드 구현 x

//		System.out.println("RecruitmentWriteController_작성자(userNick) : " + user); // 아직 UserInfoDao 에 메소드 구현 x
		
		request.getRequestDispatcher("/Recruit/recruitboard_write.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		RecruitDto dto = new RecruitDto();
		
		dto.setBoardCategory("Recruit");
		dto.setBoardTitle(request.getParameter("title"));

		dto.setBoardUser((String) request.getSession().getAttribute("userNick")); // 아직 UserInfoDao 에 메소드 구현 x


		dto.setBoardContent(request.getParameter("summernote"));
		
		// --- 구인구직_상태 ---
		String statusParam = request.getParameter("status");
		if (statusParam.equals("jobOffer")) {
			dto.setRecuritStatus("구인");
		} else if (statusParam.equals("jobHunt")) {
			dto.setRecuritStatus("구직");
		}
		// -----------------
//		System.out.println(dto);
		
		boolean success = service.createBoardRecruit(dto);
//		System.out.println("RecruitmentWriteController_success" + success);
//		System.out.println("RecruitmentWriteController_" + dto);
		
		response.sendRedirect("/recruit/recruit.do");
		
	}

}
