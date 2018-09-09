package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.UserInfoService;
import board.util.Paging;
import dto.UserInfoDto;

@WebServlet("/admin/userinfoadmin.do")
public class UserInfoAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserInfoService uisv = new UserInfoService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String param = request.getParameter("curPage");
		
		int curPage = 0;
		if( !"".equals(param) && param != null ) {
			curPage = Integer.parseInt(
				request.getParameter("curPage") );
		}	// 페이지가 비어있거나 [""], null값일 때 curPage를 요청한다
		
		// 총 회원수
		int totalCount = uisv.getTotal(); // DB에서 회원들의 숫자를 가져옴

		// Paging Class 계산하기
		Paging paging = new Paging(totalCount, curPage);	// 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴
		
//		System.out.println(paging);

		List<UserInfoDto> UserList
		= uisv.getAllUserInfoList(paging);
		
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("UserList", UserList);
		request.setAttribute("paging", paging);
		
		request.getRequestDispatcher("/admin/userinfoadmin.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
