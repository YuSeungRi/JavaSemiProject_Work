package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.UserInfoService;
import dto.UserInfoDto;

@WebServlet("/main/signsearch.do")
public class SignSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	UserInfoDto user = new UserInfoDto();
	UserInfoService uisv = new UserInfoService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("user", user);
		
		request.getRequestDispatcher("/main/sendMail.jsp").forward(request,response);

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		user.setUserEmail(request.getParameter("userEmail"));
		user.setUserNick(request.getParameter("userNick"));
		
		uisv.searchpwd(user);

		response.sendRedirect("/main/signin.do");
		
	}

}
