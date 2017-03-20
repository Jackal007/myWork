package com.xmu.bean;

public class Institution {
	private int institution_id;
	private String institution_name;
	public int getInstitution_id() {
		return institution_id;
	}
	public void setInstitution_id(int institution_id) {
		this.institution_id = institution_id;
	}
	public String getInstitution_name() {
		return institution_name;
	}
	public void setInstitution_name(String institution_name) {
		this.institution_name = institution_name;
	}
	public Institution(int institution_id, String institution_name) {
		super();
		this.institution_id = institution_id;
		this.institution_name = institution_name;
	}
	public Institution() {
		super();
	}
	
}
