package Service;

import java.util.List;

import board.util.Paging;
import dao.BoardDao;
import dao.BoardDaoImpl;
import dto.BoardDto;

public class BoardService {

	private BoardDao dao = new BoardDaoImpl();

	public int getTotal(String categoryName) {

		return dao.getTotal(categoryName);
	}

	public List<BoardDto> getPagingList(Paging paging, String categoryName) {

		return dao.getPagingList(paging, categoryName);
	}
	
	public BoardDto getBoard(int boardNo) {
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
	
}
