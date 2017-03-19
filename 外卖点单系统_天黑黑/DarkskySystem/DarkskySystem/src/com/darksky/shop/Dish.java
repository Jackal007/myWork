package com.darksky.shop;

public class Dish {

	@Override
	public String toString() {
		return "Dish [dishID=" + dishID + ", dishName=" + dishName + ", dishType=" + dishType + ", shopID=" + shopID
				+ ", dishIntroduction=" + dishIntroduction + ", dishPrice=" + dishPrice + ", dishStock=" + dishStock
				+ ", dishPhoto=" + dishPhoto + ", hot=" + hot + "]";
	}

	private String dishID; // 菜ID
	private String dishName; // 菜名
	private String dishType; // 菜品
	private String shopID; // 店的ID
	private String dishIntroduction; // 菜品介绍
	private double dishPrice; // 单价
	private int dishStock; // 菜品库存
	private String dishPhoto; // 食品图片
	private int hot; // 食品销量

	public String getDishPhoto() {
		return dishPhoto;
	}

	public void setDishPhoto(String dishPhoto) {
		this.dishPhoto = dishPhoto;
	}

	public double getDishPrice() {
		return dishPrice;
	}

	public void setDishPrice(double dishPrice) {
		this.dishPrice = dishPrice;
	}

	public Dish() {
	}

	public String getDishName() {
		return dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public String getDishID() {
		return dishID;
	}

	public void setDishID(String dishID) {
		this.dishID = dishID;
	}

	public String getDishIntroduction() {
		return dishIntroduction;
	}

	public void setDishIntroduction(String dishIntroduction) {
		this.dishIntroduction = dishIntroduction;
	}

	public int getDishStock() {
		return dishStock;
	}

	public void setDishStock(int dishStock) {
		this.dishStock = dishStock;
	}

	public String getShopID() {
		return shopID;
	}

	public void setShopID(String shopID) {
		this.shopID = shopID;
	}

	public String getDishType() {
		return dishType;
	}

	public void setDishType(String dishType) {
		this.dishType = dishType;
	}

	public int getHot() {
		return hot;
	}

	public void setHot(int hot) {
		this.hot = hot;
	}

}
