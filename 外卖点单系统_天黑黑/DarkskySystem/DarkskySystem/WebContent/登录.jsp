<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<link rel="shortcut icon" href="image/logo.ico">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/ucenter.css">
<script type="text/javascript" src="./css/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="./css/jquery-jtumbler-1.0.1.min.js"></script>
</head>
<body>
	<script>
		window.onload = function() {
			document.all.ID.focus();
		}
	</script>

	<div id="header">
		<div class="header-layout">
			<h1 class="logo-title">
				<a href="HomeServlet?method=showShops"><img src="image/logo.ico"
					style="width: 50px; height: 50px; margin-top: -10px;"></a>
			</h1>
			<h2 class="logo-title">Login</h2>
		</div>
	</div>



	<div style="height: 30px;"></div>
	<div class="index-main">
		<div class="index-main-body">

			<div class="desk-front sign-flow clearfix sign-flow-simple">

				<div class="index-tab-navs">
					<div class="navs-slider">
						<a href="注册.jsp" style="text-decoration: none;">注册</a> <a
							href="登录.jsp" class="active" style="text-decoration: none;">登录</a>
					</div>
				</div>

				<div class="view view-signin" data-za-module="SignInForm"
					style="display: block;">
					<form name="lgform" action="" method="post">
						<div class="group-inputs">

							<div class="email input-wrapper">
								<input type="text" name="ID" placeholder="手机号"
									required="required" maxlength="11"
									onkeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))">
							</div>

							<div class="input-wrapper">
								<input type="password" name="Password" placeholder="密码"
									required="required" maxlength="16">
							</div>
						</div>

						<div style="height: 30px; margin-top: 10px;">
							<span style="width: 86%; display: inline-block;">消费者</span> <span>店家</span>
						</div>


						<input class="toggle" type="checkbox" name="seller" value="商家">


						<div class="button-wrapper command">
							<button class="sign-button submit" type="button"
								onclick="login();">登录</button>
							<script>
								function login() {
									if (document.all.ID.value == '') {
										alert("请填写手机");
										return false;
									}
									if (document.all.Password.value == '') {
										alert("请填密码");
										return false;
									}
									if (document.all.seller.checked) {
										document.all.lgform.action = "SellerServlet?method=logIn";
									} else {
										document.all.lgform.action = "CustomerServlet?method=logIn";
									}
									document.all.lgform.submit();
								}
							</script>
						</div>


						<div class="signin-misc-wrapper clearfix">
							<a class="unable-login" href="找回密码.jsp">无法登录?</a>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>