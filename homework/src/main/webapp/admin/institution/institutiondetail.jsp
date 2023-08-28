<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>单位详情页</title>
</head>
<body>
	<%
		Institution institution=(Institution)session.getAttribute("choosedInstitution");
	%>
		
		<div align="center" style="margin-top:50px;">
			<div style="width:60%;" class="panel panel-success">
				<div  class="panel-heading">
        			<h3 class="panel-title">单位详情</h3>
    		</div>
			<table style="width:100%" class="table table-hover table-bordered">
				<tr>
					<td>单位id</td>
					<td><%=institution.getWid()%></td>
				</tr>
				<tr>
					<td>单位名称</td>
					<td><%=institution.getName()%></td>
				</tr>
				<tr>
					<td>负责人</td>
					<td><%=institution.getManager()%></td>
				</tr>
				<tr>
					<td>联系电话</td>
					<td><%=institution.getTel()%></td>
				</tr>
				<tr>
					<td>邮箱</td>
					<td><%=institution.getEmail()%></td>
				</tr>
				<tr>
					<td>地址</td>
					<td><%=institution.getAddr()%></td>
				</tr>
				<tr>
					<td>单位性质</td>
					<td><%=institution.getType()%></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>