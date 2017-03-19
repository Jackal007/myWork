<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="zh" class="no-js">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>查看图书</title>
<link href='http://fonts.useso.com/css?family=Ubuntu:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/reader-admin/reset.css">
<link rel="stylesheet" href="css/reader-admin/style.css">
<link href="css/reader-admin/table.css" rel="stylesheet" type="text/css"> 
<script type="text/javascript">
 $(function() {
        $("table tr:nth-child(odd)").addClass("odd-row");
		$("table td:first-child, table th:first-child").addClass("first");
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

	<sql:query var="books" dataSource="${library_management_system}">
SELECT * 
FROM	books;
</sql:query>

	<form action="删除图书检查.jsp" method="post" name="delete">
		<input type="hidden"  id="deleteid"  name="id" value="">
	</form>
	
	<div id="content">

		<table cellspacing="0">
			<tr>
				<th>图书编号</th>
				<th>书名</th>
				<th>类别</th>
				<th>作者</th>
				<th>价格</th>
				<th>操作</th>
			</tr>

			<c:forEach var="row" items="${books.rows}">
				<tr>
				<c:set var="title" value="${row.title }" />
				<c:set var="type" value="${row.booktype }" />
				<c:set var="author" value="${row.bookauthor }" />
				<c:set var="price" value="${row.bookprice}" />
				<c:set var="id" value="${row.bookid }" />
					<td>${id }</td>
					<td>${title }</td>
					<td>${type }</td>
					<td>${author }</td>
					<td>${price}</td>
					<td><a href="javascript:document.getElementById('deleteid').value='${id}';document.delete.submit();">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script
		src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/reader-admin/main.js"></script>
	<script src="js/reader-admin/modernizr.js"></script>
	<script >
	</script>
	
</body>

</html>