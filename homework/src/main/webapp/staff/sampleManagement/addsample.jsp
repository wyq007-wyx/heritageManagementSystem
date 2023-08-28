<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加标本</title>
<style>
	body {
	    background-image: url("${pageContext.request.contextPath}/images/addstaff.jpg");
	    background-repeat: no-repeat;
	    background-attachment: fixed;
	    background-size: cover;
	}
	
}
</style>
</head>
<body>
	<%
		User user=(User)session.getAttribute("currentUser");
		ApplicationContext appCon=new
		ClassPathXmlApplicationContext("applicationContext.xml");
		InstitutionService institutionService=(InstitutionService) appCon.getBean("institutionService");
		List<Institution> institutionList=institutionService.getInstitutionList();
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate=sdf.format(date);
		System.out.println(strDate);
	%>
	<div align="center"><h3>标本录入</h3></div>
	<div align="center" style="margin-top:20px;">
		<form method="post" action="${pageContext.request.contextPath}/sampleAdd.do" enctype="multipart/form-data">
			<div align="center"><font color="red">${sessionScope.errorMsg}</font></div>
			<%session.removeAttribute("errorMsg"); %>
			<input type="hidden" name="belong" value=<%=user.getWorkplace() %>>
			<input type="hidden" name="borrow_state" value="1">
			<table style="width:40%" class="table table-hover table-bordered">
				<tr>
					<td><font color="red">*</font>标本名称</td>
					<td><input type="text" name="samplename" placeholder="标本名称"></td>
				</tr>
				<tr>
					<td>标本出土地</td>
					<td><input type="text" name="findplace" placeholder="标本出土地"></td>
				</tr>
			    <tr>
			     	<td>出土时间</td>
			     	<td><input step="1" type="datetime-local" name="findtime" value="<%=strDate%>"></td>
			    </tr>
				<tr>
					<td>标本材质</td>
					<td><input type="text" name="material" placeholder="标本材质"></td>
				</tr>
				<tr>
					<td>所属年代</td>
					<td><input type="text" name="ofyear" placeholder="所属年代"></td>
				</tr>
				<tr>
					<td>录入人</td>
					<td><input type="text" name="person" placeholder="录入人"></td>
				</tr>
				<tr>
					<td>标本描述</td>
					<td><textarea style="resize:none" cols="30" rows="10" name="description" placeholder="标本描述"></textarea></td>
				</tr>
				<tr>
					<td>入库时间</td>
					<td><input step="1" type="datetime-local" name="logtime" value="<%=strDate%>"></td>
				</tr>
				<tr>
					<td>标本图片</td>
					<td><input type="file" name="image_url"></td>
				</tr>
				<tr>
					<td>标本性质</td>
					<td>
						<input type="radio" name="open" value="1" checked>公开
						<input type="radio" name="open" value="0">隐藏
					</td>
				</tr>
			</table>
			<div align="center" >
					<input type="submit" class="btn btn-success" value="提交">
					<input type="reset" class="btn btn-success" value="重置">
			</div>
		</form>
	</div>
</body>
</html>