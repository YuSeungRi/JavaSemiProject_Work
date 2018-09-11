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
import dto.BoardDto;
import dto.FileDto;
import dto.ReplyDto;


@WebServlet("/Freeboard/detail.do")
public class FreeboardviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardservice = new BoardService();
	private ReplyService 	rsvc = 		new ReplyService();
	private FileService 	fsvc = 		new FileService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("boardno");
		
		int boardno=0;
		if(!"".equals(param) && param != null) {
			boardno = Integer.parseInt(param);
		}
		
		BoardDto dto = boardservice.getBoard(boardno);
		
		request.setAttribute("board", dto);		
		
		//추천수
		BoardDto recommend = new BoardDto();
		recommend.setBoardNo(boardno);
		recommend.setBoardUser((String) request.getSession().getAttribute("userId"));
		
		//추천 상태 정보 전달
		request.setAttribute("recommend", boardservice.recommendCheck(recommend));
		
		//댓글
		ArrayList<ReplyDto> rdtos = rsvc.getReplyList(boardno);
		request.setAttribute("replyList", rdtos);
		
		//첨부파일 
		ArrayList<FileDto> fdtos = fsvc.getFileList(boardno);
		request.setAttribute("fileList", fdtos);
		
		request.getRequestDispatcher("/Freeboard/freeboard_detail.jsp").forward(request, response);
	}
}
