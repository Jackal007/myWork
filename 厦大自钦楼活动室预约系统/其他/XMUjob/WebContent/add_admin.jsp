<%@page import="com.xmu.dao.InstitutionDao"%>
<%@page import="com.xmu.bean.Institution"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/framebase.css" />
<link rel="stylesheet" type="text/css" href="css/personpagebase.css" />
<link rel="stylesheet" type="text/css" href="css/appform.css" />
<script src="js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
</head>
<body>
	<%
		List<Institution> allInstitutions = InstitutionDao.GetInstitutions(); 
		int size = allInstitutions.size();
		System.out.println("大小"+size);
	%>
	<script>
		var error = '<%=request.getParameter("error")%>' ;
		if(error == 'yes'){
			sweetAlert("出错咯","您要添加的用户名已存在！","error");
		}
	</script>
	<form class="form-horizontal" role="form" id="add_admin_form"
		name="add_admin_form" method="post" onsubmit="return check()"
		action="./AddAdmin">
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">单位名称</label>
			<div class="col-sm-9">
				<select class="form-control" name="instituiton_id"
					id="instituiton_id">
					<option value="" selected>请选择申请单位</option>
					<c:forEach items="<%=allInstitutions %>" var="item" begin="1"
						end="<%=size %>" step="1">
						<option value="${item.institution_id}">${item.institution_name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<br>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">真实姓名</label>
			<div class="col-sm-9">
				<input type="text" class="form-control" id="real_name"
					name="real_name" placeholder="请输入真实姓名">
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-9">
				<input type="text" class="form-control" id="username"
					name="username" placeholder="请输入账号名">
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">密码</label>
			<div class="col-sm-9">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="请输入密码">
			</div>
		</div>
		<span class="help-block col-sm-offset-2">密码不少于6位</span>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">确认密码</label>
			<div class="col-sm-9">
				<input type="password" class="form-control" id="password_secend"
					name="password_secend" placeholder="请再次输入密码">
			</div>
		</div>
		<br>
		<div class="form-group">
			<label for="phonenumber" class="col-sm-2 control-label">联系电话</label>
			<div class="col-sm-9">
				<input type="text" class="form-control" id="phonenumber"
					name="phonenumber" placeholder="请输入联系电话">
			</div>
		</div>

		<button type="submit"
			class="btn btn-default col-sm-2 col-sm-offset-9 btnlocation4">增加管理员</button>
	</form>
</body>
<script>
	function check(){
		var instituiton_id = document.getElementById("instituiton_id").value;
		var real_name = document.getElementById("real_name").value;
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var password_secend = document.getElementById("password_secend").value;
		var phonenumber = document.getElementById("phonenumber").value;
		if(instituiton_id == ""){
			sweetAlert("出错咯","您需要选择一个单位名称！","error");
			return false;
		}
		if(real_name == ""){
			sweetAlert("出错咯","真实姓名不能为空！","error");
			return false;
		}
		if(username == ""){
			sweetAlert("出错咯","用户名不能为空！","error");
			return false;
		}
		if(password == ""){
			sweetAlert("出错咯","密码不能为空！","error");
			return false;
		}
		if(password.length <= 5){
			sweetAlert("出错咯","密码不可以少于6位数！","error");
			return false;
		}
		if(password_secend == ""){
			sweetAlert("出错咯","请再次输入密码！","error");
			return false;
		}
		if(phonenumber == ""){
			sweetAlert("出错咯","联系电话不能为空！","error");
			return false;
		}
		if(password != password_secend){
			sweetAlert("出错咯","两次输入的密码不一样！","error");
			return false;
		}
		return true;
	}
	</script>
<script src="js/jquery-3.1.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main-moudle.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	</script>
</html>