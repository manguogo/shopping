<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.User" %>
<%@ page import="sun.nio.cs.US_ASCII" %>
<%@ page import="entity.Cart" %>
<%@ page import="service.SalesOrderService" %>
<%@ page import="service.impl.SalesOrderServiceImpl" %>
<html>
<head>
    <title>结算跳转</title>

    <%
        User user = (User)session.getAttribute("userBenQin");
        Cart cart = (Cart) session.getAttribute("cart");
        if (null != user && null != cart) {
            SalesOrderService so = SalesOrderServiceImpl.getSalesOrderService();
            so.addSalesOrder(cart, user);
            session.removeAttribute("cart");
        }
    %>
    <script>
        var c = 0;
        var time;
        window.onload = function (ev) {
            time = setInterval("jump()", 1000)
        }
        function jump() {
            document.getElementById("jump").innerText = c++;
            if(c > 3) {
                clearInterval(time);
                window.location.href = "productList.jsp";
            }
        }
    </script>
</head>
<body>
<div  align="center">
    购买成功,将在
    <span id="jump"></span>秒后<a href="productList.jsp">跳转</a>
</div>
</body>
</html>
