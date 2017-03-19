package com.xmu.darksky.domain;

/**
 * 
 * 店铺信息类
 *
 */
public class Shop {
	private String sellerName;
	private String shopId;
	private String shopName;
	private String shopTel;
	private String mainType; // 主营类型
	private String shopAddr;
	private String shopLicense;
	private String shopDesc;
	private String shopNotice;
	private String shopState;

	public Shop() {
	};

	public Shop(String sellerName, String shopId, String shopName, String shopTel, String mainType, String shopAddr,
			String shopLicense, String shopDesc, String shopNotice, String shopState) {
		super();
		this.sellerName = sellerName;
		this.shopId = shopId;
		this.shopName = shopName;
		this.shopTel = shopTel;
		this.mainType = mainType;
		this.shopAddr = shopAddr;
		this.shopLicense = shopLicense;
		this.shopDesc = shopDesc;
		this.shopNotice = shopNotice;
		this.shopState = shopState;
	}

	public String getShopNotice() {
		return shopNotice;
	}

	public void setShopNotice(String shopNotice) {
		this.shopNotice = shopNotice;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getMainType() {
		return mainType;
	}

	public void setMainType(String mainType) {
		this.mainType = mainType;
	}

	public String getShopDesc() {
		return shopDesc;
	}

	public void setShopDesc(String shopDesc) {
		this.shopDesc = shopDesc;
	}

	public String getShopState() {
		return shopState;
	}

	public void setShopState(String shopState) {
		this.shopState = shopState;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getShopAddr() {
		return shopAddr;
	}

	public void setShopAddr(String shopAddr) {
		this.shopAddr = shopAddr;
	}

	public String getShopLicense() {
		return shopLicense;
	}

	public void setShopLicense(String shopLicense) {
		this.shopLicense = shopLicense;
	}

	public String getShopTel() {
		return shopTel;
	}

	public void setShopTel(String shopTel) {
		this.shopTel = shopTel;
	}

	@Override
	public String toString() {
		return "Shop [sellerName=" + sellerName + ", shopId=" + shopId + ", shopName=" + shopName + ", shopTel="
				+ shopTel + ", mainType=" + mainType + ", shopAddr=" + shopAddr + ", shopLicense=" + shopLicense
				+ ", shopDesc=" + shopDesc + ", shopNotice=" + shopNotice + ", shopState=" + shopState + "]";
	}

}
