<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>开店</title>
<link rel="shortcut icon" href="image/logo.ico">
<link
	href="https://static11.elemecdn.com/eleme/desktop/vendor.cba496.css"
	rel="stylesheet">
<link
	href="https://static11.elemecdn.com/eleme/desktop/profile.7433e7.css"
	rel="stylesheet">
<link
	href="https://static11.elemecdn.com/eleme/desktop/vendor.cba496.css"
	rel="stylesheet">
<link href="https://static11.elemecdn.com/eleme/desktop/main.e85910.css"
	rel="stylesheet">
<base href=".">
</head>

<body style="position: relative;">
	<script>
		window.onload = function check() {
			if ('${openshop}' == "fail") {
				alert("该手机号开过店啦！");
				window.location.href = "店家店铺中心.jsp";
			}
		}
	</script>
	<div class="ng-isolate-scope">
		<div class="ng-scope ng-isolate-scope">
			<header class="topbar  shoptopbar">
				<div class="container clearfix">
					<h1>
						<a class="topbar-logo"> <span></span></a>
					</h1>
					<nav class="topbar-nav">
						<div>
							<div class="topbar-profilebox">
								<span class="topbar-profilebox-wrapper"> <span
									class="topbar-profilebox-username ng-binding">欢迎开店</span></span>
							</div>
						</div>
					</nav>
				</div>
			</header>
			<div style="height: 50px;"></div>
		</div>
	</div>
	<div class="importantnotification container" role="banner"></div>
	<div role="main" class="ng-scope">
		<div class="profile-container container">
			<div class="clearfix">
				<div class="location" style="visibility: hidden;">
					<span></span> <span class="location-current"> </span>
				</div>
				<div></div>
			</div>
			<div class="profile-panel" role="main">
				<h3 class="profile-paneltitle ng-scope">
					<span class="ng-binding">开店 </span> <span
						class="subtitle ng-binding"></span>
				</h3>
				<div class="profile-panelcontent">
					<form class="changepwd ng-scope ng-pristine ng-valid"
						action="SellerServlet?method=openShop" method="post">
						<p class="changepwd-tip">亲爱的店家，欢迎开店！</p>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">店铺名：</label> <input name="shopName"
								placeholder="请输入店铺的名字" required="required">
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">店铺电话：</label> <input name="shopID"
								placeholder="请输入店铺联系电话" required="required" maxlength="11">
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">店铺类型：</label>
							<div class="excavator-sort">
								<div class="excavator-sort-item">
									<a href="JavaScript:"> <span class="ng-binding" id="type">想卖什么</span>
										<input type="hidden" name="shopType" value="主食"> <i
										class="icon-arrow-down"></i> <i class="icon-arrow-up"></i>
									</a>
									<div class="excavator-sort-dropdown">
										<a href="JavaScript:staple();">主食</a> <a
											href="JavaScript:snack();">小吃</a> <a
											href="JavaScript:drink()">饮料</a>
									</div>
									<script type="text/javascript">
										function staple() {
											document.getElementById('type').innerHTML = '主食';
											document.all.shopType.value = "主食";
										}
										function snack() {
											document.getElementById('type').innerHTML = "小吃";
											document.all.shopType.value = "小吃";
										}
										function drink() {
											document.getElementById('type').innerHTML = "饮料";
											document.all.shopType.value = "饮料";
										}
									</script>

								</div>
							</div>
						</div>

						<div class="formfield ng-isolate-scope" label="格式对齐"></div>


						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">介绍：</label>
							<textarea name="shopIntroduction" rows="6" cols="40"
								required="required"></textarea>
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">店铺实际地址：</label>
							<textarea name="shopAddress" rows="3" cols="40"
								required="required"></textarea>
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">是否有营业执照：</label>
							<div class="excavator-sort">
								<div class="excavator-sort-item">
									<a href="JavaScript:"> <span class="ng-binding"
										id="license">有木有？</span> <input type="hidden"
										name="shopLicense" value="否"> <i
										class="icon-arrow-down"></i> <i class="icon-arrow-up"></i>
									</a>
									<div class="excavator-sort-dropdown">
										<a href="JavaScript:ido();">我有滴</a> <a
											href="JavaScript:idont();">啊，我没有</a>
									</div>
									<script type="text/javascript">
										function ido() {
											document.getElementById('license').innerHTML = '我有滴';
											document.all.shopLicense.value = "是";
										}
										function idont() {
											document.getElementById('license').innerHTML = "啊，我没有";
											document.all.shopLicense.value = "否";
										}
									</script>

								</div>
							</div>
						</div>

						<div class="formfield ng-isolate-scope" label="格式对齐"></div>

						<div class="form-group formfield ng-isolate-scope">
							<label class="ng-binding"></label>
							<button type="submit" onclick="openShop();"
								class="btn-primary btn-lg ng-scope">提交</button>
							<script>
								function openShop() {
									if (document.all.shopName.value == '') {
										alert("请填写店铺名字");
										document.all.shopName.focus();
										return false;
									}
									if (document.all.shopID.value == '') {
										alert("请填写店铺联系电话");
										document.all.shopID.focus();
										return false;
									}
									if (!(/^1[3|4|5|7|8]\d{9}$/
											.test(document.all.shopID.value))) {
										alert("手机号码有误，请重填");
										document.all.shopID.focus();
										return false;
									}
									if (document.all.shopAddress.value == '') {
										alert("请填写地址");
										document.all.shopAddress.focus();
										return false;
									}
								}
							</script>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer" role="contentinfo"></footer>
</body>

</html>