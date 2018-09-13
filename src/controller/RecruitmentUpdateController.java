package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.BoardService;
import Service.FileService;
import dto.FileDto;
import dto.RecruitDto;

/*
 * 작성일 : 2018.09.03
 * 작성자 : 권미현
 * 
 *  구인구직_수정
 */

@WebServlet("/recruit/update.do")
public class RecruitmentUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService boardService = new BoardService();
	private FileService fsvc = new FileService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String param = request.getParameter("boardno");

		int boardno = 0;
		if (!"".equals(param) && param != null) {
			boardno = Integer.parseInt(param);
		}

		RecruitDto dto = boardService.getBoardRecruit(boardno);

		request.setAttribute("board", dto);
		
		if(fsvc.getFileCount(boardno)>0) {
			ArrayList<FileDto> fdtos = fsvc.getFileList(boardno);
			request.setAttribute("fileList", fdtos);		
		} 

		request.getRequestDispatcher("/Recruit/recruitboard_update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		RecruitDto recruitDto = new RecruitDto();
		recruitDto.setBoardNo(Integer.parseInt(request.getParameter("boardno")));
		recruitDto.setBoardTitle(request.getParameter("title"));
		recruitDto.setBoardContent(request.getParameter("content"));
		
		// --- 구인구직_상태 ---
		String statusParam = request.getParameter("status");
		if (statusParam.equals("jobOffer")) {
			recruitDto.setRecruitStatus("구인");
		} else if (statusParam.equals("jobHunt")) {
			recruitDto.setRecruitStatus("구직");
		} else if (statusParam.equals("jobOfferComplete")) {
			recruitDto.setRecruitStatus("구인완료");
		} else if (statusParam.equals("jobHuntComplete")) {
			recruitDto.setRecruitStatus("구직완료");
		}
		// -----------------

//		System.out.println("RecruitmentUpdateController_" + recruitDto);

		boardService.updateBoardRecruit(recruitDto);

		response.sendRedirect("/recruit/recruit.do");

	}

}
