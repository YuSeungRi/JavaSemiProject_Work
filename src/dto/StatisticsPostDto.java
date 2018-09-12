package dto;

/*
 * 작성일 : 2018.09.11
 * 작성자 : 권미현
 * 
 *  관리자 - 통계 : 게시물 DTO
 */

public class StatisticsPostDto {

	private int postNum; // 게시물 수
	private int date; // 날짜
	
	
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "StatisticsPostDto [postNum=" + postNum + ", date=" + date + "]";
	}
	
}
