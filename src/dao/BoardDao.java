package dao;

import java.util.ArrayList;

import dto.BoardDto;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
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
	 * @return 1 : 게시글 올리기 성공 / 0 : 게시글 올리기 실패
	 */
	public boolean createBoard(BoardDto dto);
	
	
	/**
	 * 게시글 수정
	 * @param dto
	 * @return 1 : 게시글 수정 성공 / 0 : 게시글 수정 실패
	 */
	public boolean updateBoard(BoardDto dto);
	
	
	/**
	 * 게시글 삭제
	 * @param boardNo
	 * @return 1 : 게시글 삭제 성공 / 0 : 게시글 삭제 실패
	 */
	public boolean deleteBoard(int boardNo);
	
}
