package Service;

import java.util.List;


/*
 * 작성일 : 2018.09.04
 * 작성자 : 안희민
 * 
 */

import board.util.Paging;
import dao.BoardDao;
import dao.BoardDaoImpl;
import dto.BoardDto;

public class BoardsearchService {
	
	private BoardDao dao = new BoardDaoImpl();

	public int getTotal(String categoryName) {
		
		return dao.getTotal(categoryName);
	}
	
	public int searchTotal(String searchString) {
		return dao.searchTotal(searchString);
	}
	
	public int searchTotal(String searchString, String categoryName, String searchTarget) {
		
		return dao.searchTotal(searchString, categoryName, searchTarget);
	}

	public List<BoardDto> getSearchList(Paging paging, String categoryName, String order, String searchString) {
		
		return dao.getSearchList(paging, categoryName, order, searchString);
	}
	
	public List<BoardDto> getSearchList(Paging paging, String order, String searchString) {
		
		return dao.getSearchList(paging, order, searchString);	// 추가
	}
	
	// 각 게시판별 페이징리스트 검색
	public List<BoardDto> getSearchpagingList(Paging paging, String categoryName, String searchString, String searchTarget) {
	
		return dao.getSearchpagingList(paging, categoryName, searchString, searchTarget);
	}

}
