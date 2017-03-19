package com.darksky.shop;

public class Order {

	@Override
	public String toString() {
		return "Order [orderID=" + orderID + ", shopID=" + shopID + ", shopName=" + shopName + ", customerID="
				+ customerID + ", customerName=" + customerName + ", dishID=" + dishID + ", dishName=" + dishName
				+ ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", dealTime=" + dealTime + ", state="
				+ state + "]";
	}

	private String orderID; // 订单编号
	private String shopID; // 店铺编号
	private String shopName; // 店名
	private String customerID; // 用户编号
	private String customerName; // 用户名字
	private String dishID; // 菜品编号
	private String dishName; // 菜名
	private int quantity; // 菜的数量
	private double totalPrice; // 总价
	private String dealTime; // 结算时间
	private int state; // 订单状态

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getDishID() {
		return dishID;
	}

	public void setDishID(String dishID) {
		this.dishID = dishID;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getDealTime() {
		return dealTime;
	}

	public void setDealTime(String dealTime) {
		this.dealTime = dealTime;
	}

	public String getShopID() {
		return shopID;
	}

	public void setShopID(String shopID) {
		this.shopID = shopID;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getDishName() {
		return dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
