package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardsearchService;
import board.util.Paging;
import dto.BoardDto;

/*
 * 작정일 : 2018.09.04
 * 작정자 : 안희민
 *  
 */

@WebServlet("/tech/search.do")
public class TechboardsearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardsearchService bssvc = new BoardsearchService();
	private final String categoryName = "TechBoard";
	private String order = null; // 정렬
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 현재 페이지 
		String param = request.getParameter("curPage");
		String param1= request.getParameter("searchString");
		String param2 = request.getParameter("keyField");
		int curPage = 0;
		if( !"".equals(param) && param != null ) {
			curPage = Integer.parseInt(
				request.getParameter("curPage") );
		}	// 페이지가 비어있거나 [""], null값일 때 curPage를 요청한다
		
		String searchString = "";
		if(!"".equals(param1) && param1 != null) {
			searchString = param1;
		}
		
		String searchTarget = "";
		if(!"".equals(param2) && param2 != null) {
			searchTarget = param2;
		}
		
		
		System.out.println(searchTarget);
		// 총 게시글 수
		int totalCount = bssvc.searchTotal(searchString, categoryName, searchTarget); // DB에서 카테고리게시물의 숫자를 가져옴
		
		// Paging Class 계산하기
		Paging paging = new Paging(totalCount, curPage);	// 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴

		// 게시글 조회 결과
		List<BoardDto> boardList = bssvc.getSearchpagingList(paging, categoryName, searchString, searchTarget);
		// JSP에 전달할 MODEL 처리
		request.setAttribute("boardList", boardList);
		request.setAttribute("paging", paging);
		request.setAttribute("order", order); // 정렬
		request.setAttribute("searchString", searchString);
		request.setAttribute("keyField", searchTarget);
		
		request.getRequestDispatcher("/tech/techboard_search.jsp").forward(request,response);
	}
}