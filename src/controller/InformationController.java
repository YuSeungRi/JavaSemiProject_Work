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


@WebServlet("/information/info.do")
public class InformationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserInfoService uisv = new UserInfoService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userEmail = (String)session.getAttribute("userId");
		
		UserInfoDto userinfo = uisv.getUserInfo(userEmail);
		
		request.setAttribute("userinfo", userinfo);
		

		request.getRequestDispatcher("/information/information.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
	
		UserInfoDto dto = new UserInfoDto();
		
		dto.setUserEmail((String)request.getSession().getAttribute("userId"));
		dto.setUserNick(request.getParameter("changeUserNick"));
		dto.setUserPw(request.getParameter("changepwd"));
		dto.setUserIntro(request.getParameter("intro"));

		
		if(uisv.updateUserIn(dto)) {
			HttpSession session = request.getSession();
			System.out.println("회원정보 수정 성공");
			session.setAttribute("userNick", request.getParameter("changeUserNick"));
			response.sendRedirect("/mypage/mypage.do");
			
		}


	}

}
