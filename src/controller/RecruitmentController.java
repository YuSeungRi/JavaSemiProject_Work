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
import dto.RecruitDto;

/*
 * 수정일 : 2018.09.03
 * 수정자 : 권미현
 *  - 정렬 추가
 *  - 상태 정렬에 따른 페이징 새로 추가
 */

@WebServlet("/recruit/recruit.do")
public class RecruitmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private BoardService service = new BoardService();
	private final String categoryName = "Recruit";
	private String order = null; // 정렬
	private int totalCount = 0;
	private Paging paging = null;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 현재 페이지 
		String param = request.getParameter("curPage");
		
		int curPage = 0;
		if( !"".equals(param) && param != null ) {
			curPage = Integer.parseInt(
				request.getParameter("curPage") );
		}	// 페이지가 비어있거나 [""], null값일 때 curPage를 요청한다
		
		// 총 게시글 수
		totalCount = service.getTotal(categoryName); // DB에서 카테고리게시물의 숫자를 가져옴

		// Paging Class 계산하기
		paging = new Paging(totalCount, curPage);	// 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴
		
//		System.out.println(paging);


		// --- 정렬 방법 ---
		String orderParam = request.getParameter("order");
//		System.out.println("RecruitmentController_orderParam : " + orderParam);
		
		
		if (orderParam == null || orderParam.isEmpty() || orderParam.equals("create")) {
			// 최신순(기본)
			order = "create";
		} else if (orderParam.equals("read")) {
			// 조회순
			order = orderParam;
		} else if (orderParam.equals("jobOffer")) {
			// 상태(구인)
			order = orderParam;
			
			// 상태 조회 후, 총 게시글 수
			totalCount = service.getTotalStatus("구인"); // DB에서 상태에 따른 게시글 숫자를 가져옴
			// Paging Class 계산하기
			paging = new Paging(totalCount, curPage);	// 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴
		
		} else if (orderParam.equals("jobOfferComplete")) {
			// 상태(구인완료)
			order = orderParam;
			
			// 상태 조회 후, 총 게시글 수
			totalCount = service.getTotalStatus("구인완료"); // DB에서 상태에 따른 게시글 숫자를 가져옴
			// Paging Class 계산하기
			paging = new Paging(totalCount, curPage);	// 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴

		} else if (orderParam.equals("jobHunt")) {
			// 상태(구직)
			order = orderParam;
			
			// 상태 조회 후, 총 게시글 수
			totalCount = service.getTotalStatus("구직"); // DB에서 상태에 따른 게시글 숫자를 가져옴
			// Paging Class 계산하기
			paging = new Paging(totalCount, curPage);	// 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴

		} else if (orderParam.equals("jobHuntComplete")) {
			// 상태(구직완료)
			order = orderParam;
			
			// 상태 조회 후, 총 게시글 수
			totalCount = service.getTotalStatus("구직완료"); // DB에서 상태에 따른 게시글 숫자를 가져옴
			// Paging Class 계산하기
			paging = new Paging(totalCount, curPage);	// 페이징 객체에서 현재페이지의 총게시물을 정리해서 게시물의 값을 가져옴

		}
//		System.out.println("RecruitmentController_order : " + order);
		// --------------
		
		
		// 게시글 조회 결과
		List<RecruitDto> boardList
			= service.getPagingListRecruit(paging, order);

		// JSP에 전달할 MODEL 처리
		request.setAttribute("boardList", boardList);
		request.setAttribute("paging", paging);
		request.setAttribute("order", order); // 정렬
		
		request.getRequestDispatcher("/Recruit/recruitboard.jsp").forward(request,response);
	}
	
}
