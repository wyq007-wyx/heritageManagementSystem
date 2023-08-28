<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>输入借阅信息</title>
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
		Sample sample=(Sample)session.getAttribute("choosedSample");
	    User user=(User) session.getAttribute("currentUser");
	%>
	<div align="center"><h3>借阅填表</h3></div>
	<div align="center" style="margin-top:20px;">
		<form method="post" action="${pageContext.request.contextPath}/sampleBorrow.do">
			<div align="center"><font color="red">${sessionScope.errorMsg}</font></div>
			<%session.removeAttribute("errorMsg"); %>
			<input type="hidden" name="belong" value=<%=sample.getBelong()%>>
			<input type="hidden" name="sid" value=<%=sample.getSid()%>>
			<input type="hidden" name="check_state" value=<%=Borrow.WAIT_CHECK%>>
			<input type="hidden" name="borrow_workplace" value=<%=user.getWorkplace()%>>
			<table style="width:22%" class="table-hover table-bordered">
				<tr>
					<td><font color="red">*</font>借阅人姓名</td>
					<td><input style="width:100%;"type="text" name="person" placeholder="借阅人姓名"></td>
				</tr>
				<tr>
					<td>借阅理由</td>
					<td><input  style="width:100%;"type="text" name="reason" placeholder="借阅理由"></td>
				</tr>
			    <tr>
			     	<td><font color="red">*</font>联系方式</td>
			     	<td><input  style="width:100%;"type="text" name="tel" placeholder="联系方式"></td>
			    </tr>
				<tr>
					<td>备注</td>
					<td><textarea style="resize:none;width:100%;height:100%;" cols="30" rows="10" name="plus" placeholder="备注"></textarea></td>
				</tr>
			</table>
			<div align="center" style="padding-top:20px;">
					<input class="btn btn-primary" type="submit" value="提交">
					<input class="btn btn-primary" type="reset" value="重置">
			</div>
		</form>
	</div>
</body>
</html>