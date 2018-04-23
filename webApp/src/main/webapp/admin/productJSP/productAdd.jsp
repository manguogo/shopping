<%@ page import="service.ProductService" %>
<%@ page import="service.impl.ProductServiceImpl" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.Category" %>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>


<html>
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        String producthides = request.getParameter("producthides");
        if(producthides != null && producthides.equals("productAdd")){
            ProductService ps = ProductServiceImpl.getProductService();
            Product product = null;
            Category category = new Category();
            String name = request.getParameter("name");
            String strNP = request.getParameter("normalPrice");
            String strMP = request.getParameter("memberPrice");
            String strCID = request.getParameter("categoryId");
            Double normalPrice = 0.0;
            Double memberPrice = 0.0;
            Integer cid = null;
            if(null == name || null == strCID || name.equals("") || strCID.equals("")){
                response.sendRedirect("productAdd.jsp");
                return;
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
            ps.productAdd(product);
            response.sendRedirect("productList.jsp");
            return;
        }


    %>
    <title>增加商品类型</title>
    <link rel="stylesheet" type="text/css" href="../css/css.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div id="pageAll">

    <div class="page ">
        <!-- 商品增加页面 -->
        <div class="banneradd bor">
            <div class="baTopNo">
                <span>商品添加</span>
            </div>
            <div class="baBody">
                <table>
                    <form action="productAdd.jsp">

                        <input type="hidden" name="producthides" id="hides" value="productAdd"   />
                        <tr>
                            <td>
                                <div class="bbD">
                                    商品名称:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="name"  type="text" class="input3" />
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
                                    <input name="desc" type="text" class="input3"  />
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
                                    <input name="normalPrice"  type="text"  class="input3"  />
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
                                    <input name="memberPrice"  type="text" class="input3"  />
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
                                    <input name="categoryId" type="text" class="input3"  />
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