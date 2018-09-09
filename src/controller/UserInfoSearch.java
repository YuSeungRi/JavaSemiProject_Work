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

@WebServlet("/admin/userinfoadminsearch.do")
public class UserInfoSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserInfoService uisv = new UserInfoService();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = request.getParameter("curPage");
		String searchString = request.getParameter("searchString");
		String keyfiled = request.getParameter("keyFiled");
		System.out.println("keyfiled = "+keyfiled);

		int curPage = 0;
		if (!"".equals(param) && param != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} // 페이지가 비어있거나 [""], null값일 때 curPage를 요청한다
		
		
		if(keyfiled.equals("userEmail")==true) {
			
			// 총 검색된 회원수
			int totalSearchCount = uisv.getEmailSearchTotal(searchString); // DB에서 회원들의 숫자를 가져옴

			// Paging Class 계산하기
			Paging paging = new Paging(totalSearchCount, curPage);	// 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴

			List<UserInfoDto> UserSearchList = uisv.getUserEmailSearchList(paging, searchString);

			System.out.println("UserSearchList = " + UserSearchList);
			request.setAttribute("totalSearchCount", totalSearchCount);
			request.setAttribute("UserSearchList", UserSearchList);
			request.setAttribute("paging", paging);

			request.getRequestDispatcher("/admin/userinfoadmin_search.jsp").forward(request, response);
		
		} else if(keyfiled.equals("userNick")==true) {
			
			// 총 검색된 회원수
			int totalSearchCount = uisv.getNickSearchTotal(searchString); // DB에서 회원들의 숫자를 가져옴

			// Paging Class 계산하기
			Paging paging = new Paging(totalSearchCount, curPage); // 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴
			
			System.out.println("searchString = "+searchString);
			List<UserInfoDto> UserSearchList = uisv.getUserNickSearchList(paging, searchString);

			System.out.println("UserSearchList = " + UserSearchList);
			request.setAttribute("totalSearchCount", totalSearchCount);
			request.setAttribute("UserSearchList", UserSearchList);
			request.setAttribute("paging", paging);
			
			request.getRequestDispatcher("/admin/userinfoadmin_search.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
