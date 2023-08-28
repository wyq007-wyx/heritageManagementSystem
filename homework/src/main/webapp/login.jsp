<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<style type="text/css">
		body {
	    	background-image: url("images/bg_index2.webp");
	   		background-position: center center;
	    	background-repeat: no-repeat;
	    	background-attachment: fixed;
	    	background-size: cover;
		}
		
		.login_box{
			width: 18%;
	      	height: 270px;
	      	background:rgba(0,0,0,0.3);
	      	margin-top: 15%;
	      	margin-left:40%;
	      	text-align: center;
	      	border-radius: 10px;
	      	padding: 20px 50px 50px 50px;
	      	color:white;
		}
		.input_box{
			width: 200px;
            height: 30px;
            border: 1px solid #a6a6a6;
            /* 设置边框圆角 */
            border-radius: 5px;
            padding-left: 10px;
		}
		h3{
			color: #ffffff90;
		}
		.login_button {
      		margin-top: 10px;
      		width: 100%;
      		height: 30px;
      		border: 0;
      		color: #fff;
      		text-align: center;
      		line-height: 30px;
      		font-size: 15px;
      		background-image: linear-gradient(to right, #30cfd0, #330867);
    	}
		a {font-size:16px}
		a:link {color: blue; text-decoration:none;} //未访问：蓝色、无下划线
	</style>
</head>
<body>
	<script type="text/javascript">
			<% User now_user=(User) session.getAttribute("currentUser");
			   	String role=null;
				if(now_user!=null){
					if(session.getAttribute("role")!=null){
						role=(String)session.getAttribute("role");
					}
					if(role.equals("admin")){
			%>
			
				window.location.href=("/homework/admin/admin_index.jsp");
			<%
					}else if(role.equals("staff")){
			%>
						window.location.href=('/homework/staff/staff_index.jsp');
			<%
					}else{
			%>
						window.location.href=('/homework/visitor/visitor_index.jsp');
			<%
					}
				}
			%>
	</script>
	<div align="center"  style="margin-top:50px;">
		<form class="login_box" action="login.do" method="post">
			<div><h3>LOGIN</h3></div>
			<div align="center"><font color="red">${sessionScope.errorMsg}</font></div>
			<%session.removeAttribute("errorMsg"); %>
			<div><input class="input_box" type="text" name="username" placeholder="用户名/工号"/></div>
			<div style="margin-top:10px;"><input class="input_box"  type="password" name="pwd" placeholder="密码"/></div>
			<div style="margin-top:10px;">
				<input type="radio" name="role" value="admin">系统管理员
				<input type="radio" name="role" value="staff" >工作人员
				<input type="radio" name="role" value="visitor" checked>游客
			</div>
			<div style="margin-top:10px;"><input class="login_button" type="submit" value="登录"/></div>
			<div style="margin-top:10px;"><a href="register.jsp">游客注册</a></div>
			<div style="margin-top:10px;"><a href="pwdreset.jsp">忘记密码?</a></div>
		</form>
	</div>
</body>
</html>