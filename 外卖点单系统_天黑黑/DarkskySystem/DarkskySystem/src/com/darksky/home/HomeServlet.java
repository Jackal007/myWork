package com.darksky.home;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darksky.basic.*;
import com.darksky.shop.Dish;
import com.darksky.shop.Shop;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;

public class HomeServlet extends ConnectDB {

	private static final long serialVersionUID = 1L;
	private ArrayList<Shop> shopList = new ArrayList<Shop>(); // 一个用来存放所有店铺信息的表
	private ArrayList<Dish> dishList = new ArrayList<Dish>(); // 店铺的菜

	public HomeServlet() {
		super();
		System.out.println("--home servlet");
	}

	/**
	 * 在主页上显示店铺
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showShops(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("show shops");
		String sql = "select * from shop";
		shopList.clear();
		try {
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				Shop Shop = new Shop();
				Shop.setShopID(resultSet.getString("shopID"));
				Shop.setShopName(resultSet.getString("shopName"));
				Shop.setShopTel(resultSet.getString("shopTel"));
				Shop.setShopType(resultSet.getString("shopType"));
				Shop.setShopAddress(resultSet.getString("shopAddress"));
				Shop.setShopLicense(resultSet.getString("shopLicense"));
				Shop.setShopIntroduction(resultSet.getString("shopIntroduction"));
				Shop.setNotice(resultSet.getString("Notice"));
				Shop.setShopPhoto(resultSet.getString("shopPhoto"));
				Shop.setState(resultSet.getInt("state"));

				System.out.println(Shop.toString());

				if (Shop.getState() == 1)
					shopList.add(Shop);
			}

		} catch (SQLException e) {
			System.out.println("show shop fail");
			e.printStackTrace();
		}
		System.out.println("show shop success");
		request.getSession().setAttribute("shop", shopList);
		request.getRequestDispatcher("真首页.jsp").forward(request, response);
	}

	// 主页查询
	public void homeSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String type = request.getParameter("type");
		String keywords = request.getParameter("keywords");
		System.out.println(type + "  " + keywords);
		String dishSql = "";
		String shopSql = "";
		if (type.equals("全部")) {
			dishSql = "select hot,dishID,shop.shopID,shopName,dishName,dishStock,dishType,dishPrice,dishIntroduction,dishPhoto from shop,dishinfo where dishinfo.shopID = shop.shopID and dishName like '%"
					+ keywords + "%'";
			shopSql = "select shopID,shopName,shopType,shopAddress,shopPhoto,notice from shop where state = 1 and shopName like '%"
					+ keywords + "%'";
		} else if (!type.equals("全部")) {
			dishSql = "select hot,dishID,shop.shopID,shopName,dishName,dishStock,dishType,dishPrice,dishIntroduction,dishPhoto from shop,dishinfo where dishinfo.shopID = shop.shopID and dishType = '"
					+ type + "' and dishName like '%" + keywords + "%'";
			shopSql = "select shopID,shopName,shopType,shopAddress,shopPhoto,notice from shop where state = 1 and shopType = '"
					+ type + "' and shopName like '%" + keywords + "%'";
		} else
			System.out.println("判断失败");
		request.setAttribute("dishSql", dishSql);
		request.setAttribute("shopSql", shopSql);
		request.setAttribute("searchType", type);
		request.setAttribute("keywords", keywords);
		request.getRequestDispatcher("HomeServlet?method=showResults").forward(request, response);

	}

	/**
	 * 显示结果信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showResults(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		shopList.clear();
		dishList.clear();

		boolean shopFlag = false;
		boolean dishFlag = false;

		// 显示菜品信息
		int orderNum = 0;
		String dishSql = "select hot,dishID,shopID,shopName,dishName,dishStock,dishType,dishPrice,dishIntroduction,dishPhoto from shop,dishinfo where dishinfo.shopID = shop.ID";
		if (request.getAttribute("dishSql") != null && !request.getAttribute("dishSql").toString().equals("")) {
			dishSql = request.getAttribute("dishSql").toString();
			request.removeAttribute("dishSql");
		}
		System.out.println(dishSql);
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(dishSql);

			while (resultSet.next()) {
				Dish dish = new Dish();
				dish.setDishID(resultSet.getString("dishID"));
				dish.setShopID(resultSet.getString("shopID"));
				dish.setDishName(resultSet.getString("dishName"));
				dish.setDishStock(resultSet.getInt("dishStock"));
				dish.setDishPrice(resultSet.getDouble("dishPrice"));
				dish.setDishType(resultSet.getString("dishType"));
				dish.setDishPhoto(resultSet.getString("dishPhoto"));
				dish.setHot(resultSet.getInt("hot"));
				dish.setDishIntroduction(resultSet.getString("dishIntroduction"));
				dishList.add(dish);
				System.out.println(dish.toString());
				dishFlag = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 显示店家信息
		String shopSql = "select shopID,shopName,mainType,shopAddress,shopPhoto,notice from shop where state = 1";
		if (request.getAttribute("shopSql") != null && !request.getAttribute("shopSql").toString().equals("")) {
			shopSql = request.getAttribute("shopSql").toString();
			request.removeAttribute("shopSql");
		}
		System.out.println(shopSql);
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(shopSql);

			while (resultSet.next()) {
				Shop shop = new Shop();
				shop.setShopName(resultSet.getString("shopName"));
				shop.setShopType(resultSet.getString("shopType"));
				shop.setShopAddress(resultSet.getString("shopAddress"));
				shop.setShopPhoto(resultSet.getString("shopPhoto"));
				shop.setNotice(resultSet.getString("notice"));
				shop.setShopID(resultSet.getString("shopID"));
				shopList.add(shop);
				System.out.println(shop.toString());
				shopFlag = true;
			}

		} catch (SQLException e) {
			System.out.println("查询失败");
		}
		

	    
        class SortByHot implements Comparator
        {
            
            public int compare(Object o1, Object o2)
            {
            	Dish s1=(Dish)o1;
            	Dish s2=(Dish)o2;
            	return s2.getHot()-s1.getHot();
            }
        }
        dishList.sort(new SortByHot());     
        
		request.setAttribute("dishList", dishList);
		request.setAttribute("shopList", shopList);
		request.setAttribute("dishFlag", dishFlag);
		request.setAttribute("shopFlag", shopFlag);
		request.getRequestDispatcher("showResults.jsp").forward(request, response);
	}

}
