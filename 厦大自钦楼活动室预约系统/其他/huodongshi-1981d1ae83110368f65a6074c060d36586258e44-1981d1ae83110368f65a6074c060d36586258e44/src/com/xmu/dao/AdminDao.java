package com.xmu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xmu.utils.DBUtil;

public class AdminDao {

	public static int IsLogin(String username, String password) {
		// TODO Auto-generated method stub
		int number = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select admin_password from admin where admin_username='"+username+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String password2 = null;
		
		try {
			if(connection==null){
				System.out.println("!!!空");
			}
			preparedStatement = connection.prepareStatement(sql);		
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				password2 = resultSet.getString("admin_password");
			}
			if(password.equals(password2)){
				number = 1;
				return number;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e2) {
			}
		}
		return number;
	}

	public static String getInstitutionName(String username){
		String name = null;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select institution_name from institution,admin where institution.institution_id=admin.institution_id and admin.admin_username='"+username+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				name = resultSet.getString("institution_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e2) {
			}
		}		
		return name;
	}
}
