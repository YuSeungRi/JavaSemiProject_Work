package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.CodeService;
import dto.CodeCategoryDto;
import dto.CodeDto;
import dto.TechDto;
import kit.Kit;
import kit.KitData;

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
//		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		CodeDto cdto = new CodeDto();
		ArrayList<CodeDto> cdtos = new ArrayList<>();

		String codeCategory = request.getParameter("codeCategory");
		String codeLanguage = request.getParameter("codeLanguage");
		String sourceFile	= request.getParameter("sourceFile");
		String[] seletedTech= request.getParameterValues("selectedTech");
		
		System.out.println("codeCategory : " + codeCategory );
		System.out.println("codeLanguage : " + codeLanguage );
		System.out.println("sourceFile : " + sourceFile);
		
		
		//File parsing by Kit
		Kit kit = new Kit(sourceFile);
		KitData kitData = kit.getKitData();

		cdto.setCodeTitle(kitData.getCodeTitle());
		if(cdto.getLanguage()==null || cdto.getLanguage()=="") {
			cdto.setLanguage(kitData.getLanguage());
		} else {
			cdto.setLanguage(codeLanguage);
		}
		cdto.setCodeContent(kitData.getContent());
		
		CodeDto codeDto;
		int titleIdx=0;

		if(kitData.getPasredCode() != null) {
			for(String code : kitData.getPasredCode()) {
				codeDto = new CodeDto();
				codeDto.setCategoryNo(Integer.parseInt(codeCategory));
				codeDto.setLanguage(cdto.getLanguage());
				codeDto.setCodeTitle(cdto.getCodeTitle() + ((titleIdx==0)?"":++titleIdx));
				codeDto.setCodeContent(cdto.getCodeContent());
				codeDto.setCodeSource(code);
				System.out.println("!!!!code!!!" +code);

				cdtos.add(codeDto);
			}

			request.setAttribute("parsedCodes", cdtos);				
		}
		
		request.setAttribute("category", csvc.getCategoryName(Integer.parseInt(codeCategory)));
//		request.setAttribute("techList", csvc.getAllTechList());
		
		request.getRequestDispatcher("/code/code_kit.jsp").forward(request, response);
	}

}
