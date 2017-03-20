package com.xmu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xmu.dao.AdminDao;

/**
 * Servlet implementation class ModifyAdmin
 */
@WebServlet("/ModifyAdmin")
public class ModifyAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyAdmin() {
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
		String admin_id = request.getParameter("admin_id");
		String institution_id = request.getParameter("institution_id");
		String real_name = request.getParameter("real_name");
		String user_name = request.getParameter("username");
		String password = request.getParameter("password");
		String phone_number = request.getParameter("phonenumber");
		System.out.println(institution_id+" "+real_name+" "+user_name+" "+password+" "+phone_number);
		
		//修改单位
		AdminDao.UpdateAdmin(admin_id, user_name, password, institution_id, real_name, phone_number);
		request.getRequestDispatcher("modify_admin.jsp?success=yes&id="+admin_id).forward(request, response);
	}

}
