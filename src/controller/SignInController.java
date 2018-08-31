package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.UserInfoService;
import dto.UserInfoDto;


@WebServlet("/main/signin.do")
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserInfoService userservice = new UserInfoService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/main/signin.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfoDto user = new UserInfoDto();
		
		user.setUserEmail(request.getParameter("userEmail"));
		user.setUserPw(request.getParameter("userPw"));
//		System.out.println(user);
//		System.out.println(userservice.login(user));
		
		HttpSession session = request.getSession();
		
		
		
		if( userservice.login(user)) {
			session.setAttribute("login", true);
			session.setAttribute("userId", user.getUserEmail());
			session.setAttribute("userNick", userservice.getUserNick(user));
			System.out.println("로그인성공");
			response.sendRedirect("/main/main.do?login=success");
		} else {
			session.setAttribute("login", false);
			System.out.println("로그인 실패");

			response.sendRedirect("/main/main.do?login=fail");
		}
	}
}
