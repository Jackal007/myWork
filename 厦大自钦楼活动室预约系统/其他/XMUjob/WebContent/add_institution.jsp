<%@page import="com.xmu.dao.InstitutionDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/framebase.css"/>
		<link rel="stylesheet" type="text/css" href="css/personpagebase.css"/>
		<link rel="stylesheet" type="text/css" href="css/appform.css"/>
		<script src="js/sweetalert.min.js"></script> 
    	<link rel="stylesheet" type="text/css" href="css/sweetalert.css">
	</head>
	<body>
	<script>
		function checkForm(){
			var institution_name = document.getElementById("institution_name").value;
			if(institution_name == ""){
				sweetAlert("error...","单位名称不能为空","error");
				return false;
			}
			return true;
		}
	</script>
	<script>
		var error = '<%=request.getParameter("error")%>' ;
		if(error == 'yes'){
			sweetAlert("出错咯","您要添加的单位已存在！","error");
		}
	</script>
		<form class="form-horizontal" role="form" method="post" onsubmit="return checkForm()" action="./AddInstitution">
						</br>
		  				<div class="form-group">
		    				<label for="name" class="col-sm-2 control-label">单位名称</label>
		    				
		    				<div class="col-sm-9">
		    					<input type="text" class="form-control" id="institution_name" name="institution_name" placeholder="请输入单位名称">
		    				</div>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default col-sm-2 col-sm-offset-9 btnlocation4">增加单位</button>
					</form>
	</body>
	<script src="js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/main-moudle.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	</script>
</html>