package com.darksky.seller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.darksky.basic.*;
import com.darksky.shop.*;

public class SellerServlet extends ConnectDB {

	private static final long serialVersionUID = 1L;

	boolean LoginState = false; // 店家登录状态，‘false’表示未登录，‘true’表示已登录
	private Seller Seller = new Seller(); // 店家个人信息类
	private Shop Shop = new Shop(); // 店家的店铺
	private ArrayList<Dish> DishList = new ArrayList<Dish>(); // 店铺的菜
	private ArrayList<Order> SellerOrders = new ArrayList<Order>(); // 店家订单类

	public SellerServlet() {
		super();
		System.out.println("--seller servlet");
	}

	/***********
	 * * 店家注册
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("------------seller signUp---------------");

		String sellerName = request.getParameter("Name");
		String sellerID = request.getParameter("ID");
		String sellerPassword = request.getParameter("Password");

		String sql = "insert into seller (sellerID,sellerName,sellerPassword,sellerTel) values('" + sellerID + "','"
				+ sellerName + "','" + MD5.GetMD5Code(sellerPassword) + "','" + sellerID + "')";

		System.out.println(sql);

		try {
			statement.execute(sql);
		} catch (SQLException e) {
			System.out.println("seller signup fail");
			;
			request.getRequestDispatcher("注册失败.jsp").forward(request, response);
			e.printStackTrace();
		}
		System.out.println("seller signup success");

		System.out.println("------------seller signUp---------------");
		System.out.println();

		request.getSession().setAttribute("singup", "t");
		request.getRequestDispatcher("注册成功.jsp").forward(request, response);
	}

	/***********
	 * 店家登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("----------------------------seller login--------------------");

		String sellerID = request.getParameter("ID");
		String sellerPassword = MD5.GetMD5Code(request.getParameter("Password"));

		System.out.println("id: " + sellerID);

		String sql = "select * from seller";
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				if (sellerID.equals(resultSet.getString("sellerID"))) {
					if (sellerPassword.equals(resultSet.getString("sellerPassword"))) {

						/* 登录成功 */
						LoginState = true;
						System.out.println("seller LogIn success");

					} else {
						/* 登录失败 */
						System.out.println("seller LogIn password wrong");

					}
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("----------------------------seller login--------------------");
		System.out.println();

		if (LoginState) {
			request.getRequestDispatcher("SellerServlet?method=sellerHome&sellerID=" + sellerID).forward(request,
					response);
		} else {

			request.getRequestDispatcher("登录失败.jsp").forward(request, response);
		}
	}

	/**
	 * 店家退出
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("----------------------------seller logOut--------------------");

		System.out.println("seller logOut");

		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("order");
		request.getSession().removeAttribute("shop");

		System.out.println("----------------------------seller logOut--------------------");
		System.out.println();

		request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
	}

	/**
	 * 确认要修改的账户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void testID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("-------------------test ID------------------");
		
		String sellerID = request.getParameter("ID");
		String iden = "s";
		System.out.println("sellerID: " + sellerID);
		String sql = "select * from seller where sellerID = '" + sellerID + "'";
		try {
			resultSet = statement.executeQuery(sql);
			if (resultSet.wasNull()) {
				System.out.println("doesn't exist");
				request.getRequestDispatcher("用户不存在.jsp").forward(request, response);
			} else {
				request.setAttribute("sellerID", sellerID);
				request.setAttribute("iden", iden);
				questionAndAnswer(sellerID, request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error");
		}

		System.out.println("-------------------test ID------------------");
		System.out.println();
	}

	/**
	 * 检测密保问题
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void checkAnswer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String ID = request.getParameter("ID");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String iden = "s";
		boolean flag = false;
		String sql = "select * from seller";
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				if (question.equals(resultSet.getString("securityQuestion"))) {
					if (answer.equals(resultSet.getString("securityAnswer"))) {

						/* 验证成功 */
						flag = true;
						System.out.println("密保验证成功");
						request.setAttribute("sellerID", ID);
						request.setAttribute("iden", iden);
						request.getRequestDispatcher("重置密码.jsp").forward(request, response);

					} else {
						/* 验证失败 */
						flag = false;
						System.out.println("密保验证失败");
						request.getRequestDispatcher("问题回答错误.jsp").forward(request, response);
					}
					break;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error");
		}
	}

	/**
	 * 修改密码
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void modifyPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println();
		System.out.println("---------------------modifyPassword------------------");

		String sellerID = request.getParameter("ID");
		System.out.println("sellerID: " + sellerID);
		String repeatPassword = request.getParameter("repeatPW");
		String newPassword =MD5.GetMD5Code(request.getParameter("newPW")) ;
		String sellerSql = "update seller set sellerPassword='" + newPassword + "' where sellerID='" + sellerID + "'";
		try {
			statement.executeUpdate(sellerSql);
			getInfo(sellerID);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("---------------------modifyPassword------------------");
		System.out.println();

		request.getRequestDispatcher("修改密码成功.jsp").forward(request, response);
	}


	/**
	 * 获取问题和答案
	 * @param ID   店家的ID
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void questionAndAnswer(String ID, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println();
		System.out.println("---------------------questionAndAnswer------------------");

		String question = null;
		String answer = null;
		System.out.println(ID);
		String sql = "select * from seller where sellerID = '" + ID + "'";
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				question = resultSet.getString("securityQuestion");
				answer = resultSet.getString("securityAnswer");
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error");
		}
		request.setAttribute("question", question);
		request.setAttribute("answer", answer);
		System.out.println(question);
		System.out.println(answer);
		request.setAttribute("sellerID", ID);

		System.out.println("---------------------questionAndAnswer------------------");
		System.out.println();

		request.getRequestDispatcher("密保问题检测.jsp").forward(request, response);
	}

	/**
	 *  店家店铺中心Servlet，获取店家的个人信息、店铺信息、食品清单和订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void sellerHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		System.out.println();
		System.out.println("----------------------sellerHome------------");

		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("order");
		request.getSession().removeAttribute("shop");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		String sellerID = request.getParameter("sellerID");

		System.out.println("id: " + sellerID);

		/* 设置店家的个人信息 */
		getInfo(sellerID);
		request.getSession().setAttribute("user", Seller);

		/* 设置店家的店的信息 */
		if (getShop(Seller.getShopID())) {
			System.out.println(Seller.getShopID() + "店存在");
			if (Shop.getState() == 0) {
				System.out.println(Seller.getShopID() + "尚未审核");
				request.getSession().setAttribute("sellerShop", "0");
			} else if (Shop.getState() == 2) {
				System.out.println(Seller.getShopID() + "审核没通过");
				request.getSession().setAttribute("sellerShop", "2");
			} else if (Shop.getState() == 1) {
				System.out.println(Seller.getShopID() + "审核通过");
				request.getSession().setAttribute("shop", Shop);
				request.getSession().setAttribute("sellerShop", "1");

				/* 设置店家的订单信息 */
				getOrder(sellerID);
				request.getSession().setAttribute("orders", SellerOrders);

				/* 设置店家的食品信息 */
				getDish(sellerID);
				request.getSession().setAttribute("dish", DishList);
			}

		} else {
			request.getSession().setAttribute("sellerShop", "x");
			System.out.println(Seller.getShopID() + "店不存在");
		}

		System.out.println("----------------------sellerHome------------");
		System.out.println();

		request.getRequestDispatcher("店家店铺中心.jsp").forward(request, response);

	}

	/**
	 * 获取店铺信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void sellerShop(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		System.out.println();
		System.out.println("----------------------sellerShop------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops.jsp").forward(request, response);
			return;
		}

		getShop(Seller.getShopID());
		request.getSession().setAttribute("shop", Shop);

		System.out.println("----------------------sellerShop------------");
		System.out.println();

		request.getRequestDispatcher("店铺资料修改.jsp").forward(request, response);

	}

	/**
	 * 获取店家的订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void sellerOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		System.out.println();
		System.out.println("----------------------sellerOrder------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops.jsp").forward(request, response);
			return;
		}

		String sellerID = request.getParameter("sellerID");

		/* 设置店家的订单信息 */
		getOrder(sellerID);
		request.getSession().setAttribute("orders", SellerOrders);

		System.out.println("----------------------sellerOrder------------");
		System.out.println();

		request.getRequestDispatcher("店家订单处理.jsp").forward(request, response);

	}

	/**
	 *  获取店家的菜
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void sellerDish(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		System.out.println();
		System.out.println("----------------------sellerDish------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		String sellerID = request.getParameter("sellerID");
		System.out.println("**********************     sellerID=    " + sellerID + "**************");

		/* 设置店家的菜 */
		getDish(sellerID);
		request.getSession().setAttribute("dish", DishList);

		System.out.println("----------------------sellerDish------------");
		System.out.println();

		request.getRequestDispatcher("店家食品编辑.jsp").forward(request, response);

	}

	
	/**
	 * 获取店家的个人信息
	 * @param sellerID
	 * @return
	 */
	public boolean getInfo(String sellerID) {
		System.out.println();
		System.out.println("----------------------seller get Info------------");

		boolean flag = false;
		String sql = "select * from seller";
		try {
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				if (sellerID.equals(resultSet.getString("sellerID"))) {

					Seller.setSellerID(resultSet.getString("sellerID"));
					Seller.setSellerName(resultSet.getString("sellerName"));
					Seller.setSellerPassword(resultSet.getString("sellerPassword"));
					Seller.setSellerTel(resultSet.getString("sellerTel"));
					Seller.setShopID(resultSet.getString("shopID"));
					Seller.setSecurityQuestion(resultSet.getString("securityQuestion"));
					Seller.setSecurityAnswer(resultSet.getString("securityAnswer"));

					System.out.println(Seller.toString());

					flag = true;
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("----------------------seller get Info------------");
		System.out.println();

		return flag;
	}

	/**
	 *获取店家的个人信息 
	 * @param shopID
	 * @return
	 */
	public boolean getShop(String shopID) {
		System.out.println();
		System.out.println("----------------------get shop------------");

		String sql = "select * from shop";
		boolean flag = false;
		try {

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				if (resultSet.getString("shopID").equals(shopID)) {

					Shop.setShopID(shopID);
					Shop.setShopName(resultSet.getString("shopName"));
					Shop.setShopTel(resultSet.getString("shopID"));
					Shop.setShopType(resultSet.getString("shopType"));
					Shop.setShopAddress(resultSet.getString("shopAddress"));
					Shop.setShopPhoto(resultSet.getString("shopPhoto"));
					Shop.setShopLicense(resultSet.getString("shopLicense"));
					Shop.setShopIntroduction(resultSet.getString("shopIntroduction"));
					Shop.setNotice(resultSet.getString("Notice"));
					Shop.setState(resultSet.getInt("state"));

					System.out.println(Shop.toString());

					flag = true;
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("----------------------get shop------------");
		System.out.println();

		return flag;
	}

	/**
	 * 获取店家的食品
	 * @param sellerID
	 */
	public void getDish(String sellerID) {
		System.out.println();
		System.out.println("--------------------seller get dish--------------");

		String sql1 = "select * from seller";
		String shopID = null;
		try {
			resultSet = statement.executeQuery(sql1);
			while (resultSet.next()) {
				if (sellerID.equals(resultSet.getString("sellerID"))) {
					shopID = resultSet.getString("shopID");
					System.out.println(shopID);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String sql2 = "select * from dishinfo";
		try {
			resultSet = statement.executeQuery(sql2);
			DishList.clear();
			while (resultSet.next()) {
				if (shopID.equals(resultSet.getString("shopID"))) {

					Dish Dish = new Dish();

					Dish.setShopID(shopID);
					Dish.setDishName(resultSet.getString("DishName"));
					Dish.setDishType(resultSet.getString("DishType"));
					Dish.setDishID(resultSet.getString("DishID"));
					Dish.setDishPrice(Double.parseDouble(resultSet.getString("DishPrice")));
					Dish.setDishStock(resultSet.getInt("DishStock"));
					Dish.setDishPhoto(resultSet.getString("DishPhoto"));
					Dish.setDishIntroduction(resultSet.getString("DishIntroduction"));

					System.out.println(Dish.toString());

					DishList.add(Dish);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("--------------------seller get dish--------------");
		System.out.println();
	}

	/**
	 * 获取店家订单
	 * @param sellerID   店家的ID
	 * @throws ParseException
	 */
	public void getOrder(String sellerID) throws ParseException {
		System.out.println();
		System.out.println("-----------------seller get order---------------");

		String sql1 = "select * from seller";
		String shopID = null;
		try {
			resultSet = statement.executeQuery(sql1);
			while (resultSet.next()) {
				if (sellerID.equals(resultSet.getString("sellerID"))) {

					shopID = resultSet.getString("shopID");

					System.out.println(shopID);
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String sql2 = "select historyorders.state,orderID,historyorders.shopID,dishName,historyorders.customerID,quantity,totalPrice,dealTime from historyorders,dishinfo,customer where historyorders.customerID = customer.customerID and historyorders.dishID = dishinfo.dishID";
		try {
			resultSet = statement.executeQuery(sql2);
			SellerOrders.clear();
			while (resultSet.next()) {

				if (shopID.equals(resultSet.getString("historyorders.shopID"))) {
					Order SellerOrder = new Order();

					SellerOrder.setShopID(shopID);
					SellerOrder.setOrderID(resultSet.getString("orderID"));
					SellerOrder.setDishName(resultSet.getString("dishName"));
					SellerOrder.setCustomerID(resultSet.getString("customerID"));
					SellerOrder.setQuantity(resultSet.getInt("quantity"));
					SellerOrder.setTotalPrice(resultSet.getDouble("totalPrice"));
					SellerOrder.setDealTime(resultSet.getString("dealTime"));
					SellerOrder.setState(resultSet.getInt("historyorders.state"));

					System.out.println(SellerOrder.toString());

					SellerOrders.add(SellerOrder);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("-----------------seller get order---------------");
		System.out.println();
	}

	/**
	 *
	 * 修改店家信息 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void modifySellerInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println();
		System.out.println("-------------------- modifySellerInfo-----------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		/* 店家的信息 */
		String sellerID = Seller.getSellerID();
		String sellerName = request.getParameter("sellerName");
		String sellerTel = request.getParameter("sellerTel");
		String sellerPassword = MD5.GetMD5Code(request.getParameter("sellerPassword"));
		String securityQuestion = request.getParameter("securityQuestion");
		String securityAnswer = request.getParameter("securityAnswer");

		String sellerSql = null;

		if (sellerPassword.equals("")) {
			sellerSql = "update seller set sellerName='" + sellerName + "' ,sellerTel='" + sellerTel
					+ "' ,  securityQuestion='" + securityQuestion + "' , securityAnswer='" + securityAnswer
					+ "' where sellerID='" + sellerID + "'";
		} else {
			sellerSql = "update seller set sellerName='" + sellerName + "' ,sellerTel='" + sellerTel
					+ "', sellerPassword='" + MD5.GetMD5Code(sellerPassword) + "' ,  securityQuestion='"
					+ securityQuestion + "' , securityAnswer='" + securityAnswer + "' where sellerID='" + sellerID
					+ "'";
		}

		System.out.println("sellerSql: " + sellerSql);
		try {
			statement.executeUpdate(sellerSql);
			getInfo(sellerID);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("--------------------seller modify info-----------------");
		System.out.println();

		request.getSession().removeAttribute("user");
		getInfo(sellerID);
		request.getSession().setAttribute("user", Seller);

		request.getRequestDispatcher("SellerServlet?method=sellerHome&sellerID=" + sellerID).forward(request, response);
	}

	/**
	 *   
	 * 修改店铺信息
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void modifyShopInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println();
		System.out.println("--------------------shop modify info-----------------");
		/* 店家的信息 */
		String sellerID = Seller.getSellerID();

		/* 店铺的信息 */

		String shopID = Shop.getShopID();
		String shopName = null;
		String shopTel = null;
		String shopIntroduction = null;
		String Notice = null;
		String shopAddress = null;
		String shopPhoto = null;

		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();

		ServletFileUpload sfu = new ServletFileUpload(diskFileItemFactory);
		ServletFileUpload sfu2 = new ServletFileUpload(diskFileItemFactory);
		// 设置编码
		sfu.setHeaderEncoding("UTF-8");
		// 设置上传的单个文件的最大字节数为2M
		sfu.setFileSizeMax(1024 * 1024 * 2);
		// 设置整个表单的最大字节数为10M
		sfu.setSizeMax(1024 * 1024 * 10);
		List<FileItem> itemList = sfu.parseRequest(request);

		List<FileItem> itemList2 = sfu2.parseRequest(request);

		FileItem a = null;

		for (FileItem fileItem : itemList) {

			if (!fileItem.isFormField()) {
				a = fileItem;

				System.out.println("QQQQQQQQQQQQQQQQ" + fileItem.toString() + "QQQQQQQQ");

			} else {
				String fieldName = fileItem.getFieldName();
				String value = fileItem.getString("utf-8");
				switch (fieldName) {
				case "shopName":
					shopName = value;
					break;
				case "shopTel":
					shopTel = value;
					break;
				case "shopIntroduction":
					shopIntroduction = value;
					break;
				case "Notice":
					Notice = value;
					break;
				case "shopPhoto":
					shopPhoto = value;
					break;
				case "shopAddress":
					shopAddress = value;
					break;

				default:
					break;
				}

			}

		}
		double randomNum = Math.random();
		shopPhoto = "image/" + shopID + "_" + randomNum + ".jpg";
		String savePath2 = getServletContext().getRealPath("");
		System.out.println("path2=" + savePath2);
		getDish(sellerID);

		String shopSql = null;
		if (a.getSize() != 0) {
			File file2 = new File(savePath2, shopPhoto);
			a.write(file2);

			shopSql = "update shop set shopName='" + shopName + "' , shopTel='" + shopTel + "' , shopIntroduction='"
					+ shopIntroduction + "' , Notice='" + Notice + "' , shopAddress='" + shopAddress + "',shopPhoto='"
					+ shopPhoto + "' where shopID='" + shopID + "'";
		}

		else {

			shopSql = "update shop set shopName='" + shopName + "' , shopTel='" + shopTel + "' , shopIntroduction='"
					+ shopIntroduction + "' , Notice='" + Notice + "' , shopAddress='" + shopAddress
					+ "' where shopID='" + shopID + "'";
		}

		System.out.println("shopSql: " + shopSql);

		try {
			statement.executeUpdate(shopSql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		getShop(Seller.getShopID());
		request.getSession().setAttribute("shop", Shop);

		System.out.println("--------------------shop modify info-----------------");
		System.out.println();

		request.getRequestDispatcher("店铺资料修改.jsp").forward(request, response);
	}

	
	
	 
	/**
	 * * 删除食品 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void dealOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		System.out.println();
		System.out.println("-------------------dealOrder-----------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		int orderID = Integer.parseInt(request.getParameter("orderID"));
		int state = Integer.parseInt(request.getParameter("state"));
		String sql = "update historyorders set state=" + state + " where orderID=" + orderID + "";
		System.out.println(sql);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			System.out.println(e.toString());
		}
		if(state ==2){
			double totalPrice=0;
			String customerID=null;
			int quantity=0;
			String dishID=null;
			sql="Select * from historyorders  where OrderID="+orderID;
			
			try {
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
					totalPrice =Double.parseDouble(resultSet.getString("totalPrice"));
					customerID= resultSet.getString("customerID");
					quantity= resultSet.getInt("quantity");
					dishID = resultSet.getString("dishID");
				}
				String sql2="update customer set customerMoney= customerMoney+" + totalPrice + " where customerID='" + customerID + "'";
				statement.execute(sql2);
				String sql3="update dishinfo set dishStock= dishStock+" + quantity + " where dishID='" + dishID + "'";
				statement.execute(sql3);
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("------------------dealOrder-----------------");
		System.out.println();

		getOrder(Seller.getSellerID());
		request.getSession().setAttribute("order", SellerOrders);
		request.getRequestDispatcher("SellerServlet?method=sellerOrder&sellerID=" + Seller.getSellerID())
				.forward(request, response);
	

	}

	
	
	/**
	 * * 店家开店 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void openShop(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println();
		System.out.println("-----------------open shop-----------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		String shopName = request.getParameter("shopName");
		String shopIntroduction = request.getParameter("shopIntroduction");
		String shopID = request.getParameter("shopID");
		String shopType = request.getParameter("shopType");
		String shopAddress = request.getParameter("shopAddress");
		String shopLicense = request.getParameter("shopLicense");

		String shopSql = "insert into shop (shopID,shopName,shopTel,shopType,shopAddress,shopLicense,shopIntroduction) values('"
				+ shopID + "','" + shopName + "','" + shopID + "','" + shopType + "','" + shopAddress + "','"
				+ shopLicense + "','" + shopIntroduction + "')";
		String sellerSql = "update seller set shopId='" + shopID + "' where sellerID ='" + Seller.getSellerID() + "'";

		System.out.println("shopSql: " + shopSql);
		System.out.println("sellerSql: " + sellerSql);
		try {
			statement.execute(shopSql);
			statement.execute(sellerSql);
		} catch (SQLException e) {
			e.printStackTrace();

			System.out.println("open shop fail");

			request.getSession().setAttribute("openshop", "fail");
			request.getRequestDispatcher("我要开店.jsp").forward(request, response);
		}
		System.out.println("open shop success");

		System.out.println("-----------------open shop-----------");
		System.out.println();

		request.getSession().setAttribute("sellerShop", "0");
		request.getRequestDispatcher("SellerServlet?method=sellerHome&sellerID=" + Seller.getSellerID())
				.forward(request, response);
	}

	
	
	/**
	 * * 添加食品 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void addDish(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println();
		System.out.println("-----------add dish--------------");
		String sellerID = Seller.getSellerID();
		String shopID = Seller.getShopID();
		String dishType = null;
		String dishName = null;
		String dishPrice = null;

		String dishStock = null;
		String dishIntroduction = null;

		if (ServletFileUpload.isMultipartContent(request)) {
			// String savePath = getServletContext().getRealPath("image");

			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();

			ServletFileUpload sfu = new ServletFileUpload(diskFileItemFactory);
			ServletFileUpload sfu2 = new ServletFileUpload(diskFileItemFactory);
			// 设置编码
			sfu.setHeaderEncoding("UTF-8");
			// 设置上传的单个文件的最大字节数为2M
			sfu.setFileSizeMax(1024 * 1024 * 2);
			// 设置整个表单的最大字节数为10M
			sfu.setSizeMax(1024 * 1024 * 10);
			List<FileItem> itemList = sfu.parseRequest(request);

			List<FileItem> itemList2 = sfu2.parseRequest(request);

			FileItem a = null;

			for (FileItem fileItem : itemList) {

				if (!fileItem.isFormField()) {
					a = fileItem;

				} else {
					String fieldName = fileItem.getFieldName();
					String value = fileItem.getString("utf-8");
					switch (fieldName) {
					case "dishName":
						dishName = value;
						break;
					case "dishPrice":
						dishPrice = value;
						break;

					case "dishIntroduction":
						dishIntroduction = value;
						break;
					case "dishStock":
						dishStock = value;
						break;
					case "dishType":
						dishType = value;
						break;
					default:
						break;
					}

				}

			}

			String dishPhoto = "image/" + sellerID + "_" + dishName + ".jpg";
			String sql = "insert into dishinfo (dishName,dishType,dishPrice,dishPhoto,shopID,dishIntroduction,dishStock,sellerID) values('"
					+ dishName + "','" + dishType + "','" + dishPrice + "','" + dishPhoto + "','" + shopID + "','"
					+ dishIntroduction + "','" + dishStock + "','" + sellerID + "')";
			System.out.println(sql);

			String savePath2 = getServletContext().getRealPath("");
			System.out.println("path2=" + savePath2);

			File file1 = new File(savePath2, dishPhoto);
			System.out.println("图片——————————————————————————————》" + a.toString());
			a.write(file1);
			System.out.println("图片上传成功？？？？？？？？？？？");

			try {
				statement.execute(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		getDish(sellerID);
		request.getSession().setAttribute("dish", DishList);
		request.getRequestDispatcher("店家食品编辑.jsp").forward(request, response);
		System.out.println("-----------add dish--------------");
		System.out.println();

	}

	
	
	/**
	 * * 删除食品 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteDish(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println();
		System.out.println("-------------------delete dish-----------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		String dishID = request.getParameter("dishID");
		String sellerID = request.getParameter("sellerID");
		String sql = "delete from dishinfo where dishID='" + dishID + "' and sellerId = '" + sellerID + "'";
		System.out.println(sql);
		boolean Bdelete = false;
		try {
			statement.execute(sql);
			Bdelete = true;
		} catch (SQLException e) {
			System.out.println(e.toString());
		}
		if (Bdelete) {
			System.out.println("delete dish success");
			// request.setAttribute("delState", true);
		} else {
			System.out.println("delete dish fail");
			// request.setAttribute("delState", false);
		}

		System.out.println("-------------------delete dish-----------------");
		System.out.println();

		getDish(sellerID);
		request.getSession().setAttribute("dish", DishList);
		request.getRequestDispatcher("店家食品编辑.jsp").forward(request, response);

	}

	
	
	/**
	 * * 修改食品 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void modifyDish(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("-----------modify dish--------------");
		String sellerID = Seller.getSellerID();
		String dishType = null;
		String dishName = null;
		String dishPrice = null;
		String dishID = null;
		String dishIntroduction = null;
		String dishStock = null;

		if (ServletFileUpload.isMultipartContent(request)) {
			// String savePath = getServletContext().getRealPath("image");

			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();

			ServletFileUpload sfu = new ServletFileUpload(diskFileItemFactory);
			ServletFileUpload sfu2 = new ServletFileUpload(diskFileItemFactory);
			// 设置编码
			sfu.setHeaderEncoding("UTF-8");
			// 设置上传的单个文件的最大字节数为2M
			sfu.setFileSizeMax(1024 * 1024 * 2);
			// 设置整个表单的最大字节数为10M
			sfu.setSizeMax(1024 * 1024 * 10);
			List<FileItem> itemList = sfu.parseRequest(request);

			List<FileItem> itemList2 = sfu2.parseRequest(request);

			FileItem a = null;

			for (FileItem fileItem : itemList) {

				if (!fileItem.isFormField()) {
					a = fileItem;

				} else {
					String fieldName = fileItem.getFieldName();
					String value = fileItem.getString("utf-8");
					switch (fieldName) {
					case "dishName":
						dishName = value;
						System.out.println("!!!!!!!!!!!!!!!!!dishName=     " + dishName);
						break;
					case "dishPrice":
						dishPrice = value;
						break;
					case "dishIntroduction":
						dishIntroduction = value;
						break;
					case "dishStock":
						dishStock = value;
						break;
					case "dishID":
						dishID = value;
						break;
					case "dishType":
						dishType = value;
						break;
					default:
						break;
					}

				}

			}
			// 图片随机数
			double randomNum = Math.random();
			// request.setAttribute("randomNum", randomNum);

			String dishPhoto = "image/" + sellerID + "_" + dishName + "_" + randomNum + ".jpg";

			String savePath2 = getServletContext().getRealPath("");
			System.out.println("path2=" + savePath2);
			getDish(sellerID);
			File file1 = new File(savePath2, dishPhoto);

			String sql = null;
			if (a.getSize() != 0) {
				a.write(file1);

				sql = "update dishinfo set dishType='" + dishType + "',dishName='" + dishName + "',dishPrice='"
						+ dishPrice + "',dishPrice='" + dishPrice + "',dishIntroduction='" + dishIntroduction
						+ "',dishStock='" + dishStock + "',dishPhoto='" + dishPhoto + "' where dishID='" + dishID + "'";
			} else {
				sql = "update dishinfo set dishType='" + dishType + "',dishName='" + dishName + "',dishPrice='"
						+ dishPrice + "',dishPrice='" + dishPrice + "',dishIntroduction='" + dishIntroduction
						+ "',dishStock='" + dishStock + "' where dishID='" + dishID + "'";
			}

			System.out.println(sql);

			try {
				statement.execute(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		getDish(sellerID);

		request.getSession().setAttribute("dish", DishList);
		request.getSession().setAttribute("sellerID", sellerID);
		System.out.println("**********************     sellerID=    " + sellerID + "**************");
		// this.sellerDish(request, response);

		request.getRequestDispatcher("店家食品编辑.jsp").forward(request, response);

	}
}
