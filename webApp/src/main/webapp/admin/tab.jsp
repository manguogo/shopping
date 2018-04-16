<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.UserService" %>
<%@ page import="service.impl.UserServiceImpl" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>

<html>
<head>
    <%
        UserService us = new UserServiceImpl();
        Set<User> users = us.allUsers();
        User user = null;

        Iterator<User> userIterator = users.iterator();
    %>
<title></title>

<link href="css/haiersoft.css" rel="stylesheet" type="text/css" media="screen,print" />
<link href="css/print.css" rel="stylesheet" type="text/css"  media="print" />
<script src="js/jquery-1.10.1.min.js"></script>
<script src="js/side.js" type="text/javascript"></script>

<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->


</head>

<body>


<!-- MainForm -->
<div id="MainForm">
<div class="form_boxA">
<h2>.....</h2>
<table cellpadding="0" cellspacing="0">
<tr>

    <th>ID</th>
    <th>用户名</th>
    <th>电话</th>
    <th>地址</th>
    <th>注册日期</th>
    <th>操作</th>
</tr>

    <%
        while (userIterator.hasNext()){
            user = userIterator.next();
     %>
    <tr>
        <td><%=user.getId()%></td>
        <td><%=user.getUserName()%></td>
        <td><%=user.getPhone()%></td>
        <td><%=user.getAddr()%></td>
        <td><%=user.getDateTime()%></td>
        <td><a href="userUpdate.jsp?id=<%=user.getId() %>">修改</a> | <a href="#">删除</a></td>
    </tr>
     <%
        }
     %>


</table>
<p class="msg"></p>
</div>
</div>
<!-- /MainForm -->

</body>
</html>