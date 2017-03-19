<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
  
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>增加图书</title>
    <!------------------------------------------------css-------------------------------------------->
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <link rel="stylesheet" href="css/login/materialize.min.css">
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link href='http://fonts.useso.com/css?family=Lato:400' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/reader-or-admin.css" />
    <style type="text/css">html, body { height: 100%; } html { display: table; margin: auto; } body { display: table-cell; vertical-align: middle;} .margin { margin: 0 !important; }</style></head>
  
  <body class="light-blue">
    <div id="login-page" class="row">
      <div class="col s12 z-depth-6 card-panel">
        <form class="login-form" name="addbook" action="增加图书检查.jsp">
          <!------------------------head----------------------------->
          <div class="row">
            <div class="input-field col s12 center">
              <img src="img/头像.jpg" alt="" class="responsive-img valign profile-image-login">
              <p class="center login-form-text">增加图书</p></div>
          </div>
          <!------------------------head----------------------------->
          <!------------------------id----------------------------->
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" name="bookname" type="text">
              <label class="center-align">书名</label></div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" name="bookid" type="text">
              <label class="center-align">书号</label></div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" name="booktype" type="text">
              <label class="center-align">书籍类型</label></div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" name="bookauthor" type="text">
              <label class="center-align">书籍作者</label></div>
          </div>
          <!--入馆时间自动是今天 <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" id="enterTime" type="text">
              <label class="center-align">入馆时间</label></div>
          </div> -->
           <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" name="bookprice" type="text">
              <label class="center-align">书籍价格</label></div>
          </div>
          <!------------------------id----------------------------->
          <!------------------------login----------------------------->
          <div class="row">
            <div class="input-field col s12">
              <a href="javascript:document.addbook.submit();" class="btn waves-effect waves-light col s12">添加图书</a></div>
          </div>
          <!------------------------login-----------------------------></form>
      </div>
    </div>
  </body>
  <!------------------------------------------------js-------------------------------------------->
  <script type="text/javascript" src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
  <!--materialize js-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
  <script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
  <script type="text/javascript" src="js/reader-or-admin.js"></script>
  <script type="text/javascript">jQuery(function($) {
      $(".segment-select").Segment();
    });</script>

</html>