package Service;

import java.util.List;

import board.util.Paging;
import dao.BoardDao;
import dao.BoardDaoImpl;
import dao.RecommendDao;
import dao.RecommendDaoImpl;
import dao.RecruitDao;
import dao.RecruitDaoImpl;
import dto.BoardDto;
import dto.RecruitDto;

/*
 * 수정일 : 2018.08.30
 * 수정자 : 권미현
 *  - '게시글 작성_구인구직' 추가
 */

public class BoardService {

	private BoardDao dao = new BoardDaoImpl();
	private RecommendDao recommendDao = new RecommendDaoImpl();
	private RecruitDao recruitDao = new RecruitDaoImpl();

	public int getTotal(String categoryName) {

		return dao.getTotal(categoryName);
	}

	public List<BoardDto> getPagingList(Paging paging, String categoryName, String order) {

		return dao.getPagingList(paging, categoryName, order);
	}
	
	// 구인구직 페이징 리스트 조회
	public List<RecruitDto> getPagingListRecruit(Paging paging, String order) {
		return recruitDao.getPagingListRecruit(paging, order);
	}
	
	public BoardDto getBoard(int boardNo) {
		dao.boardRead(boardNo);
		return dao.getBoard(boardNo);
	}
	
	// 게시글 작성
	public boolean createBoard(BoardDto dto) {
		return dao.createBoard(dto);
	}
	// 게시글 작성_구인구직
	public boolean createBoardRecruit(RecruitDto dto) {
		return recruitDao.createBoardRecruit(dto);
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
