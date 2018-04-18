<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="service.UserService" %>
<%@ page import="service.impl.UserServiceImpl" %>
<html>
<head>
    <title>用户删除页面</title>
</head>
<body>
    <%
        Integer id = Integer.parseInt(request.getParameter("id"));
        UserService us = new UserServiceImpl();
        us.remove(id);
        response.sendRedirect("tab.jsp");
    %>
</body>
</html>
