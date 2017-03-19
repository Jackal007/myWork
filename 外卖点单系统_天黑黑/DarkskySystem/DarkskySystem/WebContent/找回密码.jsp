<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找回密码</title>
<link rel="shortcut icon" href="image/logo.ico">
<link rel="stylesheet" href="css/ucenter.css">
<link rel="stylesheet" href="css/login.css">
<script>
	(function() {
		seajs.config({
			alias : {
				'$' : 'jquery/jquery/1.9.1/jquery'
			}
		});
	})();
</script>
</head>



<body>
	<div id="header">
		<div class="header-layout">
			<h1 class="logo-title">
				<a href="HomeServlet?method=showShops"><img src="image/logo.ico"
					style="width: 50px; height: 50px; margin-top: -10px;"></a>
			</h1>
			<h2 class="logo-title">find psw</h2>
		</div>
	</div>



	<!--CBU-->
	<div id="content">
		<div class="content-layout">
			<div class="maincenter">
				<div class="maincenter-box">
				<div style="height:30px;"></div>
					<div class="index-tab-navs">
						<div class="navs-slider">请输入你需要找回登录密码的账户名</div>
					</div>

					<div class="desk-front sign-flow clearfix sign-flow-simple">
						<div class="view view-signin" data-za-module="SignInForm"
							style="display: block;">
							<form name="IDform" method="post">
								<div class="group-inputs">

									<div class="email input-wrapper">
										<input type="text" name="ID" placeholder="手机号"
											required="required" maxlength="11">
									</div>
								</div>

								<div style="height: 30px; margin-top: 10px;">
									<span style="width: 86%; display: inline-block;">消费者</span> <span>店家</span>
								</div>


								<input class="toggle" type="checkbox" name="seller" value="商家">
								<div class="button-wrapper command">
									<button class="sign-button submit" onclick="login()">下一步</button>
									<script>
										function login() {
											if (document.all.seller.checked) {
												document.all.IDform.action = "SellerServlet?method=testID";
											} else {
												document.all.IDform.action = "CustomerServlet?method=testID";
											}
											document.all.IDform.submit();
										}
									</script>
								</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>