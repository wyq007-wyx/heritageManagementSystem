<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息修改</title>
</head>
<body>
	<%
			ApplicationContext appCon=new
			ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService=(UserService)appCon.getBean("userService");
			InstitutionService institutionService=(InstitutionService) appCon.getBean("institutionService");
			List<Institution> institutionList=institutionService.getInstitutionList();
			User user=(User)session.getAttribute("choosedUser");
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
		<div align="center" style="margin-top:5%;">
		<div style="width:60%;" class="panel panel-success">
			<div  class="panel-heading">
		        			<h3 class="panel-title">用户信息修改</h3>
		    </div>
			<form action="${request.getContextPath()}/homework/userChange.do" method="post">
				<input type="hidden" name="uid" value=<%=user.getUid()%>>
				<div align="center"><font color="red">${sessionScope.errorMsg}</font></div>
				<%session.removeAttribute("errorMsg"); %>
				<table style="width:100%" class="table table-hover table-bordered">
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
					<%if(rid!=Role.VISITOR){ %>
					<tr>
						<td>工作单位</td>
						<td>
							<select  name="workplace">
							<%for(int i=0;i<institutionList.size();i++) {
								Institution x=institutionList.get(i);
							%>
							<option><%= x.getName()%></option>
							<%} %>
							</select>
						</td>
					</tr>
					<%} %>
				</table>
				<input   class="btn btn-success" type="submit" value="提交">
			</form>
		</div>
	</div>
</body>
</html>