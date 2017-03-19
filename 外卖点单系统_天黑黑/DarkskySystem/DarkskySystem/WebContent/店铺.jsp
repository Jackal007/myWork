<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>店铺</title>
<link rel="shortcut icon" href="image/logo.ico">
<script data-require-id="swfobject" src="./js/shop.js"></script>
<link href="./css/shop.css" rel="stylesheet">
<base href=".">
</head>

<body class="hidesidebar" style="position: relative;">
	<script>
		window.onload = function removeElement() {
			var module1 = document.getElementById("module1");
			var module2 = document.getElementById("module2");
			module1.style.display = "block";
			module2.style.display = "none";
			if ('${user.customerName}' != "") {
				module1.style.display = "none";
				module2.style.display = "block";

			}
		}
	</script>
	<div class="ng-isolate-scope">
		<div class="ng-scope ng-isolate-scope">
			<header class="topbar shoptopbar" role="navigation">
				<div class="container clearfix">
					<h1>
						<a href="HomeServlet?method=showShops"> <span></span></a>
					</h1>
					<a href="HomeServlet?method=showShops"
						class="topbar-item topbar-homepage"><img src="image/logo.ico" style="width:30px;height:30px;">首页</a> <a
						href="CustomerServlet?method=customerHome&customerID=${customerID}"
						class="topbar-item">个人中心</a>

					<nav class="topbar-nav">

						<div>
							<div class="topbar-profilebox">
								<span id="module1" class="ng-hide"> <a target="_blank"
									href="登录.jsp">登录</a>/ <a target="_blank" href="注册.jsp">注册</a>
								</span> <span id="module2"
									class="topbar-profilebox-username ng-binding"><a
									href="CustomerServlet?method=customerHome&customerID=${user.customerID}"><span
										class="topbar-profilebox-avatar icon-profile ng-hide"></span>
										${user.customerName} </a></span>
							</div>
						</div>
					</nav>
				</div>
			</header>
		</div>
	</div>

	<div class="ng-scope">
		<div class="shopguide ng-isolate-scope">
			<div class="container">
				<div class="shopguide-info">
					<img alt="店家图片" src="${shop.shopPhoto}">
					<div class="shopguide-info-wrapper">
						<div>
							<h1 class="ng-binding">${shop.shopName}</h1>
						</div>
						<p class="shopguide-info-rate">

							<span class="ng-binding">${shop.shopIntroduction}</span> <br />
							<span class="ng-binding">${shop.shopTel}</span>
						<p>

							<span class="shopguide-tag ng-binding ng-scope">${shop.shopType}</span>
						</p>
					</div>

				</div>

				<div class="shopguide-server">
					<span class=""> <em>地址</em> <em
						class="shopguide-server-value ng-binding">${shop.shopAddress}</em></span>
					<span class=""> <em>是否有营业执照</em> <em
						class="shopguide-server-value ng-binding">${shop.shopLicense}</em>
						<!-- ngIf: shop.delivery_mode.description --></span> <!-- <span class="">
						<em>这里要写什么？</em> <em class="shopguide-server-value ng-binding">还是可以去掉？</em>
					</span> -->
				</div>

			</div>
		</div>
		<div class="ng-scope ng-isolate-scope">
			<div class="shopnav">
				<div class="container clearfix">
					<div class="shopnav-left">
						<a class="shopnav-tab active" href="">所有商品</a> <!-- <a
							class="shopnav-tab" href="">评价</a> <a class="shopnav-tab" href="">商家详情</a> -->
					</div>
				</div>
			</div>
		</div>
		<div class="shopmain clearfix container ng-scope">

			<div class="shopmenu ng-isolate-scope">
				<div class="shopmenu-main grid">

					<div class="ng-scope">

						<div class="shopmenu-list clearfix ng-scope"
							style="min-height: 350px;">

							<c:forEach items="${dish}" var="dish">
								<div class="shopmenu-food ng-isolate-scope">
									<span class="col-1 ng-scope"> <a href="javascript:">
											<img alt="食品的图片" src="${dish.dishPhoto}">
									</a>
									</span>

									<div class="col-2 shopmenu-food-main">
										<h3 class="shopmenu-food-name ui-ellipsis ng-binding">${dish.dishName}</h3>
										<input type="hidden" name="${dish.dishID}"
											value="${dish.dishID}">
										<p class="color-mute ui-ellipsis ng-binding">
											<font size="2" color="red"><b>￥${dish.dishPrice}</b></font>
										</p>
										<p class="color-mute ui-ellipsis ng-binding">${dish.dishIntroduction}</p>
										<p>
											<span class="color-mute ng-binding">剩余
												${dish.dishStock} 份</span> <br />
										</p>
									</div>

									<span class="col-4">
										<div class="ng-isolate-scope">
											<div class="ng-scope">
												<button id="${dish.dishID}"
													class="shop-cartbutton ng-binding ng-scope"
													onclick="add('${dish.dishName}','${dish.dishPrice}', '${dish.dishID}', '${dish.dishStock}');this.disabled='disabled';">加入购物车</button>
											</div>
										</div>
									</span>
								</div>

							</c:forEach>

						</div>
					</div>

					<div class="ng-isolate-scope">
						<div class="shop-cart">

							<div class="shop-cartbasket" id="shopbasket" style="top: -150px;">
								<div class="ng-isolate-scope">
									<div class="shop-grouphead single">
										<div class="shop-grouphead-row">
											购物车 <a href="店铺.jsp">[清空]</a>
										</div>
									</div>
								</div>

							</div>

							<div class="shop-cartbasket" style="top: -105px;">

								<form name="shopCart" action="ShopServlet?method=buy"
									method="post">
									<div id="cart" class="ng-isolate-scope"
										style="overflow: auto; height: 115px;">
										<input type="hidden" name="customerID"
											value="${user.customerID}"> <input type="hidden"
											name="shopID" value="${shop.shopID}">
									</div>

								</form>
							</div>

							<div class="shop-cartfooter">
								<span class="icon-cart shop-carticon"> <span
									class="shop-cartpieces ng-binding ng-scope">总</span>
								</span>
								<p id="allPrice"
									class="shop-cartfooter-text price ng-binding ng-scope">0</p>
								<button class="shop-cartfooter-checkout ng-binding"
									onclick="deal();">下单</button>
								<script>
									function deal() {
										if (confirm('确认下单吗？')) {
											if ("${user.customerID}" == "") {
												alert("请先登录");
												return;
											}
											document.all.shopCart.submit();
										}
									}
									</script>
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="shopmain-right ng-isolate-scope">
				<div class="shopbulletin">
					<div class="shopbulletin-section">
						<h3 class="shopbulletin-section-title">商家公告</h3>
						<p class="shopbulletin-content ng-binding">${shop.notice}</p>
						<!-- <ul class="shopbulletin-supports">
							<li class="ng-binding ng-scope"><span class="ng-binding"
								style="background-color: rgb(255, 78, 0);">付</span>可使用支付宝、微信、手机QQ进行在线支付</li>
							<li class="ng-binding ng-scope"><span class="ng-binding"
								style="background-color: rgb(232, 132, 45);">新</span>新店</li>
						</ul> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>