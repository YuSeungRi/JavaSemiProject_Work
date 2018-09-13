package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import dbutil.DBConn;
import dto.StatisticsPostDto;
import dto.StatisticsVisitantDto;

/*
 * 작성일 : 2018.09.11
 * 작성자 : 권미현
 * 
 *  관리자 - 통계 DAO(구현)
 *  
 * 수정일 : 2018.09.13
 * 수정자 : 권미현
 *  - 통계 : 게시물(getPost) 메소드 삭제
 */

public class StatisticsDaoImpl implements StatisticsDao {

	private Connection conn = DBConn.getConnection(); // DB 연결 객체
	private PreparedStatement ps; // SQL 실행
	private ResultSet rs; // 결과
	
	@Override
	public ArrayList<StatisticsVisitantDto> getVisitant(String date) {
		ArrayList<StatisticsVisitantDto> list = new ArrayList<>();
		StatisticsVisitantDto dto = null;
		
		String sql = null;
		int num = 0; // 데이터 들어갈 수
		
		if (date.equals("day")) {
			// 일별
			sql = "SELECT TO_CHAR(login_time, 'DD') AS \"day\", COUNT(*)" + 
					" FROM (" + 
					"    SELECT *" + 
					"    FROM login_log" + 
					"    WHERE login_time BETWEEN TRUNC(sysdate, 'MM') AND last_day(sysdate)" + 
					"    AND login_result='Success'" + 
					")" + 
					"GROUP BY TO_CHAR(login_time, 'DD')" + 
					"ORDER BY \"day\"";
			// --- 현재 달의 마지막 날(최대 날짜) 구하기 ---
			// 현재 날짜 얻기
			Date d = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String dStr = format.format(d);
			
			// calendar 설정할 날짜
			int year = Integer.parseInt(dStr.split("-")[0]);
			int month = Integer.parseInt(dStr.split("-")[1]);
			int day = Integer.parseInt(dStr.split("-")[2]);
			
			// calendar 설정
			Calendar cal = Calendar.getInstance();
			cal.set(year, month-1, day); // month-1 를 하지 않으면 현재 달이 아닌 다음 달로 인식 
			
			num = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 28 or 29 or 30 or 31
//			System.out.println("StatisticsDaoImpl_현재 달의 마지막 날짜 : " + num);
			// ---------------------------------
			
		} else if (date.equals("month")) {
			// 월별
			sql = "SELECT TO_CHAR(login_time, 'MM') AS \"month\", COUNT(*)" + 
					" FROM (" + 
					"    SELECT *" + 
					"    FROM login_log" + 
					"    WHERE login_time BETWEEN TRUNC(sysdate, 'YYYY') AND last_day(ADD_MONTHS(TRUNC(sysdate,'YYYY'),11))" + 
					"    AND login_result='Success'" + 
					")" + 
					" GROUP BY TO_CHAR(login_time, 'MM')" + 
					" ORDER BY \"month\"";
			num = 12;
		}
		
		
		try {
			// ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE
			// isLast : 전방향 전용 결과 집합에 부적합한 작업이 수행되었습니다. - 오류 처리
			ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE); 
			
			rs = ps.executeQuery();
			
//			System.out.println("StatisticsDaoImpl_총 반복할 수 : " + num);
			int i = 1;
			while(rs.next()) {
				
				while (i <= num) {
					dto = new StatisticsVisitantDto();
					if (date.equals("day")) {
						if ( i == Integer.parseInt(rs.getString("day"))) {
							dto.setDate(Integer.parseInt(rs.getString("day")));
							dto.setVisitantNum(rs.getInt("COUNT(*)"));
							
							list.add(dto);
							
							if (!rs.isLast()) {
								// rs 마지막이 아닐 경우
								i++;
								break; // while문(i <= num) 빠져나오기
								// 다음 rs 로 이동
							}
							
						} else if ( i != Integer.parseInt(rs.getString("day"))) {
							dto.setDate(i);
							dto.setVisitantNum(0);
							
							list.add(dto);
						}
					} else if (date.equals("month")) {
						if ( i == Integer.parseInt(rs.getString("month"))) {
							dto.setDate(Integer.parseInt(rs.getString("month")));
							dto.setVisitantNum(rs.getInt("COUNT(*)"));
							
							list.add(dto);
							
							if (!rs.isLast()) {
								// rs 마지막이 아닐 경우
								i++;
								break; // while문(i <= num) 빠져나오기
								// 다음 rs 로 이동
							}
							
						} else if ( i != Integer.parseInt(rs.getString("month"))) {
							dto.setDate(i);
							dto.setVisitantNum(0);
							
							list.add(dto);
						}
					}
					i++;
				} // while문 end - i <= num
			} // while문 end - rs.next()
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

}
