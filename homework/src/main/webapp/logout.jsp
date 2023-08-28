<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.bean.*" %>
<%@page import="com.controller.*" %>
<%@page import="com.service.*" %>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="1;login.jsp">
<title>退出页</title>
<style>
        body {
            padding-top: 50px;
            background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
        }

        .container {
            text-align: center;
        }
</style>
</head>
<body>
	<%
		if (session.getAttribute("currentUser") != null) {
			User user=(User) session.getAttribute("currentUser");
			ApplicationContext appCon=new
			ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService=(UserService)appCon.getBean("userService");
			userService.updateUserSate(user.getUid(), 0);
			Date date=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd hh:mm:ss");
			String strdate=sdf.format(date);
			userService.updateLast_logintime(user.getUid(),strdate);
	    	session.removeAttribute("currentUser");
	    	session.removeAttribute("role");
		}
	%>
	<div class="container">
		<br />
		<h1>退出登录</h1>
		<br />
		<h4>退出登录, 1秒后自动跳转至登录界面!🚀</h4>
	</div>
</body>
</html>