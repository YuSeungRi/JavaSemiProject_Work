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
}
