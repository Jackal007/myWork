<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!-- SQL THINGS -->
<%
	String id = request.getParameter("id");
%>
<sql:setDataSource var="library_management_system"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/library_management_system" user="root"
	password="" />

<sql:query var="result" dataSource="${library_management_system}">
SELECT * 
FROM	READERS
WHERE readerID='<%=id%>';
</sql:query>

<c:forEach var="row" items="${result.rows}">
	<c:set var="id" value="${row.readerID}" />
	<c:set var="name" value="${row.readerName}" />
	<c:set var="sex" value="${row.readerSex }" />
	<c:set var="tel" value="${row.telephoneNumber }" />
</c:forEach>

<sql:query var="result_rentInfo_present"
	dataSource="${library_management_system}">
SELECT * 
FROM	rentInfo
WHERE readerID='<%=id%>' AND rentState=1;
</sql:query>

<sql:query var="result_rentInfo_history"
	dataSource="${library_management_system}">
SELECT * 
FROM	rentInfo
WHERE readerID='<%=id%>';
</sql:query>

<sql:query var="result_defaultMsg"
	dataSource="${library_management_system}">
SELECT * 
FROM	defaultMsg
WHERE readerID='<%=id%>';
</sql:query>

<c:forEach var="row" items="${result_defaultMsg.rows}">
	<c:set var="defaultMsgID" value="${row.readerID}" />
	<c:set var="defaultBookName" value="${row.bookName}" />
	<c:set var="defaultBookID" value="${row.bookID }" />
	<c:set var="defaultDeadline" value="${row.deadline }" />
	<c:set var="defaultReturnTime" value="${row.returnTime }" />
	<c:set var="defaultDefaultPayment" value="${row.defaultPayment }" />
</c:forEach>

<!-- SQL THINGS -->
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="msapplication-tap-highlight" content="no">
<title>${name }同学的信息</title>
<!------------------------------------------------css--------------------------------------------------->
<link
	href='http://fonts.useso.com/css?family=Raleway:400,300,200,500,600,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" href="css/reader-admin/material-cards.css">
<link rel="stylesheet" type="text/css"
	href="css/reader-admin/component.css" />
<link href='http://fonts.useso.com/css?family=Ubuntu:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/reader-admin/reset.css">
<link rel="stylesheet" href="css/reader-admin/style.css">
<script src="js/reader-admin/modernizr.js"></script>
<link rel="stylesheet" type="text/css"
	href="css/reader-admin/search.css">
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
}

body {
	background-color: #4CAF50;
	color: #37474F;
	font-family: '微软雅黑', sans-serif;
	font-weight: 300;
	font-size: 16px;
}

h1, h2, h3 {
	font-weight: 200;
}
</style>
</head>
<!---------------------------------------------body------------------------------------------------------>
<body>
	<form action="" method="post" name="user">
		<input type="hidden" name="id" value="<%=id%>">
	</form>
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<h1>${name }同学，欢迎使用图书管理系统！</h1>
		</header>
		<section class="container">
			<form class="form-wrapper cf" action="图书查询.jsp" method="post">
				<input type="text" name="search" placeholder="查找一本书">
				<button type="submit">查找图书</button>
			</form>

			<div class="row active-with-click">
				<!------------------------------------------------------------用户信息-->
				<div class="col-md-4 col-sm-6 col-xs-12">
					<article class="material-card Blue">
						<!--头标签-->
						<h2>
							<span>用户信息</span> <strong> <i class="fa fa-fw fa-star"></i>${name }同学，你好</strong>
						</h2>
						<!--头标签-->

						<div class="mc-content">
							<div class="img-container">
								<img class="img-responsive" src="img/user.jpeg">
							</div>

							<div class="mc-description">
								<!--内容-->
								<p>
									读者号 :${id }</br> </br> 名字 :${name }</br> </br> 性别 :${sex }</br> </br> 联系方式 :${tel }</br> </br>
								</p>
								<!--内容-->
							</div>
						</div>
						<div class="mc-footer">
							<h4></h4>
						</div>

						<a class="mc-btn-action"> <i class="fa fa-bars"></i>
						</a>

					</article>
				</div>
				<!-------------------------------------------------------用户信息-->


				<!------------------------------------------------------------借阅信息-->
				<div class="col-md-4 col-sm-6 col-xs-12">
					<article class="material-card Indigo">
						<!--title-->
						<h2>
							<span>借阅信息</span> <strong> <i class="fa fa-fw fa-star"></i>${name }同学，你好</strong>
						</h2>
						<!--title-->
						<div class="mc-content">
							<div class="img-container">
								<img class="img-responsive" src="img/book.png">
							</div>
							<!--内容-->
							<div class="mc-description">
								<c:forEach var="row" items="${result_rentInfo_present.rows}">
									<c:set var="bookName" value="${row.bookName }" />
									<c:set var="rentTime" value="${row.rentDate }" />
									<c:set var="deadline" value="${row.deadline }" />
									<p>
										书籍 :${bookName }</br> </br> 借阅日期 :${rentTime }</br> </br> 应还日期 :${deadline }</br> </br>
										----------------------
									</p>
								</c:forEach>
								<!--内容-->


							</div>
							<!--content-->
						</div>
						<a class="mc-btn-action"> <i class="fa fa-bars"></i>
						</a>
						<div class="mc-footer">
							<h4>详细信息</h4>
							<a
								href="javascript:document.user.action='当前借阅.jsp';document.user.submit();"><font
								size="2">当前借阅</font></a> <a
								href="javascript:document.user.action='历史借阅.jsp';document.user.submit();">
								<font size="2">历史借阅</font>
							</a>
						</div>
					</article>
				</div>
				<!-------------------------------------------------------借阅信息-->


				<!------------------------------------------------------------违约信息-->
				<div class="col-md-4 col-sm-6 col-xs-12">
					<article class="material-card Red">
						<!--title-->
						<h2>
							<span>违约信息</span> <strong> <i class="fa fa-fw fa-star"></i>${name }同学，你好</strong>
						</h2>
						<!--title-->
						<div class="mc-content">
							<div class="img-container">
								<img class="img-responsive" src="img/fine.png">
							</div>
							<!--content-->
							<div class="mc-description">
								<c:forEach var="row" items="${result_defaultMsg.rows}">
									<c:set var="defaultMsgID" value="${row.readerID}" />
									<c:set var="defaultBookName" value="${row.bookName}" />
									<c:set var="defaultBookID" value="${row.bookID }" />
									<c:set var="defaultDeadline" value="${row.deadline }" />
									<c:set var="defaultReturnTime" value="${row.returnTime }" />
									<c:set var="defaultDefaultPayment"
										value="${row.defaultPayment }" />
									<p>
										书籍 :${defaultBookName }</br> </br> <font color="red">应还日期
											:${defaultDeadline }</font></br> </br> ----------------------
									</p>
								</c:forEach>
							</div>
							<!--content-->
						</div>
						<a class="mc-btn-action"> <i class="fa fa-bars"></i>
						</a>
						<div class="mc-footer">
							<h4>详细信息</h4>
							<a
								href="javascript:document.user.action='违约信息.jsp';document.user.submit();"><font
								size="2">违约信息</font></a>
						</div>
					</article>
				</div>
				<!-------------------------------------------------------违约信息-->
			</div>
</body>
<!--------------------------------------------------js------------------------------------------------->
<script src="js/reader-admin/modernizr.custom.js"></script>
<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js"
	type="text/javascript"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="js/jquery-2.1.1.min.js"><\/script>')
</script>
<script>
	$(function() {
		$('.material-card > .mc-btn-action').click(
				function() {
					var card = $(this).parent('.material-card');
					var icon = $(this).children('i');
					icon.addClass('fa-spin-fast');

					if (card.hasClass('mc-active')) {
						card.removeClass('mc-active');

						window.setTimeout(function() {
							icon.removeClass('fa-arrow-left').removeClass(
									'fa-spin-fast').addClass('fa-bars');

						}, 800);
					} else {
						card.addClass('mc-active');

						window.setTimeout(function() {
							icon.removeClass('fa-bars').removeClass(
									'fa-spin-fast').addClass('fa-arrow-left');

						}, 800);
					}
				});
	});
</script>
<script src="js/reader-admin/classie.js"></script>
<script src="js/reader-admin/uisearch.js"></script>
<script>
	new UISearch(document.getElementById('sb-search'));
</script>
<script
	src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/reader-admin/main.js"></script>

</html>