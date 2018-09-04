package dto;

import java.sql.Date;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
 * 
 * 수정일 : 2018.09.04
 * 수정자 : 권미현
 *  - boardNick 변수, getter/setter 메소드 추가
 */

public class BoardDto {

	private int boardNo; // no
	private String boardCategory; // 카테고리
	private String boardTitle; // 제목
	private String boardUser; // email
	private String boardNick; // 닉네임
	private int boardRead; // 조회수
	private int boardRecommend; // 추천
	private Date boardCreate; // 작성일
	private Date boardModify; // 수정일
	private String boardContent; // 내용
	private int boardTech; // 기술
	
	public BoardDto() {
		
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardUser() {
		return boardUser;
	}

	public void setBoardUser(String boardUser) {
		this.boardUser = boardUser;
	}

	public String getBoardNick() {
		return boardNick;
	}

	public void setBoardNick(String boardNick) {
		this.boardNick = boardNick;
	}

	public int getBoardRead() {
		return boardRead;
	}

	public void setBoardRead(int boardRead) {
		this.boardRead = boardRead;
	}

	public int getBoardRecommend() {
		return boardRecommend;
	}

	public void setBoardRecommend(int boardRecommend) {
		this.boardRecommend = boardRecommend;
	}

	public Date getBoardCreate() {
		return boardCreate;
	}

	public void setBoardCreate(Date boardCreate) {
		this.boardCreate = boardCreate;
	}

	public Date getBoardModify() {
		return boardModify;
	}

	public void setBoardModify(Date boardModify) {
		this.boardModify = boardModify;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardTech() {
		return boardTech;
	}

	public void setBoardTech(int boardTech) {
		this.boardTech = boardTech;
	}

	// TEST
	@Override
	public String toString() {
		return "BoardDto [boardNo=" + boardNo + ", boardCategory=" + boardCategory + ", boardTitle=" + boardTitle
				+ ", boardUser=" + boardUser + ", boardNick=" + boardNick + ", boardRead=" + boardRead
				+ ", boardRecommend=" + boardRecommend + ", boardCreate=" + boardCreate + ", boardModify=" + boardModify
				+ ", boardContent=" + boardContent + ", boardTech=" + boardTech + "]";
	}

}
