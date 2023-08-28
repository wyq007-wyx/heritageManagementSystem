<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>标本详情页</title>
</head>
<body>
	<%
		Sample sample=(Sample)session.getAttribute("choosedSample");
		String t_url=basePath+sample.getImage_url();
		String borrow_state=null;
		String open_state=null;
		if(sample.getBorrow_state()==Sample.BORROWABLE){
			borrow_state="可借";
		}else{
			borrow_state="不可借";
		}
		if(sample.getOpen()==Sample.OPEN){
			open_state="公开";
		}else{
			open_state="隐藏";
		}
	%>
		<div align="center" style="margin-top:50px;">
			<div style="width:70%;" class="panel panel-success">
				<div  class="panel-heading">
        			<h3 class="panel-title">标本详情</h3>
    			</div>
				<table style="width:100%" class="table table-hover table-bordered">
						<tr>
							<td>标本id</td>
							<td><%=sample.getSid()%></td>
							<td>所属单位</td>
							<td><%=sample.getBelong()%></td>
							<td>标本名称</td>
							<td><%=sample.getSamplename()%></td>
						</tr>
						<tr>
							<td>标本出土地</td>
							<td><%=sample.getFindplace()%></td>
							<td>标本材质</td>
							<td><%=sample.getMaterial()%></td>
							<td>所属年代</td>
							<td><%=sample.getOfyear()%></td>
							
						</tr>
						<tr>
							<td>录入人</td>
							<td><%=sample.getPerson()%></td>
							<td>标本性质</td>
							<td><%=open_state %></td>
							<td>借阅状态</td>
							<td><%=borrow_state%></td>
						</tr>
						<tr>
							<td>出土时间</td>
							<td><%=sample.getFindtime()%></td>
							<td>入库时间</td>
							<td colspan=3><%=sample.getLogtime()%></td>
						</tr>
						<tr>
							<td>标本图片</td>
							<td><img style="height:150px;width:200px;" alt="暂无图片" src=<%=t_url%>></td>
							<td>标本描述</td>
							<td colspan=3><textarea cols="30" rows="10" style="resize:none;width:100%;height:100%;" disabled><%=sample.getDescription()%></textarea></td>
						</tr>
				</table>
			</div>
		</div>
</body>
</html>