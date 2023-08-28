<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>借出管理</title>
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
		User user=(User) session.getAttribute("currentUser");
		SampleBorrowService sampleBorrowService=(SampleBorrowService) appCon.getBean("sampleBorrowService");
		List<SampleBorrow> waitcheckList=sampleBorrowService.selectByCheckStateAndSrc(Borrow.WAIT_CHECK,user.getWorkplace());//待审核
		List<SampleBorrow> borrowingList=sampleBorrowService.selectByCheckStateAndSrc(Borrow.CHECKED,user.getWorkplace());//未提交归还申请
		List<SampleBorrow> waitBackResponseList=sampleBorrowService.selectByCheckStateAndSrc(Borrow.WAIT_BACK_RESPONSE,user.getWorkplace());//等待回复
		List<SampleBorrow> endList=sampleBorrowService.selectByCheckStateAndSrc (Borrow.END,user.getWorkplace());//结束
		SampleService sampleService=(SampleService) appCon.getBean("sampleService");
	%>
	<div align="center"><h3>借出管理</h3></div>
	<div align="center" style="margin-top:20px;">
		<table style="width:90%" class="table table-hover table-striped">
			<tr>
				<td>借阅id</td>
				<td>标本id</td>
				<td>标本名称</td>
				<td>标本所属单位</td>
				<td>借阅单位</td>
				<td>借阅时间</td>
				<td>归还时间</td>
				<td>借阅人</td>
				<td>借阅理由</td>
				<td>联系电话</td>
				<td>备注</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<%
				for(int i=0;i<waitcheckList.size();i++){
					out.print("<tr class=\"active\">");
					SampleBorrow sb=(SampleBorrow)waitcheckList.get(i);
						out.print("<td>"+sb.getBid()+"</td>");
						out.print("<td>"+sb.getSid()+"</td>");
						out.print("<td>"+sampleService.selectBySid(sb.getSid()).getSamplename()+"</td>");
						out.print("<td>"+sb.getBelong()+"</td>");
						out.print("<td>"+sb.getBorrow_workplace()+"</td>");
						out.print("<td>"+sb.getBorrow_time()+"</td>");
						out.print("<td>"+sb.getBack_time()+"</td>");
						out.print("<td>"+sb.getPerson()+"</td>");
						out.print("<td>"+sb.getReason()+"</td>");
						out.print("<td>"+sb.getTel()+"</td>");
						out.print("<td>"+sb.getPlus()+"</td>");
						out.print("<td>待审核</td>");
				
			%>
			<td>
					<a href="${pageContext.request.contextPath}/lendManage.do?type=1&&bid=<%=sb.getBid() %>">同意</a>
					<a href="${pageContext.request.contextPath}/lendManage.do?type=2&&bid=<%=sb.getBid() %>">拒绝</a>
			</td>
			<% out.print("</tr>");
				}
			%>
			<%
				for(int i=0;i<borrowingList.size();i++){
					out.print("<tr class=\"success\">");
					SampleBorrow sb=(SampleBorrow)borrowingList.get(i);
					out.print("<td>"+sb.getBid()+"</td>");
					out.print("<td>"+sb.getSid()+"</td>");
					out.print("<td>"+sampleService.selectBySid(sb.getSid()).getSamplename()+"</td>");
					out.print("<td>"+sb.getBelong()+"</td>");
					out.print("<td>"+sb.getBorrow_workplace()+"</td>");
					out.print("<td>"+sb.getBorrow_time()+"</td>");
					out.print("<td>"+sb.getBack_time()+"</td>");
					out.print("<td>"+sb.getPerson()+"</td>");
					out.print("<td>"+sb.getReason()+"</td>");
					out.print("<td>"+sb.getTel()+"</td>");
					out.print("<td>"+sb.getPlus()+"</td>");
					out.print("<td>未归还</td>");
				
			%>
				<td>
					无
				</td>
			<% out.print("</tr>");
				}
			%>
			<%
				for(int i=0;i<waitBackResponseList.size();i++){
					out.print("<tr class=\"info\">");
					SampleBorrow sb=(SampleBorrow)waitBackResponseList.get(i);
					out.print("<td>"+sb.getBid()+"</td>");
					out.print("<td>"+sb.getSid()+"</td>");
					out.print("<td>"+sampleService.selectBySid(sb.getSid()).getSamplename()+"</td>");
					out.print("<td>"+sb.getBelong()+"</td>");
					out.print("<td>"+sb.getBorrow_workplace()+"</td>");
					out.print("<td>"+sb.getBorrow_time()+"</td>");
					out.print("<td>"+sb.getBack_time()+"</td>");
					out.print("<td>"+sb.getPerson()+"</td>");
					out.print("<td>"+sb.getReason()+"</td>");
					out.print("<td>"+sb.getTel()+"</td>");
					out.print("<td>"+sb.getPlus()+"</td>");
					out.print("<td>归还请求</td>");
				
			%>
				<td>
					<a href="${pageContext.request.contextPath}/lendManage.do?type=3&&bid=<%=sb.getBid() %>">通过</a>
					<a href="${pageContext.request.contextPath}/lendManage.do?type=4&&bid=<%=sb.getBid() %>">不通过</a>
				</td>
			<% out.print("</tr>");
				}
			%>
			<%
				for(int i=0;i<endList.size();i++){
					out.print("<tr class=\"warning\">");
					SampleBorrow sb=(SampleBorrow)endList.get(i);
					out.print("<td>"+sb.getBid()+"</td>");
					out.print("<td>"+sb.getSid()+"</td>");
					out.print("<td>"+sampleService.selectBySid(sb.getSid()).getSamplename()+"</td>");
					out.print("<td>"+sb.getBelong()+"</td>");
					out.print("<td>"+sb.getBorrow_workplace()+"</td>");
					out.print("<td>"+sb.getBorrow_time()+"</td>");
					out.print("<td>"+sb.getBack_time()+"</td>");
					out.print("<td>"+sb.getPerson()+"</td>");
					out.print("<td>"+sb.getReason()+"</td>");
					out.print("<td>"+sb.getTel()+"</td>");
					out.print("<td>"+sb.getPlus()+"</td>");
					out.print("<td>审核结束</td>");
				
			%>
				<td>
					无
				</td>
			<% out.print("</tr>");
				}
			%>
		</table>
	</div>	
</body>
</html>