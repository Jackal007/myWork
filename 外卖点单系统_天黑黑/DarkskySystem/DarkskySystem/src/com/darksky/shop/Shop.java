package com.darksky.shop;

public class Shop {

	@Override
	public String toString() {
		return "shop [shopID=" + shopID + ", shopName=" + shopName + ", shopTel=" + shopTel + ", shopType=" + shopType
				+ ", shopAddress=" + shopAddress + ", shopPhoto=" + shopPhoto + ", shopLicense=" + shopLicense
				+ ", introduction=" + shopIntroduction + ", notice=" + notice + ", state=" + state + "]";
	}

	private String shopID; // 店的ID
	private String shopName; // 店名
	private String shopTel; // 店铺联系电话
	private String shopType; // 店铺主营类型
	private String shopAddress; // 店铺地址
	private String shopPhoto; // 店铺图片
	private String shopLicense; // 店铺是否有营业执照
	private String shopIntroduction; // 店铺简介
	private String notice; // 店铺公告
	private int state; // 店的状态信息：0表示未审核，1表示审核通过，2表示审核没通过

	public String getShopIntroduction() {
		return shopIntroduction;
	}

	public void setShopIntroduction(String shopIntroduction) {
		this.shopIntroduction = shopIntroduction;
	}

	public String getShopPhoto() {
		return shopPhoto;
	}

	public void setShopPhoto(String shopPhoto) {
		this.shopPhoto = shopPhoto;
	}

	public String getShopLicense() {
		return shopLicense;
	}

	public void setShopLicense(String shopLicense) {
		this.shopLicense = shopLicense;
	}

	public Shop() {
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopTel() {
		return shopTel;
	}

	public void setShopTel(String shopTel) {
		this.shopTel = shopTel;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getShopID() {
		return shopID;
	}

	public void setShopID(String shopID) {
		this.shopID = shopID;
	}

	public String getShopType() {
		return shopType;
	}

	public void setShopType(String shopType) {
		this.shopType = shopType;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

}
