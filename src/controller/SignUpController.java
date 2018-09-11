package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.UserInfoService;
import dto.UserInfoDto;


@WebServlet("/main/signup.do")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserInfoService userservice = new UserInfoService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/main/signup.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
		request.setCharacterEncoding("UTF-8");
		
		UserInfoDto user = new UserInfoDto();
		
		user.setUserEmail( request.getParameter("userEmail") );
		user.setUserNick( request.getParameter("userNick") );
		user.setUserPw( request.getParameter("userPw") );
		user.setUserLevel( request.getParameter("userLevel") );
		user.setUserIntro( request.getParameter("userIntro") );
		user.setUserPhoto( request.getParameter("userPhoto") );
		
		
		int result = userservice.join(user);
		
		if( result == 1 ) { 
			session.setAttribute("signup", true);
			response.sendRedirect("/main/main.do?signup=success");
		} else {
			session.setAttribute("signup", false);
			response.sendRedirect("/main/main.do?signup=fail");
		}
		
//		System.out.println("회원가입 성공 " + result);
		
//		response.sendRedirect("/main/main.do");

	}

}
