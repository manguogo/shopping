<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.SalesItem" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Cart" %>
<!DOCTYPE html >
<html >
<head>
<title>本亲生活网</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

    <%
        //遍历购物车
        Cart cart = (Cart) session.getAttribute("cart");
        List<SalesItem> salesItemList = cart.getSalesItemList();
    %>

</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script src="script/global.js" type="text/javascript"></script>
<script src="script/head.js" type="text/javascript"></script>
<script>
    function addProductFromSales(e) {
        var reg = /add/
        var add = e.id;
        add = add.replace(reg, "");
        var tmp = "productCount" + add;
        var p = document.getElementById(tmp);
        var count = Number(p.value);

        count = count + 1;
        p.value = count;
        productCount(add)
    }
    function removeProductFromSales(e) {
        var decr = e.id;
        var reg = /decr/;
        decr = decr.replace(reg, "")
        var tmp = "productCount" + decr;

        var p = document.getElementById(tmp);
        var count = Number(p.value);
        if(count <=0) {
            count = 0
        }else{
            count = count - 1;
        }
        p.value = count;
        productCount(decr)

    }
    function productCountChange(e) {
        var id = e.id;
        var reg = /productCount/
        id = id.replace(reg, "");
        productCount(id);

    }
    function productCount(id){
        var pc = "P" + id;
        var p = document.getElementById(pc);
        var price = "price" + id;
        var productCount = "productCount" + id;
        var productPrice = Number(document.getElementById(price).innerText);
        var productNum  = Number(document.getElementById(productCount).value);
        var total = productNum * productPrice

        p.innerText = total;

    }
    function settleAccounts(){
        //获取结算节点
        var settleAccounts = document.getElementById("settleAccounts");
        //获取继续购物节点
        var continueShopping = document.getElementById("continueShopping");
        //结算节点a的href
        var settleAccountsHref = settleAccounts.href;
        //继续购物节点的href
        var csHref = continueShopping.href;
        //取得所有的商品条目
        var salesItems = document.getElementsByName("salesItem");
        //用于取得现在循环到的ID
        var reg = /salesItem/;
        for(var i=0; i < salesItems.length; i++) {
            var id = salesItems[i].id;
            id = id.replace(reg, "")
            //取得商品数量
            var productCountEle = "productCount" + id;
            var p = document.getElementById(productCountEle);
            //用于检验结算的链接中是否有指定商品信息
            var reg1 = new RegExp(productCountEle);

            //用于更改结算节点的href
            if(!reg1.test(settleAccountsHref)){
                settleAccountsHref += ("&" + productCountEle + "=" + p.value);
                settleAccounts.href=settleAccountsHref;
            }else {
                var reg2 = new RegExp(productCountEle + "=[0-9]*")
                settleAccountsHref = settleAccountsHref.replace(reg2, productCountEle + "=" + p.value);
                settleAccounts.href=settleAccountsHref;
            }
            //用于更改继续购物节点的href
            if (!reg1.test(csHref)){
                csHref += ("&" + productCountEle + "=" + p.value)
                continueShopping.href = csHref;
            }else {
                var reg2 = new RegExp(productCountEle + "=[0-9]*")
                csHref = csHref.replace(reg2, productCountEle + "=" + p.value);
                continueShopping.href = csHref
            }

        }

    }
</script>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="style/base.css" />
<link rel="stylesheet" href="style/head.css" />

<body>

<!--抬头开始-->

<div class="top">

<div class="top1">
<div class="top1_main"><span class="dl">您好，欢迎光临本亲生活网！<a href="denglu.jsp"> [请登录]</a>  <a href="zhuce.html">[免费注册]</a></span><span class="yh_zx"><a href="hyzx.html">用户中心</a>  |  <a href="#">我的订单</a>  |  <a href="#">帮助中心</a>  |  <a href="#">联系方式</a></span></div>
</div>


<div class="top_logo">

<div class="logo" style="padding-left:130px;"><a href="index.jsp"><img src="images/logo.jpg" width="338" height="113" alt="本亲生活的logo标志"/></a></div>
<div class="top_you" style="background:url(images/dianhua2.jpg); margin-right:0px;">

<div class="ss_1"><input name="key" type="text" id="key" value="请输入您要搜索的产品" size="30"      
          onclick="if(value==defaultValue){value='';this.style.color='#898b8c'}"    
          onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999; line-height:26px;"  class="ssk1"/><input name="" value="搜 索" type="button"  class="button1"/></div>

</div>

</div>

</div>

<!--抬头结束-->


<!--中部开始-->

<div class="ding_tjb">
<div class="ding_1">
<table width="0" border="0" cellspacing="0" cellpadding="0">
  <tr style=" font-family:微软雅黑; text-align:center; font-size:14px;">
    <td width="69"><input name="" type="checkbox" value=""  style=" margin-left:10px; margin-right:10px;"/>全选</td>
    <td width="279">商品信息</td>
    <td width="114">单价（元）</td>
    <td width="147">数量</td>
    <td width="118">小计（元）</td>
    <td width="72">操作</td>
  </tr>
</table>
</div>

<%--
重要修改
--%>

    <%
        for(SalesItem s : salesItemList){

    %>
<div class="dingd_sl" id="salesItem<%=s.getProduct().getId()%>" name="salesItem">
<table width="0" border="0" cellspacing="0" cellpadding="0">
  <tr style=" font-family:微软雅黑; text-align:center; font-size:14px;">
    <td width="43" height="87"><input name="" type="checkbox" value=""  style=" margin-left:10px; margin-right:10px;"/></td>
     <%-- 商品信息--%>
    <td width="305" align="center">
        <span class="ddtp_3" >
            <img src="images/redwine.jpg" width="59" height="58" />
        </span>
        <span class="ddmc_xq">
            <a href="#"><%=s.getProduct().getName()%></a>
        </span>
    </td>
      <%--商品单价 --%>
    <td id="price<%=s.getProduct().getId()%>"  width="114" style="color:#F00;"><%=s.getProduct().getMemberPrice()%></td>
     <%-- 商品数量--%>
    <td width="147">
        <input id="decr<%=s.getProduct().getId()%>" value="-" type="button"  style="background: url(images/jia.jpg); width:19px; height:19px;" onclick="removeProductFromSales(this)"/>
        <input id="productCount<%=s.getProduct().getId()%>"  type="text" value="<%=s.getpCount()%>"  style="width:40px; text-align:center; height:18px; border:1px solid #dddddd;" onblur="productCountChange(this)" />
        <input id="add<%=s.getProduct().getId()%>" value="+" type="button"  style="background: url(images/jia.jpg); width:19px; height:19px;" onclick="addProductFromSales(this)"/>
    </td>
      <%--商品价格小计--%>
    <td id="P<%=s.getProduct().getId()%>"   width="118" style="color:#F00;"><%=s.getUnitPrice()%></td>
    <td width="72"><a href="#">删除</a></td>
  </tr>
</table>
</div>
    <%
        }
    %>


<div class="jxgw_zj">

<div class="jxgw_wq"><a id="continueShopping" href="itemToOrder.jsp?from=salesItem" onmouseover="settleAccounts()">继续购物</a></div>
<div class="zjs2">
<div class="none" style="height:15px;"></div>
<div class="zjs2_1">共<span style="color:#F00; font-size:14px;"><%=salesItemList.size()%></span>件商品，商品金额：<span style="color:#F00; font-size:15px;">￥<%=cart.getTotalCount()%></span></div>
<div class="zjs2_1">商品总价（不含运费）：<span style="color:#F00; font-size:15px;">￥<%=cart.getTotalCount()%></span></div>

<div class="qjs"><a id="settleAccounts" href="itemToOrder.jsp?1=1" onmouseover="settleAccounts()">去结算</a></div>
</div>


</div>



<!--浏览记录开始-->



<!--浏览记录结束-->





<!--中部结束-->





<!--底部开始-->

<div class="footer_ys">
<div class="footer_ys1"></div>
</div>



<!--软文开始-->

<div class="ruanwen">

<ul>
<li class="da">关于本亲</li>
<li><a href="#">公司简介</a></li>
<li><a href="#">联系我们</a></li>
<li><a href="#">友情连接</a></li>
</ul>

<ul>
<li class="da">新手指南</li>
<li><a href="#">账户注册</a></li>
<li><a href="#">购物流程</a></li>
<li><a href="#">注册须知</a></li>
</ul>

<ul>
<li class="da">配送范围及须知</li>
<li><a href="#">配送范围</a></li>
<li><a href="#">配送须知</a></li>
<li><a href="#">配送时间</a></li>
</ul>

<ul>
<li class="da">支付方式</li>
<li><a href="#">货到付款</a></li>
<li><a href="#">在线支付</a></li>
<li><a href="#">其他方式支付</a></li>
</ul>


<ul>
<li class="da">售后服务</li>
<li><a href="#">退换货政策</a></li>
<li><a href="#">退换货办理流程</a></li>
<li><a href="#">退款说明</a></li>
</ul>

<ul>
<li class="da">帮助说明</li>
<li><a href="#">找回密码</a></li>
<li><a href="#">帮助中心</a></li>
<li><a href="#">隐私声明</a></li>
</ul>



</div>


<!--软文结束-->


<!--友情连接开始-->


<div class="links">
<div class="links_main">友情连接：&nbsp;<a href="#">郑州卓普科技</a> &nbsp; | &nbsp; 本亲生活网  &nbsp;|  &nbsp;郑州卓普科技 &nbsp; | &nbsp; 本亲生活网 &nbsp; | &nbsp; 郑州卓普科技 &nbsp; | &nbsp; 本亲生活网 &nbsp; | &nbsp; 郑州卓普科技 &nbsp; |  &nbsp;本亲生活网 &nbsp; |  &nbsp;郑州卓普科技 &nbsp; | &nbsp; 本亲生活网&nbsp;  |&nbsp;  郑州卓普科技  </div>
</div>


<div class="banquan">Copyright © 2014-2019 All Right Reserved 版权所有：本亲生活网 备案号： 豫ICP 450051256-1号<br />

公司地址：郑州市东风路汇宝花园13号楼2单元202室 联系人：高经理 联系电话：13692548036 更多模板：<a href="http://www.mycodes.net/" target="_blank">源码之家</a>

<div class="banquan2"><img src="images/xinr.jpg" width="589" height="51" /></div>

</div>


<!--友情链接结束-->

<!--底部结束-->



</body>
</html>