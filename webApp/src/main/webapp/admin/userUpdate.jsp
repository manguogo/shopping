<%@ page import="service.UserService" %>
<%@ page import="service.impl.UserServiceImpl" %>
<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	UserService us = new UserServiceImpl();
	User user = us.getUser(id);
%>
<title>修改用户</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
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
			<!-- 会员修改页面 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>会员修改</span>
				</div>
				<div class="baBody">
					<form action="">
						<div class="bbD">
							用户名：<input type="text" class="input3" value="<%=id%>" />
						</div>
						<div class="bbD">
							电话号码:<input type="text" class="input3" />
						</div>
						<div class="bbD">
							送货地址:<textarea name=" " id="" cols="30" rows="10" class="input3"></textarea>
						</div>
						<div class="bbD">
							<p class="bbDP">
								<button class="btn_ok btn_yes" href="#">提交</button>
								<a class="btn_ok btn_no" href="#">取消</a>
							</p>
						</div>
					</form>
				</div>
			</div>

			<!-- 会员注册页面样式end -->
		</div>
	</div>

</body>
</html>