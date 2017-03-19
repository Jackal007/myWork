package com.xmu.darksky.domain;

/**
 * 
 * 订单信息类
 *
 */
public class Order {
	
	private String shopName; // 店家名
	private String customerName; // 用户名
	private String dishName; // 菜品
	private String quantity; // 菜的数量
	private String totalPrice; // 总价
	private String dishType; //菜品类型
	private String dealTime; // 结算时间
	public Order(){};
	
	public Order(String shopName, String customerName, String dishName, String quantity, String totalPrice,
			String dishType, String dealTime) {
		super();
		this.shopName = shopName;
		this.customerName = customerName;
		this.dishName = dishName;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.dishType = dishType;
		this.dealTime = dealTime;
	}

	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getDishName() {
		return dishName;
	}
	public void setDishName(String dishName) {
		this.dishName = dishName;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getDealTime() {
		return dealTime;
	}
	public void setDealTime(String dealTime) {
		this.dealTime = dealTime;
	}
	public String getDishType() {
		return dishType;
	}

	public void setDishType(String dishType) {
		this.dishType = dishType;
	}

	@Override
	public String toString() {
		return "Order [shopName=" + shopName + ", customerName=" + customerName + ", dishName=" + dishName
				+ ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", dishType=" + dishType + ", dealTime="
				+ dealTime + "]";
	}
	
}
