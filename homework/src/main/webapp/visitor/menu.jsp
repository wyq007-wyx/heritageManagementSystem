<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.bean.*" %>
<%@page import="com.controller.*" %>
<%@page import="com.service.*" %>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" >
</head>
<body>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
  
	<%
		User menu_user=(User)session.getAttribute("currentUser");
	    int menu_uid=0;
	    int menu_rid=0;
	    String url=null;
	    String path=null;
	    String basePath=null;
		if(menu_user==null){
	%>
	<script type="text/javascript"> 
		alert("请先登录!");
	 	window.location.href ="${pageContext.request.contextPath}/login.jsp";
	 </script>
	<% 
		}
		else{
			menu_uid=menu_user.getUid();
			ApplicationContext appCon=new
			ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService=(UserService)appCon.getBean("userService");
			menu_rid=userService.getUserRole(menu_uid);
			path = request.getContextPath();
			basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
			url=basePath+menu_user.getImage_url();
			System.out.println("url");
		}
		if(menu_rid!=Role.VISITOR){
	%>	
		<script type="text/javascript"> 
			alert("无权限，请使用游客账号登录!");
	 		window.location.href ="${pageContext.request.contextPath}/login.jsp";
		</script>
	
	<%
		}
		
	%>
	
	<div style="display:flex;position:relative; background-color:#F8F8FF">
		<ul class="nav nav-pills">
  
  		<li role="presentation"  style="height:60px;  display:flex;justify-content:center;align-items:center;"><a href="${pageContext.request.contextPath}/visitor/visitor_index.jsp">首页</a></li>
  		<li role="presentation"  style="height:60px;  display:flex;justify-content:center;align-items:center;"><a href="${pageContext.request.contextPath}/visitor/nowuser.jsp">个人信息</a></li>
  		<li role="presentation"  style="height:60px;  display:flex;justify-content:center;align-items:center;"><a href="${pageContext.request.contextPath}/visitor/allsample.jsp">标本信息</a></li>
 
		</ul>
		<div style="display:flex;position:absolute; right:0;">
			<ul class="nav nav-pills">
			<li role="presentation"  style="height:60px;  display:flex;justify-content:center;align-items:center;"><a href="${pageContext.request.contextPath}/logout.jsp">退出登录</a></li>
			<li  role="presentation" style="height:60px; display:flex;justify-content:center;align-items:center;">用户名:<a href="${pageContext.request.contextPath}/visitor/nowuser.jsp">${sessionScope.currentUser.username}</a></li> 
			<li  role="presentation" style="height:60px;   display:flex;justify-content:center;align-items:center;">用户头像:<a href="${pageContext.request.contextPath}/visitor/nowuser.jsp"><img   style="width:50px;height:50px;border-radius:50px"  alt="暂无图片" src="<%=url%>"></img></a></li>
			</ul>
		</div>
	</div>
</body>
</html>