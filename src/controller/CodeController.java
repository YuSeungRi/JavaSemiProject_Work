package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.CodeService;


@WebServlet("/code/code.do")
public class CodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CodeService csvc = new CodeService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.isNew()) {
			//TODO: 에러 페이지로 리다이렉트, if문 수정 
			return; 
		}
		String userEmail = session.getAttribute("userId").toString();
		
		request.setAttribute("allCount", csvc.getAllCount(userEmail));
		request.setAttribute("allCategory", csvc.getAllCategory(userEmail));
		
		request.setAttribute("codeList", csvc.getCodeList(userEmail));
		
		request.getRequestDispatcher("/code/code_main.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

}
