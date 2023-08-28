<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapcss.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css"/>


<title>管理员首页</title>
<style>
	body {
	    background-image: url("${pageContext.request.contextPath}/images/admin_index2.webp");
	   	background-position: center center;
	    background-repeat: no-repeat;
	    background-attachment: fixed;
	    background-size: cover;
	}
	.login_box{
		width: 85%;
      	height: 80%;
      	background:rgba(255,255,255,0.3);
      	margin: auto;
      	margin-top: 2%;
      	padding: 50px 50px;
	}
}
</style>
</head>
<body>
<div class="login_box">
<section id="people">
  <div class="container" style="margin-bottom:0px;">
    <div class="col-md-6 wow fadeInLeft">
    <h2>用户管理</h2>
    <p><span class="glyphicon glyphicon-bell detail"></span>创建新用户，输入工作人员基本信息后创建一名新的工作人员用户，其中用户名为工作人员工号，密码工号后四位。用户信息至少应包含用户名、密码、真实姓名、联系电话、邮箱、住址等信息。创建用户的同时，可以指派用户所属的工作单位。</p>
    <p><span class="glyphicon glyphicon-bell detail"></span>查询/修改用户信息，用户管理页面以表格列表的形式显示所有用户信息。在最右侧一列设置“操作”列，包含“详情”、“修改”、“删除”三个操作，可以分别查看用户详情、修改用户信息、删除用户。以下示例仅做参考：</p>
  </div>
  <div class="col-md-6 wow rotateIn">
    
  </div>
 
  </div>
</section>
<!--people-->
 
<!--baifeng-->
<section id="baifeng">
  <div class="container wow zoomIn">
    <div class="col-md-6 ">
     
    </div>
  <div class="col-md-6 ">
    <h2>标本管理</h2>
    <p><span class="glyphicon glyphicon-bell detail"></span>点击进入页面后以表格列表的方式显示所有标本。</p>
     <p><span class="glyphicon glyphicon-bell detail"></span>在最右侧一列设置“操作”列，包含“详情”、“修改”、“删除”三个操作，可以分别查看标本详情、修改标本信息、删除标本。</p>
  </div>
  </div>
</section>
<section id="people">
  <div class="container" style="margin-bottom:0px;">
    <div class="col-md-6 wow fadeInLeft">
    <h2>单位管理</h2>
    <p><span class="glyphicon glyphicon-bell detail"></span>新建单位，可以创建一个单位信息，应至少包括单位名称、联系人、联系电话、邮箱地址、联系地址等信息；</p>
    <p><span class="glyphicon glyphicon-bell detail"></span>单位信息维护，点击进入页面后以表格列表的方式显示所有单位信息。在最右侧一列设置“操作”列，包含“详情”、“修改”、“删除”三个操作，可以分别查看单位详情、修改单位信息、删除单位。在页面上方设置创建按钮，可以新建一个文物标本管理单位，具体单位信息参见数据库表；</p>
    <p><span class="glyphicon glyphicon-bell detail"></span>单位信息维护，可以在检索框中单位名称，进行模糊检索。</p>
  </div>
  <div class="col-md-6 wow rotateIn">
    
  </div>
 
  </div>
</section>
</div>
</body>
</html>