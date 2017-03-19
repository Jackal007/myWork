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
            <div class="crumb-list"><i class="icon-font"></i><a href="admin-welcome.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">订单查询</span>
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
        <div class="search-wrap">
            <div class="search-content">
                <form action="CusServlet?method=searchOrder" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="120">选择分类:</th>
                            <td>
                                <select name="type" id="type">
                                    <option value="全部" selected>全部</option>
                                    <option value="主食">主食</option>
                                    <option value="小吃">小吃</option>
                                    <option value="饮料">饮料</option>
                                </select>
                                <script>
                                	<% if(request.getAttribute("type")!=null){ %>
								  		 document.getElementById("type").value = "${ type }";
								  	<% }%>
								</script>
                            </td>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" type="text" value="${keywords}"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap" style="height:633px;">
            <form name="myform" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>店铺名称</th>
                            <th>顾客名称</th>
                            <th>菜品名称</th>
                            <th>菜品数量</th>
                            <th>菜品总价</th>
                            <th>菜品类型</th>
                            <th>下单时间</th>
                        </tr>
                        <c:forEach items="${ orderList }" var="result">
                        <tr>
                            <td>${ result.shopName }</td>  <!--客户ID-->
                            <td>${ result.customerName }</td> <!--客户名称-->
                            <td>${ result.dishName }</td> <!--客户密码-->
                            <td>${ result.quantity }</td> <!--客户电话-->
                            <td>${ result.totalPrice }</td> <!--客户收货地址-->
                            <td>${ result.dishType }</td> <!-- 菜品类型 -->
                            <td>${ result.dealTime }</td> <!--客户密保问题-->                       
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="list-page"> 
                    ${ orderNum }条 1/1 页
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>