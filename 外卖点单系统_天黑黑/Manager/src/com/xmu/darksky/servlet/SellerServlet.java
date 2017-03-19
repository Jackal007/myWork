package com.xmu.darksky.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xmu.darksky.domain.Seller;
import com.xmu.darksky.domain.Shop;
import com.xmu.darksky.service.ConnectDB;
import com.xmu.darksky.service.MD5;

/**
 * 
 * 店家服务，处理商家的各种相关操作
 *
 */
public class SellerServlet extends ConnectDB {

	public SellerServlet() {
		super();
	}

	/**
	 * 显示店家信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showSellers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//登陆验证
		if(!checkLogin(request)){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}

		ArrayList<Seller> sellerList = new ArrayList<Seller>();
		String sql = "select * from seller";
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				Seller seller = new Seller();
				seller.setSellerId(resultSet.getString("sellerID"));
				seller.setSellerName(resultSet.getString("sellerName"));
				// seller.setSellerPwd(resultSet.getString("sellerPassword"));
				seller.setSellerTel(resultSet.getString("sellerTel"));
				seller.setSellerSQuestion(resultSet.getString("SecurityQuestion"));
				seller.setSellerSAnswer(resultSet.getString("SecurityAnswer"));
				seller.setShopId(resultSet.getString("shopID"));
				sellerList.add(seller);
			}

			// this.closeConnect();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int sellerNum = 0;
		String sql1 = "select count(*) from seller";
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql1);
			if (resultSet.next())
				sellerNum = resultSet.getInt(1);
			System.out.println(sellerNum);
			// this.closeConnect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("sellerList", sellerList);
		request.setAttribute("sellerNum", sellerNum);
		request.getRequestDispatcher("admin-editSeller.jsp").forward(request, response);
	}

	/**
	 * 删除店家
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delSeller(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "delete from seller where sellerID=" + id;
		boolean Bdelete = false;
		try {
			statement.execute(sql);
			Bdelete = true;
		} catch (SQLException e) {
			System.out.println(e.toString());
		}
		if (Bdelete) {
			System.out.println("删除成功");
			request.setAttribute("delState", true);
		} else {
			System.out.println("删除失败");
			request.setAttribute("delState", false);
		}

		request.getRequestDispatcher("SellerServlet?method=showSellers").forward(request, response);
	}

	/**
	 * 添加店家
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addSeller(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//登陆验证
		if(!checkLogin(request)){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		
		boolean BInsert = true;

		String sellerName = request.getParameter("seller");
		String sellerPassword = request.getParameter("pwd");
		String sellerTel = request.getParameter("tele");
		String sellerQues = request.getParameter("ques");
		String sellerAns = request.getParameter("ans");

		String sql = "insert into seller(sellerID,sellerName,sellerPassword,sellerTel,SecurityQuestion,SecurityAnswer) values('"
				+ sellerTel + "','" + sellerName + "','" + MD5.GetMD5Code(sellerPassword) + "','" + sellerTel + "','"
				+ sellerQues + "','" + sellerAns + "')";
		System.out.println(sql);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			System.out.println("添加失败");
			BInsert = false;
		}
		if (BInsert)
			request.setAttribute("addSellerState", true);
		else
			request.setAttribute("addSellerState", false);
		request.getRequestDispatcher("admin-addSeller.jsp").forward(request, response);
	}

	/**
	 * 显示店铺
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showShops(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//登陆验证
		if(!checkLogin(request)){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		
		System.out.println("showShops");
		ArrayList<Shop> shopList = new ArrayList<Shop>();
		String sql = "select * from shop";
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				Shop shop = new Shop();
				shop.setShopId(resultSet.getString("shopID"));
				shop.setShopName(resultSet.getString("shopName"));
				shop.setShopTel(resultSet.getString("shopTel"));
				shop.setMainType(resultSet.getString("shopType"));
				shop.setShopAddr(resultSet.getString("shopAddress"));
				shop.setShopLicense(resultSet.getString("shopLicense"));
				shop.setShopDesc(resultSet.getString("shopIntroduction"));
				shop.setShopNotice(resultSet.getString("notice"));
				int state = resultSet.getInt("state");
				if (state == 0)
					shop.setShopState("尚未审核");
				else if (state == 1)
					shop.setShopState("审核通过");
				else
					shop.setShopState("审核未通过");
				shopList.add(shop);
				System.out.println(shop.toString());
			}

			// this.closeConnect();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int shopNum = 0;
		String sql1 = "select count(*) from shop";
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql1);
			if (resultSet.next())
				shopNum = resultSet.getInt(1);
			System.out.println(shopNum);
			// this.closeConnect();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("shopList", shopList);
		request.setAttribute("shopNum", shopNum);
		request.getRequestDispatcher("admin-sellerCommit.jsp").forward(request, response);
	}

	/**
	 * 通过申请
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void applyPass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String shopId = request.getParameter("shopId");
		String sql = "update shop set state = 1 where shopID = '" + shopId + "'";
		System.out.println(sql);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			System.out.println("审核失败");
		}
		request.getRequestDispatcher("SellerServlet?method=showShops").forward(request, response);

	}

	/**
	 * 驳回申请
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void applyReject(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String shopId = request.getParameter("shopId");
		String sql = "update shop set state = 2 where shopID = '" + shopId + "'";
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			System.out.println("驳回失败");
		}
		request.getRequestDispatcher("SellerServlet?method=showShops").forward(request, response);

	}

	/**
	 * 修改商家信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void editSeller(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//登陆验证
		if(!checkLogin(request)){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}

		String sellerId = request.getParameter("sellerId");
		String selectSql = "select * from seller where sellerID = '" + sellerId + "'";
		System.out.println(selectSql);
		Seller seller = new Seller();
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(selectSql);
			if (resultSet.next()) {
				seller.setSellerId(resultSet.getString("sellerID"));
				seller.setSellerName(resultSet.getString("sellerName"));
				seller.setSellerTel(resultSet.getString("sellerTel"));
				seller.setSellerSQuestion(resultSet.getString("SecurityQuestion"));
				seller.setSellerSAnswer(resultSet.getString("SecurityAnswer"));
			}
		} catch (SQLException e) {
			System.out.println("查询失败");
		}
		request.setAttribute("seller", seller);
		request.getRequestDispatcher("admin-editExistSeller.jsp").forward(request, response);
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
		boolean BUpdate = true;
		String sql = "";
		System.out.println("提交修改");
		String sellerId = request.getParameter("sellerId");
		String sellerName = request.getParameter("seller");
		String sellerTel = request.getParameter("tele");
		String pwdReset = request.getParameter("pwdReset");
		if (pwdReset.equals("yes"))
			sql = "update seller set sellerName=" + "'" + sellerName + "', sellerPassword='" + MD5.GetMD5Code("123456")
					+ "', sellerTel='" + sellerTel + "'where sellerID='" + sellerId + "'";
		else
			sql = "update seller set sellerName=" + "'" + sellerName + "', sellerTel='" + sellerTel
					+  "'where sellerID='"
					+ sellerId + "'";

		System.out.println(sql);
		try {
			statement.execute(sql);
		} catch (SQLException e) {
			System.out.println("提交失败");
			BUpdate = false;
		}
		if (BUpdate)
			request.setAttribute("editSellerState", true);
		else
			request.setAttribute("editSellerState", false);
		request.getRequestDispatcher("SellerServlet?method=showSellers").forward(request, response);
	}

	/**
	 * 登陆验证
	 * @param request
	 * @return
	 */
	public boolean checkLogin(HttpServletRequest request) {
		if (request.getSession().getAttribute("username") == null) {
			System.out.println("未登录");
			request.setAttribute("loginState", false);
			return false;
		} else {
			String username = request.getSession().getAttribute("username").toString();
			System.out.println("已登录");
			System.out.println(username);
			request.setAttribute("loginState", true);
			return true;
		}
	}
}