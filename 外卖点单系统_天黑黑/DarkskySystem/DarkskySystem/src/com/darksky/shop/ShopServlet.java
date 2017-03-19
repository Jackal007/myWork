package com.darksky.shop;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darksky.basic.*;

public class ShopServlet extends ConnectDB {

	private static final long serialVersionUID = 1L;

	private Shop Shop = new Shop(); // 店类
	private ArrayList<Dish> DishList = new ArrayList<Dish>(); // 店铺的菜
	private ArrayList<Order> Orders = new ArrayList<Order>(); // 店铺购物车信息

	public ShopServlet() {
		super();
		System.out.println("--shop servlet");
	}

	/**
	 * 显示店铺信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showShop(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println();
		System.out.println("------------------show a shop------------------");

		String shopID = request.getParameter("shopID");

		String shopSql = "select * from shop where shopID ='" + shopID + "'";
		System.out.println(shopSql);

		try {
			resultSet = statement.executeQuery(shopSql);
			while (resultSet.next()) {

				Shop.setShopID(shopID);
				Shop.setShopName(resultSet.getString("shopName"));
				Shop.setShopTel(resultSet.getString("shopTel"));
				Shop.setShopType(resultSet.getString("shopType"));
				Shop.setShopIntroduction(resultSet.getString("shopIntroduction"));
				Shop.setNotice(resultSet.getString("notice"));
				Shop.setShopAddress(resultSet.getString("shopAddress"));
				Shop.setShopPhoto(resultSet.getString("shopPhoto"));
				Shop.setShopLicense(resultSet.getString("shopLicense"));

				System.out.println(Shop.toString());
			}
		} catch (SQLException e) {
			System.out.println("get shop info fail");
			e.printStackTrace();
		}

		String dishSql = "select * from dishInfo where shopID='" + shopID + "'";
		System.out.println(dishSql);

		DishList.clear();
		try {
			resultSet = statement.executeQuery(dishSql);
			while (resultSet.next()) {

				Dish Dish = new Dish();

				Dish.setDishID(resultSet.getString("dishID"));
				Dish.setDishName(resultSet.getString("dishName"));
				Dish.setDishPrice(Integer.parseInt(resultSet.getString("dishPrice")));
				Dish.setDishIntroduction(resultSet.getString("dishIntroduction"));
				Dish.setDishPhoto(resultSet.getString("dishPhoto"));
				Dish.setDishStock(Integer.parseInt(resultSet.getString("dishStock")));

				System.out.println(Dish.toString());

				DishList.add(Dish);
			}
		} catch (SQLException e) {
			System.out.println("get dishes info fail");
			e.printStackTrace();
		}

		System.out.println("------------------show a shop------------------");
		System.out.println();

		request.getSession().setAttribute("dish", DishList);
		request.getSession().setAttribute("shop", Shop);
		request.getRequestDispatcher("店铺.jsp").forward(request, response);
	}

	/**
	 * 消费者买东西
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("------------------customer buy------------------");

		Map<String, String[]> parameterMap = request.getParameterMap(); // 用来保存传递过来的全部参数

		String customerID = null;
		String shopID = null;
		String dishID = null;
		double quantity = 0;
		double totalPrice = 0;
		double customerMoney = 0; // 消费者余额

		for (String key : parameterMap.keySet()) {
			System.out.println(key + "	->	" + parameterMap.get(key)[0]);
			if (key.equals("method")) {

			} else if (key.equals("customerID")) {
				customerID = parameterMap.get(key)[0];
			} else if (key.equals("shopID")) {
				shopID = parameterMap.get(key)[0];
			} else {
				dishID = key;
				String[] temp = parameterMap.get(key)[0].split(",");
				Order Order = new Order();
				Order.setCustomerID(customerID);
				Order.setDishID(dishID);
				Order.setShopID(shopID);
				Order.setTotalPrice(Double.parseDouble(temp[0]) * Double.parseDouble(temp[1]));
				totalPrice += Order.getTotalPrice();
				Order.setQuantity(Integer.parseInt(temp[1]));

				Orders.add(Order);
			}

		}
		
		try {
			// 获取该顾客的账户余额
			String orderSql = "select customerMoney from customer where customerID ='" + customerID + "'";
			System.out.println(orderSql);

			resultSet = statement.executeQuery(orderSql);
			while (resultSet.next()) {
				customerMoney = resultSet.getDouble("customerMoney");
			}

			if (customerMoney < totalPrice) {
				request.getRequestDispatcher("结算失败.jsp").forward(request, response);

			} else {

				// 更新菜品的库存

				for (int i = 0; i < Orders.size(); i++) {
					dishID = Orders.get(i).getDishID();

					int dishStock = 0;
					orderSql = "select * from dishinfo where dishID =" + dishID;
					System.out.println(orderSql);

					resultSet = statement.executeQuery(orderSql);

					while (resultSet.next()) {
						dishStock = resultSet.getInt("dishStock");
					}
					quantity = Orders.get(i).getQuantity();
					dishStock -= quantity;

					orderSql = "update dishinfo set hot=hot+1,dishStock=" + dishStock + " where dishID=" + dishID;

					statement.executeUpdate(orderSql);

					orderSql = "insert into historyorders(shopID,customerID,dishID,quantity,totalPrice) values('"
							+ shopID + "','" + customerID + "'," + dishID + "," + quantity + "," + Orders.get(i).getTotalPrice() + ")";
					System.out.println(orderSql);
					statement.execute(orderSql);

					// 更新余额
					customerMoney = customerMoney - totalPrice;
					orderSql = "update customer set customerMoney=" + customerMoney + "where customerID='" + customerID
							+ "'";
					System.out.println(orderSql);
					statement.executeUpdate(orderSql);
				}

			}

		} catch (SQLException e) {
			System.out.println("buy fail");
			e.printStackTrace();
		}
		Orders.clear();
		request.getRequestDispatcher("结算成功.jsp").forward(request, response);
		System.out.println("------------------customer buy------------------");
		System.out.println();
	}

}
