package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.StatisticsService;
import dto.StatisticsVisitantDto;

/*
 * 작성일 : 2018.09.08
 * 작정자 : 권미현
 * 
 *  관리자 페이지_통계
 *  
 * 수정일 : 2018.09.12
 * 수정자 : 권미현
 *  - 통계 : 방문자 - 완료
 */

@WebServlet("/admin/statistics.do")
public class StatisticsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StatisticsService service = new StatisticsService();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String vParam = request.getParameter("visitant");
		
		if (vParam == null || vParam.isEmpty()) {
			// 받아온 파라미터 값이 없을 때
			vParam = "day";
		}
//		System.out.println("StatisticsController_vParam : " + vParam);
		
		List<StatisticsVisitantDto> vList = service.getVisitant(vParam);
		request.setAttribute("vList", vList); // 방문자 수 리스트 넘기기
		request.setAttribute("visitant", vParam);
		
		request.getRequestDispatcher("/admin/statistics.jsp").forward(request, response);
	}

}
