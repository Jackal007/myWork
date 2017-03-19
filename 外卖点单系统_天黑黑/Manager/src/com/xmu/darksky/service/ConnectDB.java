package com.xmu.darksky.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.xmu.darksky.servlet.BasicServlet;

/**
 * 
 * 连接数据库的操作
 *
 */

public class ConnectDB extends BasicServlet {

	private static final long serialVersionUID = 1L;

	protected Connection connection;
	protected Statement statement;
	protected ResultSet resultSet;

	/**
	 * 默认构造函数，连接数据库
	 */
	public ConnectDB() {
		super();
		System.out.println("ConnectDB");
		try {
			Class.forName("com.mysql.jdbc.Driver"); // 装载JDBC驱动程序

			String url = "jdbc:mysql://120.27.123.88/dark_sky_system?useUnicode=true&characterEncoding=UTF8";
			String user = "darksky";
			String password = "a123";
			
		/*	String url = "jdbc:mysql://localhost/dark_sky_system?useUnicode=true&characterEncoding=gbk";
			String user = "root";
			String password = "";
		 */
			connection = DriverManager.getConnection(url, user, password); // 创建数据库连接
			statement = connection.createStatement(); // 创建语句对象

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 关闭数据库
	 */
	public void closeConnect() {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
