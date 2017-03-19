package com.xmu.darksky.service;


public interface LoginService {
	/**
	 * 登录时，检验用户名，密码是否正确 
	 * @param username 用户名
	 * @param password 密码
	 * @return 是否成功登录
	 */
	public boolean checkLogin(String username,String password);
	
}
