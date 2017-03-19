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
<base href=".">
</head>

<body>
	<script>
		window.onload = function() {
			location.href = "HomeServlet?method=showShops";
		}
	</script>
	<div class="ng-scope" style="height: 300px;">
		<div class="map" style="height: 280px; overflow: hidden;">
			<div class="container">
				<div class="map-header clearfix">
					<h1>
						<a href="HomeServlet?method=showShops"> <img
							src="image/logo.ico"
							style="width: 80px; height: 80px; margin-left: 20px;">
						</a>
					</h1>
					<span class="map-header-right ng-scope"> <a target="_blank"
						href="注册.jsp">注册</a> <span>|</span> <a href="登录.jsp">登录</a>
					</span>
				</div>
				<div class="map-main ng-isolate-scope">
					<h2 class="map-logo">
						<i></i>
					</h2>
					<div class="map-navbar clearfix">
						<div style="margin-top: -50px; margin-left: -100px;">
							<form class="mapsearch-inputbar ng-pristine ng-valid"
								action="homeServlet?method=homeSearch" method="post">
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
														<a href="JavaScript:all();">全部</a> <a
															href="JavaScript:shop();">店铺</a> <a
															href="JavaScript:dish();">美食</a>
													</div>
													<script type="text/javascript">
														function all() {
															document
																	.getElementById('type').innerHTML = '全部';
															document.all.shopType.value = "全部";
														}
														function shop() {
															document
																	.getElementById('type').innerHTML = '店铺';
															document.all.shopType.value = "店铺";
														}
														function dish() {
															document
																	.getElementById('type').innerHTML = "美食";
															document.all.shopType.value = "美食";
														}
													</script>

												</div>
											</div></th>
										<th><input placeholder="想找什么美食？"
											class="ng-pristine ng-valid" name="keywords">
											<button class="btn-stress" type="submit" onclick>搜 索</button></th>
									</tr>
								</table>

								<!-- <select name= "type">  
							  <option value ="全部">全部</option>  
							  <option value ="主食">主食</option>  
							  <option value="小吃">小吃</option>  
							  <option value="饮料">饮料</option>  
							</select>  -->


							</form>
						</div>
					</div>
					<div class="map-content"></div>
				</div>
				<div class="mapfooter"></div>
			</div>
		</div>
	</div>
</body>
</html>