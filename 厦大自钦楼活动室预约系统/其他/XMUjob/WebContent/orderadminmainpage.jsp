<%@page import="com.xmu.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>厦门大学学生活动中心活动室预约</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/base.css"/>
		<link rel="stylesheet" type="text/css" href="css/personpagebase.css"/>
	</head>
	<body>
	<script>
		var error = '<%=request.getParameter("error")%>' ;
		if(error == 'yes'){
			sweetAlert("error...","您要添加的单位已存在！","error");
		}
	</script>
	<%
		String username = request.getParameter("username");	
		
		String institution_name = AdminDao.getInstitutionName(username);
		String real_name = AdminDao.getRealName(username);
	%>
		<div class="header">
			<div class="headerbar">
				<!--顶部左侧的logo-->
				<div class="logo">
					<img src="image/logo.png"/>
				</div>
				<div class="welcome">您好，尊敬的<%=real_name %>老师</div>
			</div>
		</div>
		<div class="wrapper">
			<div class="maincontainer">
				<div class="leftnav">
					<ul>
					  <li class="active"><a href="#" id="choose3" name="my_information.jsp">个人中心</a></li>
					  <li><a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseOne">审核管理</a></li>
				   	  <div id="collapseOne" class="panel-collapse collapse">
						  <li class="second"><a href="#" id="choose1" name="adminpage1.jsp">未审核</a></li>
						  <li class="second"><a href="#" id="choose2" name="adminpage2.jsp">已审核</a></li>
					  </div>
					</ul>
				</div>
				<div class="rightcontainer">
					<iframe src="my_information.jsp" id="rightcontent" name="adminframe"></iframe>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		<div class="footer">
			<div class="copyright">COPYRIGHT © 厦门大学学生活动中心学生管理团队. ALL RIGHTS RESERVED.</div>
		</div>
	</body>
	<script src="js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/main-moudle.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		var count = 1; 
		$(function(){
			test();
		});
		$(function(){
			$("#choose1").click(function(){
				var name= $(this).attr("name");
  				$("#rightcontent").attr("src",name).ready();
  				/*$(this).attr("style","background:#2C6090;");
  				$(this).css("color","#FFF");*/
			})
			$("#choose2").click(function(){
				var name= $(this).attr("name");
  				$("#rightcontent").attr("src",name).ready();
  				/*$(this).attr("style","background:#2C6090;");
  				$(this).css("color","#FFF");*/
			})
			$("#choose3").click(function(){
				var name= $(this).attr("name");
  				$("#rightcontent").attr("src",name).ready();
			})
			$("#choose4").click(function(){
				var name= $(this).attr("name");
  				$("#rightcontent").attr("src",name).ready();
			})
			$("#choose5").click(function(){
				var name= $(this).attr("name");
  				$("#rightcontent").attr("src",name).ready();
			})
			$("#choose7").click(function(){
				var name= $(this).attr("name");
  				$("#rightcontent").attr("src",name).ready();
			})
			$("#choose8").click(function(){
				var name= $(this).attr("name");
  				$("#rightcontent").attr("src",name).ready();
			})
		})
	</script>
</html>