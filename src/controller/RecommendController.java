package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import dto.BoardDto;

@WebServlet("/recommend/recommend.do")
public class RecommendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardservice = new BoardService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("boardno");
		
		int boardno = 0;
		if( !"".equals(param) && param != null ) {
			boardno = Integer.parseInt(param);
		}
		
		BoardDto dto = new BoardDto();
		dto.setBoardNo(boardno);
		dto.setBoardUser((String) request.getSession().getAttribute("userId"));
		
		boolean result = boardservice.recommend(dto);
		int recommend = boardservice.getRecommend(dto);
		
		response.getWriter().println(
				"{"
				+ "\"recommend\": "+recommend
				+ ", \"result\": "+result
				+ "}");
	}


}
