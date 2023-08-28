<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人信息修改</title>
</head>
<body>
	<%
			ApplicationContext appCon=new
			ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService=(UserService)appCon.getBean("userService");
			User user=(User)session.getAttribute("currentUser");
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
		<div align="center"><h3>个人信息修改</h3></div>
		<div align="center">
			<form action="${request.getContextPath()}/homework/selfChange.do" method="post">
				<input type="hidden" name="uid" value=<%=user.getUid()%>>
				<input type="hidden" name= "workplace" value=<%=user.getWorkplace()%>>
				<div align="center"><font color="red">${sessionScope.errorMsg}</font></div>
				<%session.removeAttribute("errorMsg"); %>
				<table style="width:20%" class="table table-hover table-bordered">
					<tr>
						<td>真实姓名</td>
						<td><input type="text" name="realname" value=<%=user.getRealname()%>></td>
					</tr>
					<tr>
						<td >性别</td>
						<%
							String other=null;
							if(user.getSex().equals("男")){
								other="女";
							}else{
								other="男";
							}
							System.out.println(user.getSex());
							System.out.println(other);
							
						%>
						<td>
							<select name="sex" >
							<option value=<%=user.getSex()%> selected><%=user.getSex()%></option>
							<option value=<%=other%>><%=other%></option>
							</select>
						</td>
					</tr>
					<tr>
						<td>电话</td>
						<td><input type="text" name="tel" value=<%=user.getTel()%>></td>
					</tr>
					<tr>
						<td>邮箱</td>
						<td><input type="text" name="email" value=<%=user.getEmail()%>></td>
					</tr>
					<tr>
						<td>住址</td>
						<td><input type="text" name="addr" value=<%=user.getAddr()%>></td>
					</tr>
					
				</table>
				
				<input class="btn btn-primary" type="submit" value="提交">
					
			</form>
			<div style="margin-top:20px;">
				<form action="${request.getContextPath()}/homework/imageChange.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="uid" value=<%=user.getUid()%>>
					头像上传: <input style="margin-left:8%;margin-top:5px;margin-bottom:5px;" type="file" name="image_url">
					<input type="submit" class="btn btn-primary" value="提交">
				</form>
			</div>
		</div>
</body>
</html>