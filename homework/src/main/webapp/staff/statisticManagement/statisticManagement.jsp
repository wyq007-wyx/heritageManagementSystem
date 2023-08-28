<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>统计分析管理</title>
<style>
	body {
	    background-image: url("${pageContext.request.contextPath}/images/staff4.webp");
	   	background-position: center center;
	    background-repeat: no-repeat;
	    background-attachment: fixed;
	    background-size: cover;
	}
}
</style>
</head>
<body>
	
	<div align="center">
		<div style="margin-top:15%;"><button style="font-size:30px;background:rgba(255,255,255,0.7); color:black;" id="btn_number" class="btn btn-primary"  type="button">数量统计</button></div>
		<div style="margin-top:5%;"><button  style="font-size:30px;background:rgba(255,255,255,0.7); color:black;" id="btn_borrow" class="btn btn-primary" type="button">借阅统计</button></div>
	</div>
	<script>
		function my(id){
			return document.getElementById(id);
		}
		//第一种方
		/*my("btn").onclick=function(){
			my("dv").style.display="none";
		}
		my("btn1").onclick=function(){
			my("dv").style.display="block";
		}*/
		//第二种方法
		my("btn_number").onclick=function(){
			window.location.href="${pageContext.request.contextPath}/staff/statisticManagement/number.jsp"
		}
		my("btn_borrow").onclick=function(){
			window.location.href="${pageContext.request.contextPath}/staff/statisticManagement/borrowData.jsp"
		}
	</script>
</body>
</html>