package com.darksky.seller;

public class Seller {


	@Override
	public String toString() {
		return "Seller [sellerID=" + sellerID + ", sellerName=" + sellerName + ", sellerPassword=" + sellerPassword
				+ ", sellerTel=" + sellerTel + ", shopID=" + shopID + ", securityQuestion=" + securityQuestion
				+ ", securityAnswer=" + securityAnswer + "]";
	}

	private String sellerID; // 店家id
	private String sellerName; // 名字
	private String sellerPassword; // 店家密码
	private String sellerTel; // 店家电话
	private String shopID; // 店铺id
	private String securityQuestion; // 密保问题
	private String securityAnswer; // 密保回答
	
	
	public String getSellerID() {
		return sellerID;
	}

	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSellerPassword() {
		return sellerPassword;
	}

	public void setSellerPassword(String sellerPassword) {
		this.sellerPassword = sellerPassword;
	}

	public String getSellerTel() {
		return sellerTel;
	}

	public void setSellerTel(String sellerTel) {
		this.sellerTel = sellerTel;
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

	public String getShopID() {
		return shopID;
	}

	public void setShopID(String shopID) {
		this.shopID = shopID;
	}

}
