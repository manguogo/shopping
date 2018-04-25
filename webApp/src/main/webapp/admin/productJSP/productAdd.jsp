<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.ProductService" %>
<%@ page import="service.impl.ProductServiceImpl" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.Category" %>
<%@ page import="service.CategoryService" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page import="java.util.List" %>


<html>
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        String producthides = request.getParameter("producthides");
        ProductService ps = ProductServiceImpl.getProductService();
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        List<Category> categoryList =  cs.getCategories();

        if(producthides != null && producthides.equals("productAdd")){
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
    <link rel="stylesheet" href="../css/productSearch.css">
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
                                    <select name="categoryId">
                                        <%
                                            for(Category c : categoryList){
                                                String pre = "－－";
                                                for(int i = 0; i < c.getGrade()-1; i++){
                                                    pre += "－－";
                                                }
                                                if(c.getIsleaf()!=null && c.getIsleaf() == 0){

                                        %>
                                            <option value="<%=c.getId()%>" class="input3"   disabled><%=pre + c.getName()%></option>
                                        <%
                                                }else{
                                        %>
                                            <option value="<%=c.getId()%>" class="input3"  ><%=pre +c.getName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                                    <%--<input name="categoryId" type="text" class="input3"  />--%>


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