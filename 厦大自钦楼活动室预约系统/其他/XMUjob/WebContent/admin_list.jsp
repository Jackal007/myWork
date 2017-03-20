<%@page import="com.xmu.dao.AdminDao"%>
<%@page import="com.xmu.bean.Admin"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/framebase.css"/>
		<link rel="stylesheet" type="text/css" href="css/personpagebase.css"/>
		<script src="js/sweetalert.min.js"></script> 
    	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
	</head>
	<body>
	<% 
		List<Admin> alladmins = AdminDao.GetAllAdmins();
		int size = alladmins.size();
		System.out.println("大小"+size);
	%>
	<script>
		var success = '<%=request.getParameter("success")%>' ;
		if(success == 'deletesuccess'){
			swal("成功！","确认删除成功！","success");
		}
	</script>
					<table class="table table-hover" id="tb">
						<thead>
							<tr>
								<th>单位名称</th>
								<th>真实姓名</th>
								<th>用户名</th>
								<th>密码</th>
								<th>联系电话</th>
								<th>删除操作</th>
								<th>修改操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="<%=alladmins %>" var="item" begin="1" end="<%=size %>" step="1">
							<tr>
								<td>${item.institution_name}</td>
								<td>${item.real_name}</td>
								<td>${item.admin_username}</td>
								<td>${item.admin_password}</td>
								<td>${item.phone_number}</td>
								<td>
									<button type="button" class="btn btn-default btn-xs" onclick="javascript:window.location.href='delete_admin.jsp?id=${item.admin_id}';">删除</button>
								</td>
								<td>
									<button type="button" class="btn btn-default btn-xs" onclick="javascript:window.location.href='modify_admin.jsp?id=${item.admin_id}';">修改</button>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
	</body>
	<script src="js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/main-moudle.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		function deleteRow(tableID, obj) {//参数为表格ID，触发对象  
    //获得触发对象的行号，parentElement的个数取决于触发对象为TR的第几级子项，input=>td=>tr，所以parentElement有两个  
    	var rowIndex = obj.parentElement.parentElement.rowIndex-1;  
    //var table = document.getElementById(tableID).deleteRow(rowIndex);  
    	obj.parentElement.parentElement.parentElement.deleteRow(rowIndex); //再简化：省略tableID参数  
		}
	</script>
</html>