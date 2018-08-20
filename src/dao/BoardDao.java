package dao;

import java.util.ArrayList;

import dto.BoardDto;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
 * 
 * 수정일 : 2018.08.21
 * 수정자 : 권미현
 *  - 게시글 수정, 삭제 메소드 수정
 *  - 게시글 삭제_관리자 메소드 추가
 *  - 그외 오타 수정
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
	 * 내가 작성한 게시글 조회
	 * @param boardUser
	 * @return ArrayList<BoardDto>
	 */
	public ArrayList<BoardDto> getUserBoard(String boardUser);
	
	
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
