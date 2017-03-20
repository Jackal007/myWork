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
		var error = '<%=request.getParameter("error")%>' ;
		if(error == 'yes'){
			sweetAlert("出错咯","新单位名称不能与现有的单位名称相同！","error");
		}
		if(error == 'yes1'){
			sweetAlert("出错咯","新单位名称不能与原来的相同！","error");
		}
		var success = '<%=request.getParameter("success")%>' ;
		if(success == 'yes'){
			swal("成功！","修改成功！","success");
		}
	</script>
	<script type="text/javascript">
	function check(){ 
	    swal({ 
	        title: "您确定要删除吗？",  
	        text: "您确定要删除这条数据？",  
	        type: "warning", 
	        showCancelButton: true, 
	        closeOnConfirm: false, 
	        confirmButtonText: "是的，我要删除", 
	        confirmButtonColor: "#ec6c62" 
	    }, function() { 
	    	 document.myform.submit();
	    }); 
	}
	</script>
	<%
		String id = request.getParameter("id");
		String name = InstitutionDao.GetNameById(id);
	%>
		<form class="form-horizontal" role="form" method="post" id="myform" name="myform" action="./DeleteInstitution">
						</br>
		  				<div class="form-group">
		    				<label for="name" class="col-sm-2 control-label">单位名称</label>
		    				
		    				<div class="col-sm-9">
		    					<input type="text" class="form-control" id="institution_name" name="institution_name" value="<%=name %>" readonly>
		    					<input type="hidden" id="institution_id" name="institution_id" value="<%=id %>">
		    				</div>
		  				</div>
		  				<button type="button" class="btn btn-default col-sm-2 col-sm-offset-9 btnlocation4" onclick="return check()">删除</button>
					</form>
	</body>
	<script src="js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/main-moudle.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	</script>
</html>