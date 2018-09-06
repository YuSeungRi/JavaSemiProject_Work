package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.CodeService;
import dto.CodeCategoryDto;
import dto.TechDto;

@WebServlet("/code/write.do")
public class CodeWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CodeService csvc = new CodeService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = session.getAttribute("userId").toString();
		
		ArrayList<CodeCategoryDto> categoryList = csvc.getAllCategory(userEmail);
		ArrayList<TechDto> techList = csvc.getAllTechList();
		
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("techList", techList);
		
		request.getRequestDispatcher("/code/code_write.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
