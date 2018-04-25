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


<html>
<head>

    <%
        request.setCharacterEncoding("UTF-8");
        String datafrom = request.getParameter("producthides");
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        List<Product> products = null;
        List<Category> categoryList = cs.getCategories();

        if(null != datafrom && datafrom.equals("productSearch")){
            ProductService ps = ProductServiceImpl.getProductService();
            String strid = request.getParameter("id");
            String strName = request.getParameter("name");
            String strNormalPriceS = request.getParameter("normalPriceS");
            String strNormalPriceE = request.getParameter("normalPriceE");
            String strMemberPriceS = request.getParameter("memberPriceS");
            String strMemberPriceE = request.getParameter("memberPriceE");
            String strProductPDateS = request.getParameter("productPDateS");
            String strProductPDateE = request.getParameter("productPDateE");
            String[] strCategoryIds = request.getParameterValues("categoryId");

            Integer[] ids = null;
            String[] names = null;
            Double normalPriceS = null;
            Double normalPriceE = null;
            Double memberPriceS = null;
            Double memberPriceE = null;
            Timestamp productPDateS = null;
            Timestamp productPDateE = null;
            Integer[] categoryIds = null;

            if (strid != null && !strid.equals("")) {
                String[] idArray = strid.split(" +");
                ids  = new Integer[idArray.length];
                for(int i = 0; i < idArray.length; i++) {
                    try {
                        ids[i] = Integer.parseInt(idArray[i]);
                    } catch (Exception e) {
                        response.sendRedirect("productSearch.jsp");
                    }
                    System.out.println(ids[i]);
                }
            }
            if (null != strName && !strName.equals("")) {
                names = strName.split(" +");
            }
            if (null != strNormalPriceS && !strNormalPriceS.equals("")) {
                normalPriceS = Double.parseDouble(strNormalPriceS);
            }
            if (null != strNormalPriceE && !strNormalPriceE.equals("")) {
                normalPriceE = Double.parseDouble(strNormalPriceE);
            }
            if (null != strMemberPriceS && !strMemberPriceS.equals("")) {
                memberPriceS = Double.parseDouble(strMemberPriceS);
            }
            if (null != strMemberPriceE && !strMemberPriceE.equals("")) {
                memberPriceE = Double.parseDouble(strMemberPriceE);
            }
            if (null != strProductPDateS && !strProductPDateS.equals("")) {
                productPDateS = Common.stringToTimestamp(strProductPDateS);
            }
            if (null != strProductPDateE && !strProductPDateE.equals("")) {
                productPDateE = Common.stringToTimestamp(strProductPDateE);
            }
            if (null != strCategoryIds) {
                categoryIds = new Integer[strCategoryIds.length];
                for (int i = 0; i < strCategoryIds.length; i++) {
                    categoryIds[i] = Integer.parseInt(strCategoryIds[i]);
                }
            }
            products = ps.searchProducts( ids, names,
                    normalPriceS, normalPriceE,
                    memberPriceS, memberPriceE,
                    productPDateS, productPDateE,
                    categoryIds);

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
            <tr>

                <th>产品ID</th>
                <th>产品名称</th>
                <th>产品市场价</th>
                <th>产品会员价</th>
                <th>产品类别</th>
                <th>产品描述</th>
                <th>产品上架时间</th>
            </tr>

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
                <td><%=product.getPdate().toLocalDateTime()%></td>
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