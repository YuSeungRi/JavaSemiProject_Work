package Service;

import java.util.List;

import board.util.Paging;
import dao.BoardDao;
import dao.BoardDaoImpl;
import dao.RecommendDao;
import dao.RecommendDaoImpl;
import dto.BoardDto;

/*
 * 수정일 : 2018.08.29
 * 수정자 : 권미현
 *  - getPagingList 메소드 수정
 *  	정렬을 위한 매개변수 추가
 */

public class BoardService {

	private BoardDao dao = new BoardDaoImpl();
	private RecommendDao recommendDao = new RecommendDaoImpl();

	public int getTotal(String categoryName) {

		return dao.getTotal(categoryName);
	}

	public List<BoardDto> getPagingList(Paging paging, String categoryName, String order) {

		return dao.getPagingList(paging, categoryName, order);
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
	
	// 추천
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
	public List<BoardDto> getboards(String categoryName, int listnum) {
			
		return dao.getboards(categoryName, listnum);
	}
}
