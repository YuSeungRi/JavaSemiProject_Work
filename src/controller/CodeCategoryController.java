package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.CodeService;

@WebServlet("/code/codeCategory.do")
public class CodeCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private CodeService csvc = new CodeService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		HttpSession session = request.getSession();
		String userEmail = session.getAttribute("userId").toString();
		
		if(mode.equals("create")) {
			csvc.createCategory(request.getParameter("categoryName"), userEmail);
		}
		
		if(mode.equals("delete")) {
			csvc.deleteCategory(Integer.parseInt(request.getParameter("categoryNo")));
		}
		
		request.setAttribute("allCount", csvc.getAllCount(userEmail));
		request.setAttribute("allCategory", csvc.getAllCategory(userEmail));
		request.setAttribute("codeList", csvc.getCodeList(userEmail));
		
		request.getRequestDispatcher("/code/codeCategory_list.jsp").forward(request,response);
	}

}
