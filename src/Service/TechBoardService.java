package Service;

import java.util.List;

import board.util.Paging;
import dao.BoardDao;
import dao.BoardDaoImpl;
import dao.RecommendDao;
import dao.RecommendDaoImpl;
import dto.BoardDto;
import dto.ReplyDto;


/*
 * 작성일 : 2018.08.30
 * 작성자 : 안희민
 * 
 * 수정일 : 2018.09.01
 * 수정자 : 안희민
 * - 추천기능 추가
 * 
 * 수정일 : 2018.09.04
 * 수정자 : 안희민
 *  - getSearchList 추가
 *  
 *  페이지네이션 추가
 */

public class TechBoardService {
	
	private BoardDao dao = new BoardDaoImpl();
	private RecommendDao recommendDao = new RecommendDaoImpl();
	
	public int getTotal(String categoryName) {
		
		return dao.getTotal(categoryName);
	}
	
	public int searchTotal(String searchString) {
		
		return dao.searchTotal(searchString);
	}
	
	public List<BoardDto> getPagingList(Paging paging, String categoryName, String order) {
	
		return dao.getPagingList(paging, categoryName, order);
	}
	
	// 페이지네이션 추가
	public List<BoardDto> getSearchpagingList(Paging paging, String categorynName, String searchString, String searchTarget) {
		
		return dao.getSearchpagingList(paging, categorynName, searchString, searchTarget);
	}
//	public List<BoardDto> getSearchList(Paging paging, String categoryName, String order, String searchString) {
	
//		return dao.getSearchList(paging, categoryName, order, searchString);
		
//	}
	
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
	
	// 추천기능
	public boolean recommendCheck(BoardDto dto) {
		if( recommendDao.selectCountRecommend(dto) > 0 ) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean recommend(BoardDto dto) {
		if( recommendCheck(dto) ) {
			recommendDao.deleteRecommend(dto);
			return false;
		} else {
			recommendDao.insertRecommend(dto);
			return true;
		}
	}
	
	public int getRecommend(BoardDto dto) {
		return recommendDao.selectTotalRecommend(dto);
	}
	
	// 카테고리별 게시글 호출
	public List<BoardDto> getboard(String categoryName, int listnum) {
		
		return dao.getboards(categoryName, listnum);
	}
	
	// 추가
	public List<BoardDto> getMyBoard(String userEmail, int listnum) {
		return dao.getMyBoard(userEmail, listnum);
	}
	
	public int getNewBoardNo() {
		return dao.newBoardNo();
	}
	
	public List<ReplyDto> getMyReply(String userEmail, int listnum) {
		return dao.getMyReply(userEmail, listnum);
	}
	
}
