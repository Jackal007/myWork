package com.xmu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xmu.dao.AdminDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String user_type = request.getParameter("optionsRadios");
		System.out.println(user_type);
		
		
		if(user_type.equals("user")){
			//用户登陆
			
		}else if(user_type.equals("admin")){
			//管理员登陆
			int result = AdminDao.IsLogin(username, password);
			if(result==0){
				//登陆失败  
				response.sendRedirect("mainpage.jsp?error=yes");
			}else{
				//登陆成功
				int id = AdminDao.GetIdByUsername(username);
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				if(id == 1){
					request.getRequestDispatcher("applyform.jsp").forward(request, response);
				}else{
					request.getRequestDispatcher("orderadminmainpage.jsp").forward(request, response);
				}
			}	
		}
	}

}
