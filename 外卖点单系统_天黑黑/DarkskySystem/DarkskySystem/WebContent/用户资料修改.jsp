<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import= "com.darksky.basic.MD5 "%>
<!DOCTYPE html>
<html class="ng-scope">
<head>
<meta charset="utf-8">
<title>个人资料修改</title>
<link rel="shortcut icon" href="image/logo.ico">
<link
	href="https://static11.elemecdn.com/eleme/desktop/vendor.cba496.css"
	rel="stylesheet">
<link
	href="https://static11.elemecdn.com/eleme/desktop/profile.7433e7.css"
	rel="stylesheet">
<base href=".">
</head>

<body style="position: relative;">
	<div class="ng-isolate-scope">
		<div class="ng-scope ng-isolate-scope">

			<header class="topbar shoptopbar" role="navigation">
				<div class="container clearfix">
					<h1>
						<a class="topbar-logo"> <span>${user.customerName}</span></a>
					</h1>
					<a href="HomeServlet?method=showShops" class="topbar-item topbar-homepage"><img src="image/logo.ico" style="width:30px;height:30px;">首页</a> <a
						href="CustomerServlet?method=customerHome&customerID=${user.customerID}"
						class="topbar-item">个人中心</a>
					<nav class="topbar-nav">
						<div>
							<div class="topbar-profilebox">
								<span class="topbar-profilebox-avatar icon-profile ng-hide"></span>
								<span class="ng-hide"></span> <span
									class="topbar-profilebox-wrapper"> <span
									class="topbar-profilebox-username ng-binding">${user.customerName}</span>
									<div class="dropbox topbar-profilebox-dropbox">
										<a class="" href="CustomerServlet?method=logOut">退出登录</a>
									</div>
								</span>
							</div>
						</div>
					</nav>
				</div>
			</header>

			<div style="height: 50px;"></div>
		</div>
	</div>
	<div class="importantnotification container"></div>
	<div class="ng-scope">
		<div class="profile-container container">
			<div class="clearfix">
				<div class="location" style="visibility: hidden;">
					<span></span> <span class="location-current"> </span>
				</div>
				<div></div>
			</div>
			<ul class="profile-sidebar">
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle">
						<a
							href="CustomerServlet?method=customerHome&customerID=${user.customerID}"><i
							class="icon-line-home"></i>个人中心</a>
					</h2>
				</li>
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle">
						<a
							href="CustomerServlet?method=customerOrder&customerID=${user.customerID}"><i
							class="icon-yen"></i>我的订单</a>
					</h2>
				</li>
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle active">
						<a href="用户资料修改.jsp"><i class="icon-line-profile"></i>我的资料</a>
					</h2>
				</li>
			</ul>
			<div class="profile-panel" role="main">
				<h3 class="profile-paneltitle ng-scope">
					<span class="ng-binding">资料修改 </span> <span
						class="subtitle ng-binding"></span>
				</h3>
				<div class="profile-panelcontent">
					<form class="changepwd ng-scope ng-pristine ng-valid"
						action="CustomerServlet?method=modifyInfo" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="customerID" value="${user.customerID}">
						<p class="changepwd-tip">你可以在这里修改个人资料</p>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">头像：</label> <input
								style="display: none" type="file" name="imgUpload"
								id="imgUpload" onchange='PreviewImage(this)' />
							<div id="imgPreview" style="position: relative; right: 0; top: 0"
								onclick="javascript:document.all.imgUpload.click();">
								<img alt="用户头像" src="${user.customerPhoto}" width="150"
									height="150">
							</div>
						</div>


						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">名字：</label> <input name="customerName"
								placeholder="${user.customerName}" value="${user.customerName}">
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">联系电话：</label> <input name="customerTel"
								placeholder="${user.customerTel}" value="${user.customerTel}">
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">密码：</label> <input type="password"
								name="customerPassword" placeholder="在此输入新密码" value="">
							<!-- <script type="text/javascript">
								function modifyP() {
									oldPassword = prompt('请输入原密码', '');
									if (oldPassword == '${user.customerPassword}') {
										newPassword = prompt('请输入新的密码',
												'${user.customerPassword}');
										if (newPassword.length < 6) {
											alert("密码长度至少为6位");
											return false;
										}
										document.all.customerPassword.value = newPassword;
									} else {
										alert("原密码错误");
									}
								}
							</script> -->
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">送餐地址：</label> <input
								name="customerAddress" placeholder="${user.customerAddress}"
								value="${user.customerAddress}">
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">密保问题：</label> <input
								name="securityQuestion" placeholder="${user.securityQuestion}"
								value="${user.securityQuestion}">
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">问题答案：</label> <input
								name="securityAnswer" placeholder="${user.securityAnswer}"
								value="${user.securityAnswer}">
						</div>


						<div class="form-group formfield ng-isolate-scope">
							<label class="ng-binding"></label>
							<button type="submit" class="btn-primary btn-lg ng-scope">确定</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		function PreviewImage(imgFile) {
			var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;
			if (!pattern.test(imgFile.value)) {
				alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");
				imgFile.focus();
			} else {
				var path;
				if (document.all)//IE 
				{
					imgFile.select();
					path = document.selection.createRange().text;
					document.getElementById("imgPreview").innerHTML = "";
					document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\""
							+ path + "\")";//使用滤镜效果 
				} else//FF 
				{
					path = URL.createObjectURL(imgFile.files[0]);
					document.getElementById("imgPreview").innerHTML = "<img src='"+path+"'height='250' width='250'"+"/>";
				}
			}
		}
	</script>
	<footer class="footer" role="contentinfo"> </footer>
</body>
</html>