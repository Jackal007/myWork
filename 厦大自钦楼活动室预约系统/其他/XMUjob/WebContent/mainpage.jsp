<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>厦门大学学生活动中心活动室预约</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/base.css"/>
		<link rel="stylesheet" type="text/css" href="css/mainpage.css"/>
		<script src="js/sweetalert.min.js"></script> 
		<script src="js/login.js"></script>
    	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
	</head>
	<body>
	<script>
		var error = '<%=request.getParameter("error")%>' ;
		if(error == 'yes'){
			sweetAlert("error...","用户名或密码错误！","error");
		}
	</script>
		<div class="header">
			<div class="headerbar">
				<!--顶部左侧的logo-->
				<div class="logo">
					<img src="image/logo.png"/>
				</div>
				<!--用于登录前和登录后的两种样式-->
				<!--div class="welcome">您好，尊敬的 老师</div-->
				<div class="login"><a data-toggle="modal" data-target="#loginbar">登录</a></div>
				<!-- 模态框（Modal） -->
				<div class="modal fade" id="loginbar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    				<div class="modal-dialog">
       					<div class="modal-content">
            				<div class="modal-header">
                				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                				<h4 class="modal-title text-center" id="myModalLabel">登录</h4>
            				</div><br>
            				<form class="form-horizontal" role="form" id="login_form" method="post" onsubmit="return checkForm_Login()" action="./Login">
							<div class="form-group">
								<label for="username" class="col-sm-3 control-label">用户名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="username" name="username"
				   					placeholder="请输入用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-3 control-label">密码</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="password" name="password"
				   					placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group">
							 <div class="col-sm-offset-3 col-sm-7">
									<div class="radio-inline"> 
									  <label>
									    <input type="radio" name="optionsRadios" id="optionsRadios" value="user" checked onclick="a()">教师/学生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									  </label> 
									  <label>
									    <input type="radio" name="optionsRadios" id="optionsRadios" value="admin" onclick="a()">管理员
									  </label>
									</div>
								 </div> 
							</div><hr>
							<div class="form-group">            				
            				<button type="submit"  class="btn btn-default col-sm-offset-5 col-sm-2">登录</button> 
            				</div>           				
            				</form>
        				</div><!-- /.modal-content -->
    				</div><!-- /.modal -->
				</div>
			</div>
		</div>
		<div class="wrapper">
			<div class="maincontainer">
				<!--轮播图-->
				<div class="scrollbar">
					<div class="scroll">
						<div id="Carouselbanner" class="carousel slide" data-ride="carousel">
							<!-- 轮播（Carousel）指标 -->
							<ol class="carousel-indicators">
								<li data-target="#Carouselbanner" data-slide-to="0" 
						class="active"></li>
								<li data-target="#Carouselbanner" data-slide-to="1"></li>
								<li data-target="#Carouselbanner" data-slide-to="2"></li>
							</ol>
							<!-- 轮播（Carousel）项目 -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="image/slide1.jpg" alt="First slide">
								</div>
								<div class="item">
									<img src="image/slide2.jpg" alt="Second slide">
								</div>
								<div class="item">
									<img src="image/slide3.jpg" alt="Third slide">
								</div>
							</div>
						</div>   
					</div><!--scroll部分结束-->
					<div class="goL">
						<a href="#Carouselbanner" 
	        					data-slide="prev"><img src="image/goL.png" alt="上一张图片"></a>
					</div>
					<div class="goR">
						<a href="#Carouselbanner" 
	        					data-slide="next"><img src="image/goR.png" alt="下一张图片"></a>
					</div>
				</div>
				<!--简介-->
				<div class="introbar">
					<div class="leftstyle">
						<div class="leftbottom">
						</div>
						<div class="lefttop">
						</div>
					</div>
					<div class="rightstyle">
						<div class="rightbottom">
						</div>
						<div class="righttop">
						</div>
					</div>
					<div class="introcontent">
						<p>1、多功能厅等需用到多媒体设备的请提前去调试设备，以免影响正常使用。  (2013/12/13)<br>
							2、管委会值班时间：8:00-11:30,12:30-14:30，14:30-18:00,19:00-23:30。所有活动室不接受口头申请。若在预约过程中，有疑问请咨询管委会值班室：0592-2184321。  (2013/4/1)<br>
							3、一楼学长辅助室，一楼小剧场，二楼研讨与接待室，二楼团队合作室在网站上预约，通过后下载并打印使用登记表，得到所在组织签字盖章后，至少提前一天交至自钦楼一楼管委会值班室。  (2013/4/1)<br>
							4、二楼多功能厅、三楼露天舞台申请之后，得到状态显示“需进一步确认”通知后，请重新登陆下载并打印使用登记表，得到所在组织单位签字盖章后，再送至一楼管委会办公室等待审批。管委会将在24小时内进行审批，通过显示√，未通过显示×，请注意查询。通过后，请至少提前一天交至自钦楼一楼管委会值班室。  (2013/4/1)<br>
							5、在展厅开展展览活动时，谢绝其它活动开展。  (2012/11/16)<br>
							6、自钦楼活动室面向全校学生活动开放申请，申请各活动室需至少提前2天。各单位及个人申请之前需仔细阅读以下注意事项。  (2012/2/22)<br>
							7、“所在组织签字盖章”说明：各校级学生机构（学生会，研究生会，社联会，青协，科创，广播电台）需各自办公室主任或副主席以上签字并盖章；各社团需社联会办公室主任或副主席以上签字并盖章；其他情况需所在学院团委负责人签字并盖章。  (2012/2/22)<br>
							8、请各单位申请活动时特别注意写明活动内容，否则不予通过。若发现实际情况不符，管委会值班人员有权终止其进行，情况严重者将上报相关部门。  (2012/2/22)<br>
						</p>
					</div>
				</div>
				<!--选择要申请的活动室-->
				<div class="choosebar">
    					<div class="roomshow" id="choosehuiyi">
        					<a href="#">
            					<img src="image/huiyi_1.jpg"
                 					alt="会议室" class="img-thumbnail">
        					</a>
        					<div class="aboveimg" id="huiyi">
        						<a href="#">会议室</a>
        					</div>
    					</div>
    					<div class="roomshow" id="chooseyantao1">
        					<a href="#">
            					<img src="image/kechuang_1.jpg"
                 					alt="研讨一" class="img-thumbnail">
        					</a>
        					<div class="aboveimg" id="yantao1">
        						<a href="#">研讨一</a>
        					</div>
    					</div>
    					<div class="roomshow" id="chooseyantao2">
        					<a href="#">
            					<img src="image/yantao_1.jpg"
                 					alt="研讨二" class="img-thumbnail">
        					</a>
        					<div class="aboveimg" id="yantao2">
        						<a href="#">研讨二</a>
        					</div>
    					</div>
    					<div class="roomshow" id="chooseduogong">
        					<a href="#">
            					<img src="image/duogong_1.jpg"
                 					alt="多功能厅" class="img-thumbnail">
        					</a>
        					<div class="aboveimg" id="duogong">
        						<a href="#">多功能厅</a>
        					</div>
    					</div>
    					<div class="roomshow" id="choosetingyuan">
        					<a href="#">
            					<img src="image/tingyuan_1.jpg"
                 					alt="庭院小剧场" class="img-thumbnail">
        					</a>
        					<div class="aboveimg" id="tingyuan">
        						<a href="#">庭院小剧场</a>
        					</div>
    					</div>
    					<div class="roomshow" id="choosezhanting">
        					<a href="#">
            					<img src="image/zhanting_1.jpg"
                 					alt="展厅" class="img-thumbnail">
        					</a>
        					<div class="aboveimg" id="zhanting">
        						<a href="#">展厅</a>
        					</div>
    					</div>
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
		/*是鼠标hover图片时显示进入按钮的jQ*/
		$(document).ready(function(){
			/*会议室*/
			$("#choosehuiyi").mouseenter(function(){
				$("#huiyi").fadeIn();
			});
			$("#choosehuiyi").mouseleave(function(){
				$("#huiyi").fadeOut();
			});
			/*研讨一*/
			$("#chooseyantao1").mouseenter(function(){
				$("#yantao1").fadeIn();
			});
			$("#chooseyantao1").mouseleave(function(){
				$("#yantao1").fadeOut();
			});
			/*研讨二*/
			$("#chooseyantao2").mouseenter(function(){
				$("#yantao2").fadeIn();
			});
			$("#chooseyantao2").mouseleave(function(){
				$("#yantao2").fadeOut();
			});
			/*多功能厅*/
			$("#chooseduogong").mouseenter(function(){
				$("#duogong").fadeIn();
			});
			$("#chooseduogong").mouseleave(function(){
				$("#duogong").fadeOut();
			});
			/*庭院小剧场*/
			$("#choosetingyuan").mouseenter(function(){
				$("#tingyuan").fadeIn();
			});
			$("#choosetingyuan").mouseleave(function(){
				$("#tingyuan").fadeOut();
			});
			/*展厅*/
			$("#choosezhanting").mouseenter(function(){
				$("#zhanting").fadeIn();
			});
			$("#choosezhanting").mouseleave(function(){
				$("#zhanting").fadeOut();
			});
		});
		/*轮播图的轮转间隔*/
		$(function(){
		    $('#Carouselbanner').carousel({
		      interval: 3000
		    });
		});

	</script>
	</html>