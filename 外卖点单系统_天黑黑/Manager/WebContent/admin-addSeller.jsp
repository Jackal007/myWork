<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<h1 class="topbar-logo none">
					<a href="admin-index.jsp" class="navbar-brand">后台管理</a>
				</h1>
			</div>
		</div>
	</div>
	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
					<li><a href="#"><i class="icon-font"></i>用户管理</a>
						<ul class="sub-menu">
							<li><a href="CusServlet?method=showCustomers"><i
									class="icon-font"></i>查看/修改用户</a></li>
							<li><a href="admin-addUser.jsp"><i class="icon-font"></i>增加用户</a></li>
							<li><a href="CusServlet?method=showOrders"><i
									class="icon-font"></i>订单查询</a></li>
						</ul></li>
					<li><a href="#"><i class="icon-font"></i>商家管理</a>
						<ul class="sub-menu">
							<li><a href="SellerServlet?method=showSellers"><i
									class="icon-font"></i>查看/修改商家</a></li>
							<li><a href="admin-addSeller.jsp"><i class="icon-font"></i>添加商家</a></li>
							<li><a href="SellerServlet?method=showShops"><i
									class="icon-font"></i>商家审核</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--/sidebar-->
		<div class="main-wrap">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="admin-index.jsp">首页</a><span
						class="crumb-step">&gt;</span><a class="crumb-name"
						href="/jscss/admin/design/">添加商家</a>
						<div style="float:right;"> 
		       			<% 
						if(session.getAttribute("username")==null){
						   out.println("<a href='index.jsp'>未登录</a>");
						}else{
							String username = session.getAttribute("username").toString();
						   out.println("欢迎您，");
						   out.println(username);
						   out.println("<a href='LoginServlet?method=logOut'>注销</a>");
						}
						%>
						</div>
				</div>
			</div>
			<div class="result-wrap">
				<div class="result-content">
					<form action="SellerServlet?method=addSeller" method="post" onsubmit="return signUp();">
						<table class="insert-tab" width="100%">
							<tbody>
								<tr>
									<th width="120"><i class="require-red">*</i>商家账号：</th>
									<td><input class="common-text required"
										placeholder="请输入你的用户名" id="seller" name="seller" size="50"
										type="text" ></td>
								</tr>
								<tr>
									<th><i class="require-red">*</i>商家密码：</th>
									<td><input class="common-text required"
										placeholder="请输入你的密码" id="pwd" name="pwd" size="50"
										type="password"></td>
								</tr>
								<tr>
									<th><i class="require-red">*</i>确认密码：</th>
									<td><input class="common-text required"
										placeholder="请再次输入密码" id="cpwd" name="cpwd" size="50"
										type="password"/></td>
								</tr>
								<tr>
									<th width="120"><i class="require-red">*</i>联系电话：</th>
									<td><input class="common-text required"
										placeholder="请输入你的联系电话" id="tele" name="tele" size="50"
										type="text"></td>
								</tr>
								<tr>
									<th>密保问题：</th>
									<td><input class="common-text required"
										placeholder="请输入你的密保问题" id="ques" name="ques" size="50"
										type="text"></td>
								</tr>
								<tr>
									<th>密保答案：</th>
									<td><input class="common-text required"
										placeholder="请输入你的密保答案" id="ans" name="ans" size="50"
										type="text"></td>
								</tr>
								<tr>
									<th></th>
									<td><input class="btn btn-primary btn6 mr10" value="添加"
										type="submit"> <input
										class="btn btn6" value="重置" type="reset"></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>

		</div>
		<!--/main-->
	</div>
	<%
		if (request.getAttribute("addSellerState") != null
				&& request.getAttribute("addSellerState").toString().equals("true")) {
			request.removeAttribute("addSellerState");
			out.print("<script>alert('添加成功');</script>");
		} else if (request.getAttribute("addSellerState") != null) {
			request.removeAttribute("addSellerState");
			out.print("<script>alert('添加失败');</script>");
		}
	%>
	<script>
		function signUp() {
			if (document.all.seller.value == '') {
				alert("请填写用户名");
				return false;
			}
			if (document.all.pwd.value == '') {
				alert("请填写密码");
				document.all.pwd.focus();
				return false;
			}
			if (document.all.cpwd.value == '') {
				alert("请再次填写密码");
				document.all.cpwd.focus();
				return false;
			}
			var pwd = document.all.pwd.value;
			var cpwd = document.all.cpwd.value;
			if (pwd != cpwd) {
				alert("两次输入的密码不一致");
				document.all.cpwd.focus();
				return false;
			}
			if (document.all.tele.value == '') {
				alert("请填写手机号");
				document.all.tele.focus();
				return false;
			}
			alert("该用户将采用本次注册的手机号码为以后的登录ID");
		}
	</script>
</body>
</html>