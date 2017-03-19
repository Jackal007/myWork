package com.darksky.basic;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 基本的Servlet操作
 */

public abstract class BasicServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	public ServletReflection servletRef;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		servletRef = new ServletReflection(this, request.getParameter("method"));
		servletRef.invoke(request, response);
	}
}
