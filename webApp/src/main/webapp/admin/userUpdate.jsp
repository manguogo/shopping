
<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="service.UserService" %>
<%@ page import="service.impl.UserServiceImpl" %>
<%@ page import="entity.User" %>

<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	String hide = request.getParameter("hides");
	User user = null;
	int id = Integer.parseInt(request.getParameter("id"));
	UserService us = new UserServiceImpl();
	if(hide != null && hide.equals("update")){
		user = new User();

		user.setId(id);
		user.setUserName(request.getParameter("username"));
		user.setPhone(request.getParameter("phone"));
	    user.setAddr(request.getParameter("addr"));
		us.changeUser(user);

		response.sendRedirect("tab.jsp");
		return;
	}
	else {
		user = us.getUser(id);
	}
%>
<title>修改用户</title>
	<link rel="stylesheet" type="text/css" href="css/css.css" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script src="js/updateValidate.js"></script>
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
					<form action="userUpdate.jsp">
						<input type="hidden" name="hides" id="hides" value="update"   />
						<input type="hidden" name="id" id="id" value="<%=id %>">
						<div class="bbD">
							用&nbsp;户&nbsp;名：<input name="username" id="username" type="text" class="input3" value="<%=user.getUserName() %>"  onblur="usernameV()"/>
							<span id="usernameSpan"></span>
						</div>
						<div class="bbD">
							电话号码:<input name="phone" id="phone" type="text" class="input3" value="<%=user.getPhone() %>" onblur="phoneV()"/>
							<span id="phoneSpan"></span>
						</div>
						<div class="bbD">
							送货地址:<textarea name="addr" id="addr" cols="30" rows="10" class="input3" onblur="addrV()" ><%=user.getAddr() %></textarea>
							<span id="addrSpan"></span>
						</div>
						<div class="bbD">
							<p class="bbDP">
								<button type="submit" class="btn_ok btn_yes" href="#">提交</button>
								<a class="btn_ok btn_no" href="tab.jsp">取消</a>
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