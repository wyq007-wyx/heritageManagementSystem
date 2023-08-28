<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文物标本管理</title>
</head>
<body>
	<div align="center"><h3>文物标本管理</h3></div>
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
		if (session.getAttribute("errorMsg")!=null) {
			String info=(String) session.getAttribute("errorMsg");
			out.print("<script>alert('"+info+"')</script>");
			//System.out.println("有okMsg");
			//System.out.println(info);
			session.removeAttribute("errorMsg");
		}else{
			System.out.println("没有errorMsg");
		}
	%>
	<%
		ApplicationContext appCon=new
		ClassPathXmlApplicationContext("applicationContext.xml");
		SampleService sampleService=(SampleService) appCon.getBean("sampleService");
		List<Sample> sampleList=sampleService.getSampleList();
	%>
	<div align="center" style="margin-top:20px;">
		<table  style="width:80%" class="table table-hover table-striped">
			<tr>
				<td>标本id</td>
				<td>标本名称</td>
				<td>标本出土地</td>
				<td>出土时间</td>
				<td>标本材质</td>
				<td>所属年代</td>
				<td>录入人</td>
				<td>入库时间</td>
				<td colspan="3">操作</td>
			<tr>
			<%
				for(int i=0;i<sampleList.size();i++){
					out.print("<tr>");
					Sample sample=(Sample)sampleList.get(i);
					out.print("<td>"+sample.getSid()+"</td>");
					out.print("<td>"+sample.getSamplename()+"</td>");
					out.print("<td>"+sample.getFindplace()+"</td>");
					out.print("<td>"+sample.getFindtime()+"</td>");
					out.print("<td>"+sample.getMaterial()+"</td>");
					out.print("<td>"+sample.getOfyear()+"</td>");
					out.print("<td>"+sample.getPerson()+"</td>");
					out.print("<td>"+sample.getLogtime()+"</td>");
			%>
			<td><a href="${pageContext.request.contextPath}/sampleManage.do?type=detail&&sid=<%=sample.getSid() %>">详情</a></td>
			<td><a href="${pageContext.request.contextPath}/sampleManage.do?type=change&&sid=<%=sample.getSid() %>">修改</a></td>
			<td><a href="${pageContext.request.contextPath}/sampleManage.do?type=delete&&sid=<%=sample.getSid() %>">删除</a></td>
			<% out.print("</tr>");
				}
			%>
		</table>
<%-- 		<a href="${pageContext.request.contextPath}/admin/sample/addsample.jsp">添加文物标本</a> --%>
	</div>
</body>
</html>