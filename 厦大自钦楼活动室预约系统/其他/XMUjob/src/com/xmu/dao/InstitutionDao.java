package com.xmu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xmu.bean.Institution;
import com.xmu.utils.DBUtil;

public class InstitutionDao {
	public static List<Institution> GetInstitutions(){
		List<Institution> institutions = new ArrayList<Institution>();
		Institution institution;
		
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select * from institution";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				institution = new Institution();
				institution.setInstitution_id(resultSet.getInt("institution_id"));
				institution.setInstitution_name(resultSet.getString("institution_name"));
				System.out.println(institution.getInstitution_id()+" "+institution.getInstitution_name());
				institutions.add(institution);
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
		return institutions;
	}

	public static List<String> GetInstitutionNames(){
		List<String> institutionnames = new ArrayList<String>();
		String institutionname;
		
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select * from institution";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				institutionname = new String();
				institutionname = resultSet.getString("institution_name");
				System.out.println(institutionname);
				institutionnames.add(institutionname);
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
		return institutionnames;
	}

	public static int IsExist(String institution_name){
		int mark = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select * from institution where institution_name='"+institution_name+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				System.out.println("已存在，编号为："+resultSet.getInt("institution_id"));
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
	
	public static int AddInstitution(String institution_name){
		int mark = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="insert into institution(institution_name) values ('"+institution_name+"')";
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

	public static String GetNameById(String id){
		String name = null;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="select institution_name from institution where institution_id='"+id+"'";
		System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				name = resultSet.getString("institution_name");
				System.out.println("找到，名字为："+name);
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

	public static int UpdateInstitution(String id,String new_name){
		int mark = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="update institution set institution_name='"+new_name+"' where institution_id='"+id+"'";
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

	public static int DeleteInstitution(String id){
		int mark = 0;
		Connection connection = null;
		connection = DBUtil.openConnection();
		String sql ="delete from institution where institution_id='"+id+"'";
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
}
