<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户注册</title>
<link rel="shortcut icon" href="image/logo.ico">
<link rel="stylesheet" href="css/signup.css">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/ucenter.css">
<script type="text/javascript" src="./css/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="./css/jquery-jtumbler-1.0.1.min.js"></script>
</head>
<body>
	<script>
		document.all.ID.focus();
	</script>
	<div id="header">
		<div class="header-layout">
			<a href="HomeServlet?method=showShops"><h1 class="logo-title">
					<img src="image/logo.ico"
						style="width: 50px; height: 50px; margin-top: -10px;">
				</h1></a>
			<h2 class="logo-title">SignUp</h2>
		</div>
	</div>

	<div style="height: 10px;"></div>
	<div class="index-main">
		<div class="index-main-body">

			<div class="desk-front sign-flow clearfix sign-flow-simple">

				<div class="index-tab-navs">
					<div class="navs-slider" data-active-index="0">
						<a href="注册.jsp" class="active" style="text-decoration: none;">注册</a>
						<a href="登录.jsp" style="text-decoration: none;">登录</a>
					</div>
				</div>



				<div class="view view-signup selected" style="display: block;">
					<form class="zu-side-login-box" action="" name="suform"
						method="post">
						<div class="group-inputs">

							<div class="name input-wrapper">
								<input type="text" name="Name" placeholder="姓名"
									required="required">
							</div>

							<div class="email input-wrapper">
								<input type="text" class="account" name="ID"
									placeholder="手机号（仅支持中国大陆）" required="required" maxlength="11"
									onkeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))">
							</div>

							<div class="input-wrapper">
								<input type="password" name="Password" placeholder="密码（不少于 6 位）"
									required="required" maxlength="16">
							</div>

							<div class="input-wrapper">
								<input type="password" name="confirmPassword"
									placeholder="再次输入密码" required="required" maxlength="16">
							</div>

						</div>

						<div style="height: 30px; margin-top: 10px;">
							<span style="width: 86%; display: inline-block;">消费者</span> <span>店家</span>
						</div>


						<input class="toggle" type="checkbox" name="seller" value="商家">


						<div class="button-wrapper">
							<button class="sign-button submit" type="button"
								onclick="signUp()">注册</button>
							<script>
								function signUp() {
									if (document.all.Name.value == '') {
										alert("请填写名字");
										document.all.Name.focus();
										return false;
									}
									if (document.all.ID.value == '') {
										alert("请填写手机");
										document.all.ID.focus();
										return false;
									}
									if (!(/^1[3|4|5|7|8]\d{9}$/
											.test(document.all.ID.value))) {
										alert("手机号码有误，请重填");
										document.all.ID.focus();
										return false;
									}
									if (document.all.Password.value == '') {
										alert("请填密码");
										document.all.Password.focus();
										return false;
									}
									if (document.all.Password.value.length < 6) {
										alert("您输入的密码过短");
										document.all.Password.focus();
										return false;
									}
									if (document.all.confirmPassword.value == '') {
										alert("请再次输入密码");
										document.all.confirmPassword.focus();
										return false;
									}

									var pwd = document.all.Password.value;
									var cpwd = document.all.confirmPassword.value;
									if (pwd != cpwd) {
										alert("两次输入的密码不一致");
										document.all.confimPassword.focus();
										return false;
									}
									alert("将采用您第本次注册的手机号码为以后的登录ID");
									if (document.all.seller.checked) {
										document.all.suform.action = "SellerServlet?method=signUp";
									} else {
										document.all.suform.action = "CustomerServlet?method=signUp";
									}
									document.all.suform.submit();

								}
							</script>
						</div>
					</form>

				</div>
</body>
</html>