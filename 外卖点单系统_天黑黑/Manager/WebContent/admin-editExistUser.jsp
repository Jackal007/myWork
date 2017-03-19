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
            <div class="crumb-list"><i class="icon-font"></i><a href="admin-welcome.jsp">首页</a><span class="crumb-step">&gt;</span><span>修改用户信息</span>
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
        <div class="result-wrap">
            <div class="result-content">
                <form action="CusServlet?method=editCommit" method="POST">
                	<input type="hidden" name="customerId" value="${ customer.cusId }"/>
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                              <th width="120"><i class="require-red">*</i>用户名：</th>
                               <td>
                                    <input class="common-text required" placeholder="${ customer.cusName }" value="${ customer.cusName }" id="user" name="user" size="50" type="text"/>
                               </td>
                            </tr>
                            <tr>
                              <th width="120">是否重置客户密码</th>
                               <td>
                                    <input id="yes" value="yes" name="pwdReset" size="50" type="radio" checked/>
                                    <label for="yes">是</label>
                                    &nbsp;&nbsp;&nbsp;
                                    <input id="no" value="no" name="pwdReset" size="50" type="radio"/>
                                    <label for="no">否</label>
                               </td>
                            </tr>
                            <tr>
                              <th width="120"><i class="require-red">*</i>联系电话：</th>
                               <td>
                                    <input class="common-text required" placeholder="${ customer.cusTele }" value="${ customer.cusTele }" id="tele" name="tele" size="50" type="text"/>
                               </td>
                            </tr>
                            <tr>
                              <th width="120">收货地址：</th>
                               <td>
                                    <input class="common-text required" placeholder="${ customer.cusAddr }" value="${ customer.cusAddr }" id="addr" name="addr" size="50" type="text"/>
                               </td>
                            </tr>
           					 <tr>
                                <th>密保问题：</th>
                                <td>
                                    <label>${ customer.cusSQuestion }</label>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="修改" type="submit" onclick="return confirm('确定要修改?')">
                                    <input class="btn btn6" value="取消" type="button" onclick="javascript:location.href='CusServlet?method=showCustomers'">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>

</body>
</html>