<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人主页</title>
</head>
<body>
	<%
		if (session.getAttribute("okMsg")!=null) {
			String info=(String) session.getAttribute("okMsg");
			out.print("<script>alert('"+info+"')</script>");
			//System.out.println("有okMsg");
			//System.out.println(info);
			session.removeAttribute("okMsg");
		}else{
			System.out.println("没有okMsg");
		}
	%>
	<%
			ApplicationContext appCon=new
			ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService=(UserService)appCon.getBean("userService");
			User user=(User)session.getAttribute("currentUser");
			System.out.println("url");
			int rid=userService.getUserRole(user.getUid());
			String identity=null;
			String register_state=null;
			String user_state=null;
			if(rid==Role.ADMIN){
				identity="系统管理员";
			}else if(rid==Role.STAFF){
				identity="工作人员";
			}else{
				identity="游客";
			}
			if(user.getRegister_state()==1){
				register_state="已注册";
			}else{
				register_state="未注册";
			}
			if(user.getUser_state()==1){
				user_state="登录";
			}else{
				user_state="未登录";
			}
		%>
	<div align="center"><h3>当前用户信息</h3></div>
	<div class="container" style="width:30%;">
			<div align="center">
				<table class="table table-hover table-striped" >
					<tr>
						<td>用户id</td>
						<td><%=user.getUid()%></td>
					</tr>
					<tr>
						<td>用户名</td>
						<td><%=user.getUsername()%></td>
					</tr>
					<tr>
						<td>用户身份</td>
						<td><%=identity%></td>
					</tr>
					<tr>
						<td>真实姓名</td>
						<td><%=user.getRealname()%></td>
					</tr>
					<tr>
						<td>工作单位</td>
						<td><%=user.getWorkplace()%></td>
					</tr>
					<tr>
						<td >性别</td>
						<td><%=user.getSex()%></td>
					</tr>
					<tr>
						<td>注册状态</td>
						<td><%=register_state%></td>
					</tr>
					<tr>
						<td>登录状态</td>
						<td><%=user_state%></td>
					</tr>
					<tr>
						<td>电话</td>
						<td><%=user.getTel()%></td>
					</tr>
					<tr>
						<td>邮箱</td>
						<td><%=user.getEmail()%></td>
					</tr>
					<tr>
						<td>住址</td>
						<td><%=user.getAddr()%></td>
					</tr>
					<tr>
						<td>创建时间</td>
						<td><%=user.getCreatetime()%></td>
					</tr>
					<tr>
						<td>上次登录时间</td>
						<td><%=user.getLast_logintime()%></td>
					</tr>
				</table>
		</div>
		<div align="center">
			<a href="${pageContext.request.contextPath}/staff/userchange.jsp">信息修改</a> | 
			<a href="${pageContext.request.contextPath}/pwdreset.jsp">密码重置</a>
		</div>
	</div>
</body>
</html>