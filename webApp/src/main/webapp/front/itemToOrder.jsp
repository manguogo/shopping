<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.SalesItem" %>
<%@ page import="java.util.ArrayList" %>
<%
    Cart cart = (Cart)session.getAttribute("cart");
    Double total = new Double(0.0);
    List<SalesItem> salesItemList;
    List<SalesItem> salesItemList1 = new ArrayList<SalesItem>();
    if (cart != null) {
        salesItemList = cart.getSalesItemList();
        for (int i = 0; i < salesItemList.size(); i++) {
            SalesItem s = salesItemList.get(i);
            int id = s.getProduct().getId();
            String tmp = "productCount" + id;
            String countStr = request.getParameter(tmp);
            Integer count = null;
            if (countStr != null) {
                count = Integer.parseInt(countStr);
                s.setpCount(count);
                s.setUnitPrice(s.getpCount() * s.getProduct().getMemberPrice());
                s.setProduct(s.getProduct());
                salesItemList1.add(s);
            }
            total += s.getUnitPrice();
        }
        cart.setSalesItemList(salesItemList1);
        cart.setTotalCount(total);
        session.setAttribute("cart", cart);
    }
    if(request.getParameter("from") != null && request.getParameter("from").equals("salesItem")){

        response.sendRedirect("productList.jsp");
        return;
    }
    request.getRequestDispatcher("salesOrderConfirm.jsp").forward(request,response);

%>
