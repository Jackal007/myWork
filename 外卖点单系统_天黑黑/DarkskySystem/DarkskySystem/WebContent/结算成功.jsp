<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>结算成功</title>
<link rel="shortcut icon" href="image/logo.ico">
</head>
<body style="background-image: url(image/backGround.jpg);">
	<script>
		window.onload = function() {
			alert("结算成功啦！");
			location.href = "HomeServlet?method=showShops";
		}
	</script>
</body>
</html>