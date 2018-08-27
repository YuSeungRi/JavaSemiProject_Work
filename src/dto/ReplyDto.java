package dto;

import java.util.Date;

public class ReplyDto {
	int replyNo;
	int boardNo;
	String userEmail;
	Date replyCreate;
	String replyContent;
	
	@Override
	public String toString() {
		return "ReplyDto [replyNo=" + replyNo + ", boardNo=" + boardNo + ", userEmail=" + userEmail + ", replyCreate="
				+ replyCreate + ", replyContent=" + replyContent + "]";
	}
	
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
	public Date getReplyCreate() {
		return replyCreate;
	}
	public void setReplyCreate(Date replyCreate) {
		this.replyCreate = replyCreate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
	
}
