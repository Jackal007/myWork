<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="ng-scope">

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragrma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<head>
<meta charset="utf-8">

<title>编辑食品</title>
<link rel="shortcut icon" href="image/logo.ico">
<link
	href="https://static11.elemecdn.com/eleme/desktop/vendor.cba496.css"
	rel="stylesheet">
<link
	href="https://static11.elemecdn.com/eleme/desktop/profile.7433e7.css"
	rel="stylesheet">
<link href="./css/home.css" rel="stylesheet">
<base href=".">
</head>

<body style="position: relative;">
	<div class="ng-isolate-scope">
		<div class="ng-scope ng-isolate-scope">
			<header class="topbar  shoptopbar">
				<div class="container clearfix">
					<h1>
						<a class="topbar-logo"> <span></span></a>
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
					<h2 class="profile-sidebar-sectiontitle">
						<a href="SellerServlet?method=sellerShop"><i
							class="icon-line-order"></i>店铺资料</a>
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
					<h2 class="profile-sidebar-sectiontitle active">
						<a
							href="SellerServlet?method=sellerDish&sellerID=${user.sellerID}"><i
							class="icon-order-favor"></i>食品编辑</a>
					</h2>
				</li>
			</ul>


			<div class="profile-panel" role="main">
				<h3 class="profile-paneltitle ng-scope">
					<span class="ng-binding">食品编辑</span>
				</h3>

				<div class="shopmain clearfix container ng-scope">
					<div class="shopmenu ng-isolate-scope">
						<c:forEach items="${dish}" var="oneDish">
							<form id="${oneDish.dishID}"
								action="SellerServlet?method=modifyDish" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="sellerID" value="${user.sellerID}">
								<input type="hidden" name="dishID" value="${oneDish.dishID}">
								<div class="container ng-scope" style="margin-left: 10px;">
									<table>
										<tr>
											<th valign="top" align="left"><input
												style="display: none" type="file"
												name="imageUpload${oneDish.dishID}"
												id="imageUpload${oneDish.dishID}"
												onchange='PreviewImageA(this,imageUpload${oneDish.dishID})' />
												<div id="imgPreviewimageUpload${oneDish.dishID}"
													onclick="javascript:document.all.imageUpload${oneDish.dishID}.click();"
													style="position: relative; right: 0; top: 0">
													<img alt="食品的图片" src="${oneDish.dishPhoto}" width="103"
														height="103">
												</div></th>
											<th>
												<div style="width: 850px;">
													<table class="typo-table search-foodtable ng-scope">
														<tbody>
															<tr>
																<th colspan="4"><small class="search-sales">菜名：
																		<input type="text" name="dishName"
																		value="${oneDish.dishName}">
																</small> <small class="search-sales">价格： <input
																		type="text" name="dishPrice"
																		value="${oneDish.dishPrice}"
																		onkeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
																		size="5" maxlength="4">
																</small> <small class="search-sales">剩余数量： <input
																		type="text" name="dishStock" maxlength="4"
																		onkeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
																		value="${oneDish.dishStock}" size="5">
																</small> <small class="search-sales">食品类别： <select
																		id="饮料${oneDish.dishName}" name="dishType"
																		style="width: 60px;">
																			<c:if test="${oneDish.dishType=='主食'}">
																				<option value="主食" selected="selected">主食</option>
																				<option value="小吃">小吃</option>
																				<option value="饮料">饮料</option>
																			</c:if>
																			<c:if test="${oneDish.dishType=='小吃'}">
																				<option value="主食">主食</option>
																				<option value="小吃" selected="selected">小吃</option>
																				<option value="饮料">饮料</option>
																			</c:if>
																			<c:if test="${oneDish.dishType=='饮料'}">
																				<option value="主食">主食</option>
																				<option value="小吃">小吃</option>
																				<option value="饮料" selected="selected">饮料</option>
																			</c:if>
																	</select>
																</small></th>
																<td class="search-col3"><a
																	class="btn btn-sm ng-binding ng-scope"
																	href="javascript:document.getElementById('${oneDish.dishID}').submit();">确认修改</a></td>
															</tr>
															<tr class="ng-scope">
																<th colspan="4"><small class="search-sales">食品简介
																		<input type="text" name="dishIntroduction"
																		value="${oneDish.dishIntroduction}" size="90">
																</small></th>
																<td class="search-col3"><a
																	class="btn btn-sm ng-binding ng-scope"
																	href="SellerServlet?method=deleteDish&sellerID=${user.sellerID}&dishID=${oneDish.dishID}">删除</a></td>

															</tr>
														</tbody>
													</table>
												</div>
											</th>

										</tr>

									</table>
								</div>
							</form>
						</c:forEach>



						<form name="addDish"
							action="SellerServlet?method=addDish&shopID='${user.shopID}'&sellerID='${user.sellerID}'"
							method="post" enctype="multipart/form-data">

							<input type="hidden" name=sellerID value="${user.sellerID}">
							<div class="container ng-scope" style="margin-left: 10px;">
								<table>
									<tr>

										<th valign="top" align="left"><input
											style="display: none" type="file" name="imgUpload"
											id="imgUpload" onchange='PreviewImage(this)' />
											<div id="imgPreview"
												onclick="javascript:document.all.imgUpload.click();"
												style="position: relative; right: 0; top: 0">
												<img alt="点击添加图片" src="image/addDish1.jpg" width="90" height="90" onMouseOver="this.src='image/addDish2.jpg'" onMouseOut="this.src='image/addDish1.jpg'" >
											</div></th>
										<th>
											<div style="width: 850px;">
												<table class="typo-table search-foodtable ng-scope">
													<tbody>
														<tr>
															<th colspan="4"><small class="search-sales">菜名：
																	<input type="text" name="dishName"
																	value="${oneDish.dishName}">
															</small> <small class="search-sales">价格： <input
																	type="text" name="dishPrice" maxlength="4"
																	onkeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
																	value="${oneDish.dishPrice}" size="5">
															</small> <small class="search-sales">剩余数量： <input
																	type="text" name="dishStock" maxlength="4"
																	onkeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"
																	value="${oneDish.dishStock}" size="5">
															</small><small class="search-sales">食品类别：<select
																	name="dishType" style="width: 60px;">
																		<option value="主食">主食</option>
																		<option value="小吃">小吃</option>
																		<option value="饮料">饮料</option>
																</select>
															</small></th>
															<td class="search-col3"></td>
														</tr>
														<tr class="ng-scope">
															<th colspan="4"><small class="search-sales">食品简介
																	<input type="text" name="dishIntroduction"
																	value="${oneDish.dishIntroduction}" size="90">
															</small></th>
															<td class="search-col3"><a
																class="btn btn-sm ng-binding ng-scope"
																href="javascript:document.all.addDish.submit();">添加</a></td>

														</tr>
													</tbody>
												</table>
											</div>
										</th>

									</tr>

								</table>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<footer class="footer" role="contentinfo"> </footer>

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
					document.getElementById("imgPreview").innerHTML =  "<img src='"+path+"'height='100' width='100'"+"/>";
				}
			}
		}
		function PreviewImageA(imgFile,divName) {
			
			
			
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
					document.getElementById("imgPreview"+divName.name).innerHTML = "";
					document.getElementById("imgPreview"+divName.name).style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\""
							+ path + "\")";//使用滤镜效果 
				} else//FF 
				{
					
					path = URL.createObjectURL(imgFile.files[0]);
					document.getElementById("imgPreview"+divName.name).innerHTML =  "<img src='"+path+"'height='100' width='100'"+"/>";
				}
			}
		}

function Choose(optionID) {
	alert(optionID.name);
	document.getElementById(optionID.name).value="饮料";
     
		}
		
	</script>
</body>
</html>