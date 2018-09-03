package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.FileService;

@WebServlet("/file/delete.do")
public class FileDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	FileService fsvc = new FileService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	// get, post 어떤 방식으로 들어오던지 삭제 처리
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("fileNo");
		
		//파라미터 값 널체크 후 파일 삭제
		if(param != null && param !="") {
			int fileNo = Integer.parseInt(param);
			
			fsvc.deleteFile(fileNo);
		}
		//이전 페이지로 이동
		response.sendRedirect(request.getHeader("referer"));
	}
}
