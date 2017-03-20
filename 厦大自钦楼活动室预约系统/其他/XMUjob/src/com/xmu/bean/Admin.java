package com.xmu.bean;


public class Admin {
	
	private int Admin_id;
	private String Admin_username;
	private String Admin_password;
	private int Institution_id;
	private String real_name;
	private String phone_number;
	private String institution_name;
	
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
	public Admin(){
		super();
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public Admin(int admin_id, String admin_username, String admin_password, int institution_id, String real_name,
			String phone_number) {
		super();
		this.Admin_id = admin_id;
		this.Admin_username = admin_username;
		this.Admin_password = admin_password;
		this.Institution_id = institution_id;
		this.real_name = real_name;
		this.phone_number = phone_number;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getInstitution_name() {
		return institution_name;
	}
	public void setInstitution_name(String institution_name) {
		this.institution_name = institution_name;
	}
	
}
