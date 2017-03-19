<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注册失败/title>
<link rel="shortcut icon" href="image/logo.ico">
</head>
<body style="background-image: url(image/backGround.jpg);">
	<script type="text/javascript">
		window.onload = function() {
			alert("该用户已经注册过了哦");
			location.href = "注册.jsp";
		}
	</script>
</body>
</html>