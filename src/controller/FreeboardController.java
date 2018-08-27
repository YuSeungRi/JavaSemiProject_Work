package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import board.util.Paging;
import dto.BoardDto;


@WebServlet("/Freeboard/free.do")
public class FreeboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private BoardService bsvc = new BoardService();
	private final String categoryName = "FreeBoard";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 현재 페이지 
		String param = request.getParameter("curPage");
		
		int curPage = 0;
		if( !"".equals(param) && param != null ) {
			curPage = Integer.parseInt(
				request.getParameter("curPage") );
		}	// 페이지가 비어있거나 [""], null값일 때 curPage를 요청한다
		
		// 총 게시글 수
		int totalCount = bsvc.getTotal(categoryName); // DB에서 카테고리게시물의 숫자를 가져옴

		// Paging Class 계산하기
		Paging paging = new Paging(totalCount, curPage);	// 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴
		
//		System.out.println(paging);


		// 게시글 조회 결과
		List<BoardDto> boardList
			= bsvc.getPagingList(paging, categoryName);

		// JSP에 전달할 MODEL 처리
		request.setAttribute("boardList", boardList);
		request.setAttribute("paging", paging);
		
		request.getRequestDispatcher("freeboard.jsp").forward(request, response);
	}
}
