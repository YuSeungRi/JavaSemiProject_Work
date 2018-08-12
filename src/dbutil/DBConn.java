package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	// DB 연결 정보
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USERNAME = "semi";
	private static final String PASSWORD = "1234";

	private static Connection conn = null; //연결객체 

	private DBConn() { } //DBConn 객체 생성 방지

	// Connection 객체 반환 - Singleton Pattern 
	public static Connection getConnection() {
		if( conn == null ) { // DB연결이 안 되어있을 때만 동작
			try {
				Class.forName(DRIVER); //드라이버로드
				conn = DriverManager.getConnection(URL, USERNAME, PASSWORD); //DB연결

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conn; //DB연결객체 반환
	}
}