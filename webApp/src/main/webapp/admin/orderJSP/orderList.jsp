<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dao.SalesOrderDao" %>
<%@ page import="service.SalesOrderService" %>
<%@ page import="serviceFactory.SalesOrderFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.SalesOrder" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>


<html>
<head>

    <%
        request.setCharacterEncoding("UTF-8");
        //分页代码
        SalesOrderService salesOrder = SalesOrderFactory.getSalesOrder();
        List<SalesOrder> salesOrderList = null;
        String pageNumStr = request.getParameter("page");
        String pageCountStr = request.getParameter("pageCount");
        Integer pageNum = 1;
        Integer pageCount = 0;
        String regStr = "[0-9]+";
        //编译正则表达式
        Pattern pattern = Pattern.compile(regStr);
        if (pageNumStr != null && !pageNumStr.equals("") ) {
            //使用正则表达式来确定输入的是不是数字
            Matcher matcher = pattern.matcher(pageNumStr);
            if (matcher.matches()) {
                pageNum = Integer.parseInt(pageNumStr);
            }
        }
        //获取分页数
        if (pageCountStr == null) {
            pageCount = (salesOrder.getAllOrderCount() + salesOrder.pageSize - 1) / salesOrder.pageSize;
        }else {
            pageCount = Integer.parseInt(pageCountStr);
        }
        //对分页的最大页和最小页进行判断
        if (pageNum > pageCount) {
            pageNum = pageCount;
        }
        if (pageNum < 1) {
            pageNum = 1;
        }
        salesOrderList = salesOrder.getAllOrders(salesOrder.pageSize, pageNum);
    %>
    <title></title>

    <link href="../css/haiersoft.css" rel="stylesheet" type="text/css" media="screen,print" />
    <link href="../css/print.css" rel="stylesheet" type="text/css"  media="print" />
    <script src="../js/jquery-1.10.1.min.js"></script>
    <script src="../js/side.js" type="text/javascript"></script>
    <script>
        function jump() {
            var page = document.getElementById("page");
            var pageCount = document.getElementById("pageTotal");
            if(pageCount.innerText != null && pageCount.innerText != "") {
                window.location.href="orderList.jsp?page=" + page.value +"&pageCount=" + pageCount.innerText;
            }
        }
    </script>
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->


</head>

<body>
<h2>订单列表</h2>

<!-- MainForm -->
<div id="MainForm">
    <div class="form_boxA">
        <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>

                    <th>订单ID</th>
                    <th>用户</th>
                    <th>送货地址</th>
                    <th>创建时间</th>
                    <th>状态</th>
                    <th>详细</th>

                </tr>
            </thead>
            <tfoot>
                <tr>

                    <td colspan="6">
                        <span>第<%=pageNum%>页</span>&emsp;
                        <a href="orderList.jsp?page=1">首页</a>&emsp;
                        <a href="orderList.jsp?page=<%=pageNum -1 %>&pageCount=<%=pageCount%>">上一页</a>&emsp;
                        <a href="orderList.jsp?page=<%=pageNum + 1%>&pageCount=<%=pageCount%>">下一页</a>&emsp;
                        <a href="orderList.jsp?page=<%=pageCount%>">尾页</a>&emsp;&emsp;
                        共<span id="pageTotal"><%=pageCount%></span>页&emsp;
                        <span>
                            <button type="button" onclick="jump()">跳转</button>
                            至&nbsp;<input type="text" name="page" id="page">
                        </span>&emsp;
                    </td>

                </tr>
            </tfoot>
            <%
                if(salesOrderList != null){
                    for(int i = 0; i < salesOrderList.size(); i++){
                        SalesOrder s = salesOrderList.get(i);

            %>
            <tr>
                <td><%=s.getId()%></td>
                <td><%=s.getUser().getUserName()%></td>
                <td><%=s.getAddr()%></td>
                <td><%=s.getOdate()%></td>
                <td><%=s.getStatus()%></td>
                <td><a href="orderDetail.jsp?id=<%=s.getId()%>&pageNum=<%=pageNum%>">订单详情</a></td>
            <%
                    }
                }
            %>
            </tr>
            <tr>


            </tr>
        </table>

        <p class="msg"></p>
    </div>
</div>
<!-- /MainForm -->

</body>
</html>