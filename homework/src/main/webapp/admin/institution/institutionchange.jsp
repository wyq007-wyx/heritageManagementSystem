<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改单位页</title>
</head>
<body>
	<%
			Institution institution=(Institution)session.getAttribute("choosedInstitution");
		%>
		<div align="center" style="margin-top:5%;">
		<div style="width:40%;" class="panel panel-success">
			<div  class="panel-heading">
		        	<h3 class="panel-title">单位信息修改</h3>
		    </div>
		    <div align="center"><font color="red">${sessionScope.errorMsg}</font></div>
			<%session.removeAttribute("errorMsg"); %>
			<form action="${request.getContextPath()}/homework/institutionChange.do" method="post">
				<input type="hidden" name="wid" value=<%=institution.getWid()%>>
				<table style="width:100%" class="table table-hover table-bordered">
					<tr>
						<td ><font color="red">*</font>负责人</td>
						<td><input type="text" name="manager" value=<%=institution.getManager()%>></td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td><input type="text" name="tel" value=<%=institution.getTel()%>></td>
					</tr>
					<tr>
						<td>邮箱</td>
						<td><input type="text" name="email" value=<%=institution.getEmail()%>></td>
					</tr>
					<tr>
						<td>地址</td>
						<td><input type="text" name="addr" value=<%=institution.getAddr()%>></td>
					</tr>
					<tr>
						<td>单位性质</td>
						<td><input type="text" name= "type" value=<%=institution.getType()%>></td>
					</tr>
					
				</table>
					 <input  class="btn btn-success" type="submit" value="提交">
				
			</form>
		</div>
	</div>
</body>
</html>