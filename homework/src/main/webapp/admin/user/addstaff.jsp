<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加工作人员页面</title>
<style>
	body {
	    background-image: url("${pageContext.request.contextPath}/images/addstaff.jpg");
	    background-repeat: no-repeat;
	    background-attachment: fixed;
	    background-size: cover;
	}
	.login_box{
		width: 30%;
      	height: 60%;
      	background:rgba(255,255,255,0.3);
      	margin: auto;
      	margin-top: 10%;
      	text-align: center;
      	border-radius: 10px;
      	padding: 50px 50px;
	}
	 #user_input{
            width: 200px;
            height: 30px;
            border: 1px solid #a6a6a6;
            /* 设置边框圆角 */
            border-radius: 5px;
            padding-left: 10px;

        }
}
</style>
</head>
<body>
	<!-- response.setHeader("cache-control","public"); -->
	<%
		ApplicationContext appCon=new
		ClassPathXmlApplicationContext("applicationContext.xml");
		InstitutionService institutionService=(InstitutionService) appCon.getBean("institutionService");
		List<Institution> institutionList=institutionService.getInstitutionList();
	%>
	<div align="center"><h3>工作人员添加</h3></div>
	<div class="login_box" align="center" style="margin-top:50px;">
		<form method="post" action="${pageContext.request.contextPath}/staffAdd.do">
			<div align="center"><font color="red">${sessionScope.errorMsg}</font></div>
			<%session.removeAttribute("errorMsg"); %>
			<div><font color="red">*</font><input id="user_input" type="text" name="username" placeholder="用户名"></div>
			<div style="margin-top:10px;"><font color="red">*</font><input id="user_input" type="password" name="password" placeholder="密码"></div>
			<div style="margin-top:10px;"><font color="red">*</font><input id="user_input" type="password" name="repassword" placeholder="确认密码"></div>
			<div style="margin-top:10px;"><input id="user_input" type="text" name="realname" placeholder="真实姓名"></div>
			<div style="margin-top:10px;">
				<input type="radio" name="sex" value="男" checked>男
				<input type="radio" name="sex" value="女">女
			</div>
			<div style="margin-top:10px;">
				工作单位:
				<select  name="workplace">
					<%for(int i=0;i<institutionList.size();i++) {
						Institution x=institutionList.get(i);
					%>
					<option><%= x.getName()%></option>
					<%} %>
				</select>
			</div>
			<div style="margin-top:10px;"><input id="user_input" type="text" name="tel" placeholder="联系电话"></div>
			<div style="margin-top:10px;"><input id="user_input" type="text" name="email" placeholder="邮箱"></div>
			<div style="margin-top:10px;"><input id="user_input" type="text" name="addr" placeholder="住址"></div>
			<div style="margin-top:10px;">
				<input type="submit" class="btn btn-primary" value="提交">
				<input type="reset" class="btn btn-primary" value="重置">
			</div>
		</form>
	</div>
</body>
</html>