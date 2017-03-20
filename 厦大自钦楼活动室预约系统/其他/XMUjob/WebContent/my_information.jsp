<%@page import="com.xmu.dao.InstitutionDao"%>
<%@page import="com.xmu.bean.Institution"%>
<%@page import="com.xmu.bean.Admin"%>
<%@page import="com.xmu.dao.AdminDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/framebase.css"/>
		<link rel="stylesheet" type="text/css" href="css/personpagebase.css"/>
		<link rel="stylesheet" type="text/css" href="css/appform.css"/>
				<script src="js/sweetalert.min.js"></script> 
    	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
	</head>
	<body>
	<%
		Admin myadmin = AdminDao.GetOneAdminByUsername(String.valueOf(session.getAttribute("username")));
	%>
		<form class="form-horizontal" role="form">
		  				<div class="form-group">
		    				<label for="name" class="col-sm-2 control-label">单位名称</label>
		    				<div class="col-sm-9">
		    					<input type="text" class="form-control" id="institution_name" name="institution_name" value="<%=myadmin.getInstitution_name() %>" readonly>
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="name" class="col-sm-2 control-label">真实姓名</label>
		    				<div class="col-sm-9">
		    					<input type="text" class="form-control" id="real_name" name="real_name" value="<%=myadmin.getReal_name() %>" readonly>
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="name" class="col-sm-2 control-label">用户名</label>
		    				<div class="col-sm-9">
		    					<input type="text" class="form-control" id="username" name="username" value="<%=myadmin.getAdmin_username() %>" readonly>
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="phonenumber" class="col-sm-2 control-label">联系电话</label>
		    				<div class="col-sm-9">
		    					<input type="text" class="form-control" id="phonenumber" name="phonenumber" value="<%=myadmin.getPhone_number() %>" readonly>
		    				</div>
		  				</div>
		  				
<!-- 		  				<button type="button" class="btn btn-default col-sm-2 col-sm-offset-9 btnlocation4" >修改信息</button> -->
					</form>
	</body>
	<script src="js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/main-moudle.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	</script>
</html>