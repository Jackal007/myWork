<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
<script type="text/javascript">
function fsubmit(obj){
	obj.submit();
}
</script>
</head>
<body>            
<form action="CusServlet?method=showCustomers" method="post" name="form1" id="form1">
 <div style="position:absolute; left:0; top:0; width:100%; height:100%">
 <input type=image  src="images/welcome.jpg" width=100% height=100% onclick="javascript:fsubmit(document.form1);"/>
 
  </div></form>
  

  </body>
  </html>
