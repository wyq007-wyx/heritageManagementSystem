<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>密码重置</title>
<style>
#step .step-wrap {
    width: 100%;
    position: relative;
}
#step .step-bg {
    width: 100%;
    height: 10px;
    border-radius: 5px;
    position: absolute;
    top: 10px;
    left: 0;
    background-color: lightgrey;
}
#step .step-progress {
    width: 33.33%;
    height: 10px;
    border-radius: 5px;
    position: absolute;
    top: 10px;
    left: 0;
    background-color: #54FF9F;
}
#step .step {
    display: inline-block;
}
#step .step-item {
    width: 33.33%;
    margin-bottom: 10px;
    display: inline-block;
    position: absolute;
    top: 0;
}
#step .step-item .setp-item-title {
    font-size: 14px;
    text-align: center;
}
#step .step-item.active .setp-item-num {
    background-color: #54FF9F;
}
#step .step .step-item .setp-item-num {
    line-height: 30px;
    margin-left: 44%;
}
#step .step .step-item:nth-child(1) {
    left: 0;
} 
#step .step .step-item:nth-child(2) {
    left: 33.33%;
}
#step .step .step-item:nth-child(3) {
    left: 66.66%;
}
#step .step .setp-item-num {
    width: 30px;
    height: 30px;
    background-color: lightgrey;
    border-radius: 50%;
    text-align: center;
    padding: 3px;
}
.step-next {
	width: 200px;
	margin: 40px auto;
}
#nextStep {
	display: block;
	height: 30px;
	width: 100%;
}
</style>

<!-- Bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" >

</head>
<body>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
   
	<div class="container" style="width: 400px; margin:auto; margin-top:5%;">
	 <div id="step">
	    <div class="step-wrap">
	        <div class="step-bg"></div>
	        <div class="step-progress"></div>
	        <ul class="step">
	            <li class="step-item active">
	                <div class="setp-item-num"><span>1</span></div>
	                <div class="setp-item-title">输入信息</div>
	            </li>
	            <li class="step-item">
	                <div class="setp-item-num"><span>2</span></div>
	                <div class="setp-item-title">验证身份</div>
	            </li>
	            <li class="step-item">
	                <div class="setp-item-num"><span>3</span></div>
	                <div class="setp-item-title">重设登录密码</div>
	            </li>
	        </ul>
	    </div>
	</div>
    <form style="margin-top:15%;"action="${pageContext.request.contextPath}/pwdReset.do" method="post">
    	<div align="center"><font color="red">${sessionScope.errorMsg}</font></div>
		<%session.removeAttribute("errorMsg"); %>
        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" name="username" id="username" class="form-control" placeholder="请输入您的用户名" required/>
        </div>
        <div class="form-group">
            <label for="email">邮箱：</label>
            <input type="email" name="email" id="email" class="form-control" placeholder="请输入您注册时填写的邮箱" required/>
        </div>
 
        <div class="form-group" style="text-align: center;">
            <input class="btn btn btn-primary" type="submit" value="发送验证码">
            <input class="btn btn btn-primary" id="btn" type="button" value="返回首页">
        </div>
    </form>
</div>
<script type="text/javascript">
		var role='${sessionScope.role}';
		var btn = document.getElementById("btn");
		//console.log(btn);
		btn.onclick=function(){
			if(role=='admin'){
				window.location.href='/homework/admin/nowuser.jsp';
			}else if(role=='staff'){
				window.location.href='/homework/staff/nowuser.jsp';
			}else if(role=='visitor'){
				window.location.href='/homework/visitor/nowuser.jsp';
			}else{
				window.location.href='/homework/login.jsp';
			}
		}
</script>
</body>
</html>