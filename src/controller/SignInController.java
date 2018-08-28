package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		
		if( userservice.login(user)) {
			request.getSession().setAttribute("login", true);
			request.getSession().setAttribute("login", user.getUserEmail());
			System.out.println(userservice.login(user));
			} 
//			else {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter sendalert = response.getWriter();
//			sendalert.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); </script>");	
//			}

		response.sendRedirect("/main/main.do");
	}
}
