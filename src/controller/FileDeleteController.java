package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

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
		
		boolean result = false;
		HttpSession session = request.getSession();
		
		//파라미터 값 널체크 후 파일 삭제
		if(param != null && param !="") {
			int fileNo = Integer.parseInt(param);
			//인증처리 - 로그인사용자와 보드 작성자 일치하는지 확인
			String owner = fsvc.getFileOwner(fileNo);
			if(owner.equals(session.getAttribute("userId"))) {
				fsvc.deleteFile(fileNo);
				result = true;
			} 
		}
		
		response.getWriter().println(
				"{\"result\": "+ result +"}");
		
		//이전 페이지로 이동
//		response.sendRedirect(request.getHeader("referer"));
	}
}
