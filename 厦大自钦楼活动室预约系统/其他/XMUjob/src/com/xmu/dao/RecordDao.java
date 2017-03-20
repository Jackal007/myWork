package com.xmu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.DatabaseMetaData;
import com.xmu.bean.Admin;
import com.xmu.utils.DBUtil;

public class RecordDao {

	public static boolean insert(DatabaseMetaData date, int room_id) {
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql = "insert into record(record_id, room_id,	room_status,	time,	 time_spacing,apply_reason,	apply_name,apply_unit,	apply_email,	applyunit_views,	admin_views, belongunits_id;)";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		int resultSet;
		String password2 = null;

		try {
			if (connection == null) {
				System.out.println("!!!空");
			}
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeUpdate();
			if (resultSet == 1) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (Exception e2) {
			}
		}
	}
}
