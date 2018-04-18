<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
<html>
<head>

	<%
		String login = request.getParameter("login");
		String adminpwph = "请输入密码";
		if(login != null && login != "" && login.equals("loggin") ){
		    String admin = request.getParameter("admin");
			String adminpw = request.getParameter("adminpw");

			if(admin.equals("admin")) {
				if (adminpw.equals("000000")) {
					session.setAttribute("login", "loginSuccess");
					response.sendRedirect("index.jsp");
					return;
				}
				adminpwph = "请重新输入密码";

			}
		}

	%>

<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/public.css" />
<link rel="stylesheet" type="text/css" href="css/page.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
</head>
<body>

	<!-- 登录body -->
	<div class="logDiv">
		<img class="logBanner" src="img/logBanner.png" />
		<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">登录</p>
			</div>
			<!-- 输入框 -->
			<form action="login.jsp">
				<input type="hidden" name="login" value="loggin">
				<div class="lgD">
					<img class="img1" src="img/logName.png" />
					<input type="text" name="admin" id="admin" placeholder="请输入用户名"  />
				</div>
				<div class="lgD">
					<img class="img1" src="img/logPwd.png" />
					<input type="password" name="adminpw" id="adminpw" placeholder=<%=adminpwph %> />
				</div>
				<div class="logC">
					<button type="submit">登 录</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 登录body  end -->

	<!-- 登录页面底部 -->
	<div class="logFoot">
		<p class="p1">@CopyRight</p>
		<p class="p2"></p>
	</div>
	<!-- 登录页面底部end -->
   
</body>
</html>