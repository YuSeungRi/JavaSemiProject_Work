package dao;

import java.util.ArrayList;

import board.util.Paging;
import dto.RecruitDto;

/*
 * 작성일 : 2018.08.30
 * 작성자 : 권미현
 * 
 *  구인구직 DAO
 */

public interface RecruitDao {

	/**
	 * 구인구직 페이징 리스트 조회
	 * @param paging
	 * @param categoryName
	 * @return ArrayList<BoardDto>
	 */
	public ArrayList<RecruitDto> getPagingListRecruit(Paging paging, String order);


	/**
	 * 게시글 작성_구인구직
	 * @param dto
	 * @return true : 게시글 올리기 성공 / false : 게시글 올리기 실패
	 */
	public boolean createBoardRecruit(RecruitDto dto);
	
	
	/**
	 * 게시글 수정_구인구직
	 * @param dto
	 * @return true : 게시글 수정 성공 / false : 게시글 수정 실패
	 */
	public boolean updateBoard(RecruitDto dto);
}
