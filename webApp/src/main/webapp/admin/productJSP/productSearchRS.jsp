<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.CategoryService" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page import="entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="entity.Product" %>
<%@ page import="service.ProductService" %>
<%@ page import="service.impl.ProductServiceImpl" %>
<%@ page import="util.Common" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="productSearchTD.ProductSearch" %>


<html>
<head>

    <%
        request.setCharacterEncoding("UTF-8");
        //验证提交数据来源
        String datafrom = request.getParameter("producthides");
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        List<Product> products = null;
        List<Category> categoryList = cs.getCategories();

        //分页代码-1开始
        ProductService ps = ProductServiceImpl.getProductService();
        Integer pageSize = 5;
        Integer pageNum  = 1;
        //传递查询参数
        String parameters = "";
        String requestPage = request.getParameter("page");
        if (requestPage == null || requestPage.equals("")) {
            pageNum = 1;
        }
        if (requestPage != null && !requestPage.equals("")) {
            pageNum = Integer.parseInt(request.getParameter("page"));
            if(pageNum < 1){
                pageNum = 1;
            }
            if (pageNum > Product.pageCount){
                pageNum = Product.pageCount;
            }
        }
        //分页代码-1结束

        if(null != datafrom && datafrom.equals("productSearch")){
            //处理客户端发出的请求
            String strid = request.getParameter("id");
            String strName = request.getParameter("name");
            String strNormalPriceS = request.getParameter("normalPriceS");
            String strNormalPriceE = request.getParameter("normalPriceE");
            String strMemberPriceS = request.getParameter("memberPriceS");
            String strMemberPriceE = request.getParameter("memberPriceE");
            String strProductPDateS = request.getParameter("productPDateS");
            String strProductPDateE = request.getParameter("productPDateE");
            //jsp接收checkbox使用getParameterValues()方法
            String[] strCategoryIds = request.getParameterValues("category");
            ProductSearch productSearchCondition = null;

            //当页面提交到自身时给予一个身份标识
            parameters += "producthides=productSearch";

            Integer[] ids = null;
            String[] names = null;
            Double normalPriceS = null;
            Double normalPriceE = null;
            Double memberPriceS = null;
            Double memberPriceE = null;
            Timestamp productPDateS = null;
            Timestamp productPDateE = null;
            Integer[] category = null;


            if (strid != null && !strid.equals("")) {
                String[] idArray = strid.split(" +");
                ids  = new Integer[idArray.length];
                for(int i = 0; i < idArray.length; i++) {
                    try {
                        ids[i] = Integer.parseInt(idArray[i]);
                    } catch (Exception e) {
                        response.sendRedirect("productSearch.jsp");
                        return;
                    }

                    parameters += "&id=" + ids[i];

                }
            }
            if (null != strName && !strName.equals("")) {
                names = strName.split(" +");
                parameters += "&name=" + strName;

            }
            if (null != strNormalPriceS && !strNormalPriceS.equals("")) {
                try {
                    normalPriceS = Double.parseDouble(strNormalPriceS);
                    parameters += "&normalPriceS=" + normalPriceS;
                } catch (Exception e) {
                    response.sendRedirect("productSearch.jsp");
                    return;
                }
            }
            if (null != strNormalPriceE && !strNormalPriceE.equals("")) {
                try {
                    normalPriceE = Double.parseDouble(strNormalPriceE);
                    parameters += "&normalPriceE=" + normalPriceE;
                } catch (Exception e) {
                    response.sendRedirect("productSearch.jsp");
                    return;
                }
            }
            if (null != strMemberPriceS && !strMemberPriceS.equals("")) {
                try {
                    memberPriceS = Double.parseDouble(strMemberPriceS);
                    parameters += "&memberPriceS=" + memberPriceS;
                }catch (Exception e) {
                    response.sendRedirect("productSearch.jsp");
                    return;
                }
            }
            if (null != strMemberPriceE && !strMemberPriceE.equals("")) {
                try {
                    memberPriceE = Double.parseDouble(strMemberPriceE);
                    parameters += "&memberPriceE=" + memberPriceE;
                }catch (Exception e) {
                    response.sendRedirect("productSearch.jsp");
                    return;
                }

            }
            if (null != strProductPDateS && !strProductPDateS.equals("")) {
                productPDateS = Common.stringToTimestamp(strProductPDateS);
                parameters += "&productPDateS=" + strProductPDateS;
            }
            if (null != strProductPDateE && !strProductPDateE.equals("")) {
                productPDateE = Common.stringToTimestamp(strProductPDateE);
                parameters += "&productPDateE=" + strProductPDateE;
            }
            if (null != strCategoryIds) {
                category = new Integer[strCategoryIds.length];
                for (int i = 0; i < strCategoryIds.length; i++) {
                    category[i] = Integer.parseInt(strCategoryIds[i]);
                    parameters += "&category=" + category[i];
                }
            }
            //封装查询条件
            productSearchCondition  = new ProductSearch(ids, names,
                    normalPriceS, normalPriceE,
                    memberPriceS, memberPriceE,
                    productPDateS, productPDateE,
                    category);
            products = ps.searchProducts(productSearchCondition,  pageNum, pageSize);

        }



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
        <h2>产品搜索结果</h2>
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
                    <a href="productSearchRS.jsp?page=1&<%=parameters%>">首页</a>&emsp;
                    <a href="productSearchRS.jsp?page=<%=pageNum - 1 %>&<%=parameters%>">上一页</a>&emsp;
                    <a href="productSearchRS.jsp?page=<%=pageNum + 1 %>&<%=parameters%>">下一页</a>&emsp;
                    <a href="productSearchRS.jsp?page=<%=Product.pageCount%>&<%=parameters%>">尾页</a>&emsp;&emsp;
                    <span>共<%=Product.pageCount%>页</span>&emsp;
                    <span>
                            <button type="button" onclick="jump()">跳转</button>
                            至&nbsp;<input type="text" name="page" id="page">
                        </span>&emsp;
                </td>

            </tr>
            </tfoot>

            <%
                Product product = null;
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
                <td><%=product.getPdate()%></td>
                <td>
                    <a href="productUpdate.jsp?id=<%=product.getId() %>">修改</a>
                    |
                    <a href="productRemove.jsp?id=<%=product.getId() %>" name="userRemove">删除</a>
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