package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/user/logout.do")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
		String logType = (String)session.getAttribute("logType");
		
		
		if( logType != null ) {	
			
			if( logType.equals("google") ) {
				
				// 로그아웃 처리	
				request.getSession().invalidate();
				
				// 메인페이지 리다이렉트
				response.sendRedirect("/main/googlelogout.jsp");
		
			} else if( logType.equals("naver") ) {
				
				// 로그아웃 처리
				request.getSession().invalidate();
				
				// 네이버 로그아웃 페이지 전송
				response.sendRedirect("/main/naverlogout.jsp");
				
			}
			
		} else {
		
			// 로그아웃 처리
			request.getSession().invalidate();
			request.setAttribute("logout", true);; // 로그아웃 되었음을 알림 (수정일 : 2018.09.14 / 수정자 : 권미현)
			
			// 메인화면으로 이동(request 값 가진채로)
			request.getRequestDispatcher("/main/main.do").forward(request, response);
		
		}
	}

}
