<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.SalesOrderService" %>
<%@ page import="serviceFactory.SalesOrderFactory" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="entity.SalesItem" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.SalesOrder" %>


<html>
<head>

    <%
        request.setCharacterEncoding("UTF-8");
        String pageNumStr = request.getParameter("pageNum");
        Integer pageNum = 1;
        String reg_1 = "[0-9]+";
        Pattern pattern_1 = Pattern.compile(reg_1);
        if (pageNumStr != null && !pageNumStr.equals("") && pattern_1.matcher(pageNumStr).matches()) {
            pageNum = Integer.parseInt(pageNumStr);
        }
        //从链接中获取订单id
        String idStr = request.getParameter("id");
        String reg = "[0-9]+";
        Pattern pattern = Pattern.compile(reg);
        if (idStr == null || idStr.equals("") || !(pattern.matcher(idStr).matches())) {
            response.sendRedirect("orderList.jsp");
            return;
        }
        //获取订单详细
        SalesOrderService order = SalesOrderFactory.getSalesOrder();
        Integer id = Integer.parseInt(idStr);
        List<SalesItem> salesItemList = order.getOrderDetails(id);
        SalesOrder salesOrder = order.getOrderById(id);

    %>
    <title></title>

    <link href="../css/haiersoft.css" rel="stylesheet" type="text/css" media="screen,print" />
    <link href="../css/print.css" rel="stylesheet" type="text/css"  media="print" />
    <script src="../js/jquery-1.10.1.min.js"></script>
    <script src="../js/side.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->


</head>

<body>
<h2>订单详细</h2>

<!-- MainForm -->
<div id="MainForm">
    <div class="form_boxA">
        <table cellpadding="0" cellspacing="0">
            <thead>
            <tr>

                <th>订单编号</th>
                <th>用户</th>
                <th>送货地址</th>
                <th>创建时间</th>
                <th>状态</th>

            </tr>
            </thead>
            <tfoot>
            <tr>

                <td colspan="6">
                    <span>第页</span>&emsp;
                    <a href="orderList.jsp?page=1">首页</a>&emsp;
                    <a href="">上一页</a>&emsp;
                    <a href="" >下一页</a>&emsp;
                    <a href="">尾页</a>&emsp;&emsp;
                    共<span id="pageTotal"></span>页&emsp;
                    <span>
                            <button type="button" onclick="">跳转</button>
                            至&nbsp;<input type="text" name="page" id="page">
                     </span>&emsp;&emsp;
                    <a href="orderList.jsp?page=<%=pageNum%>">返回</a>
                </td>

            </tr>
            </tfoot>
            <%--订单信息--%>
            <tr>
                <td><%=salesOrder.getId()%></td>
                <td><%=salesOrder.getUser().getUserName()%></td>
                <td><%=salesOrder.getAddr()%></td>
                <td><%=salesOrder.getOdate()%></td>
                <td><%=salesOrder.getStatus()%></td>
            </tr>
            <%--订单明细--%>
            <tr>

                <th>订单项编号</th>
                <th>产品名称</th>
                <th>产品数量</th>
                <th>产品价格</th>

            </tr>
            <%
                if(salesItemList != null){
                    for(int i = 0; i < salesItemList.size(); i++){
                        SalesItem s = salesItemList.get(i);

            %>
            <tr>
                <td><%=s.getId()%></td>
                <td><%=s.getProduct().getName()%></td>
                <td><%=s.getpCount()%></td>
                <td><%=s.getUnitPrice()%></td>
            </tr>
            <%
                    }
                }
            %>
            <tr>


            </tr>
        </table>

        <p class="msg"></p>
    </div>
</div>
<!-- /MainForm -->

</body>
</html>