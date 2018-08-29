package dto;

import java.sql.Date;

/*
 * 작성일 : 2018.08.19
 * 작성자 : 권미현
 */

public class BoardDto {

	private int boardNo;
	private String boardCategory;
	private String boardTitle;
	private String boardUser;
	private int boardRead;
	private int boardRecommend;
	private Date boardCreate;
	private Date boardModify;
	private String boardContent;
	private int boardTech;
	
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

	public int getBoardRead() {
		return boardRead;
	}

	public void setBoardRead(int boardRead) {
		this.boardRead = boardRead;
	}

	public int getBoardRecommend() {
		return boardRecommend;
	}

	public void setBoardrecommend(int boardRecommend) {
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
		return "BoardDto [ boardNo : " + boardNo + ", boardCategory : " + boardCategory + ", boardTitle : " + boardTitle
				+ ", boardUser : " + boardUser + ", boardRead : " + boardRead + ", boardRecomant : " + boardRecommend
				+ ", boardCreate : " + boardCreate + ", boardModify : " + boardModify + ", boardContent : " + boardContent
				+ ", boardTech : " + boardTech + " ]";
	}
	
}
