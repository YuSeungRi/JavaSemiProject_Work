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
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");
		
		boolean isLoggedin =  false;
		String userId = null;
		String userNick = null;
		String Type = null;
		String loginType = request.getParameter("loginType");
		
		if( loginType != null) {
			
			if (loginType.equals("google") || loginType.equals("naver")) {
			
				if(request.getParameter("userEmail") != null && request.getParameter("userEmail") !="") {
				
					if( loginType.equals("google") ) {
						Type = "google";
						session.setAttribute("logType", Type);
						
					} else if( loginType.equals("naver") ) {
						Type = "naver";
						session.setAttribute("logType", Type);
						
					}
					
					isLoggedin = true;
					userId = request.getParameter("userEmail");
					userNick = request.getParameter("userNick");
				}
			
			}
			
		} else {

			user.setUserEmail(request.getParameter("userEmail"));
			user.setUserPw(request.getParameter("userPw"));
			isLoggedin = userservice.login(user);
			
			if(isLoggedin) {
			
				userId = user.getUserEmail();
				userNick = userservice.getUserNick(user);
			}
		}
		
		
		if( isLoggedin) {
			
			session.setAttribute("login", true);
			session.setAttribute("userId", userId);
			session.setAttribute("userNick", userNick);
			
			if(request.getParameter("userPhoto") != null && request.getParameter("userPhoto") !="") {
				session.setAttribute("userPhoto", request.getParameter("userPhoto"));
			}
			
			System.out.println("로그인성공");
			response.sendRedirect("/main/main.do?login=success");
		} else {
			session.setAttribute("login", false);
			System.out.println("로그인 실패");

			response.sendRedirect("/main/main.do?login=fail");
		}
	
	}
}

