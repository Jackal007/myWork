package com.xmu.darksky.domain;


/**
 * 
 * 店主信息类
 * 
 */
public class Seller {
	
	private String sellerId;
	private String sellerName;
	private String sellerPwd;
	private String sellerTel;
	private String sellerSQuestion;
	private String sellerSAnswer;
	private String shopId;
	
	public Seller(){};
	
	public Seller(String sellerId, String sellerName, String sellerPwd, String sellerTel, String sellerSQuestion,
			String sellerSAnswer, String shopId) {
		super();
		this.sellerId = sellerId;
		this.sellerName = sellerName;
		this.sellerPwd = sellerPwd;
		this.sellerTel = sellerTel;
		this.sellerSQuestion = sellerSQuestion;
		this.sellerSAnswer = sellerSAnswer;
		this.shopId = shopId;
	}

	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public String getSellerPwd() {
		return sellerPwd;
	}
	public void setSellerPwd(String sellerPwd) {
		this.sellerPwd = sellerPwd;
	}
	public String getSellerTel() {
		return sellerTel;
	}
	public void setSellerTel(String sellerTel) {
		this.sellerTel = sellerTel;
	}

	public String getSellerSQuestion() {
		return sellerSQuestion;
	}

	public void setSellerSQuestion(String sellerSQuestion) {
		this.sellerSQuestion = sellerSQuestion;
	}

	public String getSellerSAnswer() {
		return sellerSAnswer;
	}

	public void setSellerSAnswer(String sellerSAnswer) {
		this.sellerSAnswer = sellerSAnswer;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	@Override
	public String toString() {
		return "Seller [sellerId=" + sellerId + ", sellerName=" + sellerName + ", sellerPwd=" + sellerPwd
				+ ", sellerTel=" + sellerTel + ", sellerSQuestion=" + sellerSQuestion + ", sellerSAnswer="
				+ sellerSAnswer + ", shopId=" + shopId + "]";
	}
	
}
