<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="ng-scope">
<head>
<meta charset="utf-8">
<title>天黑黑外卖网</title>
<link rel="shortcut icon" href="image/logo.ico">
<link href="./css/home.css" rel="stylesheet">
<link
	href="https://static11.elemecdn.com/eleme/desktop/vendor.cba496.css"
	rel="stylesheet">
<link
	href="https://static11.elemecdn.com/eleme/desktop/profile.7433e7.css"
	rel="stylesheet">
<base href=".">
<meta name="mobile-agent" content="undefined">
</head>
<body>
	<script>
		window.onload = function removeElement() {
			var module1 = document.getElementById("module1");
			var module2 = document.getElementById("module2");
			module1.style.display = "block";
			module2.style.display = "none";
			if ('${user.customerID}' != "") {
				module1.style.display = "none";
				module2.style.display = "block";

			}
		}
	</script>
	<div class="ng-scope" style="height: 400px;">
		<div class="map" style="height: 380px; overflow: hidden;" style="background-image:url(image/homeBackGound.jpg);">
			<div class="container">
				<div class="map-header clearfix">
					<a href="HomeServlet?method=showShops"> <img
						src="image/logo.ico"
						style="width: 80px; height: 80px; margin-left: 20px;">
					</a>
					<span id="module1" class="map-header-right ng-scope"> <a
						target="_blank" href="注册.jsp">注册</a> <span>|</span> <a
						href="登录.jsp">登录</a>
					</span> <span id="module2" class="map-header-right ng-scope"><a
						href="CustomerServlet?method=customerHome&customerID=${user.customerID}"><span
							class="topbar-profilebox-avatar icon-profile ng-hide"></span>${user.customerName}</a></span>


				</div>
				<div class="map-main ng-isolate-scope">
					<h2 class="map-logo">
						<i></i>
					</h2>
					<div class="map-navbar clearfix">
						<div style="margin-top: -50px; margin-left: -100px;">
							<form class="mapsearch-inputbar ng-pristine ng-valid"
								action="HomeServlet?method=homeSearch" method="post">
								<table>
									<tr>
										<th><div class="excavator-sort">
												<div class="excavator-sort-item">
													<a href="JavaScript:"> <span class="ng-binding"
														id="type">全部</span> <input type="hidden" name="type"
														value="全部"> <i class="icon-arrow-down"></i> <i
														class="icon-arrow-up"></i>
													</a>
													<div class="excavator-sort-dropdown">
														 <a href="JavaScript:all();">全部</a><a
															href="JavaScript:mainFood();">主食</a> <a
															href="JavaScript:snack();">小吃</a><a
															href="JavaScript:drink();">饮料</a>
													</div>
													<script type="text/javascript">
														function all() {
															document
																	.getElementById('type').innerHTML = '全部';
															document.all.shopType.value = "全部";
														}
														function mainFood() {
															document
																	.getElementById('type').innerHTML = '主食';
															document.all.shopType.value = "主食";
														}
														function snack() {
															document
																	.getElementById('type').innerHTML = "小吃";
															document.all.shopType.value = "小吃";
														}
														function drink() {
															document
																	.getElementById('type').innerHTML = "饮料";
															document.all.shopType.value = "饮料";
														}
													</script>

												</div>
											</div></th>
										<th><input placeholder="想找什么美食？"
											class="ng-pristine ng-valid" name="keywords" size="99.5%">
											<button class="btn-stress" type="submit">搜 索</button></th>
									</tr>
								</table>
							</form>
						</div>
					</div>
					<div class="map-content"></div>
				</div>
				<div class="mapfooter"></div>
			</div>
		</div>
	</div>

	<div class="ng-scope">

		<c:forEach items="${shop}" var="oneShop">
			<div class="container ng-scope" style="margin-left: 200px;">
				<table>
					<tr>
						<th valign="top" align="left">
							<div style="position: relative; right: 0; top: 0">
								<img alt="店铺图片" src="${oneShop.shopPhoto}" width="158" height="158">
							</div>
						</th>
						<th>
							<div style="width: 700px;">
								<table class="typo-table search-foodtable ng-scope">
									<tbody>
										<tr>
											<th colspan="4">
												<h4 class="typo-h5">
													<a class="ng-binding"
														href="ShopServlet?method=showShop&shopID=${oneShop.shopID}">${oneShop.shopName}</a>

												</h4> <small class="search-sales">主营 <span
													class="ng-binding">${oneShop.shopType}</span></small> <small
												class="ng-scope">地址 <span
													class="highlight ng-binding">${oneShop.shopAddress}</span>
											</small>
											</th>
										</tr>
										<tr class="ng-scope">

											<td class="search-col3"><a class="ng-scope"
												href="ShopServlet?method=showShop&shopID=${oneShop.shopID}"> <span class="ng-binding">${oneShop.shopIntroduction}
														<br> <small class="ng-binding">${oneShop.notice}</small>
												</span>
											</a></td>
											<!-- <td class="search-col2"><a class="ng-binding ng-scope"
                      href="店铺.html">¥ 4.9</a></td> -->
											<td class="search-col3"><a
												class="btn btn-sm ng-binding ng-scope"
												href="ShopServlet?method=showShop&shopID=${oneShop.shopID}">进店</a></td>
											<!-- <td class="search-col4">
                      <div class="ng-binding">月售10份</div>
                    </td> -->
										</tr>
									</tbody>
								</table>
							</div>
						</th>

					</tr>

				</table>
			</div>
		</c:forEach>
		<div style="height: 20px;"></div>
	</div>
</body>
</html>