<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	request.setCharacterEncoding("gbk");
	String id=request.getParameter("userid");
	String password=request.getParameter("password");
	String readeroradmin=request.getParameter("readeroradmin");
%>
<sql:setDataSource var="library_management_system" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/library_management_system" user="root" password="" />
	
	<c:set var="rora" value="<%=readeroradmin%>" />
	<c:set var="reader" value="����" />
	<c:set var="admin" value="����Ա" />
	
 <c:choose>	
	<c:when test="${rora==reader}">
		<form action="����.jsp" method="post"  name="pass">
			<input type="hidden" name="id" value="<%=id%>">
		</form>
		<sql:query dataSource="${library_management_system}" var="result">
		SELECT * FROM readers WHERE readerID='<%=id%>';
		</sql:query>
		<c:forEach var="row" items="${result.rows}">
	<c:set var="pw" value="${row.readerpassword}" />
	</c:forEach>
		<c:set var="enterpw" value="<%=password %>" />
		<c:choose>
			<c:when test="${pw == enterpw}">
				<script type="text/javascript">
					document.write("���ڵ��룬���Ժ󡤡���������������������������");
				    document.pass.submit();
				</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">    
				    alert("�û��������������");
				    window.history.back(-1);
				</script>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:when test="${rora==admin}">
		<form action="����Ա.jsp" method="post"  name="pass">
			<input type="hidden" name="id" value="<%=id%>">
		</form>
		<sql:query dataSource="${library_management_system}" var="result">
		SELECT * FROM admins WHERE adminID='<%=id%>';
		</sql:query>
		<c:forEach var="row" items="${result.rows}">
			<c:set var="pw" value="${row.adminpassword}" />
		</c:forEach>
		<c:set var="enterpw" value="<%=password %>" />
		<c:choose>
			<c:when test="${pw == enterpw}">
				<script type="text/javascript">
					document.write("���ڵ��룬���Ժ󡤡���������������������������");
				    document.pass.submit();
				</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">    
				    alert("�û��������������");
				    window.history.back(-1);
				</script>
			</c:otherwise>
		</c:choose>
	</c:when>
</c:choose>


