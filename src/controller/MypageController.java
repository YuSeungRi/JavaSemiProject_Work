package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.BoardService;
import Service.UserInfoService;
import dto.BoardDto;
import dto.UserInfoDto;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("/mypage/mypage.do")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	UserInfoService uisv = new UserInfoService();
	private BoardService bsvc = new BoardService();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userNick = (String)session.getAttribute("userNick");
		
		
		UserInfoDto userinfo = uisv.getUserInfo(userNick);

		List<BoardDto> boardList = bsvc.getMyBoard(userNick, 5);
		
		
		request.setAttribute("userinfo", userinfo);
		request.setAttribute("boardList", boardList);
		
		request.getRequestDispatcher("/mypage/mypage.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

}
