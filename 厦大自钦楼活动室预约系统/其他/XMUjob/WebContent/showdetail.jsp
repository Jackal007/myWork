<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>厦门大学学生活动中心活动室预约</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/framebase.css"/>
		<link rel="stylesheet" type="text/css" href="css/appform.css"/>
	</head>
	<body>
				<div class="formcontainerplus">
					<form class="form-horizontal" role="form">
						<!--申请单位部分-->
		  				<div class="form-group">
		  					<span class="formhead">申请单位</span><hr>
		    				<label for="name" class="col-sm-2 control-label stylecontrol ">单位名称</label>
		    				<div class="col-sm-9 stylecontrol">
		    					<p class="form-control-static">软件学院</p>
		    				</div>
		  				</div><br>
		  				<!--申请房间要求部分-->
		  				<div class="form-group">
		  					<span class="formhead">申请房间要求</span><hr>
		    				<label for="name" class="col-sm-2 control-label stylecontrol">房间名称</label>
		    				<div class="col-sm-9 stylecontrol">
		    					<p class="form-control-static">自钦楼二楼多功能厅</p>
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="name" class="col-sm-2 control-label stylecontrol">使用用途</label>
		    				<div class="col-sm-9 stylecontrol">
		    					<p class="form-control-static">用来玩</p>
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="name" class="col-sm-2 control-label stylecontrol">使用时间</label>
		    				<div class="col-sm-9 stylecontrol">
		    					<p class="form-control-static">2017 年 3 月 22 日 7 点- 11 点</p>
		    				</div>
		  				</div><br>
		  				<!--经办人部分-->
		  				<div class="form-group">
		  					<span class="formhead">经办人</span><hr>
		    				<label for="name" class="col-sm-2 control-label stylecontrol">姓名</label>
		    				<div class="col-sm-9 stylecontrol">
		    					<p class="form-control-static">林二</p>
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="phonenumber" class="col-sm-2 control-label stylecontrol">联系电话</label>
		    				<div class="col-sm-9 stylecontrol">
		    					<p class="form-control-static">11122233344</p>
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="emailaddress" class="col-sm-2 control-label stylecontrol">邮箱地址</label>
		    				<div class="col-sm-9 stylecontrol">
		    					<p class="form-control-static">1122@163.com</p>
		    				</div>
		  				</div><br>
		  				<button type="submit" class="btn btn-default col-sm-2 btnlocation" onclick="javascript:window.parent.location.href='adminmainpage.html';">返回</button>
		  				<button type="submit" class="btn btn-default col-sm-2 btnlocation2">驳回</button>
		  				<button type="submit" class="btn btn-default btn-success col-sm-2  btnlocation3">批准</button>
					</form>
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
		
		function returnmain()
		{

			TOP.history.back();
		
		}
		$(function(){
			test();
		});
		$(function(){
			$("#returnmain1").click(function(){
				window.parent.test1();
				var frame=window.parent.getElementById("rightcontent"); 
				var path = frame.getAttribute("src"); 
				frame.setAttribute("src", path);
				alert(frame);
			})
			
		})
	</script>
	</html>