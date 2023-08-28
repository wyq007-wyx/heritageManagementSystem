<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>

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
		if(session.getAttribute("samplelist")!=null){
			sampleList=(List<Sample>)session.getAttribute("samplelist");
			session.removeAttribute("samplelist");
		}
	%>
	
	<div  align="center" style="margin-top:20px;">
		<div align="center">
			<form action="${pageContext.request.contextPath}/sampleCheck.do" method="post">
				<div style="width:400px;display:flex;">
					<input type="text"   style="margin-left:20px; width:200px; margin-right:20px;" name="content" placeholder="名称/出土地/标本材质/所属单位">
					<input type="submit"  style="margin-left:5px;"class="btn btn-primary"   value="查询">
					<input type="button"   style="margin-left:5px;"class="btn btn-primary"  value="视图" onclick="window.location.href='${pageContext.request.contextPath}/splitPage.do?currentPage=1&&belong=<%=menu_user.getWorkplace()%>'"/>
				</div>
			</form>
			<div style="margin-top:10px;">
				<a href="${pageContext.request.contextPath}/staff/sampleManagement/addsample.jsp">手动添加文物标本</a>
				<a href="${pageContext.request.contextPath}/staff/sampleManagement/autoAdd.jsp">批量添加文物标本</a>
			</div>
		</div>

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
					<td colspan="3">操作</td>
				</tr>
				<%
					for(int i=0;i<sampleList.size();i++){
						Sample sample=(Sample)sampleList.get(i);
						if(sample.getBelong().equals(menu_user.getWorkplace())){
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
							<td><a href="${pageContext.request.contextPath}/sampleManage2.do?type=detail&&sid=<%=sample.getSid() %>">详情</a></td>
							<td><a href="${pageContext.request.contextPath}/sampleManage2.do?type=change&&sid=<%=sample.getSid() %>">修改</a></td>
							<td><a href="${pageContext.request.contextPath}/sampleManage2.do?type=delete&&sid=<%=sample.getSid() %>">删除</a></td>
				<% 			out.print("</tr>");
						}
					}
				%>
			</table>
	</div>
	
</body>
</html>