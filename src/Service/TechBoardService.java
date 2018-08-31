package Service;

import java.util.List;

import board.util.Paging;
import dao.BoardDao;
import dao.BoardDaoImpl;
import dao.RecommendDao;
import dao.RecommendDaoImpl;
import dto.BoardDto;

/*
 * 작성일 : 2018.08.30
 * 작성자 : 안희민
 * 
 */

public class TechBoardService {
	
	private BoardDao dao = new BoardDaoImpl();
//	private RecommendDao recommendDao = new RecommendDaoImpl();
	
	public int getTotal(String categoryName) {
		
		return dao.getTotal(categoryName);
	}
	
	public List<BoardDto> getPagingList(Paging paging, String categoryName) {
	
		return dao.getPagingList(paging, categoryName);
	}
	
	public BoardDto getBoard(int boardNo) {
		dao.boardRead(boardNo);
		return dao.getBoard(boardNo);
	}
	
	// 게시글 작성
	public boolean createBoard(BoardDto dto) {
		return dao.createBoard(dto);
	}
	
	public void update(BoardDto dto) {
		dao.updateBoard(dto);
	}
	
	public void deleteBoard(int boardNo) {
		dao.deleteBoard(boardNo);
	}
	
	// 카테고리별 게시글 호출
	public List<BoardDto> getboard(String categoryName, int listnum) {
		
		return dao.getboards(categoryName, listnum);
	}
	
	// 추천은 아직
}
