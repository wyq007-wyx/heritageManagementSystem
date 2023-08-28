<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改标本页</title>
</head>
<body>
		<%
			Sample sample=(Sample)session.getAttribute("choosedSample");
		%>
		<div align="center" style="margin-top:1%;">
		<div style="width:40%;" class="panel panel-success">
			<div  class="panel-heading">
		        			<h3 class="panel-title">标本信息修改</h3>
		    </div>
			<form action="${request.getContextPath()}/homework/sampleChange.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="sid" value=<%=sample.getSid()%>>
				<table style="width:100%" class="table table-hover table-bordered">
					<tr>
						<td>标本出土地</td>
						<td><input type="text" name="findplace" value=<%=sample.getFindplace()%>></td>
					</tr>
					<tr>
						<td>出土时间</td>
						<td><input type="datetime-local" name="findtime" value="<%=sample.getFindtime()%>"></td>
					</tr>
					<tr>
						<td>标本材质</td>
						<td><input type="text" name="material" value=<%=sample.getMaterial()%>></td>
					</tr>
					<tr>
						<td>所属年代</td>
						<td><input type="text" name="ofyear" value=<%=sample.getOfyear()%>></td>
					</tr>
					<tr>
						<td>录入人</td>
						<td><input type="text" name= "person" value=<%=sample.getPerson()%>></td>
					</tr>
					<tr>
						<td>标本描述</td>
						<td><textarea  cols="30" rows="10" style="resize:none;" placeholder="标本描述" name= "description" ><%=sample.getDescription()%></textarea></tr>
					<tr>
						<td>入库时间</td>
						<td><input type="datetime-local" name= "logtime" value="<%=sample.getLogtime()%>"></td>
					</tr>
					<tr>
						<td>标本图片</td>
						<td>
							<input type="file" name= "image_url">
							<input type="hidden" name= "image_url2" value=<%=sample.getImage_url()%>>
						</td>
					</tr>
					
					
				</table>
				
				<input class="btn btn-success"  type="submit" value="提交">
					
			</form>
		</div>
	</div>
</body>
</html>