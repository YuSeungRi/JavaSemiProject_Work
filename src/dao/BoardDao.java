package dao;

import java.util.ArrayList;

import board.util.Paging;
import dto.BoardDto;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
 * 
 * 수정일 : 2018.08.28
 * 수정자 : 권미현
 *  - '카테고리별 페이징 리스트 조회' 메소드 수정
 *  	정렬을 위한 매개변수 추가
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
	 * 작성자 : 안희민 
	 * 카테고리별 페이징 리스트 조회(정렬없음)
	 * @param paging
	 * @param categoryName
	 * @return
	 */
	public ArrayList<BoardDto> getPagingList(Paging paging, String categoryName);
		
	/**
	 * 카테고리별 페이징 리스트 조회
	 * @param paging
	 * @param categoryName
	 * @param order
	 * @return ArrayList<BoardDto>
	 */
	public ArrayList<BoardDto> getPagingList(Paging paging, String categoryName, String order);
	
	
	/**
	 * 게시글 작성
	 * @param dto
	 * @return true : 게시글 올리기 성공 / false : 게시글 올리기 실패
	 */
	public boolean createBoard(BoardDto dto);
	
	
	/**
	 * 게시글 수정
	 * @param dto
	 * @return true : 게시글 수정 성공 / false : 게시글 수정 실패
	 */
	public boolean updateBoard(BoardDto dto);
	
	
	/**
	 * 게시글 삭제
	 * @param boardNo
	 * @return true : 게시글 삭제 성공 / false : 게시글 삭제 실패
	 */
	public boolean deleteBoard(int boardNo);
	
	/**
	 * 수정 : 유승리
	 * 게시글 조회수 증가
	 * */
	public void boardRead(int boardNo);
	
	
	/**
	 * 메인화면 게시판 출력
	 * @param categoryName,  page
	 * @return ArrayList<BoardDto>
	 */
	
	public ArrayList<BoardDto> getboards(String categoryName, int page);
	
	
	
	public ArrayList<BoardDto> getMyBoard(String userNick, int listnum);

}
