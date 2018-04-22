<%@ page import="entity.Category" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page import="service.CategoryService" %>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>


<html>
<head>
    <%@include file="common.jsp"%>
    <%
        request.setCharacterEncoding("UTF-8");
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        String categoryHide = request.getParameter("categoryhides");
        String categoryAddFrom = request.getParameter("from");

        Integer id = null;
        Integer grade = null;
        Integer isleaf = null;

        if(categoryHide != null && categoryHide.equals("categoryAdd")){
            Category c = new Category();
            String categoryid = request.getParameter("categoryid");
            String categorygrade = request.getParameter("categorygrade");
            String categorydesc = request.getParameter("desc");
            String categoryname = request.getParameter("name");

            if(!categoryid.trim().equals("null") && !categoryid.trim().equals("") ) {
                c.setPid(Integer.parseInt(categoryid));
            }
            if(!categoryname.trim().equals("null") && !categoryname.trim().equals("")){
                c.setName(request.getParameter("name"));
            }
            if(!categorydesc.trim().equals("null") && !categorydesc.trim().equals("")){
                c.setDesc(request.getParameter("desc"));
            }
            if(!categorygrade.trim().equals("null") && !categorygrade.trim().equals("")){
                c.setGrade(Integer.parseInt(request.getParameter("categorygrade"))+1);
            }
            cs.addCategory(c);
            response.sendRedirect("categoryList.jsp");
            return;
        }
        if(categoryAddFrom != null && categoryAddFrom.equals("categoryList")){
            id = Integer.parseInt(request.getParameter("id")) ;
            grade = Integer.parseInt( request.getParameter("grade"));
            isleaf = Integer.parseInt(request.getParameter("isleaf"));

        }

    %>
    <title>增加商品类型</title>
    <link rel="stylesheet" type="text/css" href="../css/css.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div id="pageAll">

    <div class="page ">
        <!-- 类别增加页面 -->
        <div class="banneradd bor">
            <div class="baTopNo">
                <span>商品类别添加</span>
            </div>
            <div class="baBody">
                <form action="categoryAdd.jsp">
                    <input type="hidden" name="categoryhides" id="hides" value="categoryAdd"   />
                    <input type="hidden" name="categoryid" value="<%=id %>">
                    <input type="hidden" name="categorygrade" value="<%=grade %>">
                    <input type="hidden" name="isleaf" value="<%=isleaf %>">
                    <div class="bbD">
                        商品类别名称:<input name="name" id="" type="text" class="input3" />
                        <span id="nameSpan"></span>
                    </div>
                    <div class="bbD">
                        商品类别描述:<input name="desc" id="desc" type="text" class="input3"  />
                        <span id="descSpan"></span>
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