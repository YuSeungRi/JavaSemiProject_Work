package dao;

import java.util.ArrayList;

import dto.StatisticsPostDto;
import dto.StatisticsVisitantDto;

/*
 * 작성일 : 2018.09.11
 * 작성자 : 권미현
 * 
 *  관리자 - 통계 DAO
 */

public interface StatisticsDao {


	/**
	 * 방문자 수 조회
	 * @param date
	 * @return ArrayList<StatisticsVisitantDto>
	 */
	public ArrayList<StatisticsVisitantDto> getVisitant(String date);
	
	/**
	 * 게시물 수 조회
	 * @param date
	 * @return ArrayList<StatisticsPostDto>
	 */
	public ArrayList<StatisticsPostDto> getPost(String date);
}
