<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户详情页</title>
</head>
<body>
		<!-- response.setHeader("cache-control","public"); -->
		<%
			ApplicationContext appCon=new
			ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService=(UserService)appCon.getBean("userService");
			User user=(User)session.getAttribute("choosedUser");
			System.out.println(url);
			String choosed_url=basePath+user.getImage_url();
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
		
		
			
			<div align="center"><img width="100px" height="100px" style="border-radius:100px;" alt="暂无图片" src="<%=choosed_url %>"></div>
			<div align="center" style="width:80%;" >
				<div style="width:60%; margin-left:25%;" class="panel panel-success">
					<div  class="panel-heading">
		        			<h3 class="panel-title">用户详情</h3>
		    		</div>
					<table style="width:100%" class="table table-hover table-bordered">
						<tr>
							<td>用户id</td>
							<td><%=user.getUid()%></td>
							<td>用户名</td>
							<td><%=user.getUsername()%></td>
							<td>用户身份</td>
							<td><%=identity%></td>
						</tr>
						
							
						<tr>
							<td>真实姓名</td>
							<td><%=user.getRealname()%></td>
							<td >性别</td>
							<td><%=user.getSex()%></td>
							<td>注册状态</td>
							<td><%=register_state%></td>
						</tr>
						<tr>
							<td>登录状态</td>
							<td><%=user_state%></td>
							<td>电话</td>
							<td><%=user.getTel()%></td>
							<td>邮箱</td>
							<td><%=user.getEmail()%></td>
						</tr>
						<tr>
							<td>住址</td>
							<td colspan=7><%=user.getAddr()%></td>
						</tr>
						<%if (rid!=Role.VISITOR){ %>
							<tr>
								<td>工作单位</td>
								<td colspan=7><%=user.getWorkplace()%></td>
							</tr>
						<%} %>
						<tr>
							<td>创建时间</td>
							<td colspan=7><%=user.getCreatetime()%></td>
						</tr>
						<tr>
							<td>上次登录时间</td>
							<td colspan=7><%=user.getLast_logintime()%></td>
						</tr>
					</table>
			</div>
	</div>
</body>
</html>