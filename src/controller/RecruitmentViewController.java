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
import Service.ReplyService;
import dto.FileDto;
import dto.RecruitDto;
import dto.ReplyDto;

/*
 * 작성일 : 2018.09.03
 * 작성자 : 권미현
 *  
 *  구인구직 상세(내용) 조회
 */

@WebServlet("/recruit/detail.do")
public class RecruitmentViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService boardService = new BoardService();
	private ReplyService replyService = new ReplyService();
	private FileService  fsvc 		  =	new FileService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("boardno");
		
		int boardno=0;
		if(!"".equals(param) && param != null) {
			boardno = Integer.parseInt(param);
		}
		
//		System.out.println("RecruitmentViewController_boardno : " + boardno);
		RecruitDto dto = boardService.getBoardRecruit(boardno);
		
		request.setAttribute("board", dto);
		
		// 댓글
		ArrayList<ReplyDto> dtos = replyService.getReplyList(boardno);
		request.setAttribute("replyList", dtos);
		
		//첨부파일 
		ArrayList<FileDto> fdtos = fsvc.getFileList(boardno);
		request.setAttribute("fileList", fdtos);
		
		request.getRequestDispatcher("/Recruit/recruitboard_detail.jsp").forward(request, response);
	}

}
