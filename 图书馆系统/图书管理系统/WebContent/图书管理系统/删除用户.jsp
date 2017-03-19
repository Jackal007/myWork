<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="zh" class="no-js">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>查看用户</title>
<link href='http://fonts.useso.com/css?family=Ubuntu:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/reader-admin/reset.css">
<link rel="stylesheet" href="css/reader-admin/style.css">
<link href="css/reader-admin/table.css" rel="stylesheet" type="text/css"> 
<script type="text/javascript">
 $(function() {
		/* For zebra striping */
        $("table tr:nth-child(odd)").addClass("odd-row");
		/* For cell text alignment */
		$("table td:first-child, table th:first-child").addClass("first");
		/* For removing the last border */
		$("table td:last-child, table th:last-child").addClass("last");
});
</script>
<style type="text/css">
body {
	background-color: #03A9F4;
}
</style>
</head>

<body>
	<sql:setDataSource var="library_management_system"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/library_management_system" user="root"
		password="" />
		
<sql:query var="readers"
	dataSource="${library_management_system}">
SELECT * 
FROM	readers;
</sql:query>

	<form action="删除用户检查.jsp" method="post" name="delete">
		<input type="hidden" id="deleteid"  name="id"value="">
	</form>
	<div id="content">

		<table cellspacing="0">
			<tr>
				<th>读者号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>电话</th>
				<th>操作</th>
			</tr>
			<c:forEach var="row" items="${readers.rows}">
				<tr>
					<c:set var="readerid" value="${row.readerid}" />
					<c:set var="readername" value="${row.readername }" />
					<c:set var="readersex" value="${row.readersex }" />
					<c:set var="tel" value="${row.telephonenumber }" />
					<c:set var="id" value="${row.readerid }" />

					<td>${readerid}</td>
					<td>${readername}</td>
					<td>${readersex}</td>
					<td>${tel}</td>
					<td><a
						href="javascript:document.getElementById('deleteid').value='${id}';document.delete.submit();">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script
		src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/reader-admin/main.js"></script>
	<script src="js/reader-admin/modernizr.js"></script>
</body>

</html>