<%@ page import="service.CategoryService" %>
<%@ page import="service.impl.CategoryServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%
        request.setCharacterEncoding("utf-8");
        CategoryService cs = CategoryServiceImpl.getCategoryService();
        String strid = request.getParameter("id");
        String strpid = request.getParameter("pid");
        int id = Integer.parseInt(strid);
        if(!strid.trim().equals("null") && !strid.trim().equals("")){
            cs.removeCategory(id, Integer.parseInt(strpid));
            response.sendRedirect("categoryList.jsp");
            return;
        }else{

    %>
    <title>类别删除页面</title>

</head>
<body>

    类别删除失败
    <%
        }
    %>


</body>
</html>
