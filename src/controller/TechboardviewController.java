package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.TechBoardService;
import Service.FileService;
import Service.ReplyService;
import dto.BoardDto;
import dto.FileDto;
import dto.ReplyDto;

/*
 * 작성일 : 08월 30일
 * 작성자 : 안희민
 * 
 * 수정일 : 09월 01일
 * 수정자 : 안희민
 * 
 *  - 추천 추가
 * 
 */
@WebServlet("/tech/detail.do")
public class TechboardviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private TechBoardService techBoardService = new TechBoardService();
	private ReplyService rsvc = new ReplyService();
	private FileService fsvc = new FileService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("boardno");
		
		int boardno=0;
		if(!"".equals(param) && param != null) {
			boardno = Integer.parseInt(param);
		}
		
		BoardDto dto = techBoardService.getBoard(boardno);
		
		request.setAttribute("board", dto);	
		
		//추천 추가
		BoardDto recommend = new BoardDto();
		recommend.setBoardNo(boardno);
		recommend.setBoardUser((String) request.getSession().getAttribute("userId"));
		
		//추천상태정보 추가
		request.setAttribute("recommend", techBoardService.recommendCheck(recommend));
		
		// 댓글
		ArrayList<ReplyDto> rdtos = rsvc.getReplyList(boardno);
		request.setAttribute("replyList", rdtos);
		
		// 첨부 파일
		ArrayList<FileDto> fdtos = fsvc.getFileList(boardno);
		request.setAttribute("fileList", fdtos);
		
		request.getRequestDispatcher("/tech/techboard_detail.jsp").forward(request, response);
		
	}
}
