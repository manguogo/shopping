<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.UserService" %>
<%@ page import="service.impl.UserServiceImpl" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <%@include file="commonJSP/common.jsp"%>
    <%
        UserService us = new UserServiceImpl();
        User user = null;
        User[] users = us.allUsers();

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
        for(int i = 0; i < users.length; i++){
            user = users[i];
     %>
    <tr>
        <td><%=user.getId()%></td>
        <td><%=user.getUserName()%></td>
        <td><%=user.getPhone()%></td>
        <td><%=user.getAddr()%></td>
        <td><%=user.getDateTime()%></td>
        <td>
            <a href="userUpdate.jsp?id=<%=user.getId() %>">修改</a>
            |
            <a href="userRemove.jsp?id=<%=user.getId() %>" name="userRemove">删除</a></td>
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