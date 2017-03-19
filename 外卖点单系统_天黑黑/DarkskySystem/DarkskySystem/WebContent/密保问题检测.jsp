<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>密保问题检测</title>
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
			<h2 class="logo-title">Q&A</h2>
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
							<div class="navs-slider">请输入密保问题的答案</div>
						</div>
						<div class="view view-signin" data-za-module="SignInForm"
							style="display: block;">
							<form name="qaaform" action="" method="post">
								<div class="group-inputs">
									<div class="email input-wrapper">
										<input type="text" name="question" placeholder="密保问题"
											required="required" value='${question}'>
									</div>
								</div>
								<div class="group-inputs">
									<div class="email input-wrapper">
										<input type="text" name="answer" placeholder="密保答案"
											required="required">
									</div>
								</div>


								<div class="button-wrapper command">
									<button class="sign-button submit" type="button"
										onclick="login()">确定</button>
									<script>
										function login() {
											if ('${iden}' == "s") {
												document.all.qaaform.action = "SellerServlet?method=checkAnswer&ID=${sellerID}";
											} else {
												document.all.qaaform.action = "CustomerServlet?method=checkAnswer&ID=${customerID}";
											}
											document.all.qaaform.submit();
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