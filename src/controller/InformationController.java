package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import Service.UserInfoService;
import dto.UserInfoDto;


@WebServlet("/information/info.do")
public class InformationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserInfoService uisv = new UserInfoService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userEmail = (String)session.getAttribute("userId");
		
		UserInfoDto userinfo = uisv.getUserInfo(userEmail);
		
		request.setAttribute("userinfo", userinfo);
		

		request.getRequestDispatcher("/information/information.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
	
		
		
		ServletContext context = getServletContext();
		String saveDirectory = context.getRealPath("upload");
		int maxPostSize = 10 * 1024 * 1024; //10MB
		String encoding = "UTF-8";
		FileRenamePolicy policy
			= new DefaultFileRenamePolicy();

		MultipartRequest mul = new MultipartRequest(
				request,
				saveDirectory,
				maxPostSize,
				encoding,
				policy );
		
		
		System.out.println("mul = "+mul);
		
		File up = mul.getFile("file");
		System.out.println(up);
		
		
		UserInfoDto dto = new UserInfoDto();
		
		dto.setUserEmail((String)request.getSession().getAttribute("userId"));
		dto.setUserNick(mul.getParameter("changeUserNick"));
		dto.setUserPw(mul.getParameter("changepwd"));
		dto.setUserIntro(mul.getParameter("intro"));
		dto.setUserPhoto(mul.getOriginalFileName("file"));

		if(up==null || !up.exists()) {
			uisv.updateUserIn(dto);
			System.out.println("회원정보 수정 성공");
			response.sendRedirect("/mypage/mypage.do");
			
		} else {
			uisv.updateUserIn2(dto);
			System.out.println("회원정보 수정 성공");
			response.sendRedirect("/mypage/mypage.do");
			
		}

	}

}
