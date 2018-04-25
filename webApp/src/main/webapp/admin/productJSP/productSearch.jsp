<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="entity.Category" %>
<%@ page import="service.CategoryService" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page import="java.util.List" %>


<html>
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        List<Category> categoryList = cs.getCategories();


    %>
    <title>商品搜索</title>
    <link rel="stylesheet" type="text/css" href="../css/css.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script src="../js/productSearch.js"></script>

    <link rel="stylesheet" href="../css/productSearch.css">

</head>
<body>
<div id="pageAll">

    <div class="page">
        <!-- 商品搜索页面 -->
        <div class="banneradd bor">
            <div class="baTopNo">
                <span>商品搜索</span>
            </div>
            <div class="baBody">
                <table border="0">
                    <form action="productSearchRS.jsp"  onsubmit="check()">

                        <input type="hidden" name="producthides" id="hides" value="productSearch"   />
                        <%--根据商品价格查询--%>
                        <tr>
                            <td>
                                <div class="bbD">
                                    商品ID:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="id" id="id"  type="text" class="input3" onblur="intValedate()"/>
                                </div>

                            </td>
                            <td>
                                <div class="bbD">
                                    <span id="idSpan"></span>
                                </div>
                            </td>
                        </tr>
                        <%--根据商品名称查询--%>
                        <tr>
                            <td>
                                <div class="bbD">
                                    商品名称:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="name"  type="text" class="input3"  />
                                </div>
                            </td>
                        </tr>
                        <%--根据商品描述查询--%>
                      <%--  <tr>
                            <td>
                                <div class="bbD">
                                    商品描述:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="desc" type="text" class="input3"  value="<%=1%>" />
                                </div>
                            </td>
                        </tr>--%>
                        <%--根据商品价格查询--%>
                        <div>
                        <tr>
                            <td>

                                <div class="bbD">
                                    商品价格(市场价):
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="normalPriceS" id="normalPriceS" placeholder="请输入查询最小价格"  type="text"  class="input3" onblur="doubleValedate()" />
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    -<input name="normalPriceE" id="normalPriceE" placeholder="请输入查询最大价格"  type="text"  class="input3" onblur="doubleValedate()"  />
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <span id="normalPriceSpan"></span>
                                </div>
                            </td>
                        </tr>
                        </div>
                        <div>
                        <tr>
                            <td>

                                <div class="bbD">
                                    商品价格(会员价):
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="memberPriceS" id="memberPriceS" placeholder="请输入查询最小价格" type="text"  class="input3" onblur="doubleValedate()"  />
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    -<input name="memberPriceE" id="memberPriceE" placeholder="请输入查询最大价格"  type="text"  class="input3" onblur="doubleValedate()"/>
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <span id="memberPriceSpan"></span>
                                </div>
                            </td>
                        </tr>
                        </div>
                        <%--根据商品类别查询--%>
                        <div>
                        <tr>
                            <td>
                                <div class="bbD">
                                    商品类别:
                                </div>
                            </td>
                            <td colspan="2">
                                    <%
                                        for(Category c : categoryList){
                                            if(c.getPid() != null && c.getPid() == 0){
                                    %>
                                        <div class="bbD" >
                                            <label><input type="checkbox" name="categoryId"  value="<%=c.getId()%>"><%=c.getName()%></label>
                                        </div>
                                    <%
                                            }else {
                                    %>
                                        <span class="categorySearch" >
                                                <label><input type="checkbox" name="categoryId" value="<%=c.getId()%>"><%=c.getName()%></label>
                                        </span>
                                    <%
                                            }
                                        }
                                    %>

                            </td>
                        </tr>
                        </div>

                        <%--根据时间查询--%>
                        <div>
                        <tr>
                            <td>

                                <div class="bbD">
                                    商品上架时间:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="productPDateS" id="productPDateS" type="date" class="input3" onblur="dateValedate()" />
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    -<input name="productPDateE" id="productPDateE" type="date" class="input3" onblur="dateValedate()"/>
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <span id="productPdateSpan"></span>
                                </div>
                            </td>
                        </tr>
                        </div>
                        <tr>
                            <td colspan="2" >
                                <div class="bbD">
                                    <p class="bbDP">
                                        <button type="submit" class="btn_ok btn_yes">提交</button>
                                        <a class="btn_ok btn_no" href="productSearch.jsp">取消</a>
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