<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>厦门大学学生活动中心活动室预约</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/applicationpage.css" />
</head>
<body>
	<div class="header">
		<div class="headerbar">
			<!--顶部左侧的logo-->
			<div class="logo">
				<img src="image/logo.png" />
			</div>
			<div class="welcome">您好， 同学</div>
		</div>
	</div>
	<div class="wrapper">
		<div class="maincontainer">
			<div class="leftcontent">
				<div class="calendar container" id="firstpage">
					<div class="row titleline" id="caltitle">
						<!--日历的第一行，显示日期-->
						<div class="nullbar"></div>
						<div class="datebar">
							<span id="showdate1">12月12日</span>
						</div>
						<div class="datebar">
							<span id="showdate2"></span>
						</div>
						<div class="datebar">
							<span id="showdate3"></span>
						</div>
						<div class="datebar">
							<span id="showdate4"></span>
						</div>
						<div class="datebar">
							<span id="showdate5"></span>
						</div>
						<div class="datebar">
							<span id="showdate6"></span>
						</div>
						<div class="datebar">
							<span id="showdate7"></span>
						</div>
					</div>
					<div class="row calline1" id="time1">
						<div class="timebar">
							<span>时段一</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>审核中</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
					</div>
					<div class="row calline" id="time2">
						<div class="timebar">
							<span>时段二</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>审核中</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
					</div>
					<div class="row calline1" id="time3">
						<div class="timebar">
							<span>时段三</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>审核中</span>
						</div>
					</div>
					<div class="row calline" id="time4">
						<div class="timebar">
							<span>时段四</span>
						</div>
						<div class="choosebar">
							<span>审核中</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
					</div>
				</div>
				<!--这是第二页，页面刚被刷新时是被隐藏的-->
				<div class="calendar container" id="secondpage">
					<div class="row titleline" id="caltitle">
						<!--日历的第一行，显示日期-->
						<div class="nullbar"></div>
						<div class="datebar">
							<span id="showdate8">12月12日</span>
						</div>
						<div class="datebar">
							<span id="showdate9">
						</div>
						<div class="datebar">
							<span id="showdate10">
						</div>
						<div class="datebar">
							<span id="showdate11">
						</div>
						<div class="datebar">
							<span id="showdate12"><
						</div>
						<div class="datebar">
							<span id="showdate13">
						</div>
						<div class="datebar">
							<span id="showdate14">
						</div>
					</div>
					<div class="row calline1" id="time21">
						<div class="timebar">
							<span>时段一</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>审核中</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
					</div>
					<div class="row calline" id="time22">
						<div class="timebar">
							<span>时段二</span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>审核中</span>
						</div>
					</div>
					<div class="row calline1" id="time23">
						<div class="timebar">
							<span>时段三</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>审核中</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
					</div>
					<div class="row calline" id="time24">
						<div class="timebar">
							<span>时段四</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>审核中</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span>已预约</span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
						<div class="choosebar">
							<span></span>
						</div>
					</div>
				</div>
				<!--第二页结束-->
				<div class="buttonbar">
					<button type="button"
						class="btn btn-default col-sm-2 col-sm-offset-1 btnlocation2"
						id="nextPage" onclick="nextPage()">下一页</button>
					<button type="button"
						class="btn btn-default col-sm-2 col-sm-offset-1 btnlocation2"
						id="prePage" onclick="prePage()">上一页</button>
					<button type="button"
						class="btn btn-default col-sm-2 col-sm-offset-1 btnlocation">返回</button>
					<!--button type="submit" class="btn btn-default col-sm-2 col-sm-offset-7 btnlocation1">确定</button-->
				</div>
			</div>
			<div class="rightcontent">
				<h3 class="text-center">某活动室基本情况</h3>
				<hr>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="name" class="col-sm-4 control-label">活动室名称</label>
						<div class="col-sm-6">
							<p class="form-control-static">某活动室</p>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-4 control-label">活动室位置</label>
						<div class="col-sm-6">
							<p class="form-control-static">自钦楼X楼</p>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-4 control-label">活动室面积</label>
						<div class="col-sm-6">
							<p class="form-control-static">XX平方米</p>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-4 control-label positioncontrol">最少申请人数</label>
						<div class="col-sm-6">
							<p class="form-control-static positioncontrol1">5人</p>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-4 control-label">活动室用途</label>
						<div class="col-sm-6">
							<p class="form-control-static">学术科技活动及竞赛资料陈列、查询</p>
						</div>
					</div>
				</form>
				<hr style="margin-top: -15px;">
				<div class="imagebar">
					<img src="image/huiyi_1.jpg" alt="会议室" class="img-thumbnail">
					<img src="image/huiyi_1.jpg" alt="会议室" class="img-thumbnail">
					<img src="image/huiyi_1.jpg" alt="会议室" class="img-thumbnail">
				</div>
				<hr>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="footer">
			<div class="copyright">COPYRIGHT ? 厦门大学学生活动中心学生管理团队. ALL RIGHTS
				RESERVED.</div>
		</div>
</body>
<script src="js/jquery-3.1.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main-moudle.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
		$(function(){
			var curDate=new Date();
			var month=curDate.getMonth()+1;/*month是从0开始计算的*/
			var date=curDate.getDate()+1;/*这样就可以从当前天的第二天开始预约*/
			/*document.getElementById("showdate1").innerHTML=month+"月"+date+"日";*/
			/*初始化日期行*/
			for(var i=1;i<15;i++)
			{
				document.getElementById("showdate"+i).innerHTML=month+"月"+date+"日";
				var tmpDate=new Date(curDate);
				tmpDate.setDate(date+1);
				month=tmpDate.getMonth()+1;
				date=tmpDate.getDate();
			}
			/*初始化四个时段*/
			/*我把值存入了二维数组str[][]，此时str[0][2]指的是第一行第三列的数*/
			var str=[];
			var str2=[];
			for(var i=1;i<5;i++)
			{
				obj = document.getElementById("time"+i).getElementsByTagName("span");
			    str[i-1]= [];
			    for(var j=1;j<8;j++){
			        str[i-1].push(obj[j].innerHTML);
			        if("已预约"==str[i-1][j-1])
			        {
			        	obj[j].style.backgroundColor="#FF8C69";
			        }
			        if("审核中"==str[i-1][j-1])
			        {
			        	obj[j].style.backgroundColor="#FFEC8B";
			        }
			    }
			    obj2 = document.getElementById("time2"+i).getElementsByTagName("span");
			    str2[i-1]= [];
			    for(var j=1;j<obj2.length;j++){
			        str2[i-1].push(obj2[j].innerHTML);
			        if("已预约"==str2[i-1][j-1])
			        {
			        	obj2[j].style.backgroundColor="#FF8C69";
			        }
			        if("审核中"==str2[i-1][j-1])
			        {
			        	obj2[j].style.backgroundColor="#FFEC8B";
			        }
			    }
			}
			/*以下是第一页相关的*/
			/*获取点击的行列数*/
			var line=0;
			var col=0;
			var d1=$('#time1 .choosebar');
			var d2=$('#time2 .choosebar');
			var d3=$('#time3 .choosebar');
			var d4=$('#time4 .choosebar');
			/*为什么我要写四个差不多样子的function呢。。我也不造诶。。*/
			d1.click(function(){
				col=$(this).index();
				line=1;/*test:alert(line+","+col);*/
				var tmpDate2=new Date();
				date=tmpDate2.getDate();
				tmpDate2.setDate(date+col);
				month=tmpDate2.getMonth()+1;
				date=tmpDate2.getDate();
				if(str[line-1][col-1]=="")
					alert("确定选择这个时段吗？"+month+"月"+date+"日，时段一");
				if(str[line-1][col-1]=="已预约")
					alert("这个时段已预约，请选择其他的时段");
				if(str[line-1][col-1]=="审核中")
					alert("这个时段已被他人预约，此时正在审核中，确定选择这个时段吗？")
			})
			d2.click(function(){
				col=$(this).index();
				line=2;
				var tmpDate2=new Date();
				date=tmpDate2.getDate();
				tmpDate2.setDate(date+col);
				month=tmpDate2.getMonth()+1;
				date=tmpDate2.getDate();
				if(str[line-1][col-1]=="")
					alert("确定选择这个时段吗？"+month+"月"+date+"日，时段二");
				if(str[line-1][col-1]=="已预约")
					alert("这个时段已预约，请选择其他的时段");
				if(str[line-1][col-1]=="审核中")
					alert("这个时段已被他人预约，此时正在审核中，确定选择这个时段吗？")
			})
			d3.click(function(){
				col=$(this).index();
				line=3;
				var tmpDate2=new Date();
				date=tmpDate2.getDate();
				tmpDate2.setDate(date+col);
				month=tmpDate2.getMonth()+1;
				date=tmpDate2.getDate();
				if(str[line-1][col-1]=="")
					alert("确定选择这个时段吗？"+month+"月"+date+"日，时段三");
				if(str[line-1][col-1]=="已预约")
					alert("这个时段已预约，请选择其他的时段");
				if(str[line-1][col-1]=="审核中")
					alert("这个时段已被他人预约，此时正在审核中，确定选择这个时段吗？")
			})
			d4.click(function(){
				col=$(this).index();
				line=4;
				var tmpDate2=new Date();
				date=tmpDate2.getDate();
				tmpDate2.setDate(date+col);
				month=tmpDate2.getMonth()+1;
				date=tmpDate2.getDate();
				if(str[line-1][col-1]=="")
					alert("确定选择这个时段吗？"+month+"月"+date+"日，时段四");
				if(str[line-1][col-1]=="已预约")
					alert("这个时段已预约，请选择其他的时段");
				if(str[line-1][col-1]=="审核中")
					alert("这个时段已被他人预约，此时正在审核中，确定选择这个时段吗？")
			})
			/*以下是第二页相关的*/
			/*获取点击的行列数*/
			var line2=0;
			var col2=0;
			var d21=$('#time21 .choosebar');
			var d22=$('#time22 .choosebar');
			var d23=$('#time23 .choosebar');
			var d24=$('#time24 .choosebar');
			d21.click(function(){
				col2=$(this).index();
				line2=1;
				var tmpDate2=new Date();
				date=tmpDate2.getDate();
				tmpDate2.setDate(date+col2+7);
				month=tmpDate2.getMonth()+1;
				date=tmpDate2.getDate();
				if(str2[line2-1][col2-1]=="")
					alert("确定选择这个时段吗？"+month+"月"+date+"日，时段一");
				if(str2[line2-1][col2-1]=="已预约")
					alert("这个时段已预约，请选择其他的时段");
				if(str2[line2-1][col2-1]=="审核中")
					alert("这个时段已被他人预约，此时正在审核中，确定选择这个时段吗？")
			})
			d22.click(function(){
				col2=$(this).index();
				line2=2;
				var tmpDate2=new Date();
				date=tmpDate2.getDate();
				tmpDate2.setDate(date+col2+7);
				month=tmpDate2.getMonth()+1;
				date=tmpDate2.getDate();
				if(str2[line2-1][col2-1]=="")
					alert("确定选择这个时段吗？"+month+"月"+date+"日，时段二");
				if(str2[line2-1][col2-1]=="已预约")
					alert("这个时段已预约，请选择其他的时段");
				if(str2[line2-1][col2-1]=="审核中")
					alert("这个时段已被他人预约，此时正在审核中，确定选择这个时段吗？")
			})
			d23.click(function(){
				col2=$(this).index();
				line2=3;
				var tmpDate2=new Date();
				date=tmpDate2.getDate();
				tmpDate2.setDate(date+col2+7);
				month=tmpDate2.getMonth()+1;
				date=tmpDate2.getDate();
				if(str2[line2-1][col2-1]=="")
					alert("确定选择这个时段吗？"+month+"月"+date+"日，时段三");
				if(str2[line2-1][col2-1]=="已预约")
					alert("这个时段已预约，请选择其他的时段");
				if(str2[line2-1][col2-1]=="审核中")
					alert("这个时段已被他人预约，此时正在审核中，确定选择这个时段吗？")
			})
			d24.click(function(){
				col2=$(this).index();
				line2=4;
				var tmpDate2=new Date();
				date=tmpDate2.getDate();
				tmpDate2.setDate(date+col2+7);
				month=tmpDate2.getMonth()+1;
				date=tmpDate2.getDate();
				if(str2[line2-1][col2-1]=="")
					alert("确定选择这个时段吗？"+month+"月"+date+"日，时段四");
				if(str2[line2-1][col2-1]=="已预约")
					alert("这个时段已预约，请选择其他的时段");
				if(str2[line2-1][col2-1]=="审核中")
					alert("这个时段已被他人预约，此时正在审核中，确定选择这个时段吗？")
			})
		});
		function nextPage(){
			document.getElementById('firstpage').style.display='none';
			document.getElementById('secondpage').style.display='block';
			document.getElementById('nextPage').style.display='none';
			document.getElementById('prePage').style.display='block';
		}
		function prePage(){
			document.getElementById('firstpage').style.display='block';
			document.getElementById('secondpage').style.display='none';
			document.getElementById('nextPage').style.display='block';
			document.getElementById('prePage').style.display='none';
		}
	</script>
</html>