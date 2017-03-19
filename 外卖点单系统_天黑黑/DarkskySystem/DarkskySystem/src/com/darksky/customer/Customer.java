package com.darksky.customer;

/**
 * 消费者类
 *
 */

public class Customer{		
	@Override
	public String toString() {
		return "Customer [customerID=" + customerID + ", customerName=" + customerName + ", customerPassword="
				+ customerPassword + ", customerTel=" + customerTel + ", customerPhoto=" + customerPhoto
				+ ", customerAddress=" + customerAddress + ", securityQuestion=" + securityQuestion
				+ ", securityAnswer=" + securityAnswer + ", customerMoney=" + customerMoney + "]";
	}
	private String customerID;	//ID
	private String customerName;	//名字
	private String customerPassword;	//用户密码
	private String customerTel;	//用户电话
	private String customerPhoto;	//用户头像
	private String customerAddress;	//送餐地址
	private String securityQuestion;	//密保问题
	private String securityAnswer;	//密保问题答案
	private double customerMoney;	//消费者的余额
	
	
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerPassword() {
		return customerPassword;
	}
	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}
	public String getCustomerTel() {
		return customerTel;
	}
	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public String getSecurityQuestion() {
		return securityQuestion;
	}
	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}
	public String getSecurityAnswer() {
		return securityAnswer;
	}
	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}
	public double getCustomerMoney() {
		return customerMoney;
	}
	public void setCustomerMoney(double customerMoney) {
		this.customerMoney = customerMoney;
	}
	public String getCustomerPhoto() {
		return customerPhoto;
	}
	public void setCustomerPhoto(String customerPhoto) {
		this.customerPhoto = customerPhoto;
	}
	
}
