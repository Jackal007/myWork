package com.xmu.darksky.domain;

public class Customer {
	/**
	 * 用户信息类
	 */
	private String cusId;
	private String cusName;
	private String cusPwd;
	private String cusTele;
	private String cusAddr;
	private String cusSQuestion;
	private String cusSAnswer;
	private String cusBalance; //客户余额
	
	public Customer(){}
		
	public Customer(String cusId, String cusName, String cusPwd, String cusTele, String cusAddr, String cusSQuestion,
			String cusSAnswer, String cusBalance) {
		super();
		this.cusId = cusId;
		this.cusName = cusName;
		this.cusPwd = cusPwd;
		this.cusTele = cusTele;
		this.cusAddr = cusAddr;
		this.cusSQuestion = cusSQuestion;
		this.cusSAnswer = cusSAnswer;
		this.cusBalance = cusBalance;
	}

	public String getCusId() {
		return cusId;
	}
	public void setCusId(String cusId) {
		this.cusId = cusId;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getCusPwd() {
		return cusPwd;
	}
	public void setCusPwd(String cusPwd) {
		this.cusPwd = cusPwd;
	}
	public String getCusTele() {
		return cusTele;
	}
	public void setCusTele(String cusTele) {
		this.cusTele = cusTele;
	}
	public String getCusAddr() {
		return cusAddr;
	}
	public void setCusAddr(String cusAddr) {
		this.cusAddr = cusAddr;
	}
	public String getCusSQuestion() {
		return cusSQuestion;
	}
	public void setCusSQuestion(String cusSQuestion) {
		this.cusSQuestion = cusSQuestion;
	}
	public String getCusSAnswer() {
		return cusSAnswer;
	}
	public void setCusSAnswer(String cusSAnswer) {
		this.cusSAnswer = cusSAnswer;
	}

	public String getCusBalance() {
		return cusBalance;
	}

	public void setCusBalance(String cusBalance) {
		this.cusBalance = cusBalance;
	}

	@Override
	public String toString() {
		return "Customer [cusId=" + cusId + ", cusName=" + cusName + ", cusPwd=" + cusPwd + ", cusTele=" + cusTele
				+ ", cusAddr=" + cusAddr + ", cusSQuestion=" + cusSQuestion + ", cusSAnswer=" + cusSAnswer
				+ ", cusBalance=" + cusBalance + "]";
	}
	
}
