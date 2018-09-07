package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.CodeService;
import dto.CodeDto;

@WebServlet("/code/codeList.do")
public class CodeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CodeService csvc = new CodeService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getSession().getAttribute("userId").toString();
		int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		ArrayList<CodeDto> dtos;
		
		if(categoryNo == 0 )
			dtos = csvc.getCodeList(userId);
		else
			dtos = csvc.getCodeList(categoryNo, userId);
		
		request.setAttribute("codeList" , dtos);
		
		request.getRequestDispatcher("/code/code_list.jsp").forward(request, response);
	}

}

