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
 * 수정일 : 2018.09.03
 * 수정자 : 권미현
 *  - '게시글 상세 조회(내용)_구인구직' 추가(53행)
 *  - '게시글 수정_구인구직' 추가(71행)
 *  - '게시글 삭제_구인구직' 추가(79행)
 *  - '구인구직_상태 조회 후, 총 개수' 추가(34행)
 */

public class BoardService {

	private BoardDao dao = new BoardDaoImpl();
	private RecommendDao recommendDao = new RecommendDaoImpl();
	private RecruitDao recruitDao = new RecruitDaoImpl();

	public int getTotal(String categoryName) {

		return dao.getTotal(categoryName);
	}
	// 구인구직_상태 조회 후, 총 개수
	public int getTotalStatus(String status) {
		
		return recruitDao.getTotalStatus(status);
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
	// 게시글 상세 조회(내용)_구인구직
	public RecruitDto getBoardRecruit(int boardNo) {
		dao.boardRead(boardNo);
		return recruitDao.getBoardRecruit(boardNo);
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
	// 게시글 수정_구인구직
	public boolean updateBoardRecruit(RecruitDto dto) {
		return recruitDao.updateBoardRecruit(dto);
	}
	
	public void deleteBoard(int boardNo) {
		dao.deleteBoard(boardNo);
	}
	// 게시글 삭제_구인구직
	public boolean deleteBoardRecruit(int boardNo) {
		return recruitDao.deleteBoardRecruit(boardNo);
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
	
	
	public List<BoardDto> getMyBoard(String userNick, int listnum) {
		return dao.getMyBoard(userNick, listnum);
	}
	
}
