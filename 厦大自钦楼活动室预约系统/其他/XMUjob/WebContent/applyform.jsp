<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>厦门大学学生活动中心活动室预约</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/base.css"/>
		<link rel="stylesheet" type="text/css" href="css/appform.css"/>
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
				<div class="formcontainer">
					<form class="form-horizontal" role="form">
						<!--申请单位部分-->
		  				<div class="form-group">
		  					<span class="formhead">申请单位</span><hr>
		    				<label for="name" class="col-sm-2 control-label">单位名称</label>
		    				<div class="col-sm-9">
		    					<select class="form-control">
							        <option value="">请选择申请单位</option>
							        <option>软件学院</option>
      								<option>管理学院</option>
        							<option>数学科学学院</option>
        							<option>物理机电工程学院</option>
        							<option>信息科学与技术学院</option>
							    </select>
		    				</div>
		  				</div><br>
		  				<!--申请房间要求部分-->
		  				<div class="form-group">
		  					<span class="formhead">申请房间要求</span><hr>
		    				<label for="name" class="col-sm-2 control-label">房间名称</label>
		    				<div class="col-sm-9">
		    					<p class="form-control-static">自钦楼二楼多功能厅</p>
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="name" class="col-sm-2 control-label">使用用途</label>
		    				<div class="col-sm-9">
		    					<textarea class="form-control" rows="5" placeholder="请输入使用用途"></textarea>
		    				</div>
		  				</div>
		  				<span class="help-block col-sm-offset-2">简要说明即可，不超过XXX字</span>
		  				<div class="form-group">
		    				<label for="name" class="col-sm-2 control-label">使用时间</label>
		    				<div class="col-sm-9">
		    					<p class="form-control-static">2017 年 3 月 22 日 7 点- 11 点</p>
		    				</div>
		  				</div><br>
		  				<!--经办人部分-->
		  				<div class="form-group">
		  					<span class="formhead">经办人</span><hr>
		    				<label for="name" class="col-sm-2 control-label">姓名</label>
		    				<div class="col-sm-9">
		    					<input type="text" class="form-control" id="appname" placeholder="请输入经办人姓名">
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="phonenumber" class="col-sm-2 control-label">联系电话</label>
		    				<div class="col-sm-9">
		    					<input type="text" class="form-control" id="phonenumber" placeholder="请输入经办人联系电话">
		    				</div>
		  				</div>
		  				<div class="form-group">
		    				<label for="emailaddress" class="col-sm-2 control-label">邮箱地址</label>
		    				<div class="col-sm-9">
		    					<input type="text" class="form-control" id="phonenumber" placeholder="请输入经办人的常用邮箱地址">
		    				</div>
		  				</div><br>
		  				<button type="submit" class="btn btn-default col-sm-2 col-sm-offset-9 btnlocation">提交申请</button>
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
		$(function(){
			test();
		});
	</script>
	</html>