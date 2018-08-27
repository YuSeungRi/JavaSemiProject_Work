package Service;

import dao.BoardDao;
import dao.BoardDaoImpl;
import dto.BoardDto;

public class BoardService {
	
	private BoardDao boarddao = new BoardDaoImpl();

	public void update(BoardDto boarddto) {
//		boarddao.updateBoard(boarddto);
	}
}
