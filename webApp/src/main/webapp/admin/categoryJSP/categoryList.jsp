<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.CategoryService" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page import="entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>


<html>
<head>
    <jsp:include page="../commonJSP/common.jsp"/>
    <%
        List<Category> categoryList;
        Category category;
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        categoryList = cs.getCategories();
        String isleaf = null;
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
                <th>父类别</th>
                <th>类别名</th>
                <th>描述</th>
                <th>类别级别</th>
                <th>叶子节点</th>
            </tr>

            <%
                for(Iterator<Category> categoryIterator = categoryList.iterator(); categoryIterator.hasNext();){
                    category = categoryIterator.next();
                    if(category.getIsleaf() == 1){
                        isleaf = "是";
                    }else{
                        isleaf = "不是";
                    }

            %>
            <tr>
                <td><%=category.getId()%></td>
                <td><%=category.getPid()%></td>
                <td><%=category.getName()%></td>
                <td><%=category.getDesc()%></td>
                <td><%=category.getGrade()%></td>
                <td><%=isleaf%></td>
                <td>
                    <a href="categoryUpdate.jsp?id=<%=category.getId() %>">修改</a>
                    |
                    <a href="categoryRemove.jsp?id=<%=category.getId() %>&pid=<%=category.getPid()%>" name="userRemove">删除</a>
                    |
                    <a href="categoryAdd.jsp?id=<%=category.getId()%>&grade=<%=category.getGrade()%>&isleaf=<%=category.getIsleaf()%>&from=categoryList">增加子类别</a>
                </td>
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