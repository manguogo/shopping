<%@ page import="entity.Category" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page import="service.CategoryService" %>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>


<html>
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        CategoryService cs = new CategoryServiceImpl();
        String categoryHide = request.getParameter("categoryhides");
        if(categoryHide != null && categoryHide.equals("categoryAdd")){
            Category c = new Category();
            c.setName(request.getParameter("name"));
            c.setDesc(request.getParameter("desc"));
            cs.addCategory(c);
            response.sendRedirect("categoryList.jap");
            return;
        }

    %>
    <title>增加酒类型</title>
    <link rel="stylesheet" type="text/css" href="../css/css.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="img/coin02.png" /><span><a href="#">首页</a>&nbsp;-&nbsp;<a
                href="#">公共管理</a>&nbsp;-</span>&nbsp;意见管理
        </div>
    </div>
    <div class="page ">
        <!-- 类别增加页面 -->
        <div class="banneradd bor">
            <div class="baTopNo">
                <span>酒类增加</span>
            </div>
            <div class="baBody">
                <form action="categoryAdd.jsp">
                    <input type="hidden" name="categoryhides" id="hides" value="categoryAdd"   />
                    <div class="bbD">
                        酒类名称:<input name="name" id="" type="text" class="input3" />
                        <span id="nameSpan"></span>
                    </div>
                    <div class="bbD">
                        酒类描述:<input name="desc" id="desc" type="text" class="input3"  />
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