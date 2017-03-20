package com.xmu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xmu.bean.Admin;
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
	
	public static String GetInstitutionNameById(String id){
		String name = null;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select institution_name from institution,admin where institution.institution_id=admin.institution_id and admin.admin_id='"+id+"'";
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
	
	public static int GetInstitutionIdById(String id){
		int the_id = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select institution_id from admin where admin_id='"+id+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				the_id = resultSet.getInt("institution_id");
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
		return the_id;
	}
	
	public static String getRealName(String username){
		String name = null;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select real_name from admin where admin_username='"+username+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				name = resultSet.getString("real_name");
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

	public static int IsExist(String username){
		int mark = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select * from admin where admin_username='"+username+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				mark = 1;
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
		return mark;
	}
	
	public static int DeleteAdmin(String id){
		int mark = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="delete from admin where admin_id='"+id+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();
			mark = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				preparedStatement.close();
				connection.close();
			} catch (Exception e2) {
			}
		}
		return mark;
	}
	
	public static int UpdateAdmin(String id,String username,String password,String institution_id,String realname,String phonenumber){
		int mark = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="update admin set admin_username='"+username+"',admin_password='"+password+"',institution_id='"+institution_id+"',real_name='"+realname+"',phone_number='"+phonenumber+"' where admin_id='"+id+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();
			mark = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				preparedStatement.close();
				connection.close();
			} catch (Exception e2) {
			}
		}
		return mark;
	}
	
	public static int AddAdmin(String username,String password,String institution_id,String realname,String phonenumber){
		int mark = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="insert into admin(admin_username,admin_password,institution_id,real_name,phone_number) values ('"+username+"','"+password+"','"+institution_id+"','"+realname+"','"+phonenumber+"')";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();
			mark = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				preparedStatement.close();
				connection.close();
			} catch (Exception e2) {
			}
		}
		return mark;
	}

	public static int GetIdByUsername(String username){
		int mark = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select admin_id from admin where admin_username='"+username+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {	
				mark = resultSet.getInt("admin_id");
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
		return mark;
	}
	
	public static Admin GetOneAdminByUsername(String username){
		Admin admin = new Admin();
		
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select * from admin where admin_username='"+username+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				admin.setAdmin_id(resultSet.getInt("admin_id"));
				admin.setAdmin_username(resultSet.getString("admin_username"));
				admin.setAdmin_password(resultSet.getString("admin_password"));
				admin.setInstitution_id(resultSet.getInt("institution_id"));
				admin.setReal_name(resultSet.getString("real_name"));
				admin.setPhone_number(resultSet.getString("phone_number"));
			}
				String the_name;
				String mysql = "select institution_name from institution where institution_id='"+admin.getInstitution_id()+"'";
				System.out.println(mysql);
				PreparedStatement p = null;
				ResultSet r = null;
				p = connection.prepareStatement(mysql);
				r = p.executeQuery();
				while(r.next()){
					the_name = r.getString("institution_name");
					admin.setInstitution_name(the_name);
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
		return admin;
	}
	
	public static Admin GetOneAdmin(String id){
		Admin admin = new Admin();
		
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select * from admin where admin_id='"+id+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				admin.setAdmin_id(resultSet.getInt("admin_id"));
				admin.setAdmin_username(resultSet.getString("admin_username"));
				admin.setAdmin_password(resultSet.getString("admin_password"));
				admin.setInstitution_id(resultSet.getInt("institution_id"));
				admin.setReal_name(resultSet.getString("real_name"));
				admin.setPhone_number(resultSet.getString("phone_number"));
			}
				String the_name;
				String mysql = "select institution_name from institution where institution_id='"+admin.getInstitution_id()+"'";
				System.out.println(mysql);
				PreparedStatement p = null;
				ResultSet r = null;
				p = connection.prepareStatement(mysql);
				r = p.executeQuery();
				while(r.next()){
					the_name = r.getString("institution_name");
					admin.setInstitution_name(the_name);
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
		return admin;
	}
	
	public static List<Admin> GetAllAdmins(){
		List<Admin> admins = new ArrayList<Admin>();
		Admin admin;
		
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select * from admin";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				admin = new Admin();
				admin.setAdmin_id(resultSet.getInt("admin_id"));
				admin.setAdmin_username(resultSet.getString("admin_username"));
				admin.setAdmin_password(resultSet.getString("admin_password"));
				admin.setInstitution_id(resultSet.getInt("institution_id"));
				admin.setReal_name(resultSet.getString("real_name"));
				admin.setPhone_number(resultSet.getString("phone_number"));
				admins.add(admin);
			}
			for(int i = 0; i<admins.size();i++){
				int id = admins.get(i).getInstitution_id();
				String the_name;
				String mysql = "select institution_name from institution where institution_id='"+id+"'";
				System.out.println(mysql);
				PreparedStatement p = null;
				ResultSet r = null;
				p = connection.prepareStatement(mysql);
				r = p.executeQuery();
				while(r.next()){
					the_name = r.getString("institution_name");
					admins.get(i).setInstitution_name(the_name);
				}
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
		return admins;
	}
}
