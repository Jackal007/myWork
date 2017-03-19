<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>订单查询</title>
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
		<div>
			<header class="topbar  shoptopbar" role="navigation">
				<div class="container clearfix">
					<h1>
						<a class="topbar-logo"> <span>饿</span></a>
					</h1>
					<a href="SellerServlet?method=sellerHome&sellerID=${user.sellerID}"
						class="topbar-item">店铺中心</a>
					<nav class="topbar-nav">
						<div>
							<div class="topbar-profilebox">
								<span class="topbar-profilebox-avatar icon-profile ng-hide"></span>
								<span class="topbar-profilebox-wrapper"> <span
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
		<div class="profile-container container">
			<div class="clearfix">
				<div class="location" style="visibility: hidden;">
					<span></span> <span class="location-current"></span>
				</div>
			</div>
			<ul class="profile-sidebar" role="navigation">
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle">
						<a
							href="SellerServlet?method=sellerHome&sellerID=${user.sellerID}">
							<i class="icon-line-home"></i>店家中心
						</a>
					</h2>
				</li>
				<li class="profile-sidebar-section" id="hideDingDan">
					<h2 class="profile-sidebar-sectiontitle">
						<a href="SellerServlet?method=sellerShop"> <i
							class="icon-line-order"></i>店铺资料
						</a>
					</h2>
				</li>
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle active">
						<a
							href="SellerServlet?method=sellerOrder&sellerID=${user.sellerID}">
							<i class="icon-yen"></i>订单处理
						</a>
					</h2>
				</li>
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle">
						<a
							href="SellerServlet?method=sellerDish&sellerID=${user.sellerID}">
							<i class="icon-order-favor"></i>食品编辑
						</a>
					</h2>
				</li>
			</ul>
			<div class="profile-panel" role="main">
				<h3 class="profile-paneltitle ng-scope">
					<span class="ng-binding">所有订单</span> <span
						class="subtitle ng-binding"></span>
				</h3>
				<div class="profile-panelcontent">
					<div class="order-fetchtakeout ng-scope ng-isolate-scope"></div>
					<table class="order-list ng-scope">
						<thead>
							<th>下单时间</th>
							<th class="order-list-infoth">订单内容</th>
							<th>支付金额（元）</th>
							<th>操作</th>
							<th>状态</th>
						</thead>
						<tbody>
							<tr></tr>
							<c:forEach items="${orders}" var="order">
								<tr>
								<tr class="timeline">
									<td>
										<p class="ordertimeline-title ng-binding">${order.dealTime}</p>
									</td>
									<td class="ordertimeline-info">
										<h3 class="ordertimeline-title">${order.customerID}买了</h3>
										<p class="ordertimeline-info-food">
											<a href=""> <span class="ordertimeline-food ng-binding">${order.dishName}</span>
												<span class="ordertimeline-info-productnum ng-binding">${order.quantity}</span>
												<span>份</span></a>
										</p>
									</td>
									<td class="ordertimeline-status">
										<h3 class="ng-binding">${order.totalPrice}</h3>
									</td>
									<td class="ordertimeline-handle"><c:if
											test="${order.state=='0'}">
											<table>
												<tr>
													<th><a class="ordertimeline-handle-detail"
														href="SellerServlet?method=dealOrder&orderID=${order.orderID}&state=1">接单</a></th>
													<th><div style="width: 5px;"></div></th>
													<th><a class="ordertimeline-handle-detail"
														href="SellerServlet?method=dealOrder&orderID=${order.orderID}&state=2">拒接</a></th>
												</tr>
											</table>
										</c:if></td>
									<td class="ordertimeline-handle"><c:if
											test="${order.state=='0'}">
											<h3 class="ng-binding">未处理</h3>
										</c:if> <c:if test="${order.state=='1'}">
											<h3 class="ng-binding">已接单</h3>
										</c:if> <c:if test="${order.state=='2'}">
											<h3 class="ng-binding">拒单</h3>
										</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="ng-scope pagination">
						<ul></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer" role="contentinfo"></footer>
</body>

</html>