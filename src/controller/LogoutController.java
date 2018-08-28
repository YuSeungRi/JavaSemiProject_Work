package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/user/logout.do")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 로그아웃 처리
		request.getSession().invalidate();
		// 메인화면으로 리다이렉트
		response.sendRedirect("/main/main.do");
	}

}
