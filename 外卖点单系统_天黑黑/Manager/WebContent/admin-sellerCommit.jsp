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
            <div class="crumb-list"><i class="icon-font"></i><a href="admin-welcome.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">商家审核</span>
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
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                       	 	<th>店铺ID</th>
                            <th>店铺名称</th>
                            <th>店铺电话</th>
                            <th>主营类型</th>
                            <th>店铺地址</th>
                            <th>是否有营业执照</th>
                            <th>店铺描述</th> 
                            <th>店铺公告</th>
                            <th>店铺状态</th> 
                            <th>操作</th>  
                        </tr>
                        <c:forEach items="${ shopList }" var="result">
                        <tr>
                        	<td>${ result.shopId }</td>
                            <td>${ result.shopName }</td> <!--店家名称-->
                            <td>${ result.shopTel }</td>
                            <td>${ result.mainType }</td>
                            <td>${ result.shopAddr }</td>
                            <td>${ result.shopLicense }</td>
                            <td>${ result.shopDesc }</td> <!--店家密码-->
                            <td>${ result.shopNotice }</td> <!--店家电话-->
                            <td>${ result.shopState }</td> <!--店铺电话-->
                            <td>
                                <a class="link-update" href="SellerServlet?method=applyPass&shopId=${ result.shopId }">通过</a>
                                <a class="link-del" href="SellerServlet?method=applyReject&shopId=${ result.shopId }">驳回</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="list-page"> 
                    ${ shopNum } 条 1/1 页
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>