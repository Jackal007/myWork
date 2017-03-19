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
		<div class="ng-scope ng-isolate-scope">

			<header class="topbar shoptopbar" role="navigation">
				<div class="container clearfix">
					<h1>
						<a class="topbar-logo"> <span>${user.customerName}</span></a>
					</h1>
					<a href="HomeServlet?method=showShops"
						class="topbar-item topbar-homepage"><img src="image/logo.ico" style="width:30px;height:30px;">首页</a> <a
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
					<h2 class="profile-sidebar-sectiontitle active">
						<a
							href="CustomerServlet?method=customerOrder&customerID=${user.customerID}"><i
							class="icon-yen"></i>我的订单</a>
					</h2>
				</li>
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle">
						<a href="用户资料修改.jsp"><i class="icon-line-profile"></i>我的资料</a>
					</h2>
				</li>
			</ul>
			<div class="profile-panel" role="main">
				<h3 class="profile-paneltitle ng-scope">
					<span class="ng-binding">全部订单</span> <span
						class="subtitle ng-binding"></span>
				</h3>
				<div class="profile-panelcontent">

					<table class="order-list ng-scope">
						<thead>
							<th>下单时间</th>
							<th style="width: 10%;"></th>
							<th class="order-list-infoth">订单内容</th>
							<th>支付金额（元）</th>
							<th>状态</th>
						</thead>
						<tbody>
							<tr></tr>

							<c:forEach items="${orders}" var="order">
								<tr class="timeline">
									<td>
										<p class="ordertimeline-title ng-binding">${order.dealTime}</p>
									</td>
									<td>
										<p class="ordertimeline-title ng-binding">
											<!-- <img alt="" src="1.jpg"> -->
										</p>
									</td>
									<td class="ordertimeline-info">
										<h3 class="ordertimeline-title">那天我从 ${order.shopName} 买了</h3>
										<p class="ordertimeline-info-food">
											<a href=""> <span class="ordertimeline-food ng-binding">${order.dishName}</span>
												<span class="ordertimeline-info-productnum ng-binding">${order.quantity}</span>
												<span>份</span>
											</a>
										</p>

									</td>
									<td class="ordertimeline-amount">
										<p>${order.totalPrice}</p>
									</td>
									<td class="ordertimeline-status"><c:if
											test="${order.state=='0'}">
											<h3 class="ng-binding">未处理</h3>
										</c:if> <c:if test="${order.state=='1'}">

											<h3 class="ng-binding">已接单</h3>
										</c:if> <c:if test="${order.state=='2'}">
											<h3 class="ng-binding">拒单</h3>
										</c:if></td>
									<!-- <td class="ordertimeline-handle"><a
										class="ordertimeline-handle-detail" href="">订单详情</a> <a
										class="ordertimeline-handle-a ng-scope">取消订单</a></td> -->
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
	<footer class="footer" role="contentinfo"> </footer>


</body>
</html>