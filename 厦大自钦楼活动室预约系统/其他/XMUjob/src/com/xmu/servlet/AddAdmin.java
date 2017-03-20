package com.xmu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xmu.dao.AdminDao;

/**
 * Servlet implementation class AddAdmin
 */
@WebServlet("/AddAdmin")
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdmin() {
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
		request.setCharacterEncoding("UTF-8");
		String institution_id = request.getParameter("instituiton_id");
		String real_name = request.getParameter("real_name");
		String user_name = request.getParameter("username");
		String password = request.getParameter("password");
		String phone_number = request.getParameter("phonenumber");
		System.out.println(institution_id+" "+real_name+" "+user_name+" "+password+" "+phone_number);
		
		if(AdminDao.IsExist(user_name) == 1){
			//存在同样用户名，报错
			response.sendRedirect("add_admin.jsp?error=yes");
		}else{
			//添加单位
			AdminDao.AddAdmin(user_name, password, institution_id, real_name, phone_number);
			request.getRequestDispatcher("admin_list.jsp").forward(request, response);
		}

	}

}
