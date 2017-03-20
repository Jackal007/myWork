package com.xmu.bean;


public class Admin {
	
	private int Admin_id;
	private String Admin_username;
	private String Admin_password;
	private int Institution_id;
	
	public int getAdmin_id() {
		return Admin_id;
	}
	public void setAdmin_id(int admin_id) {
		Admin_id = admin_id;
	}
	public String getAdmin_username() {
		return Admin_username;
	}
	public void setAdmin_username(String admin_username) {
		Admin_username = admin_username;
	}
	public String getAdmin_password() {
		return Admin_password;
	}
	public void setAdmin_password(String admin_password) {
		Admin_password = admin_password;
	}
	public int getInstitution_id() {
		return Institution_id;
	}
	public void setInstitution_id(int institution_id) {
		Institution_id = institution_id;
	}
	public Admin(int admin_id, String admin_username, String admin_password, int institution_id) {
		super();
		Admin_id = admin_id;
		Admin_username = admin_username;
		Admin_password = admin_password;
		Institution_id = institution_id;
	}
	public Admin(){
		super();
	}
}
