package com.xmu.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.mysql.jdbc.Statement;

public class DBUtil {

	private Statement stmt = null;

	public static void closeConn(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static Connection openConnection() {
		Properties prop = new Properties();
		String driver = null;
		String url = null;
		String username = null;
		String password = null;

		try {
			// System.out.println(DBUtil.class.getClassLoader().getResource(""));
			prop.load(DBUtil.class.getClassLoader().getResourceAsStream("DBConfig.properties"));

			driver = prop.getProperty("driver");

			Class.forName(driver);
			url = prop.getProperty("url");
			username = prop.getProperty("username");
			password = prop.getProperty("password");
			return DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * Execute a query sql and return a ResultSet, such as a SELECT query
	 * 
	 * @param sql
	 *            The sql statement
	 * @return The ResultSet object
	 * @throws SQLException
	 */
	public static ResultSet executeQuery(String sql) throws SQLException {
		Connection conn = openConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		return rs;
	}

	/**
	 * Execute a sql statement without a result, such as a INSERT, UPDATE,
	 * DELETE statement
	 * 
	 * @param sql
	 *            The sql statement
	 * @throws SQLException
	 */
	public static void executeSql(String sql) throws SQLException {
		Connection conn = openConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.execute();
		pstmt.close();
		closeConn(conn);
	}

	public static int executeUpdate(String sql) throws SQLException {
		Connection conn = openConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int result = pstmt.executeUpdate();
		pstmt.close();
		closeConn(conn);
		return result;
	}

	public int Insert(String sql) throws Exception {
		int intTemp = 0;
		intTemp = stmt.executeUpdate(sql);
		return intTemp;
	}

}
