package dao;

import java.util.ArrayList;

import dto.BoardDto;
import board.util.Paging;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
 * 
 * 수정일 : 2018.08.27
 * 수정자 : 권미현
 *  - '내가 작성한 게시글 조회' 메소드 삭제
 *  	public ArrayList<BoardDto> getUserBoard(String boardUser)
 *  - '카테고리별 게시글 수 조회', '카테고리별 페이징 리스트 조회' 메소드 추가
 *  	public int getTotal(String categoryName)
 *  	public ArrayList<BoardDto> getPagingList(Paging paging, String categoryName)
 */

public interface BoardDao {

	/**
	 * 게시글 상세 조회(내용)
	 * @param boardNo
	 * @return BoardDto
	 */
	public BoardDto getBoard(int boardNo);
	
	/**
	 * 카테고리별 게시글 조회
	 * @param boardCategory
	 * @return ArrayList<BoardDto>
	 */
	public ArrayList<BoardDto> getCategoryBoard(String boardCategory);
	
	/**
	 * 카테고리별 게시글 수 조회
	 * @param categoryName
	 * @return int
	 */
	public int getTotal(String categoryName);
	
	/**
	 * 카테고리별 페이징 리스트 조회
	 * @param paging
	 * @param categoryName
	 * @return ArrayList<BoardDto>
	 */
	public ArrayList<BoardDto> getPagingList(Paging paging, String categoryName);
	
	
	/**
	 * 게시글 작성
	 * @param dto
	 * @return true : 게시글 올리기 성공 / false : 게시글 올리기 실패
	 */
	public boolean createBoard(BoardDto dto);
	
	
	/**
	 * 게시글 수정
	 * @param boardUser, boardNo, dto
	 * @return true : 게시글 수정 성공 / false : 게시글 수정 실패
	 */
	public boolean updateBoard(String boardUser, int boardNo, BoardDto dto);
	
	
	/**
	 * 게시글 삭제
	 * @param boardNo
	 * @return true : 게시글 삭제 성공 / false : 게시글 삭제 실패
	 */
	public boolean deleteBoard(String boardUser, int boardNo);
	
	/**
	 * 게시글 삭제_관리자
	 * @param boardNo
	 * @return true : 게시글 삭제 성공 / false : 게시글 삭제 실패
	 */
	public boolean deleteBoardManager(int boardNo);
	
}
