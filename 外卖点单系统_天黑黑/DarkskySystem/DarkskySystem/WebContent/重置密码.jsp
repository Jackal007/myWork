<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>重置密码</title>
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
			<h2 class="logo-title">new psw</h2>
		</div>
	</div>
	<div id="content">
		<div class="content-layout">
			<div class="maincenter">
				<div class="maincenter-box">
					<div class="maincenter-box-tip"></div>
					<div class="desk-front sign-flow clearfix sign-flow-simple">
						<div style="height: 30px;"></div>
						<div class="index-tab-navs">
							<div class="navs-slider">请输入新的密码</div>
						</div>
						<div class="view view-signin" data-za-module="SignInForm"
							style="display: block;">
							<form name="lgform" method="post">
								<div class="group-inputs">
									<div class="email input-wrapper">
										<input type="password" name="newPW" placeholder="新密码（至少6位）"
											minlength="6" maxlength="16" required="required">
									</div>
								</div>
								<div class="group-inputs">
									<div class="email input-wrapper">
										<input type="password" name="repeatPW" placeholder="在次输入密码"
											minlength="6" maxlength="16" required="required">
									</div>
								</div>


								<div class="button-wrapper command">
									<button class="sign-button submit" type="button"
										onclick="newP()">确定</button>
									<script>
										function newP() {
											if (document.all.newPW.value.length < 6) {
												alert("您输入的密码过短");
												document.all.newPW.focus();
												return false;
											}
											if (document.all.newPW.value != document.all.repeatPW.value) {
												alert("两次密码不一致");
												document.all.newPW.focus();
												return false;
											}
											if ('${iden}' == "s") {
												document.all.lgform.action = "SellerServlet?method=modifyPassword&ID=${sellerID}";
											} else {
												document.all.lgform.action = "CustomerServlet?method=modifyPassword&ID=${customerID}";
											}
											document.all.lgform.submit();
										}
									</script>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
</body>
</html>