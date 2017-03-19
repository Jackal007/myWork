<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${user.sellerName}</title>
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
	<script type="text/javascript">
		window.onload = function removeElement() {
			var div1 = document.getElementById("hideOrNot");
			var div2 = document.getElementById("hideDingDan");
			var div3 = document.getElementById("hideZiLiao");
			var div4 = document.getElementById("hideBianJi");
			var modify = document.getElementById("Modify");
			div1.style.display = "none";
			div2.style.display = "none";
			div3.style.display = "none";
			div4.style.display = "none";
			if ('${sellerShop}' == "0") {
				alert("您的店还未审核，可以过些时间过来看下是否审核通过");
			} else if ('${sellerShop}' == "2") {
				alert("您的店未通过审核");
			} else if ('${sellerShop}' == "1") {
				/*alert("您的店已经 通过审核啦");*/
				div1.style.display = "block";
				div2.style.display = "block";
				div3.style.display = "block";
				div4.style.display = "block";
				modify.innerHTML = "查看店铺";
				modify.href = "javascript:alert('功能正在实现中');";
			} else {
				alert("您还未开店，也许你可以点击开店按钮来开一家店啊");
			}
		}
	</script>
	<div class="ng-isolate-scope">
		<div class="ng-scope ng-isolate-scope">
			<header class="topbar shoptopbar">
				<div class="container clearfix">
					<h1>
						<a class="topbar-logo"> <span>${user.sellerName}</span></a>
					</h1>
					<a href="SellerServlet?method=sellerHome&sellerID=${user.sellerID}"
						class="topbar-item">店铺中心</a>
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
	<div class="importantnotification container" role="banner"></div>

	<div role="main" class="ng-scope">
		<div class="profile profile-container container">
			<div class="clearfix">
				<div class="location" style="visibility: hidden;">
					<span></span> <span class="location-current"> </span>
				</div>
				<div></div>
			</div>
			<ul class="profile-sidebar" role="navigation">
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle active">
						<a
							href="SellerServlet?method=sellerHome&sellerID=${user.sellerID}"><i
							class="icon-line-home"></i>店家中心</a>
					</h2>
				</li>
				<li class="profile-sidebar-section" id="hideZiLiao">
					<h2 class="profile-sidebar-sectiontitle">
						<a href="SellerServlet?method=sellerShop"><i class="icon-line-order"></i>店铺资料</a>
					</h2>
				</li>
				<li class="profile-sidebar-section" id="hideDingDan">
					<h2 class="profile-sidebar-sectiontitle">
						<a
							href="SellerServlet?method=sellerOrder&sellerID=${user.sellerID}"><i
							class="icon-yen"></i>订单处理</a>
					</h2>
				</li>
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle" id="hideBianJi">
						<a
							href="SellerServlet?method=sellerDish&sellerID=${user.sellerID}"><i
							class="icon-order-favor"></i>食品编辑</a>
					</h2>
				</li>
			</ul>
			<div class="profile-panel">
				<div class="profile-panelcontent">
					<div class="profile-info ng-scope">
						<div class="profile-infoitem">
							<div class="profile-avatarwrap">
								<img class="profile-avatar" src="${shop.shopPhoto }"> <a
									href="店铺资料修改.jsp" class="profile-edit">编辑资料</a>
							</div>
							<div class="profile-perosondata">
								<h3 class="profile-name ng-binding">
									你好，<strong class="ng-binding">${user.sellerName}</strong>
								</h3>
								<p class="profile-tips ng-binding">登录ID:${user.sellerID}</p>
								<p class="profile-tips ng-binding">店铺电话:${shop.shopTel}</p>
								<p class="profile-tips ng-binding">店铺地址:${shop.shopAddress}</p>
							</div>
						</div>
						<div class="profile-infoitem">
							<a class="inherit" href=""></a>
							<p>商家收入</p>
							<p class="profile-infoitem-number balance">
								<span class="number ng-binding">好多</span>元
							</p>
							<a class="profile-btn" href="我要开店.jsp" id="Modify">我要开店</a>
						</div>

					</div>
					<div class="profile-order ng-scope" style="height: 500px;"
						id="hideOrNot">
						<div class="tabnavigation">
							<a class="tabnavigation-navitem active">编辑信息</a>
						</div>
						<div class="profile-order-content">
							<div class="profile-panelcontent">

								<form class="changepwd ng-scope ng-pristine ng-valid"
									action="SellerServlet?method=modifySellerInfo" method="post">

									<div class="formfield ng-isolate-scope">
										<label class="ng-binding">店家名：</label> <input
											name="sellerName" placeholder="${user.sellerName}"
											value="${user.sellerName}">
									</div>

									<div class="formfield ng-isolate-scope">
										<label class="ng-binding">店家电话：</label> <input
											name="sellerTel" placeholder="${user.sellerTel}"
											value="${user.sellerTel}">
									</div>

									<div class="formfield ng-isolate-scope">
										<label class="ng-binding">店家登录密码：</label> <input type="password"
											name="sellerPassword" placeholder="在此输入新密码">
									</div>

									<div class="formfield ng-isolate-scope">
										<label class="ng-binding">密保问题：</label> <input
											name="securityQuestion"
											placeholder="${user.securityQuestion}"
											value="${user.securityQuestion}">
									</div>

									<div class="formfield ng-isolate-scope">
										<label class="ng-binding">密保回答：</label> <input
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
			</div>
		</div>
	</div>
	<footer class="footer" role="contentinfo"> </footer>


</body>
</html>