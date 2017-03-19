package com.xmu.darksky.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.xmu.darksky.service.LoginService;
import com.xmu.darksky.serviceimpl.AdminLoginImpl;

/**
 * 
 * 登录服务，处理登录、验证、注销等操作
 * 
 */
public class LoginServlet extends BasicServlet {
	
	private LoginService loginService;
	
	/**
	 * 登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logIn(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		loginService = new AdminLoginImpl();
		String username = request.getParameter("username");
		String password = request.getParameter("password");	
		System.out.println(username+"	"+password);
		boolean flag=loginService.checkLogin(username, password);		
		if(flag){
			System.out.println("success");
			request.setAttribute("state", true);
			request.setAttribute("username", username);
			request.getSession().setAttribute("username", username); //保存登录用户名
			request.getRequestDispatcher("admin-welcome.jsp").forward(request, response);
		}else{
			System.out.println("fail");
			request.setAttribute("state", false);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	/**
	 * 注销
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logOut(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getSession().removeAttribute("username");
		request.setAttribute("logoutState", true);
		request.getRequestDispatcher("index.jsp").forward(request, response);	
	}
}
