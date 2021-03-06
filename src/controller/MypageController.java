package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.BoardService;
import Service.UserInfoService;
import dto.BoardDto;
import dto.ReplyDto;
import dto.UserInfoDto;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("/mypage/mypage.do")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserInfoService uisv = new UserInfoService();
	private BoardService bsvc = new BoardService();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userEmail = (String)session.getAttribute("userId");
		
		
		UserInfoDto userinfo = uisv.getUserInfo(userEmail);

		List<BoardDto> boardList = bsvc.getMyBoard(userEmail, 5);
		List<ReplyDto> replyList = bsvc.getMyReply(userEmail, 5);
		
		
		request.setAttribute("userinfo", userinfo);
		request.setAttribute("boardList", boardList);
		request.setAttribute("replyList", replyList);
		
		request.getRequestDispatcher("/mypage/mypage.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		UserInfoDto dto = new UserInfoDto();
		
		
		dto.setUserEmail((String)request.getSession().getAttribute("userId"));
		dto.setUserPw(request.getParameter("userConfirmPwd"));
		if(uisv.login(dto)) {
			System.out.println("비밀번호 확인");
			response.sendRedirect("/information/info.do");
		} else {
			System.out.println("비밀번호 틀림");
			response.sendRedirect("/mypage/mypage.do");
			
		}

	}

}
