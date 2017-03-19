<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="zh">

<head>
<meta charset="UTF-8">
<title>删除图书检查</title>
<body>
<%
	request.setCharacterEncoding("gbk");
	String id = request.getParameter("id");
	Connection conn = null;
	Statement stat = null;
	//把MYSQL 的JDBC驱动类加载在内存中,只有加载了这个驱动类,才可以在JSP页面中建立与MYSQL建立连接;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	//连接本地数据库
	String url = "jdbc:mysql://localhost/library_management_system";
	String user = "root";
	String password = "";
	//通过驱动管理器取得一个与MYSQL数据库连接的对象
	conn = DriverManager.getConnection(url, user, password);
	//使用数据库连接对象conn来创建一个statement对象，可以执行SQL语句
	stat = conn.createStatement();
	//插入语句需注意一点：语句必须符合MYSQL语句语法标准，否则会失败
	String sql = "DELETE  FROM books WHERE bookID='"+id +"';";
	out.println(id);
	try {
		if (stat.executeUpdate(sql) == 0)
%>
				<script type="text/javascript">
					alert("删除图书成功！");
					window.location.href="删除图书.jsp";
				</script>
			<%
			}catch(SQLException e)
			{;%>
			<script type="text/javascript">
				alert("有读者已经借走了这本书，所以删除失败");
				window.location.href="删除图书.jsp";
			</script>
	<%
	 }
	//释放资源，释放前需先判断statement和connection两个对象是否为空，如果不为空则说明资源没有释放。就需要关闭占有数据库的对象statement和connection。
	if (stat != null) { stat.close(); } if (conn != null) { conn.close(); }
	%>
</body>