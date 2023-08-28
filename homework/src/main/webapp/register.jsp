<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>游客注册页面</title>
<style type="text/css">
		body{
			background-image:url("images/register2.webp");
			background-position: center center;
    		background-repeat: no-repeat;
    		background-attachment: fixed;
    		background-size: cover;
		}
		.rg_layout{
		
            width: 900px;
            height: 500px;
            border: 8px solid #eeeeee;
            background-color: rgba(255,255,255,0.7);
            /* 让div水平居中 */
            margin: auto;
            margin-top: 5%;
            /* padding: 15px; */
        }
        .rg_left{
            /* border: 1px solid red; */
            float: left;
            margin: 15px;
        }
        .rg_left p:first-child{
            color: #fed026;
            size: 20px;
        }
        .rg_left p:last-child{
            color: #a6a6a6;
            size: 20px;
        }
        .rg_center{
        	margin-top:10%;
            width: 400px;
            /* border: 1px solid red; */
            float:left;
            padding-left:20%;
           	
        }
        #user_name,#user_password,#user_input{
            width: 150px;
            height: 20px;
            border: 1px solid #a6a6a6;
            /* 设置边框圆角 */
            border-radius: 5px;
            padding-left: 10px;

        }
 
        #btn_sub{
       		margin-left:7%;
        	margin-top:5px;
            width: 100px;
            height: 20px;
            color:white;
            background-color: #ffd026;
            border: 1px solid #a6a6a6;
        }
        .rg_right{
            /* border: 1px solid red; */
            float: right;
        }
        .rg_right p:first-child{
            /* color: #a6a6a6; */
            font-size: 15px;
        }
        .rg_right p a{
            color: blue;
        }
		
	</style>
</head>
<body>
	<div class="rg_layout">
		<div class = "rg_left">
	            <p>新用户注册</p>
	            <p>USER REGISTER</p>
        </div>
        <div class="rg_center">
			<form method="post" action="register.do" enctype="multipart/form-data">
				<font color="red">${sessionScope.errorMsg}</font>
				<%session.removeAttribute("errorMsg"); %>
				<div><font color="red">*</font><input type="text" id="user_name" name="username" placeholder="用户名"></div>
				<div style="margin-top:10px;">头像上传: <input type="file" name="image_url"></div>
				<div style="margin-top:10px;"><font color="red">*</font><input id="user_password" type="password" name="password" placeholder="密码"></div>
				<div style="margin-top:10px;"><font color="red">*</font><input id="user_password" type="password" name="repassword" placeholder="确认密码"></div>
				<div style="margin-top:10px;"><input id="user_input" type="text" name="realname" placeholder="真实姓名"></div>
				<div style="margin-top:10px;">
					<input type="radio" name="sex" value="男" checked>男
					<input type="radio" name="sex" value="女">女
				</div>
				<div style="margin-top:10px;"><input id="user_input" type="text" name="tel" placeholder="联系电话"></div>
				<div style="margin-top:10px;"><input id="user_input" type="text" name="email" placeholder="邮箱"></div>
				<div style="margin-top:10px;"><input id="user_input" type="text" name="addr" placeholder="住址"></div>
				<div style="margin-top:10px;"><input id="btn_sub" type="submit" value="提交"></div>
				<div style="margin-top:10px;"><input id="btn_sub" type="reset" value="重置"></div>
			</form>
		</div>
		<div class = "rg_right">
            <p>已有账号?&nbsp;  <a href="login.jsp">&nbsp;立即登录&nbsp;</a></p>
        </div>	
	</div>
	
</body>
</html>