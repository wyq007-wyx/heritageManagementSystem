<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/visitor/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>标本清单页面</title>
</head>
<body>
	<div align="center"><h3>文物标本</h3></div>
	<%
		ApplicationContext appCon=new
		ClassPathXmlApplicationContext("applicationContext.xml");
		SampleService sampleService=(SampleService) appCon.getBean("sampleService");
		List<Sample> sampleList=sampleService.getSampleList();
	%>
	<div align="center" style="margin-top:50px;">
		<table style="width:80%" class="table table-hover table-striped">
			<tr>
				<td>标本id</td>
				<td>标本名称</td>
				<td>标本出土地</td>
				<td>出土时间</td>
				<td>标本材质</td>
				<td>所属年代</td>
				<td>录入人</td>
				<td>入库时间</td>
				<td>操作</td>
			</tr>
			<%
				for(int i=0;i<sampleList.size();i++){
					
					Sample sample=(Sample)sampleList.get(i);
					if(sample.getOpen()==Sample.OPEN){
						out.print("<tr>");
						out.print("<td>"+sample.getSid()+"</td>");
						out.print("<td>"+sample.getSamplename()+"</td>");
						out.print("<td>"+sample.getFindplace()+"</td>");
						out.print("<td>"+sample.getFindtime()+"</td>");
						out.print("<td>"+sample.getMaterial()+"</td>");
						out.print("<td>"+sample.getOfyear()+"</td>");
						out.print("<td>"+sample.getPerson()+"</td>");
						out.print("<td>"+sample.getLogtime()+"</td>");
			%>
						<td><a href="${pageContext.request.contextPath}/sampleLook.do?sid=<%=sample.getSid() %>">详情</a></td>
			<% 			out.print("</tr>");
					}
				}
			%>
		</table>
	</div>
</body>
</html>