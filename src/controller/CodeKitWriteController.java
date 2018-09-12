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

@WebServlet("/code/kitwrite.do")
public class CodeKitWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CodeService csvc = new CodeService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		PrintWriter out = response.getWriter();
		
		//get user info from session 
		HttpSession session = request.getSession();
		String userEmail = session.getAttribute("userId").toString();
		
		//get parameters
		String inputCategory = request.getParameter("inputCategory");
		String inputLanguage = request.getParameter("inputLanguage");
		String inputTitle	 = request.getParameter("inputTitle");
		String inputContent	 = request.getParameter("inputContent");
		String inputCode	 = request.getParameter("inputCode");
//		String[] inputTech	 = request.getParameterValues("checkedTech");
		
		//Modify data for DTO
		int categoryNo = csvc.getCategoryNo(inputCategory, userEmail);
//		ArrayList<String> tech = (ArrayList<String>) Arrays.asList(inputTech);
		
		//set Code DTO 
		CodeDto cdto = new CodeDto();
		
		cdto.setCategoryNo(categoryNo);
		cdto.setCodeTitle(inputTitle);
		cdto.setCodeContent(inputContent);
		cdto.setCodeSource(inputCode);
		cdto.setUserEmail(userEmail);
//		cdto.setTech(tech);
		cdto.setLanguage(inputLanguage);
		
		System.out.println("1 : " + cdto);
		
		//Insert new code in database
		csvc.setNewCode(cdto);
		
//		out.println("<div class='col'>");
//		out.println("<p>코드가 서버에 저장되었습니다.<p>");
//		out.println("</div>");
		response.sendRedirect("/code/code.do");
	}

}
