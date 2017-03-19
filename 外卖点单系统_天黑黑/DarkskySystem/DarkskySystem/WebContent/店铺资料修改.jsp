<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">

<title>店铺资料修改</title>
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
	<script>
		window.onload = function removeElement() {
			document.all.sellerAddress.focus();
		}
	</script>
	<div class="ng-isolate-scope">
		<div class="ng-scope ng-isolate-scope">

			<header class="topbar shoptopbar" role="navigation">
				<div class="container clearfix">
					<h1>
						<a class="topbar-logo"> <span>${user.sellerName}</span></a>
					</h1>
					<a href="sellerServlet?method=sellerHome&sellerID=${user.sellerID}"
						class="topbar-item">店家中心</a>
					<nav class="topbar-nav">
						<div>
							<div class="topbar-profilebox">
								<span class="topbar-profilebox-avatar icon-profile ng-hide"></span>
								<span class="ng-hide"></span> <span
									class="topbar-profilebox-wrapper"> <span
									class="topbar-profilebox-username ng-binding">${user.sellerName}</span>
									<div class="dropbox topbar-profilebox-dropbox">
										<a class="" href="SellerServlet?method=logOut">退出登录</a>
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
			<ul class="profile-sidebar" role="navigation">
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle">
						<a
							href="SellerServlet?method=sellerHome&sellerID=${user.sellerID}"><i
							class="icon-line-home"></i>店家中心</a>
					</h2>
				</li>
				<li class="profile-sidebar-section" id="hideDingDan">
					<h2 class="profile-sidebar-sectiontitle  active">
						<a href="店铺资料修改.jsp"><i class="icon-line-order"></i>店铺资料</a>
					</h2>
				</li>
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle">
						<a
							href="SellerServlet?method=sellerOrder&sellerID=${user.sellerID}"><i
							class="icon-yen"></i>订单处理</a>
					</h2>
				</li>
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle">
						<a
							href="SellerServlet?method=sellerDish&sellerID=${user.sellerID}"><i
							class="icon-order-favor"></i>食品编辑</a>
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
						action="SellerServlet?method=modifyShopInfo" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="sellerID" value="${user.sellerID}">
						<p class="changepwd-tip">你可以在这里修改店铺资料</p>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">店铺图片：</label> <input
								style="display: none" type="file" name="imgUpload"
								id="imgUpload" onchange='PreviewImage(this)' />
							<div id="imgPreview" style="position: relative; right: 0; top: 0"
								onclick="javascript:document.all.imgUpload.click();">
								<img alt="店铺图片" src="${shop.shopPhoto}" width="90" height="90">
							</div>
						</div>


						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">店铺名：</label> <input name="shopName"
								placeholder="${shop.shopName}" value="${shop.shopName}">
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">店铺电话：</label> <input name="shopTel"
								placeholder="${shop.shopTel}" value="${shop.shopTel}">
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">店铺地址：</label>
							<textarea name="shopAddress" rows="3" cols="40">${shop.shopAddress}</textarea>
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">介绍：</label>
							<textarea name="shopIntroduction" rows="6" cols="40">${shop.shopIntroduction}</textarea>
						</div>

						<div class="formfield ng-isolate-scope">
							<label class="ng-binding">公告：</label>
							<textarea name="Notice" rows="3" cols="40">${shop.notice}</textarea>
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