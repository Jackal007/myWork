<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="admin-welcome.jsp" class="navbar-brand">后台管理</a></h1>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font"></i>用户管理</a>
                    <ul class="sub-menu">
                        <li><a href="CusServlet?method=showCustomers"><i class="icon-font"></i>查看/修改用户</a></li>
                        <li><a href="admin-addUser.jsp"><i class="icon-font"></i>增加用户</a></li>
						<li><a href="CusServlet?method=showOrders"><i class="icon-font"></i>订单查询</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font"></i>商家管理</a>
                    <ul class="sub-menu">
                        <li><a href="SellerServlet?method=showSellers" ><i class="icon-font"></i>查看/修改商家</a></li>
						<li><a href="admin-addSeller.jsp"><i class="icon-font"></i>添加商家</a></li>
                        <li><a href="SellerServlet?method=showShops"><i class="icon-font"></i>商家审核</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="admin-index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">查看/修改商家</span>
            	<div style="float:right;"> 
       			<% 
				if(session.getAttribute("username")==null){
				   out.println("<a href='index.jsp'>未登录</a>");
				}else{
					String username = session.getAttribute("username").toString();
				   out.println("欢迎您，");
				   out.println(username);
				   out.println("<a href='LoginServlet?method=logOut'>注销</a>");
				}
				%>
				</div>
            </div>
        </div>
        <!-- mainFrame -->
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a href="admin-addSeller.jsp"><i class="icon-font"></i>新增商家</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>店家ID</th>
                            <th>店家名称</th>
                            <th>店家电话</th>  <!-- 商铺名||未申请商铺 -->
                            <th>密保问题</th>
                            <th>店铺ID</th>
                            <th>操作</th>  
                        </tr>
            
                        <c:forEach items="${ sellerList }" var="result">
                        <tr>
                            <td>${ result.sellerId }</td>  <!--店家ID-->
                            <td>${ result.sellerName }</td> <!--店家名称-->
                            <td>${ result.sellerTel	}</td> <!--店家电话-->
                            <td>${ result.sellerSQuestion }</td>
                            <td>${ result.shopId }</td> <!--店铺Id-->
                            <td>
                                <a class="link-update" href="SellerServlet?method=editSeller&sellerId=${ result.sellerId }">修改</a>
                                <a class="link-del" href="SellerServlet?method=delSeller&id=${ result.sellerId }" onclick="return confirm('确定要删除?')">删除</a>
                            </td>
                        </tr>
                        </c:forEach>
                     
                    </table>
                    
                </div>
                <div class="list-page"> 
                    	${ sellerNum }条 1/1 页
                    </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>

<% 
	if(request.getAttribute("delState")!=null && request.getAttribute("delState").toString().equals("true")){
		request.removeAttribute("delState");
		out.print("<script>alert('删除成功');</script>");
		}
	else if(request.getAttribute("delState")!=null && request.getAttribute("delState").toString().equals("false")){
		request.removeAttribute("delState");
		out.print("<script>alert('删除失败');</script>");
		}%>
<% 
	if(request.getAttribute("editSellerState")!=null && request.getAttribute("editSellerState").toString().equals("true")){
		request.removeAttribute("editSellerState");
		out.print("<script>alert('修改成功');</script>");
		}
	else if(request.getAttribute("editSellerState")!=null){
		request.removeAttribute("editSellerState");
		out.print("<script>alert('修改失败');</script>");
		}%>
</body>
</html>