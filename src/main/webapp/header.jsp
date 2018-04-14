<%@ page import="com.handsome.shop.bean.Customer" %>
<%@ page import="com.handsome.shop.framework.DaoFactory" %>
<%@ page import="com.handsome.shop.dao.OrdersDao" %>
<%@ page import="com.handsome.shop.dao.ShopCarDao" %>
<%--
  Created by IntelliJ IDEA.
  User: wangrongjun
  Date: 2017/6/18
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_content_footer.css">
</head>
<body>

<header>
    <a class="brand" href="${pageContext.request.contextPath}/">英俊商城</a>
    <div class="menu">
        <a href="${pageContext.request.contextPath}/">首页</a>
        <%
            Customer customer = (Customer) request.getSession().getAttribute("customer");
            if (customer == null) {
        %>
        <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
        <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
        <%
        } else {
            ShopCarDao shopCarDao = DaoFactory.getShopCarDao();
            long shopCarCount = shopCarDao.queryCountByCustomerId(customer.getCustomerId());
            OrdersDao ordersDao = DaoFactory.getOrdersDao();
            int ordersCount = ordersDao.queryCountByCustomerId(customer.getCustomerId());
        %>
        <a href="${pageContext.request.contextPath}/customer_info.jsp"><%=customer.getNickname()%>
        </a>
        <a href="${pageContext.request.contextPath}/shopCar/">我的购物车(<%=shopCarCount%>)</a>
        <a href="${pageContext.request.contextPath}/orders/">我的订单(<%=ordersCount%>)</a>
        <a href="${pageContext.request.contextPath}/logout">[退出登录]</a>
        <%
            }
        %>
    </div>
</header>

</body>
</html>
