package com.darksky.basic;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 利用java反射机制 
 * 获取受请求的Servlet的某个方法，以及函数参数
 *  以供外部Servlet的调用 
 *  用以实现事件分发
 *  实现一个Servlet可以处理多个请求
 * 
 */
public class ServletReflection {
	
	private BasicServlet basicServlet;	//请求的Servlet
	private String methodName;			//请求的Servlet中指定的方法名
	
	public ServletReflection(BasicServlet basicServlet, String methodName) {
		super();
		this.basicServlet = basicServlet;
		this.methodName = methodName;
	}
	
	/**
	 * 转发页面请求
	 * 用以实现事件分发
	 * @param request
	 * @param response
	 */
	public void invoke(HttpServletRequest request, HttpServletResponse response) {
		// 获取用于请求的Servlet		
		
		Class servlet = basicServlet.getClass();
		try {
			// 构造该方法参数类型的Class对象数组
			Class[] parameters = new Class[] {
					Class.forName("javax.servlet.http.HttpServletRequest"),
					Class.forName("javax.servlet.http.HttpServletResponse") };
			// 获取Servlet中指定的方法
			Method invokeMethod = servlet.getMethod(methodName, parameters);
			//指定的Servlet对象调用由此 Method对象表示的底层方法
			invokeMethod.invoke(basicServlet,new Object[] { request, response });

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
			
		} catch (InvocationTargetException e) {
			e.printStackTrace();
			
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			
		}

	}
}
