<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html lang="zh">
  
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>增加用户</title>
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
        <form class="login-form" name="adduser" action="增加用户检查.jsp">
          <!------------------------head----------------------------->
          <div class="row">
            <div class="input-field col s12 center">
              <img src="img/头像.jpg" alt="" class="responsive-img valign profile-image-login">
              <p class="center login-form-text">增加用户</p></div>
          </div>
          <!------------------------head----------------------------->
          <!------------------------id----------------------------->
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" name="name" type="text">
              <label class="center-align">姓名</label></div>
          </div>
          <!------------------------id----------------------------->
          <!------------------------id----------------------------->
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" name="id" type="text">
              <label class="center-align">读者号</label></div>
          </div>
          <!------------------------id----------------------------->
          <!------------------------id----------------------------->
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" name="sex" type="text">
              <label class="center-align">性别</label></div>
          </div>
          <!------------------------id----------------------------->
          <!------------------------id----------------------------->
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input class="validate" name="phone" type="text">
              <label class="center-align">联系方式</label></div>
          </div>
          <!------------------------id----------------------------->
          <!------------------------login----------------------------->
          <div class="row">
            <div class="input-field col s12">
              <a href="javascript:document.adduser.submit();" class="btn waves-effect waves-light col s12">添加</a></div>
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