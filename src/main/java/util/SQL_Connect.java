package util;

import java.sql.*;

public class SQL_Connect {
	public static Connection open() {
		Connection conn = null;

		final String JDBC_DRIVER = "org.h2.Driver";
		final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
		final String JDBC_USER = "jwbook";
		final String JDBC_PW = "1234";

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PW);
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연결 실패: " + e);
		}

		return conn;
	}

	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			conn.close();
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
