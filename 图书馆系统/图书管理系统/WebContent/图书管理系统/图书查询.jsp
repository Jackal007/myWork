<%@ page import="FirstLetter.GetFirstLetter"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html lang="zh" class="no-js">
  
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='http://fonts.useso.com/css?family=Ubuntu:400,700' rel='stylesheet' type='text/css'>
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
<script src="js/reader-admin/modernizr.js"></script>
    <style type="text/css">body { background-color: #4BAF50; }</style>
    </head>
  
  <body>
  <sql:setDataSource var="library_management_system" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/library_management_system" user="root" password=""  />
	<%
	request.setCharacterEncoding("gbk");
	String search=request.getParameter("search");
	String readerid=request.getParameter("readerid");
	GetFirstLetter GFL = new GetFirstLetter();
	String firstLetter = GFL.getFirstLetter(search);
    %>
<sql:query dataSource="${library_management_system}" var="result">
		SELECT * FROM books WHERE titleFirstLetter like '%<%=firstLetter%>%';
</sql:query>
	<div id="content">

		<table cellspacing="0">
			<tr>
				<th>书名</th>
				<th>图书编号</th>
				<th>作者</th>
				<th>可借与否</th>
			</tr>

			<c:forEach var="row" items="${result.rows}">
				<tr>
					<c:set var="title" value="${row.title }" />
					<c:set var="bookid" value="${row.bookid }" />
					<c:set var="bookauthor" value="${row.bookauthor }" />
					<c:set var="state" value="${row.bookState }" />
					<td>${title }</td>
					<td>${bookid }</td>
					<td>${bookauthor }</td>
					<c:choose>	
						<c:when test="${state==1}">
							<td>可借</td>
						</c:when>
						<c:otherwise>
							<td>不可借</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>

	</div>
    <script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/reader-admin/main.js"></script>
    </body>

</html> 