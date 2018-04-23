<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.ProductService" %>
<%@ page import="service.impl.ProductServiceImpl" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.Category" %>


<html>
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        String strid = request.getParameter("id");
        Product p = new Product();
        ProductService ps = ProductServiceImpl.getProductService();
        String productUpdateHide = request.getParameter("producthides");

        //如果修改后的页面提交,修改已提交的信息
        if(null != productUpdateHide && productUpdateHide.equals("productUpdate")){
            Product product = null;
            Category category = new Category();
            String strHideId = request.getParameter("hideId");
            Integer hideId = null;
            String name = request.getParameter("name");
            String strNP = request.getParameter("normalPrice");
            String strMP = request.getParameter("memberPrice");
            String strCID = request.getParameter("categoryId");
            Double normalPrice = 0.0;
            Double memberPrice = 0.0;
            Integer cid = null;
            if(null == strHideId || null == name || null == strCID || name.equals("") || strCID.equals("")){
                response.sendRedirect("productAdd.jsp");
                return;
            }
            if(null != strHideId && !strHideId.equals("")){
                hideId = Integer.parseInt(strHideId);
            }
            if(strNP != null){
                normalPrice = Double.parseDouble(strNP);
            }
            if(strMP != null){
                memberPrice = Double.parseDouble(strMP);
            }
            if(strCID != null) {
                cid = Integer.parseInt(strCID);
            }
            category.setId(cid);
            product = new Product(request.getParameter("name"), request.getParameter("desc"),
                    normalPrice, memberPrice, category);
            product.setId(hideId);
            ps.updateProduct(product);
            response.sendRedirect("productList.jsp");
            return;
        }
        //如果从是list页面提交过来的产品,则查询此产品的相关信息
        if (null != strid && !strid.equals("")) {
            Integer id = Integer.parseInt(strid);
//            System.out.println(id);
            p = ps.getAProduct(id);
        }

    %>
    <title>商品修改</title>
    <link rel="stylesheet" type="text/css" href="../css/css.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div id="pageAll">

    <div class="page ">
        <!-- 商品修改页面 -->
        <div class="banneradd bor">
            <div class="baTopNo">
                <span>商品修改</span>
            </div>
            <div class="baBody">
                <table>
                    <form action="productUpdate.jsp">

                        <input type="hidden" name="producthides" id="hides" value="productUpdate"   />
                        <input type="hidden" name="hideId" value="<%=p.getId()%>">
                        <tr>
                            <td>
                                <div class="bbD">
                                    商品ID:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="id"  type="text" class="input3" value="<%=p.getId()%>" readonly/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="bbD">
                                    商品名称:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="name"  type="text" class="input3" value="<%=p.getName()%>" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="bbD">
                                    商品描述:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="desc" type="text" class="input3"  value="<%=p.getDesc()%>" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <div class="bbD">
                                    商品市场价:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="normalPrice"  type="text"  class="input3"  value="<%=p.getNormalPrice()%>" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <div class="bbD">
                                    商品会员价:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="memberPrice"  type="text" class="input3" value="<%=p.getMemberPrice()%>" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <div class="bbD">
                                    商品类别:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="categoryId" type="text" class="input3" value="<%=p.getCategory().getId()%>" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                        <tr>
                            <td>

                                <div class="bbD">
                                    商品上架时间:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="productPDate" type="text" class="input3" value="<%=p.getPdate().toLocalDateTime()%>" readonly />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" >
                                <div class="bbD">
                                    <p class="bbDP">
                                        <button type="submit" class="btn_ok btn_yes">提交</button>
                                        <a class="btn_ok btn_no" href="productList.jsp">取消</a>
                                    </p>
                                </div>
                            </td>
                        </tr>
                    </form>
                </table>
            </div>
        </div>

    </div>
</div>

</body>
</html>