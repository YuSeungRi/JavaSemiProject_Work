package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.CodeService;
import dto.CodeDto;


@WebServlet("/code/code.do")
public class CodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CodeService csvc = new CodeService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("login").equals(false) || session.getAttribute("userId") == null ) {
			//TODO: 에러 페이지로 리다이렉트, if문 수정 
			response.sendRedirect("/main/main.do?login=fail"); 
		}
		String userEmail = session.getAttribute("userId").toString();
		
		request.setAttribute("allCount", csvc.getAllCount(userEmail));
		request.setAttribute("allCategory", csvc.getAllCategory(userEmail));
		
		request.setAttribute("codeList", csvc.getCodeList(userEmail));
		
		request.getRequestDispatcher("/code/code_main.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int codeNo = Integer.parseInt(request.getParameter("codeNo"));
		CodeDto dto = csvc.getCode(codeNo);
		
		request.setAttribute("code", dto);
		
		request.getRequestDispatcher("/code/codeDetail.jsp").forward(request, response);

	}

}
