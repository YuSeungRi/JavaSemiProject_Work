package Service;

import java.util.ArrayList;

import dao.StatisticsDao;
import dao.StatisticsDaoImpl;
import dto.StatisticsVisitantDto;

/*
 * 작성일 : 2018.09.11
 * 작성자 : 권미현
 * 
 *  관리자 - 통계 Service
 *  
 * 수정일 : 2018.09.13
 * 수정자 : 권미현
 *  - 계시물 수 조회 : 삭제
 */

public class StatisticsService {

	private StatisticsDao dao = new StatisticsDaoImpl();
	
	// 방문자 수 조회
	public ArrayList<StatisticsVisitantDto> getVisitant(String date) {
		return dao.getVisitant(date);
	}
	
}
