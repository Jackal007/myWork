<%@ page import="FirstLetter.GetFirstLetter"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="zh">

<head>
<meta charset="UTF-8">
<title>����ͼ����</title>
<body>
	<%
		GetFirstLetter GFL = new GetFirstLetter();
  		String title=request.getParameter("bookname");
  		String firstLetter = GFL.getFirstLetter(title);
		String id=request.getParameter("bookid");
		String type=request.getParameter("booktype");
		String author=request.getParameter("bookauthor");
		String price=request.getParameter("bookprice");
		String enterdate="2016-5-30";
			Connection conn=null;
			  Statement stat=null;
			  //��MYSQL ��JDBC������������ڴ���,ֻ�м��������������,�ſ�����JSPҳ���н�����MYSQL��������;
			  Class.forName("com.mysql.jdbc.Driver").newInstance();
			  //���ӱ������ݿ�
			  String url="jdbc:mysql://localhost/library_management_system";
			  String user="root";
			  String password="";
			  //ͨ������������ȡ��һ����MYSQL���ݿ����ӵĶ���
			  conn=DriverManager.getConnection(url,user,password);
			  //ʹ�����ݿ����Ӷ���conn������һ��statement���󣬿���ִ��SQL���
			  stat=conn.createStatement();
			 // String sql="insert into jsptest.student(id,name,age,gender)values('44','dd','26','M','guangsi')";
			
			//���������ע��һ�㣺���������MYSQL����﷨��׼�������ʧ��
			String sql = "insert into books values('"+title+"', '"+id+"','"+type+"','"+author+"','"+enterdate+"',1,'"+price+"','"+firstLetter+"');                    ";
			try{
				if (stat.executeUpdate(sql) >= 0)%>
				<script type="text/javascript">
					alert("���ͼ��ɹ���");
					window.location.href="����Ա.jsp";
				</script>
			<%
			}catch(SQLException e)
			{;%>
			<script type="text/javascript">
				alert("��Ǹ������ظ���");
				 window.history.back(-1);
			</script>
	<%
	 }
	//�ͷ���Դ���ͷ�ǰ�����ж�statement��connection���������Ƿ�Ϊ�գ������Ϊ����˵����Դû���ͷš�����Ҫ�ر�ռ�����ݿ�Ķ���statement��connection��
	if (stat != null) { stat.close(); } if (conn != null) { conn.close(); }
	%>
</body>