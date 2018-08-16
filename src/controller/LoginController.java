package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserInfoDao;
import dao.UserInfoDaoImpl;

@WebServlet("/login/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("../main/signin.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userEmail = request.getParameter("userEmail");
		String userPw = request.getParameter("userPw");
		
		//login check
		UserInfoDao userDao = new UserInfoDaoImpl();
		boolean loginCheck = userDao.login(userEmail, userPw);
		
		// store in session 
		if(loginCheck) {
			
		}
		
		// foward to myPage
		request.getRequestDispatcher("./myPage/myPage.jsp").forward(request, response);
	}

}
