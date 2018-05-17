<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Cart" %>
<%@ page import="entity.SalesItem" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<html>
<head>
  <%
    //检查用户是否登陆
    Boolean isLogined = (Boolean)session.getAttribute("isLogined");
    if(isLogined == null || !isLogined) {
        response.sendRedirect("denglu.jsp");
        return;
    }
    User user = (User)session.getAttribute("userBenQin");
  %>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>本亲生活网</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script src="script/global.js" type="text/javascript"></script>
<script src="script/head.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="style/base.css" />
<link rel="stylesheet" href="style/head.css" />

<body>

<!--抬头开始-->

<div class="top">

  <div class="top1">
    <div class="top1_main"><span class="dl">欢迎您到结算页面<%=user.getUserName()%></span><span class="yh_zx"><a href="hyzx.html">用户中心</a>  |  <a href="#">我的订单</a>  |  <a href="#">帮助中心</a>  |  <a href="#">联系方式</a></span></div>
  </div>


  <div class="top_logo">

    <div class="logo" style="padding-left:130px;"><a href="index.html"><img src="images/logo.jpg" width="338" height="113"  alt="本亲生活的logo标志"/></a></div>
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

  <!--收获地址开始-->

<%--重要修改--%>
  <div class="lljl_2" style="height:auto; padding-bottom:20px;">
    <div class="lljl_bt1">
      <span class="lljl_mc" style="border-bottom-color:#90a80b; color:#98b205;">确认收货地址</span>
    </div>

    <div class="shdzk">
      <div class="shr_wbk">&nbsp;&nbsp;&nbsp;
        收货人：<input name="" type="text" value="<%=user.getUserName()%>"  style="width:156px; height:25px; line-height:25px; padding-left:5px; color:#3d4245; border:1px solid #e4e4e4; margin-left:5px;"/>
      </div>

      <div class="shr_wbk">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        手机：<input name="" type="text" value="<%=user.getPhone()%>" style="width:156px; height:25px; line-height:25px; padding-left:5px; color:#3d4245; border:1px solid #e4e4e4; margin-left:5px;"/>
      </div>


      <div class="shr_wbk">
        收货地址：
        <select style="width:220px; height:25px; line-height:25px; margin-left:5px; border:1px solid #e4e4e4; font-size:12px; color:#3d4245; padding-left:5px;">
        <option value="yi" selected="selected">请选择您的提货地址</option>
        <option value="er"><%=user.getAddr()%></option>
      </select>
      </div>
      <div class="shr_wbk">
        <a href="#">添加新的收货地址</a>
      </div>
    </div>
  </div>

  <!--收获地址结束-->


  <div class="lljl_bt1"><span class="lljl_mc" style="border-bottom-color:#90a80b; color:#98b205;">确认订单信息</span></div>
  <div class="ding_1">
    <table width="0" border="0" cellspacing="0" cellpadding="0">
      <tr style=" font-family:微软雅黑; text-align:center; font-size:14px;">
        <td width="20"></td>
        <td width="326">商品信息</td>
        <td width="102">单价（元）</td>
        <td width="146">数量</td>
        <td width="196">小计（元）</td>

      </tr>
    </table>
  </div>

  <%--重点修改--%>
<%

  Cart cart = (Cart) session.getAttribute("cart");
  Integer productNum = 0;
  if (cart != null) {
    List<SalesItem> salesItemList = cart.getSalesItemList();
    for (SalesItem s : salesItemList) {
      productNum += s.getpCount();

%>
  <div class="dingd_sl">
    <table width="0" border="0" cellspacing="0" cellpadding="0">
      <tr style=" font-family:微软雅黑; text-align:center; font-size:14px;">
        <td width="16" height="87"></td>
        <%--商品信息--%>
        <td width="330">
          <span class="ddtp_3">
            <img src="images/redwine.jpg" width="59" height="58" />
          </span>
          <span class="ddmc_xq" style=" width:255px;">
            <a href="#"><%=s.getProduct().getName()%></a>
          </span>
        </td>
        <%--商品单价--%>
        <td width="113" style="color:#F00;"><%=s.getProduct().getMemberPrice()%></td>
        <%--商品数量--%>
        <td width="146"><%=s.getpCount()%></td>
        <%--小计--%>
        <td width="196" style="color:#F00;"><%=s.getUnitPrice()%></td>
      </tr>
    </table>
  </div>
<%
    }
  }
%>


  <div class="jxgw_zj" style="height:92px;">
    <div class="jxgw_wq" style="width:150px; margin-top:30px;"><a href="salesItem.jsp">返回购物车修改订单商品</a></div>
  </div>



  <div class="lljl_bt1" style="border-bottom:1px solid #e4e4e4;"><span class="lljl_mc" style="border-bottom-color:#90a80b; color:#98b205;">确认结算信息</span></div>

  <div class="qrxx_2">
    <div class="none" style="height:10px;"></div>
    <div class="qrxx_2_1">商品数量：<span style="color:#F00;"><%=productNum%></span></div>
    <div class="qrxx_2_1">商品金额：<span style="color:#F00;">￥<%=cart.getTotalCount()%></span> &nbsp;&nbsp;运费金额：<span style="color:#F00;">￥0.00</span></div>
  </div>


  <div class="zjs2">
    <div class="none" style="height:15px;"></div>
    <div class="zjs2_1">应付金额：<span style="color:#F00; font-size:17px;">￥<%=cart.getTotalCount()%></span></div>
<%--重要修改2--%>
    <div class="qjs"><a href="salesSuccess.jsp" onmouseover="">提交订单</a></div>
  </div>


</div>

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