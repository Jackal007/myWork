<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="zh" class="no-js">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>当前借阅</title>
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
	background-color: #9ACD32;
}
</style>
</head>

<body>
	<%
		request.setCharacterEncoding("gbk");
		String id = request.getParameter("id");
	%>
	<sql:setDataSource var="library_management_system"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/library_management_system" user="root"
		password="" />
		
<sql:query var="result_rentInfo_present" dataSource="${library_management_system}">
SELECT rentInfo.*,books.*
FROM	rentInfo,books
WHERE rentInfo.bookID=books.bookID AND rentInfo.rentState=1 AND rentInfo.readerID='<%=id%>';
</sql:query>

	<div id="content">

		<table cellspacing="0">
			<tr>
				<th>书名</th>
				<th>图书编号</th>
				<th>作者</th>
				<th>借书日期</th>
				<th>应还日期</th>
			</tr>

			<c:forEach var="row" items="${result_rentInfo_present.rows}">
				<tr>
					<c:set var="bookName" value="${row.bookname }" />
					<c:set var="bookid" value="${row.bookid }" />
					<c:set var="bookauthor" value="${row.bookauthor }" />
					<c:set var="rentTime" value="${row.rentDate }" />
					<c:set var="deadline" value="${row.deadline }" />
					<td>${bookName }</td>
					<td>${bookid }</td>
					<td>${bookauthor }</td>
					<td>${rentTime}</td>
					<td>${deadline}</td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<script	src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/reader-admin/main.js"></script>
	<script src="js/reader-admin/modernizr.js"></script>
	
</body>

</html>