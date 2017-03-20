package com.xmu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xmu.dao.InstitutionDao;

/**
 * Servlet implementation class AddInstitution
 */
@WebServlet("/AddInstitution")
public class AddInstitution extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddInstitution() {
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
		String institution_name = request.getParameter("institution_name");
		
		System.out.println("要添加的单位名称："+institution_name);
		if(InstitutionDao.IsExist(institution_name) == 1){
			//存在同样名字的单位了，报错
			response.sendRedirect("add_institution.jsp?error=yes");
		}else{
			//添加单位
			InstitutionDao.AddInstitution(institution_name);
			request.getRequestDispatcher("institution_list.jsp").forward(request, response);
		}

	}

}
