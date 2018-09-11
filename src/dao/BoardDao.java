package dao;

import java.util.ArrayList;

import board.util.Paging;
import dto.BoardDto;
import dto.ReplyDto;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
 * 
 * 수정일 : 2018.08.28
 * 수정자 : 권미현
 *  - '카테고리별 페이징 리스트 조회' 메소드 수정
 *  	정렬을 위한 매개변수 추가
 *  
 * 수정일 : 2018.09.04
 * 수정자 : 안희민
 *  - getSearchList 추가
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
	 *  전체 게시글수 조회 
	 * @param searchString
	 * @return
	 */
	
	public int searchTotal(String searchString); 
	
	/**
	 * 카테고리 검색 결과 수 조회 
	 * @param searchString
	 * @param categoryName
	 * @param searchTarget
	 * @return
	 */
	public int searchTotal(String searchString, String categoryName, String searchTarget);
	
	/**
	 * 작성자 : 안희민 
	 * 카테고리별 페이징 리스트 조회(정렬없음)
	 * @param paging
	 * @param categoryName
	 * @return
	 */
	public ArrayList<BoardDto> getPagingList(Paging paging, String categoryName);
	
	/**
	 * 작성자 : 안희민
	 * 게시판 별 검색용
	 * @param paging
	 * @param categoryName
	 * @param searchString
	 * @return
	 */
	public ArrayList<BoardDto> getSearchpagingList(Paging paging, String categoryName, String searchString, String searchTarget);
	
	/**
	 * 카테고리별 페이징 리스트 조회
	 * @param paging
	 * @param categoryName
	 * @param order
	 * @return ArrayList<BoardDto>
	 * -- 추가 : searchString [안희민]
	 */
	public ArrayList<BoardDto> getPagingList(Paging paging, String categoryName, String order);
	
	/**
	 * 카테고리별 검색 페이징 리스트 조회
	 * @param paging
	 * @param categoryName
	 * @param order
	 * @return ArrayList<BoardDto>
	 * -- 추가 : searchString [안희민]
	 */
	public ArrayList<BoardDto> getSearchList(Paging paging, String categoryName, String order, String searchString);
	
	/**
	 * 
	 * @param paging
	 * @param order
	 * @param searchString
	 * @return
	 *  -- 추가 : 전체게시판 검색용
	 */
	public ArrayList<BoardDto> getSearchList(Paging paging, String order, String searchString);
	
	
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
	
	
	
	public ArrayList<BoardDto> getMyBoard(String Email, int listnum);

	/**
	 * 새글 작성 시 사용할 board_no 할당.
	 * @return 새로 작성할 게시물의 boardNo
	 */
	public int newBoardNo();
	
	
	/**
	 * 
	 * @param Email
	 * @param listnum
	 * @return
	 */
	public ArrayList<ReplyDto> getMyReply(String Email, int listnum);
	
}
