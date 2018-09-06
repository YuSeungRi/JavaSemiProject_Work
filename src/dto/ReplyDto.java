package dto;

/*
 * 수정일 : 2018.09.05
 * 수정자 : 권미현
 *  - userNick 추가
 *  - replyCreate 타입을 String 으로 변경
 */

public class ReplyDto {
	private int replyNo; // 댓글 번호
	private int boardNo; // 게시판 번호
	private String userEmail; // email
	private String userNick; // 닉네임
	private String replyCreate; // 작성일
	private String replyContent; // 내용
	
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getReplyCreate() {
		return replyCreate;
	}
	public void setReplyCreate(String replyCreate) {
		this.replyCreate = replyCreate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}	
	
	
	@Override
	public String toString() {
		return "ReplyDto [replyNo=" + replyNo + ", boardNo=" + boardNo + ", userEmail=" + userEmail + ", userNick="
				+ userNick + ", replyCreate=" + replyCreate + ", replyContent=" + replyContent + "]";
	}
	
}
