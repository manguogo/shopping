<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
<html >
<head>
	<%@include file="commonJSP/common.jsp"%>
<title>首页左侧导航</title>
<link rel="stylesheet" type="text/css" href="css/public.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<head></head>

<body id="bg">
	<!-- 左边节点 -->
	<div class="container">

		<div class="leftsidebar_box">
			<a href="main.jsp" target="main"><div class="line">
					<img src="img/coin01.png" />&nbsp;&nbsp;首页
				</div></a>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="img/coin03.png" /><img class="icon2"
						src="img/coin04.png" /> 网站管理<img class="icon3"
						src="img/coin19.png" /><img class="icon4"
						src="img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="img/coin111.png" /><img class="coin22"
						src="img/coin222.png" /><a class="cks" href="tab.jsp"
						target="main">会员管理</a><img class="icon5" src="img/coin21.png" />
				</dd>
			</dl>

			<%--产品类型管理--%>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="img/coin01.png" />
					<img class="icon2" src="img/coin02.png" /> 产品类型管理
					<img class="icon3" src="img/coin19.png" />
					<img class="icon4" src="img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="img/coin111.png" />
					<img class="coin22" src="img/coin222.png" />
					<a class="cks" href="categoryJSP/categoryList.jsp" target="main">产品类别</a>
					<img class="icon5" src="img/coin21.png" />
				</dd>

				<dd>
					<img class="coin11" src="img/coin111.png" />
					<img class="coin22" src="img/coin222.png" />
					<a class="cks" href="categoryJSP/categoryAdd.jsp" target="main">增加产品类别</a>
					<img class="icon5" src="img/coin21.png" />
				</dd>

			</dl>

			<%--会员管理--%>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="img/coin07.png" /><img class="icon2"
						src="img/coin08.png" /> 会员管理<img class="icon3"
						src="img/coin19.png" /><img class="icon4"
						src="img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="img/coin111.png" />
					<img class="coin22" src="img/coin222.png" />
					<a href="tab.jsp" target="main" class="cks">会员列表</a>
					<img class="icon5" src="img/coin21.png" />
				</dd>
				<!--<dd>
					<img class="coin11" src="img/coin111.png" />
					<img class="coin22" src="img/coin222.png" />
					<a href="p1.html" target="main" class="cks">会员管理</a>
					<img class="icon5" src="img/coin21.png" />
				</dd>-->
			</dl>

			<%--产品管理--%>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="img/coin10.png" />
					<img class="icon2" src="img/coin09.png" /> 产品管理
					<img class="icon3" src="img/coin19.png" />
					<img class="icon4" src="img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="img/coin111.png" />
					<img class="coin22" src="img/coin222.png" />
					<a class="cks" href="productJSP/productList.jsp" target="main">产品列表</a>
					<img class="icon5" src="img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="img/coin11.png" /><img class="icon2"
						src="img/coin12.png" /> 新闻管理<img class="icon3"
						src="img/coin19.png" /><img class="icon4"
						src="img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="img/coin111.png" /><img class="coin22"
						src="img/coin222.png" /><a class="cks">新闻管理</a><img class="icon5" src="img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="img/coin14.png" /><img class="icon2"
						src="img/coin13.png" /> 心愿管理<img class="icon3"
						src="img/coin19.png" /><img class="icon4"
						src="img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="img/coin111.png" /><img class="coin22"
						src="img/coin222.png" /><a class="cks">心愿管理</a><img class="icon5" src="img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="img/coin15.png" /><img class="icon2"
						src="img/coin16.png" /> 预警管理<img class="icon3"
						src="img/coin19.png" /><img class="icon4"
						src="img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="img/coin111.png" /><img class="coin22"
						src="img/coin222.png" /><a class="cks">预警管理</a><img class="icon5"
						src="img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="img/coin17.png" /><img class="icon2"
						src="img/coin18.png" /> 收支管理<img class="icon3"
						src="img/coin19.png" /><img class="icon4"
						src="img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="img/coin111.png" /><img class="coin22"
						src="img/coin222.png" /><a class="cks">收支管理</a><img class="icon5"
						src="img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="img/coinL1.png" /><img class="icon2"
						src="img/coinL2.png" /> 系统管理<img class="icon3"
						src="img/coin19.png" /><img class="icon4"
						src="img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="img/coin111.png" /><img class="coin22"
						src="img/coin222.png" /><a href="changepwd.html"
						target="main" class="cks">修改密码</a><img class="icon5"
						src="img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="img/coin111.png" /><img class="coin22"
						src="img/coin222.png" /><a class="cks">退出</a><img
						class="icon5" src="img/coin21.png" />
				</dd>
			</dl>

		</div>

	</div>
</body>
</html>
