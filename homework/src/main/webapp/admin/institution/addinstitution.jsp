<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加工作单位</title>
<style>
	body {
	    background-image: url("${pageContext.request.contextPath}/images/addstaff.jpg");
	    background-repeat: no-repeat;
	    background-attachment: fixed;
	    background-size: cover;
	}
	.login_box{
		width: 30%;
      	height: 60%;
      	background:rgba(255,255,255,0.3);
      	margin: auto;
      	margin-top: 10%;
      	text-align: center;
      	border-radius: 10px;
      	padding: 50px 50px;
	}
	 #user_input{
            width: 150px;
            height: 20px;
            border: 1px solid #a6a6a6;
            /* 设置边框圆角 */
            border-radius: 5px;
            padding-left: 10px;

        }
}
</style>
</head>
<body>
	<div align="center"><h3>工作单位信息录入</h3></div>
	<div class="login_box" align="center" style="margin-top:50px;">
		<form method="post" action="${pageContext.request.contextPath}/institutionAdd.do">
			<div align="center"><font color="red">${sessionScope.errorMsg}</font></div>
			<%session.removeAttribute("errorMsg"); %>
			<div><font color="red">*</font><input id="user_input" type="text" name="name" placeholder="单位名称"></div>
			<div style="margin-top:10px;"><font color="red">*</font><input id="user_input" type="text" name="manager" placeholder="负责人"></div>
			<div style="margin-top:10px;"><input id="user_input" type="text" name="tel" placeholder="联系电话"></div>
			<div style="margin-top:10px;"><input id="user_input" type="text" name="email" placeholder="邮箱"></div>
			<div style="margin-top:10px;"><input id="user_input" type="text" name="addr" placeholder="地址"></div>
			<div style="margin-top:10px;"><input id="user_input" type="text" name="type" placeholder="单位性质"></div>
			<div style="margin-top:10px;">
				<input class="btn btn-primary" type="submit" value="提交">
				<input  class="btn btn-primary"  type="reset" value="重置">
			</div>
		</form>
	</div>
</body>
</html>