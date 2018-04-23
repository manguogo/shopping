<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Product" %>
<%@ page import="service.ProductService" %>
<%@ page import="service.impl.ProductServiceImpl" %>

<%
    //删除页面,对product进行删除
    ProductService ps = ProductServiceImpl.getProductService();
    String strid = request.getParameter("id");
    Integer id = null;
    if (null != strid && !strid.equals("")) {
        id = Integer.parseInt(strid);
        ps.removeProduct(id);
        response.sendRedirect("productList.jsp");
        return;
    }else{
%>

删除错误
<%

    }


%>

