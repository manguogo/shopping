
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.UserService" %>
<%@ page import="entity.User" %>
<%@ page import="service.impl.UserServiceImpl" %>
<html>
<head>
    <title>Title</title>
    <%
        request.setCharacterEncoding("utf-8");
        UserService us = new UserServiceImpl();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");
        User user = new User();
        user.setUserName(username);
        user.setPassword(password);
        user.setPhone(phone);
        user.setAddr(addr);
        //us.add(user);

    %>
</head>
<body>
    注册成功!
    <%=username %>
    <%=password %>
    <%=phone %>
    <%=addr%>

</body>
</html>
