<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>厦门大学学生活动中心活动室预约</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/base.css"/>
		<link rel="stylesheet" type="text/css" href="css/personpagebase.css"/>
	</head>
	<body>
		<div class="header">
			<div class="headerbar">
				<!--顶部左侧的logo-->
				<div class="logo">
					<img src="image/logo.png"/>
				</div>
				<div class="welcome">您好， 同学</div>
			</div>
		</div>
		<div class="wrapper">
			<div class="maincontainer">
				<div class="leftnav">
					<ul>
					  <li class="active"><a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseOne">查看申请</a></li>
				   		<div id="collapseOne" class="panel-collapse collapse">
						  <li class="second"><a href="#">正在审核</a></li>
						  <li class="second"><a href="#">审核通过</a></li>
						</div>
					  <li><a href="#">申请规则</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="copyright">COPYRIGHT © 厦门大学学生活动中心学生管理团队. ALL RIGHTS RESERVED.</div>
		</div>
	</body>
	<script src="js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/main-moudle.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
			test();
		});
	</script>
	</html>