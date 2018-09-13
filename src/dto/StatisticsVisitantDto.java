package dto;

/*
 * 작성일 : 2018.09.11
 * 작성자 : 권미현
 * 
 *  관리자 - 통계 : 방문자 DTO
 */

public class StatisticsVisitantDto {

	private int visitantNum; // 방문자 수
	private int date; // 날짜
	
	
	public int getVisitantNum() {
		return visitantNum;
	}
	public void setVisitantNum(int visitantNum) {
		this.visitantNum = visitantNum;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "StatisticsVisitantDto [visitantNum=" + visitantNum + ", date=" + date + "]";
	}
	
}
