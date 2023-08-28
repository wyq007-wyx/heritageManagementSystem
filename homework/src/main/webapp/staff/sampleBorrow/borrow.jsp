<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>标本借阅</title>
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
		SampleService sampleService=(SampleService) appCon.getBean("sampleService");
		List<Sample> sampleList=sampleService.getSampleList();
		User user=(User) session.getAttribute("currentUser");
	%>
	<div align="center"><h3>标本借阅</h3></div>
	<div align="center" style="margin-top:20px;">
		<table style="width:80%" class="table table-hover table-striped">
			<tr>
				<td>标本id</td>
				<td>标本名称</td>
				<td>所属单位</td>
				<td>标本出土地</td>
				<td>出土时间</td>
				<td>标本材质</td>
				<td>所属年代</td>
				<td>录入人</td>
				<td>入库时间</td>
				<td colspan="3">操作</td>
			</tr>
			<%
				for(int i=0;i<sampleList.size();i++){
					
					Sample sample=(Sample)sampleList.get(i);
					if(sample.getBelong()!=null && !sample.getBelong().equals(user.getWorkplace())&&sample.getOpen()==Sample.OPEN){
						out.print("<tr>");
						out.print("<td>"+sample.getSid()+"</td>");
						out.print("<td>"+sample.getSamplename()+"</td>");
						out.print("<td>"+sample.getBelong()+"</td>");
						out.print("<td>"+sample.getFindplace()+"</td>");
						out.print("<td>"+sample.getFindtime()+"</td>");
						out.print("<td>"+sample.getMaterial()+"</td>");
						out.print("<td>"+sample.getOfyear()+"</td>");
						out.print("<td>"+sample.getPerson()+"</td>");
						out.print("<td>"+sample.getLogtime()+"</td>");
			%>
						<td><a href="${pageContext.request.contextPath}/sampleManage2.do?type=detail&&sid=<%=sample.getSid() %>">详情</a></td>
					<%
						if(sample.getBorrow_state()==Sample.BORROWABLE&&sample.getOpen()==Sample.OPEN){
					%>	
						<td><a href="${pageContext.request.contextPath}/borrowInput.do?belong=<%=sample.getBelong()%>&&sid=<%=sample.getSid()%>">借阅</a></td>
					<%
						}else{
					%>
						<td>已借出</td>	

					
				<%	}
						out.print("</tr>");
					}
			 	%>
			<% 	
				}
			%>
		</table>
	</div>	
</body>
</html>