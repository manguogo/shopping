<%@ page import="service.CatetoryService" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>


<html>
<head>
    <%
        CatetoryService cs = new CategoryServiceImpl();
    %>
    <title></title>

    <link href="../css/haiersoft.css" rel="stylesheet" type="text/css" media="screen,print" />
    <link href="../css/print.css" rel="stylesheet" type="text/css"  media="print" />
    <script src="../js/jquery-1.10.1.min.js"></script>
    <script src="../js/side.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->


</head>

<body>


<!-- MainForm -->
<div id="MainForm">
    <div class="form_boxA">
        <h2>产品类别列表</h2>
        <table cellpadding="0" cellspacing="0">
            <tr>

                <th>ID</th>
                <th>类别名</th>
                <th>父类别</th>
                <th>描述</th>
                <th>类别级别</th>
            </tr>

            <%


            %>
            <tr>
                <td><%=1%></td>
                <td><%=1%></td>
                <td><%=1%></td>
                <td><%=1%></td>
                <td><%=1%></td>
                <td>
                    <a href="userUpdate.jsp?id=<%=1 %>">修改</a>
                    |
                    <a href="userRemove.jsp?id=<%=1 %>" name="userRemove">删除</a></td>
            </tr>
            <%

            %>


        </table>
        <p class="msg"></p>
    </div>
</div>
<!-- /MainForm -->

</body>
</html>