package com.xmu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xmu.dao.InstitutionDao;

/**
 * Servlet implementation class ModifyInstitution
 */
@WebServlet("/ModifyInstitution")
public class ModifyInstitution extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyInstitution() {
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
		String new_institution_name = request.getParameter("institution_name");
		String institution_id = request.getParameter("institution_id");
		String old_institution_name = InstitutionDao.GetNameById(institution_id);
		
		System.out.println("要修改的单位名称："+old_institution_name);
		System.out.println("准备修改成："+new_institution_name);
		if(old_institution_name.equals(new_institution_name)){
			//与原来的单位名字相同，不同意修改
			response.sendRedirect("modify_institution.jsp?id="+institution_id+"&error=yes1");
		}else if(InstitutionDao.IsExist(new_institution_name) == 1){
			//存在同样名字的单位了，报错
			response.sendRedirect("modify_institution.jsp?id="+institution_id+"&error=yes");
		}else{
			//可以修改单位名称
			InstitutionDao.UpdateInstitution(institution_id, new_institution_name);
			response.sendRedirect("modify_institution.jsp?id="+institution_id+"&success=yes");
		}

	}

}
