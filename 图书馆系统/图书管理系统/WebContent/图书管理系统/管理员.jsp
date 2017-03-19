<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!-- SQL THINGS -->
<%String id=request.getParameter("id"); %>
<sql:setDataSource var="library_management_system" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/library_management_system" user="root" password="" />

<sql:query var="result" dataSource="${library_management_system}">
SELECT * 
FROM	admins
WHERE adminID='<%=id %>';
</sql:query>

<c:forEach var="row" items="${result.rows}">
	<c:set var="administratorID" value="${row.adminID} "/>
	<c:set var="administratorName" value="${row.adminName}"/>
	<c:set var="telephoneNumber" value="${row.telephoneNumber}"/>
</c:forEach>

<!-- SQL THINGS -->
<!DOCTYPE html>
<html>  
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="msapplication-tap-highlight" content="no">
    <title>${administratorName}管理员的信息</title>
    <!------------------------------------------------css--------------------------------------------------->
    <link href='http://fonts.useso.com/css?family=Raleway:400,300,200,500,600,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <link rel="stylesheet" href="css/reader-admin/material-cards.css">
    <link rel="stylesheet" type="text/css" href="css/reader-admin/component.css" />
    <link href='http://fonts.useso.com/css?family=Ubuntu:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/reader-admin/reset.css">
    <link rel="stylesheet" href="css/reader-admin/style.css">
    <script src="js/reader-admin/modernizr.js"></script>
    <style type="text/css">html { position: relative; min-height: 100%; } body { background-color:#218868; color: #37474F; font-family: '微软雅黑', sans-serif; font-weight: 300; font-size: 16px; } h1, h2, h3 { font-weight: 200; }</style></head>
  <!---------------------------------------------body------------------------------------------------------>

<body>
    <div class="htmleaf-container">
      <header class="htmleaf-header">
        <h1>${administratorName}管理员，欢迎使用图书管理系统</h1>        
        </header>        
      <section class="container">
        <div style="height:80px;">
          <h1> </h1></div>
        <div class="row active-with-click">
          <!------------------------------------------------------------管理员信息-->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <article class="material-card Blue">
              <h2>
                <span>管理员信息</span>
                <strong>
                  <i class="fa fa-fw fa-star"></i>${administratorName}管理员，你好</strong>
              </h2>              
              <div class="mc-content">
                <div class="img-container">
                  <img class="img-responsive" src="img/admin.png"></div>
                
							<div class="mc-description">
							<!--内容-->
									<p>
										管理员号 :${administratorID}</br> </br>
										名字 :${administratorName}</br> </br>
										联系方式 :${telephoneNumber}</br> </br>
									</p>
							<!--内容-->
							</div>
                </div>
                <div class="mc-footer">
                <h4></h4></div>

              <a class="mc-btn-action">
                <i class="fa fa-bars"></i>
              </a>
              
            </article>
          </div>
          <!-------------------------------------------------------用户信息-->
          
          
         <!------------------------------------------------------------add delete user -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <article class="material-card Red">
              <!--title-->
              <h2>
                <span>增/删 读者</span>
                <strong>
                  <i class="fa fa-fw fa-star"></i>管理员你好</strong>
              </h2>
              <!--title-->
              <div class="mc-content">
                <div class="img-container">
                  <img class="img-responsive" src="img/addreader.jpg"></div>
                <!--content-->
                <div class="mc-description">管理员可以增加或者删除读者，<br/><br/><br/>以保证管理系统的正常运行
                  <!-- cd-table --></div>
                <!--content--></div>
              <a class="mc-btn-action">
                <i class="fa fa-bars"></i>
              </a>
              <div class="mc-footer">
                <h4>选择</h4>
                <a href="增加用户.jsp">+</a>
                <a href="删除用户.jsp">-</a></div>
            </article>
          </div>
          <!-------------------------------------------------------add delete user-->
          <!------------------------------------------------------------add delete book -->
          <div class="col-md-4 col-sm-6 col-xs-12">
            <article class="material-card Red">
              <!--title-->
              <h2>
                <span>增/删 图书</span>
                <strong>
                  <i class="fa fa-fw fa-star"></i>管理员你好</strong>
              </h2>
              <!--title-->
              <div class="mc-content">
                <div class="img-container">
                  <img class="img-responsive" src="img/addbook.jpg"></div>
                <!--content-->
                <div class="mc-description">管理员可以增加或者删除图书，<br/><br/><br/>以保证管理系统的正常运行
                  <!-- cd-table --></div>
                <!--content--></div>
              <a class="mc-btn-action">
                <i class="fa fa-bars"></i>
              </a>
              <div class="mc-footer">
                <h4>选择</h4>
                <a href="增加图书.jsp">+</a>
                <a href="删除图书.jsp">-</a></div>
            </article>
          </div>
          <!-------------------------------------------------------add delete book-->
          </div>
  </body>
  <!--------------------------------------------------js------------------------------------------------->
  <script src="js/reader-admin/modernizr.custom.js"></script>
  <script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
  <script>$(function() {
      $('.material-card > .mc-btn-action').click(function() {
        var card = $(this).parent('.material-card');
        var icon = $(this).children('i');
        icon.addClass('fa-spin-fast');

        if (card.hasClass('mc-active')) {
          card.removeClass('mc-active');

          window.setTimeout(function() {
            icon.removeClass('fa-arrow-left').removeClass('fa-spin-fast').addClass('fa-bars');

          },
          800);
        } else {
          card.addClass('mc-active');

          window.setTimeout(function() {
            icon.removeClass('fa-bars').removeClass('fa-spin-fast').addClass('fa-arrow-left');

          },
          800);
        }
      });
    });</script>
  <script src="js/reader-admin/classie.js"></script>
  <script src="js/reader-admin/uisearch.js"></script>
  <script>new UISearch(document.getElementById('sb-search'));</script>
  <script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="js/reader-admin/main.js"></script>

</html>