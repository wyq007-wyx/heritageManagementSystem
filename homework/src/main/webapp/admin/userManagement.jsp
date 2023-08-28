<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理</title>
</head>
<body>
	<div align="center"><h3>用户管理</h3></div>
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
		List<User> userList=userService.getUserList();
	%>
	<div align="center" style="margin-top:20px;">
		<table style="width:80%" class="table table-hover table-striped">
			<tr>
				<td>用户id</td>
				<td>用户名</td>
				<td>用户身份</td>
				<td>工作单位</td>
				<td>真实姓名</td>
				<td>性别</td>
				<td>注册状态</td>
				<td>用户状态</td>
				<td>创建时间</td>
				<td>上次登录时间</td>
				<td colspan="3">操作</td>
			<tr>
			<%
				for(int i=0;i<userList.size();i++){
					out.print("<tr>");
					User user=(User)userList.get(i);
					int uid=user.getUid();
					int rid=userService.getUserRole(uid);
					String identity=null;
					String register_state=null;
					String user_state=null;
					if(rid==Role.ADMIN){
						identity="系统管理员";
						out.print("<tr class=\"success\">");
					}else if(rid==Role.STAFF){
						out.print("<tr class=\"info\">");
						identity="工作人员";
					}else{
						out.print("<tr class=\"warning\">");
						identity="游客";
					}
					if(user.getRegister_state()==0){
						 register_state="未注册";
					}else{
						 register_state="已注册";
					}
					if(user.getUser_state()==0){
						 user_state="未登录";
					}else{
						 user_state="登录";
					}
					out.print("<td>"+user.getUid()+"</td>");
					out.print("<td>"+user.getUsername()+"</td>");
					out.print("<td>"+identity+"</td>");
					out.print("<td>"+user.getWorkplace()+"</td>");
					//out.print("<td><img style=\"height:50px;width:50px\" src="+user.getImageUrl()+"></td>");
					out.print("<td>"+user.getRealname()+"</td>");
					out.print("<td>"+user.getSex()+"</td>");
					out.print("<td>"+register_state+"</td>");
					out.print("<td>"+ user_state+"</td>");
					out.print("<td>"+user.getCreatetime()+"</td>");
					out.print("<td>"+user.getLast_logintime()+"</td>");
			%>
			<td><a href="${pageContext.request.contextPath}/userManage.do?type=detail&&username=<%=user.getUsername() %>">详情</a></td>
			<td><a href="${pageContext.request.contextPath}/userManage.do?type=change&&username=<%=user.getUsername() %>">修改</a></td>
			<%if (rid!=Role.ADMIN){%>
				<td><a href="${pageContext.request.contextPath}/userManage.do?type=delete&&username=<%=user.getUsername() %>">删除</a></td>
			<%} %>
			<% out.print("</tr>");
				}
			%>
		</table>
		<a href="${pageContext.request.contextPath}/admin/user/addstaff.jsp">添加工作人员</a>
	</div>
</body>
</html>