<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>单位管理</title>
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
		InstitutionService institutionService=(InstitutionService) appCon.getBean("institutionService");
		List<Institution> institutionList=institutionService.getInstitutionList();
		if(session.getAttribute("institutionlist")!=null){
			institutionList=(List<Institution>)session.getAttribute("institutionlist");
			session.removeAttribute("institutionlist");
		}
		
	%>
	<div align="center"><h3>单位管理</h3></div>
	<div align="center" style="margin-top:20px;">
		<form action="${pageContext.request.contextPath}/workPlaceCheck.do" method="post">
			<input type="text" name="checkname" placeholder="请输入要查询的单位名称">
			<input  class="btn btn-primary" style="height:30%; font-size:10px;" type="submit" value="查询">
		</form>
	</div>
	<div align="center" style="margin-top:20px;">
		<table style="width:60%" class="table table-hover table-striped">
			<tr>
				<td>单位id</td>
				<td>单位名称</td>
				<td>负责人</td>
				<td>联系电话</td>
				<td>联系邮箱</td>
				<td>联系地址</td>
				<td>单位性质</td>
				<td colspan="3">操作</td>
			<tr>
			<%
				for(int i=0;i<institutionList.size();i++){
					out.print("<tr>");
					Institution institution=(Institution)institutionList.get(i);
					int wid=institution.getWid();
					String identity=null;
					String register_state=null;
					String user_state=null;
					out.print("<td>"+institution.getWid()+"</td>");
					out.print("<td>"+institution.getName()+"</td>");
					out.print("<td>"+institution.getManager()+"</td>");
					out.print("<td>"+institution.getTel()+"</td>");
					out.print("<td>"+institution.getEmail()+"</td>");
					out.print("<td>"+institution.getAddr()+"</td>");
					out.print("<td>"+institution.getType()+"</td>");
			%>
			<td><a href="${pageContext.request.contextPath}/institutionManage.do?type=detail&&wid=<%=institution.getWid() %>">详情</a></td>
			<td><a href="${pageContext.request.contextPath}/institutionManage.do?type=change&&wid=<%=institution.getWid() %>">修改</a></td>
			<td><a href="${pageContext.request.contextPath}/institutionManage.do?type=delete&&wid=<%=institution.getWid() %>">删除</a></td>
			<% out.print("</tr>");
				}
			%>
		</table>
		<a href="${pageContext.request.contextPath}/admin/institution/addinstitution.jsp">添加工作单位</a>
	</div>
</body>
</html>