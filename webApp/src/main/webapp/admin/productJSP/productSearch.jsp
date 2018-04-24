<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.ProductService" %>
<%@ page import="service.impl.ProductServiceImpl" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.Category" %>
<%@ page import="java.sql.Timestamp" %>


<html>
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        String datafrom = request.getParameter("producthides");
        if(null != datafrom && datafrom.equals("productSearch")){
            String strid = request.getParameter("id");
            String strName = request.getParameter("name");
            String strNormalPriceS = request.getParameter("normalPriceS");
            String strNormalPriceE = request.getParameter("normalPriceE");
            String strMemberPriceS = request.getParameter("memberPriceS");
            String strMemberPriceE = request.getParameter("memberPriceE");
            String strProductPDateS = request.getParameter("productPDateS");
            String strProductPDateE = request.getParameter("productPDateS");


            Integer[] ids = null;
            String[] names = null;
            Double normalPriceS = null;
            Double normalPriceE = null;
            Double memberPriceS = null;
            Double memberPriceE = null;
            Timestamp productPDateS = null;
            Timestamp productPDateE = null;




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
                productPDateS = Timestamp.valueOf(strProductPDateS);
            }
            if (null != strProductPDateE && !strProductPDateE.equals("")) {
                productPDateE = Timestamp.valueOf(strProductPDateE);
            }


            response.sendRedirect("productSearch.jsp");
            return;
        }



    %>
    <title>商品搜索</title>
    <link rel="stylesheet" type="text/css" href="../css/css.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script src="../js/productSearch.js"></script>

    <style>
        td {
            border:0px;
        }
    </style>
</head>
<body>
<div id="pageAll">

    <div class="page ">
        <!-- 商品搜索页面 -->
        <div class="banneradd bor">
            <div class="baTopNo">
                <span>商品搜索</span>
            </div>
            <div class="baBody">
                <table border="0">
                    <form action="productSearch.jsp">

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
                        <%--根据商品类别查询--%>
                        <tr>
                            <td>

                                <div class="bbD">
                                    商品类别:
                                </div>
                            </td>
                            <td>
                                <div class="bbD">
                                    <input name="categoryId" type="text" class="input3" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                        <%--根据时间查询--%>
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