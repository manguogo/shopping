<%@ page import="service.CategoryService" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page import="entity.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>

    <link rel="stylesheet" type="text/css" href="../css/css.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <%@include file="common.jsp"%>
    <%
        request.setCharacterEncoding("utf-8");
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        Category category = new Category();
        String strid = request.getParameter("id");
        String categoryhides = request.getParameter("categoryhides");
        if( null != categoryhides && categoryhides.equals("categoryUpdate")){
            if(strid == null && strid.trim().equals("")){
                response.sendRedirect("categoryList.jsp");
                return;
            }
            category.setId(Integer.parseInt(request.getParameter("id")));
            category.setName(request.getParameter("name"));
            category.setDesc(request.getParameter("desc"));
            cs.updateCategory(category);
            response.sendRedirect("categoryList.jsp");
            return;
        }
        if(strid != null && !strid.trim().equals("")) {
            category.setId(Integer.parseInt(strid));
            category = cs.findACategory(category);
        }

    %>

    <title>类别修改</title>
</head>
<body>
<div id="pageAll">

    <div class="page ">
        <!-- 类别修改页面 -->
        <div class="banneradd bor">
            <div class="baTopNo">
                <span>商品类别修改</span>
            </div>
            <div class="baBody">
                <form action="categoryUpdate.jsp">
                    <input type="hidden" name="categoryhides" id="hides" value="categoryUpdate"   />
                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                    <div class="bbD">
                        商品类别名称修改:<input name="name" id="name" type="text"  class="input3" value="<%=category.getName()%>"/>
                    </div>
                    <div class="bbD">
                        商品类别描述修改:<textarea name="desc" id="desc"   class="input3"><%=category.getDesc() %></textarea>
                        <%--<input name="desc" id="desc" type="" class="input3"  />--%>
                    </div>
                    <div class="bbD">
                        <p class="bbDP">
                            <button type="submit" class="btn_ok btn_yes">提交</button>
                            <a class="btn_ok btn_no" href="categoryList.jsp">取消</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
</body>
</html>
