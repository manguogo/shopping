<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.CategoryService" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page import="entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="entity.Product" %>
<%@ page import="service.ProductService" %>
<%@ page import="service.impl.ProductServiceImpl" %>


<html>
<head>

    <%
        request.setCharacterEncoding("UTF-8");
        ProductService ps = ProductServiceImpl.getProductService();
        Integer pageSize = 5;
        Integer pageNum  = 1;
        Integer pageCount = ps.getPageCount(pageSize);
        String requestPage = request.getParameter("page");
        if (requestPage == null || requestPage.equals("")) {
            pageNum = 1;
        }
        if (requestPage != null && !requestPage.equals("")) {
            pageNum = Integer.parseInt(request.getParameter("page"));
            if(pageNum < 1){
                pageNum = 1;
            }
            if (pageNum > pageCount){
                pageNum = pageCount;
            }
        }
        List<Product> products = ps.getAllProducts(pageSize, pageNum);
        Product product = null;
    %>
    <title></title>

    <link href="../css/haiersoft.css" rel="stylesheet" type="text/css" media="screen,print" />
    <link href="../css/print.css" rel="stylesheet" type="text/css"  media="print" />
    <script src="../js/jquery-1.10.1.min.js"></script>
    <script src="../js/side.js" type="text/javascript"></script>
    <script src="../js/productSearch.js"></script>

    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->


</head>

<body>
<h2>产品列表</h2>

<!-- MainForm -->
<div id="MainForm">
    <div class="form_boxA">
        <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>

                    <th>产品ID</th>
                    <th>产品名称</th>
                    <th>产品市场价</th>
                    <th>产品会员价</th>
                    <th>产品类别</th>
                    <th>产品描述</th>
                    <th>产品上架时间</th>

                </tr>
            </thead>
            <tfoot>
                <tr>

                    <td colspan="7">
                        <span>第<%=pageNum%>页</span>&emsp;
                        <a href="productList.jsp?page=1">首页</a>&emsp;
                        <a href="productList.jsp?page=<%=pageNum - 1 %>">上一页</a>&emsp;
                        <a href="productList.jsp?page=<%=pageNum + 1 %>">下一页</a>&emsp;
                        <a href="productList.jsp?page=<%=pageCount%>">尾页</a>&emsp;&emsp;
                        <span>共<%=pageCount %>页</span>&emsp;
                        <span>
                            <button type="button" onclick="jump()">跳转</button>
                            至&nbsp;<input type="text" name="page" id="page">
                        </span>&emsp;
                    </td>

                </tr>
            </tfoot>
            <%
                for(Iterator<Product> productIterator = products.iterator(); productIterator.hasNext();){
                    product = productIterator.next();

            %>
            <tr>
                <td><%=product.getId()%></td>
                <td><%=product.getName()%></td>
                <td><%=product.getNormalPrice()%></td>
                <td><%=product.getMemberPrice()%></td>
                <td><%=product.getCategory().getId()%></td>
                <td><%=product.getDesc()%></td>
                <td><%=product.getPdate().toLocalDateTime()%></td>
                <td>
                    <a href="productUpdate.jsp?id=<%=product.getId() %>">修改</a>
                    |
                    <a href="productRemove.jsp?id=<%=product.getId() %>" name="userRemove">删除</a>
                </td>
            <%
                }
            %>
            </tr>
            <tr>


            </tr>
        </table>

        <p class="msg"></p>
    </div>
</div>
<!-- /MainForm -->

</body>
</html>