package dao;

import java.util.ArrayList;

import dto.StatisticsPostDto;
import dto.StatisticsVisitantDto;

/*
 * 작성일 : 2018.09.11
 * 작성자 : 권미현
 * 
 *  관리자 - 통계 DAO
 *  
 * 수정일 : 2018.09.13
 * 수정자 : 권미현
 *  - 통계 : 게시물(getPost) 메소드 삭제
 */

public interface StatisticsDao {


	/**
	 * 방문자 수 조회
	 * @param date
	 * @return ArrayList<StatisticsVisitantDto>
	 */
	public ArrayList<StatisticsVisitantDto> getVisitant(String date);
	
}
