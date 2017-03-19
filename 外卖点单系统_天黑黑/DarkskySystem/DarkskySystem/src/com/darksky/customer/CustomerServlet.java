package com.darksky.customer;

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
import com.darksky.shop.Order;

public class CustomerServlet extends ConnectDB {

	private static final long serialVersionUID = 1L;

	boolean LoginState = false; // 用户状态'false'表示未登录,'true'表示登录
	private Customer Customer = new Customer(); // 用户个人信息类
	private ArrayList<Order> CustomerOrders = new ArrayList<Order>(); // 用户订单类

	public CustomerServlet() {
		super();
		System.out.println("--customer Servlet");
	}

	/**
	 *  用户注册
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("-------------customer signUp-----------------");

		String customerName = request.getParameter("Name");
		String customerTel = request.getParameter("ID");
		String customerPassword = request.getParameter("Password");

		String sql = "insert into customer(customerID,customerName,customerPassword,customerTel) values('" + customerTel
				+ "','" + customerName + "','" + MD5.GetMD5Code(customerPassword) + "','" + customerTel + "')";

		System.out.println(sql);

		try {
			statement.execute(sql);
		} catch (SQLException e) {
			System.out.println("customer signup fail");
			request.getRequestDispatcher("注册失败.jsp").forward(request, response);
			e.printStackTrace();
		}
		System.out.println("customer signup success");
		System.out.println("-------------customer signUp-----------------");
		System.out.println();

		request.getRequestDispatcher("注册成功.jsp").forward(request, response);
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

		String customerID = request.getParameter("ID");
		String iden = "c";
		System.out.println("customerID: " + customerID);
		String sql = "select * from customer where customerID = '" + customerID + "'";
		try {
			resultSet = statement.executeQuery(sql);
			if (resultSet.wasNull()) {
				System.out.println("doesn't exist");
				
			} else {
				request.setAttribute("customerID", customerID);
				request.setAttribute("iden", iden);
				questionAndAnswer(customerID, request, response);
				request.getRequestDispatcher("用户不存在.jsp").forward(request, response);
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
		String iden = "c";
		boolean flag = false;
		String sql = "select * from customer";
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				if (question.equals(resultSet.getString("securityQuestion"))) {
					if (answer.equals(resultSet.getString("securityAnswer"))) {

						/* 验证成功 */
						flag = true;
						System.out.println("密保验证成功");
						request.setAttribute("customerID", ID);
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

		String customerID = request.getParameter("ID");
		System.out.println("customerID: " + customerID);
		String newPassword = MD5.GetMD5Code(request.getParameter("newPW"));
		String customerSql = "update customer set customerPassword='" + newPassword + "' where customerID='"
				+ customerID + "'";
		try {
			statement.executeUpdate(customerSql);
			getInfo(customerID);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("---------------------modifyPassword------------------");
		System.out.println();

		request.getRequestDispatcher("修改密码成功.jsp").forward(request, response);
	}

	/**
	 * 获取问题和答案
	 * @param ID
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
		String sql = "select * from customer where customerID = '" + ID + "'";
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
	 * 用户登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("-----------------------customer LogIn----------------");

		String customerID = request.getParameter("ID");
		String customerPassword = MD5.GetMD5Code(request.getParameter("Password"));

		String sql = "select * from customer";

		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				if (customerID.equals(resultSet.getString("customerID"))) {
					if (customerPassword.equals(resultSet.getString("customerPassword"))) {
						/* 登录成功 */
						LoginState = true;
						System.out.println(customerID + " customer LogIn success");

					} else {
						/* 登录失败 */
						System.out.println(customerID + " customer LogIn fail");

					}
					break;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("-----------------------customer LogIn--------------");
		System.out.println();

		if (LoginState) {
			request.getRequestDispatcher("CustomerServlet?method=customerHome&customerID=" + customerID)
					.forward(request, response);
		} else {
			request.getRequestDispatcher("登录失败.jsp").forward(request, response);
		}
	}

	/**
	 * 消费者退出
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------------------customer LogOut----------------");

		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("order");
		LoginState = false;

		System.out.println("-----------------------customer LogOut----------------");
		System.out.println();

		request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
	}

	/**
	 *  用户个人中心的Servlet，获取用户的个人信息和订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void customerHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		System.out.println();
		System.out.println("-----------------------customerHome----------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		String customerID = request.getParameter("customerID");

		System.out.println("id:" + customerID);

		getInfo(customerID);
		getOrder(customerID);

		request.getSession().setAttribute("user", Customer);
		request.setAttribute("orders", CustomerOrders);

		System.out.println("-----------------------customerHome----------------");
		System.out.println();

		request.getRequestDispatcher("用户个人中心.jsp").forward(request, response);
	}
	/**
	 * 用户充钱
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void charge(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		System.out.println("--------------------customer charge money----------------------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		String customerID = request.getParameter("customerID");
		String chargeMoney = request.getParameter("chargeMoney");

		String sql = "update customer set customerMoney=customerMoney+" + chargeMoney + "  where customerID='"
				+ customerID + "'";
		System.out.println(sql);

		try {
			statement.executeUpdate(sql);

		} catch (SQLException e) {
			System.out.println("charge fail");
			e.printStackTrace();
		}
		System.out.println("charge success");
		System.out.println("--------------------customer charge money----------------------------");
		System.out.println();

		request.getRequestDispatcher("CustomerServlet?method=customerHome&customerID=" + Customer.getCustomerID())
				.forward(request, response);
	}
	/**
	 * 用户订单页面的Servlet，获取用户的个人订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void customerOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		System.out.println();
		System.out.println("-----------------------customerOrder---------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		String customerID = request.getParameter("customerID");

		getOrder(customerID);
		request.setAttribute("orders", CustomerOrders);

		System.out.println("-----------------------customerOrder---------------");
		System.out.println();

		request.getRequestDispatcher("用户订单查询.jsp").forward(request, response);
	}

	/**
	 * 获取消费者的个人信息
	 * @param customerID
	 * @return
	 */
	public boolean getInfo(String customerID) {
		System.out.println();
		System.out.println("-----------------------get customer Info--------------------");

		boolean flag = false;
		String sql = "select * from customer";
		try {
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				if (customerID.equals(resultSet.getString("customerID"))) {

					Customer.setCustomerID(resultSet.getString("customerID"));
					Customer.setCustomerName(resultSet.getString("customerName"));
					Customer.setCustomerPassword(resultSet.getString("customerPassword"));
					Customer.setCustomerTel(resultSet.getString("customerTel"));
					Customer.setCustomerPhoto(resultSet.getString("customerPhoto"));
					Customer.setCustomerAddress(resultSet.getString("customerAddress"));
					Customer.setSecurityQuestion(resultSet.getString("securityQuestion"));
					Customer.setSecurityAnswer(resultSet.getString("securityAnswer"));
					Customer.setCustomerMoney(Double.parseDouble(resultSet.getString("customerMoney")));

					System.out.println(Customer.toString());

					flag = true;
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("-----------------------get customer Info--------------------");
		System.out.println();

		return flag;
	}

	/**
	 * 获取用户的订单
	 * @param customerID
	 * @return
	 * @throws ParseException
	 */
	public boolean getOrder(String customerID) throws ParseException {

		System.out.println("-----------------------------get customer orders----------------");

		String sql = "select historyorders.state,customerID,shopName,dishName,quantity,totalPrice,dealTime from historyorders,shop,dishinfo where historyorders.shopID = shop.shopID and historyorders.dishID = dishinfo.dishID";
		boolean flag = false;
		try {
			resultSet = statement.executeQuery(sql);

			CustomerOrders.clear();

			while (resultSet.next()) {
				if (customerID.equals(resultSet.getString("customerID"))) {
					Order CustomerOrder = new Order();

					CustomerOrder.setCustomerID(customerID);
					CustomerOrder.setShopName(resultSet.getString("shopName"));
					CustomerOrder.setDishName(resultSet.getString("dishName"));
					CustomerOrder.setQuantity(resultSet.getInt("quantity"));
					CustomerOrder.setTotalPrice(Double.parseDouble(resultSet.getString("totalPrice")));
					CustomerOrder.setDealTime(resultSet.getString("dealTime"));
					CustomerOrder.setState(resultSet.getInt("historyorders.state"));

					System.out.println(CustomerOrder.toString());

					CustomerOrders.add(CustomerOrder);
					flag = true;
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("-----------------------------get customer orders----------------");
		System.out.println();

		return flag;
	}

	/**
	 * 用户修改信息
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void modifyInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println();
		System.out.println("-----------------------------customer modify info----------------");

		if (!LoginState) {
			request.getRequestDispatcher("HomeServlet?method=showShops").forward(request, response);
			return;
		}

		String customerID = null;
		String customerName = null;
		String customerPassword = null;
		String customerTel = null;
		String customerAddress = null;
		String securityQuestion = null;
		String securityAnswer = null;

		if (ServletFileUpload.isMultipartContent(request)) {

			String savePath = "image/";
			System.out.println("savePath=" + savePath);

			File saveDir = new File(savePath);

			// 如果目录不存在，就创建目录
			if (!saveDir.exists()) {
				saveDir.mkdir();
			}

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
					case "customerID":

						customerID = value;
						break;
					case "customerName":
						customerName = value;
						break;
					case "customerPassword":
						customerPassword = value;
						break;
					case "customerTel":
						customerTel = value;
						break;
					case "customerAddress":
						customerAddress = value;
						break;
					case "securityQuestion":
						securityQuestion = value;
					case "securityAnswer":
						securityAnswer = value;
						break;
					default:
						break;
					}

				}

			}
			double randomNum = Math.random();
			String customerPhoto = "image/" + customerID + "_" + randomNum + ".jpg";

			String savePath2 = getServletContext().getRealPath("");
			System.out.println("path2=" + savePath2);

			String sql = null;

			System.out.println(sql);
			if (a.getSize() != 0) {
				File file = new File(savePath2, customerPhoto);
				a.write(file);
				if (customerPassword.equals("")) {
					sql = "update customer set customerName='" + customerName + "',customerTel='" + customerTel
							+ "',customerAddress='" + customerAddress + "',securityQuestion='" + securityQuestion
							+ "',securityAnswer='" + securityAnswer + "',customerPhoto='" + customerPhoto
							+ "'where customerID='" + customerID + "'";
				} else {
					sql = "update customer set customerName='" + customerName + "',customerPassword='"
							+ MD5.GetMD5Code(customerPassword) + "',customerTel='" + customerTel + "',customerAddress='"
							+ customerAddress + "',securityQuestion='" + securityQuestion + "',securityAnswer='"
							+ securityAnswer + "',customerPhoto='" + customerPhoto + "'where customerID='" + customerID
							+ "'";
				}

			}

			else {
				if (customerPassword.equals("")) {
					sql = "update customer set customerName='" + customerName + "',customerTel='" + customerTel
							+ "',customerAddress='" + customerAddress + "',securityQuestion='" + securityQuestion
							+ "',securityAnswer='" + securityAnswer + "'where customerID='" + customerID + "'";
				} else {
					sql = "update customer set customerName='" + customerName + "',customerPassword='"
							+ MD5.GetMD5Code(customerPassword) + "',customerTel='" + customerTel + "',customerAddress='"
							+ customerAddress + "',securityQuestion='" + securityQuestion + "',securityAnswer='"
							+ securityAnswer + "'where customerID='" + customerID + "'";
				}
			}
			try {
				statement.execute(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		System.out.println("-----------------------------customer modify info----------------");
		System.out.println();

		getInfo(customerID);
		request.getSession().setAttribute("user", Customer);
		request.getRequestDispatcher("用户资料修改.jsp").forward(request, response);
	}

}
