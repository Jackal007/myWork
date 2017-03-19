<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/xgxt_login.css" />
<title>管理员登录系统</title>
</head>
<body>

<div id="header">
	<div class="header_title">
		<span class="title_con">天黑黑外卖网</span>
	</div>
</div>
<body bgcolor="#F0F0F0"></body>
<br><br>
<div id="content" >
<center>
		<div class="con">
		<div class="con_title">
			<span class="con_title_sp">管理员登录系统</span>
		</div>
		<form action="LoginServlet?method=logIn" method="post">
		<div>
			<table>
			<tr>
				<td><span class="con_input_span">用户名：</span></td>
				<td><input class="con_input" type="text" placeholder="账号" name="username"/></td>
			</tr>
			<tr>	
				<td><span class="con_input_span">密&nbsp;&nbsp;码：</span></td>
				<td><input class="con_input" type="password" placeholder="密码" name="password"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="登    录" class="submit-btn"/>
					&nbsp;&nbsp;&nbsp;
					<input type="reset" value="重    置" class="reset-btn"/>
				</td>
			</tr>
			</table>
		</div>
		</form>
	</div>
	</center>
</div>
<% 
	if(request.getAttribute("state")!=null && request.getAttribute("state").toString().equals("true")){
		request.removeAttribute("state");
	}
	else if(request.getAttribute("state")!=null && request.getAttribute("state").toString().equals("false")){
		request.removeAttribute("state");
		out.print("<script>alert('用户名或密码错误');</script>");
}%>
<% 
	if(request.getAttribute("loginState")!=null && request.getAttribute("loginState").toString().equals("false")){
		request.removeAttribute("loginState");
		out.print("<script>alert('请先完成登录！');</script>");
}%>
</body>
</html>
