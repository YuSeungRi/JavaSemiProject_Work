package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.CodeService;
import dto.CodeDto;

@WebServlet("/code/delete.do")
public class CodeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CodeService csvc = new CodeService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int codeNo = Integer.parseInt(request.getParameter("codeNo"));
		CodeDto dto = csvc.getCode(codeNo);
		csvc.deleteCode(codeNo);
		
		PrintWriter out = response.getWriter();
		
		System.out.println(dto.getCategoryNo());
		out.println(dto.getCategoryNo());
	}

}
