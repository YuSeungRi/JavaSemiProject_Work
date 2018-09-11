package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		request.setCharacterEncoding("UTF-8");
		
		UserInfoDto user = new UserInfoDto();
		
		user.setUserEmail( request.getParameter("userEmail") );
		user.setUserNick( request.getParameter("userNick") );
		user.setUserPw( request.getParameter("userPw") );
		user.setUserLevel( request.getParameter("userLevel") );
		user.setUserIntro( request.getParameter("userIntro") );
		user.setUserPhoto( request.getParameter("userPhoto") );
		
		userservice.join(user);
		
		response.sendRedirect("/main/main.do");

	}

}
