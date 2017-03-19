package com.xmu.darksky.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xmu.darksky.domain.Customer;
import com.xmu.darksky.domain.Order;
import com.xmu.darksky.service.ConnectDB;
import com.xmu.darksky.service.MD5;


/**
 * 对客户、订单的表单数据进行处理的相关操作
 */
public class CusServlet extends ConnectDB {
	
	public CusServlet() {
		super();
	}

	/**
	 * 显示客户信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showCustomers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("showCustomers");
		
		//登陆验证
		if(!checkLogin(request)){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		
		ArrayList<Customer> customerList = new ArrayList<Customer>();
		int num = 0;

		// 获取用户信息
		String sql = "select * from customer";
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				Customer customer = new Customer();
				customer.setCusId(resultSet.getString("customerID"));
				customer.setCusName(resultSet.getString("customerName"));
				customer.setCusTele(resultSet.getString("customerTel"));
				customer.setCusAddr(resultSet.getString("customerAddress"));
				customer.setCusSQuestion(resultSet.getString("securityQuestion"));
				customer.setCusSAnswer(resultSet.getString("securityAnswer"));
				customer.setCusBalance(resultSet.getString("customerMoney"));
				customerList.add(customer);
			}

			// this.closeConnect();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 获取用户数量
		String sql1 = "select count(*) from customer";
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql1);
			if (resultSet.next())
				num = resultSet.getInt(1);
			System.out.println(num);
			// this.closeConnect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("customerList", customerList);
		request.setAttribute("cusNum", num);
		request.getRequestDispatcher("admin-editUser.jsp").forward(request, response);
	}

	/**
	 * 显示订单信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showOrders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		//登陆验证
		if(!checkLogin(request)){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		
		int orderNum = 0;
		ArrayList<Order> orderList = new ArrayList<Order>();
		String sql = "select shopName,customerName,dishName,quantity,totalPrice,dishType,dealTime from shop,customer,historyorders,dishinfo where historyorders.shopID = shop.shopID and historyorders.customerID = customer.customerID and historyorders.dishID = dishinfo.dishID";
		if (request.getAttribute("sql") != null && !request.getAttribute("sql").toString().equals("")) {
			sql = request.getAttribute("sql").toString();
			request.removeAttribute("sql");
		}
		System.out.println(sql);
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				Order order = new Order();
				order.setShopName(resultSet.getString("shopName"));
				order.setCustomerName(resultSet.getString("customerName"));
				order.setDishName(resultSet.getString("dishName"));
				order.setQuantity(resultSet.getString("quantity"));
				order.setTotalPrice(resultSet.getString("totalPrice"));
				order.setDishType(resultSet.getString("dishType"));
				order.setDealTime(resultSet.getString("dealTime"));
				orderList.add(order);
			}

			// this.closeConnect();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 获取订单数量
		String sql1 = "select count(*) from historyorders";
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql1);
			if (resultSet.next())
				orderNum = resultSet.getInt(1);
			System.out.println(orderNum);
			// this.closeConnect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("orderList", orderList);
		request.setAttribute("orderNum", orderNum);
		request.getRequestDispatcher("admin-showOrders.jsp").forward(request, response);

	}

	/**
	 * 订单查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void searchOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//登陆验证
		if(!checkLogin(request)){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		
		String type = request.getParameter("type");
		String keywords = request.getParameter("keywords");
		System.out.println(type + "  " + keywords);
		String sql = "";
		if (type.equals("全部"))
			sql = "select shopName,customerName,dishName,quantity,totalPrice,dishType,dealTime from shop,customer,historyorders,dishinfo where historyorders.shopID = shop.shopID and historyorders.customerID = customer.customerID and historyorders.dishID = dishinfo.dishID and dishName like '%"
					+ keywords + "%'";
		else if (!type.equals("全部"))
			sql = "select shopName,customerName,dishName,quantity,totalPrice,dishType,dealTime from shop,customer,historyorders,dishinfo where historyorders.shopID = shop.shopID and historyorders.customerID = customer.customerID and historyorders.dishID = dishinfo.dishID and dishType = '"
					+ type + "' and dishName like '%" + keywords + "%'";
		else
			System.out.println("判断失败");
		request.setAttribute("sql", sql);
		request.setAttribute("type", type);
		request.setAttribute("keywords", keywords);
		request.getRequestDispatcher("CusServlet?method=showOrders").forward(request, response);

	}

	/**
	 * 删除用户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "delete from customer where customerID=" + id;
		boolean Bdelete = false;
		try {
			statement.execute(sql);
			Bdelete = true;
		} catch (SQLException e) {
			System.out.println(e.toString());
		}

		System.out.println(sql);
		System.out.println(id);
		if (Bdelete) {
			System.out.println("删除成功");
			request.setAttribute("delState", true);
		} else {
			System.out.println("删除失败");
			request.setAttribute("delState", false);
		}

		request.getRequestDispatcher("CusServlet?method=showCustomers").forward(request, response);
	}

	/**
	 * 添加用户
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//登陆验证
		if(!checkLogin(request)){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		
		boolean BInsert = true;

		String customerName = request.getParameter("user");
		String customerTel = request.getParameter("tele");
		String customerPassword = request.getParameter("pwd");
		String customerAddr = request.getParameter("addr");
		String customerQues = request.getParameter("sQuestion");
		String customerAns = request.getParameter("sAnswer");

		String sql = "insert into customer(`customerID`, `customerName`, `customerPassword`, `customerTel`, `customerAddress`, `securityQuestion`, `securityAnswer`, `customerMoney`) values('" + customerTel + "','" + customerName + "','"
				+ MD5.GetMD5Code(customerPassword) + "','" + customerTel + "','" + customerAddr + "','" + customerQues
				+ "','" + customerAns + "','0')";
		System.out.println(sql);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			System.out.println("添加失败");
			BInsert = false;
		}
		if (BInsert)
			request.setAttribute("addCusState", true);
		else
			request.setAttribute("addCusState", false);
		request.getRequestDispatcher("admin-addUser.jsp").forward(request, response);
	}

	/**
	 * 修改用户信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void editCustomer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customerId = request.getParameter("cusId");
		String selectSql = "select * from customer where customerID = '" + customerId + "'";
		System.out.println(selectSql);
		Customer customer = new Customer();
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(selectSql);
			if (resultSet.next()) {
				customer.setCusId(resultSet.getString("customerID"));
				customer.setCusName(resultSet.getString("customerName"));
				// customer.setCusPwd(resultSet.getString("customerPassword"));
				customer.setCusTele(resultSet.getString("customerTel"));
				customer.setCusAddr(resultSet.getString("customerAddress"));
				customer.setCusSQuestion(resultSet.getString("SecurityQuestion"));
				customer.setCusSAnswer(resultSet.getString("SecurityAnswer"));
				System.out.println(customer.toString());
			}
		} catch (SQLException e) {
			System.out.println("查询失败");
		}
		request.setAttribute("customer", customer);
		request.getRequestDispatcher("admin-editExistUser.jsp").forward(request, response);
	}

	/**
	 * 提交修改
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void editCommit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean BInsert = true;
		String sql = "";
		String customerId = request.getParameter("customerId");
		String customerName = request.getParameter("user");
		String customerTel = request.getParameter("tele");
		String pwdReset = request.getParameter("pwdReset");
		String customerAddr = request.getParameter("addr");

		System.out.println(pwdReset);

		if (pwdReset.equals("yes"))
			sql = "update customer set customerName=" + "'" + customerName + "', customerPassword='"
					+ MD5.GetMD5Code("123456") + "',customerTel='" + customerTel + "',customerAddress='" + customerAddr
					+  "'where customerID='"
					+ customerId + "'";
		else
			sql = "update customer set customerName=" + "'" + customerName + "',customerTel='" + customerTel
					+ "',customerAddress='" + customerAddr + "'where customerID='" + customerId + "'";

		System.out.println(sql);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			System.out.println("提交失败");
			BInsert = false;
		}
		if (BInsert)
			request.setAttribute("editCusState", true);
		else
			request.setAttribute("editCusState", false);
		request.getRequestDispatcher("CusServlet?method=showCustomers").forward(request, response);
	}

	/**
	 * 登陆验证
	 * @param request
	 * @return
	 */
	public boolean checkLogin(HttpServletRequest request) {
		if (request.getSession().getAttribute("username") == null) {
			System.out.println("未登录");
			request.setAttribute("loginState",false);
			return false;
		} else {
			String username = request.getSession().getAttribute("username").toString();
			System.out.println("已登录");
			System.out.println(username);
			request.setAttribute("loginState",true);
			return true;
		}
	}
}
