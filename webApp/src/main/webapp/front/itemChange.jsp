<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Cart" %>
<%@ page import="entity.SalesItem" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Product" %>
<%
    //获取session中的cart购物车,并将新的商品放入到购物车中
    /*
    * 如果session中不存在购物车则新建购物车一个
    * 若存在则取出来加入新的产品项
    * */
    Cart cart = null;
    if (null == session.getAttribute("cart")) {
        cart = new Cart();
    }else {
        cart = (Cart) session.getAttribute("cart");
    }
    /*
    * 从访问中取得产品项
    * */
    Integer productId = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    Double price = Double.parseDouble(request.getParameter("memberPrice"));
    Integer count = 1;
    if (request.getParameter("count") != null) {
        count = Integer.parseInt(request.getParameter("count"));
    }

    //将产品放入到购物车中
    List<SalesItem> salesItemList = cart.getSalesItemList();
    SalesItem salesItem = new SalesItem();
    Product product = new Product();
    Boolean isProductExist = false;
    Double total = 0.0;

    if (salesItemList == null) {

    }else {
        for (SalesItem s : salesItemList) {
            if (isProductExist = (s.getProduct().getId() == productId)) {
                salesItemList.remove(s);
                s.setpCount(s.getpCount() + count);
                s.setProduct(s.getProduct());
                s.setUnitPrice(s.getProduct().getMemberPrice() * s.getpCount());
                salesItemList.add(s);
            }
            total += s.getUnitPrice();
        }
    }

    if (!isProductExist) {
        product.setId(productId);
        product.setName(name);
        product.setMemberPrice(price);

        salesItem.setUnitPrice(price * count);
        salesItem.setpCount(count);
        salesItem.setProduct(product);
        salesItemList.add(salesItem);
        total += salesItem.getUnitPrice();
    }
    cart.setSalesItemList(salesItemList);
    cart.setTotalCount(total);
    session.setAttribute("cart", cart);
    response.sendRedirect("salesItem.jsp");
%>
