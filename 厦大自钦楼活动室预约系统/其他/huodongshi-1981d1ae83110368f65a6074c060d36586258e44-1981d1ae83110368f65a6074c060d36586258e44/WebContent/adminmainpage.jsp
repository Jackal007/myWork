<%@page import="com.xmu.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<%
		String username = request.getParameter("username");	
		
		String institution_name = AdminDao.getInstitutionName(username);
	%>
		<div class="header">
			<div class="headerbar">
				<!--顶部左侧的logo-->
				<div class="logo">
					<img src="image/logo.png"/>
				</div>
				<div class="welcome">您好，尊敬的<%=institution_name %>老师</div>
			</div>
		</div>
		<div class="wrapper">
			<div class="maincontainer">
				<div class="leftnav">
					<ul>
					  <li class="active"><a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseOne">审核管理</a></li>
				   	  <div id="collapseOne" class="panel-collapse collapse">
						  <li class="second"><a href="#">未审核</a></li>
						  <li class="second"><a href="#">已审核</a></li>
					  </div>
					  <li><a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseTwo">用户管理</a></li>
				   		<div id="collapseTwo" class="panel-collapse collapse">
						  <li class="second"><a href="#">用户列表</a></li>
						  <li class="second"><a href="#">增加用户</a></li>
					  </div>
					  <li><a href="adminwelcome.jsp">管理活动室</a></li>
					  <li><a href="#">预约活动室</a></li>
					</ul>
				</div>
				<div class="rightcontainer">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>活动室名</th>
								<th>申请单位</th>
								<th>使用时间</th>
								<th>经办人</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>研讨二</td>
								<td>软件学院</td>
								<td>2017.3.14</td>
								<td>林春枫</td>
								<td>
									<button type="submit" class="btn btn-default btn-xs">查看</button>
								</td>
							</tr>
							<tr>
								<td>研讨二</td>
								<td>软件学院</td>
								<td>2017.3.14</td>
								<td>林春枫</td>
								<td>
									<button type="submit" class="btn btn-default btn-xs">查看</button>
								</td>
							</tr>
							<tr>
								<td>研讨二</td>
								<td>软件学院</td>
								<td>2017.3.14</td>
								<td>林春枫</td>
								<td>
									<button type="submit" class="btn btn-default btn-xs">查看</button>
								</td>
							</tr>
						</tbody>
					</table>
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
		$(function(){
			test();
		});
	</script>
	</html>