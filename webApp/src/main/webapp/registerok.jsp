
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>注册成功</title>
</head>
<body>
    恭喜你,注册成功!<br>
    <%=request.getParameter("username") %>  <br>
    <%=request.getParameter("password") %>
</body>
</html>
