<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${customerName}的个人中心</title>
<link rel="shortcut icon" href="image/logo.ico">
<link
	href="https://static11.elemecdn.com/eleme/desktop/vendor.cba496.css"
	rel="stylesheet">
<link
	href="https://static11.elemecdn.com/eleme/desktop/profile.7433e7.css"
	rel="stylesheet">
</head>
<body>
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
		<div class="profile profile-container container">
			<div class="clearfix">
				<div class="location" style="visibility: hidden;">
					<span></span> <span class="location-current"> </span>
				</div>
				<div></div>
			</div>
			<ul class="profile-sidebar">
				<li class="profile-sidebar-section">
					<h2 class="profile-sidebar-sectiontitle active">
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
					<h2 class="profile-sidebar-sectiontitle">
						<a href="用户资料修改.jsp"><i class="icon-line-profile"></i>我的资料</a>
					</h2>
				</li>
			</ul>
			<div class="profile-panel" role="main">
				<div class="profile-panelcontent">
					<div class="profile-info ng-scope">
						<div class="profile-infoitem">
							<div class="profile-avatarwrap">
								<img class="profile-avatar" src="${user.customerPhoto }">
								<a href="用户资料修改.jsp" class="profile-edit">编辑资料</a>
							</div>
							<div class="profile-perosondata">
								<h3 class="profile-name ng-binding">
									你好， <strong class="ng-binding">${user.customerName}</strong>
								</h3>
								<p class="profile-tips ng-binding">美食送到将送到：${user.customerAddress}</p>
								<p class="profile-tips ng-binding">电话：${user.customerTel}</p>
								<p class="profile-tips ng-binding">
									<a href="用户资料修改.jsp">编辑</a>
								</p>
							</div>
						</div>
						<div class="profile-infoitem">
							<p>账户余额</p>
							<p class="profile-infoitem-number balance">
								<span class="number ng-binding">${user.customerMoney}</span>元
							</p>
							<a class="profile-btn" href="javascript:charge();">充值</a>
							<script type="text/javascript">
								function charge() {
									money = prompt("请输入要充值的金额:", "5");
									if (!(/^[0-9]*$/.test(money))) {
										alert("请输入数字");
										return false;
									}
									window.location.href = "CustomerServlet?method=charge&customerID=${user.customerID}&chargeMoney="
											+ money;
								}
							</script>
						</div>
					</div>
					<div class="profile-order ng-scope">
						<div class="tabnavigation">
							<a class="tabnavigation-navitem active">最近订单</a> <a
								class="tabnavigation-rightitem profile-allorder"
								href="CustomerServlet?method=customerOrder&customerID=${user.customerID}">查看全部订单&gt;</a>
						</div>
						<div class="profile-order-content" style="height: 500px;">
							<table class="order-list ng-scope">
								<thead>
									<th style="width: 30%;">下单时间</th>
									<th>订单内容</th>
									<th style="width: 10%;">支付金额（元）</th>
									<th style="width: 15%;">状态</th>
								</thead>
								<tbody>
								</tbody>
							</table>

							<div class="profile-order-content"
								style="height: 400px; overflow: auto;">
								<table class="order-list ng-scope">
									<thead>
										<th style="width: 30%;"></th>
										<th style="width: 20%;"></th>
										<th></th>
										<th style="width: 10%;"></th>
										<th style="width: 15%;"></th>
									</thead>
									<tbody>
										<tr></tr>

										<c:forEach items="${orders}" var="order" end="5">
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
													<h3 class="ordertimeline-title">从${order.shopName} 买了</h3>
													<p class="ordertimeline-info-food">
														<a href=""> <span
															class="ordertimeline-food ng-binding">${order.dishName}</span>
															<span class="ordertimeline-info-productnum ng-binding">${order.quantity}</span>
															<span>份</span>
														</a>
													</p>

												</td>
												<td class="ordertimeline-amount">
													<p>${order.totalPrice}</p>
												</td>
												<td class="ordertimeline-status">
												<c:if test="${order.state=='0'}">
													<h3 class="ng-binding">未处理</h3>
													</c:if>
													<c:if test="${order.state=='1'}">
													
														<h3 class="ng-binding">已接单</h3>
													</c:if>
												
													<c:if test="${order.state=='2'}">
													<h3 class="ng-binding">拒单</h3>
													</c:if>
												</td>
												<!-- <td class="ordertimeline-handle"><a
										class="ordertimeline-handle-detail" href="">订单详情</a> <a
										class="ordertimeline-handle-a ng-scope">取消订单</a></td> -->
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer" role="contentinfo"> </footer>
</body>
</html>