﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >
<head>

	<%@include file="commonJSP/common.jsp"%>

<title>首页</title>
</head>
<frameset rows="100,*" cols="*" scrolling="No" framespacing="0"
	frameborder="no" border="0">
	<!-- 引用头部 -->
	<frame src="head.jsp" name="headmenu" id="mainFrame" title="mainFrame">
	<!-- 引用左边和主体部分 -->
	<frameset rows="100*" cols="220,*" scrolling="No" framespacing="0" frameborder="no" border="0">
		<frame src="left.jsp" name="leftmenu" id="" title="mainFrame" >
		<frame src="main.jsp" name="main" scrolling="yes" noresize="noresize" id="rightFrame" title="rightFrame">
	</frameset>
</frameset>
</html>