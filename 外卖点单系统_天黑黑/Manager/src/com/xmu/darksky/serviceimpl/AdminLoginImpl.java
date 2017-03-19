package com.xmu.darksky.serviceimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.xmu.darksky.service.ConnectDB;
import com.xmu.darksky.service.LoginService;
import com.xmu.darksky.service.MD5;

/**
 * 
 * 管理员登录接口实现类
 *
 */
public class AdminLoginImpl extends ConnectDB implements LoginService{

	public AdminLoginImpl() {
		super();
	}
	
	@Override
	public boolean checkLogin(String username, String password) {
		boolean flag = false;
		String sql = "select * from administrator";
		try {
			resultSet = statement.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("语句关闭");
			flag=false;
			e.printStackTrace();
		}
		try {
			while(resultSet.next()){
				System.out.println(resultSet.getString(2)+" "+resultSet.getString(3));
				if(resultSet.getString(2).equals(username)&&resultSet.getString(3).equals(MD5.GetMD5Code(password))){
					flag = true;
				}
			}
		} catch (SQLException e) {
			System.out.println("验证错误");
		}
		//this.closeConnect();
		return flag;
	}
}
