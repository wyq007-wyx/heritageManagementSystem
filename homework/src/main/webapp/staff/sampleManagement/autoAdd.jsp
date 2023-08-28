<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>excel文件上传</title>
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
	<div align="center" style="margin-top:20px;">
		<form id="importForm" method="post" action="${pageContext.request.contextPath}/import.do" enctype="multipart/form-data">
    	<input style="margin-left:8%; margin-bottom:1%;"type="file"  name="xlsFile" id="xlsFile"/>
   	 	<input type="submit" class="btn btn-primary"  size="60" value="批量导入"/>
   	 	</form>
	</div>
	

</body>
</html>