<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>标本管理</title>
<script  src="${pageContext.request.contextPath}/res/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
$(function(){
	$("#pageNum").change(function(){
	    var val = $(this).val();
	    val = $.trim(val);
	
	    //1. 校验 val 是否为数字 1, 2, 而不是 a12, b
	    var flag = false;
	    var reg = /^\d+$/g;
	    var pageNo = 0;
		var belong='<%=menu_user.getWorkplace()%>';
	    if(reg.test(val)){
	        //2. 校验 val 在一个合法的范围内： 1-totalPageNumber
	        pageNo = parseInt(val);
	        if(pageNo >= 1 && pageNo <= parseInt("${pageBean.totalPage}")){
	            flag = true;
	        }
	    }
	
	
	    if(!flag){
	        alert("输入的不是合法的页码.");
	        $(this).val("");
	        return;
	    }
	
	    //3. 页面跳转
	    var href = "<%=request.getContextPath() %>/splitPage.do?belong="+belong+"&currentPage=" + pageNo + "&" + $(":hidden").serialize();
	    window.location.href = href;
	});
})
</script>
</head>
<body>
	<div align="center"><h3>文物标本管理</h3></div>
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
	<div  align="center" style="margin-top:20px;">
		<div align="center">
				<form action="${pageContext.request.contextPath}/sampleCheck2.do" method="post">
					<div style="width:400px;display:flex;">
						<input type="hidden" value="${pageBean.currentPage}">
						<input type="text"   style="margin-left:20px; width:200px; margin-right:20px;" name="content" placeholder="名称/出土地/标本材质/所属单位">
						<input type="submit"  class="btn btn-primary" style="margin-left:5px;" value="查询">
						<input type="button"  id="change"  class="btn btn-primary" style="margin-left:5px;" value="表格" onclick="window.location.href='${pageContext.request.contextPath}/staff/sampleManagement/sampleManagement.jsp'"/>
					</div>
				</form>
				<div style="margin-top:15px;">
				<a href="${pageContext.request.contextPath}/staff/sampleManagement/addsample.jsp">手动添加文物标本</a>
				<a href="${pageContext.request.contextPath}/staff/sampleManagement/autoAdd.jsp">批量添加文物标本</a>
				</div>
		</div>
		<div style="display:flex;margin-left:15%;margn-right:200px;margin-top:20px;">
			<c:forEach items="${requestScope.list}" var="list" varStatus="s">
			<%--增强for循环，循环遍历分页的list的数据--%>		    	
			<div class="row" style="margin-right:20px;">
				<div class="col-xs-6 col-md-3" style="width:200px;height:101%;">
					<a href="#" class="thumbnail">
						<img src="${pageContext.request.contextPath}${list.image_url}">
					</a>
			</div>
			<div  style="margin-top:%1;">
				<br>
					${list.samplename}
				<br>
					${list.material}
				<br>
				</div>
			</div>
			 </c:forEach>
		</div>

		<table style="margin-top:5%;">
			<tr>
				<td> <a href="<%=request.getContextPath()%>/splitPage.do?currentPage=1&&belong=<%=menu_user.getWorkplace()%>">首页&nbsp;</a></td>
				<td> <a href="<%=request.getContextPath()%>/splitPage.do?currentPage=${pageBean.prevPage}&&belong=<%=menu_user.getWorkplace()%>">上一页&nbsp;</a></td>
				<c:forEach begin="${pageBean.currentPage-3>0?pageBean.currentPage-3:1 }" end="${pageBean.currentPage+3>pageBean.totalPage?pageBean.totalPage:pageBean.currentPage+3 }" step="1" var="i">		    
				<td>
				<a  href="<%=request.getContextPath()%>/splitPage.do?currentPage=${i}&&belong=<%=menu_user.getWorkplace()%>" >${i}&nbsp;</a>
				</td>
				</c:forEach>
				<td> <a href="<%=request.getContextPath()%>/splitPage.do?currentPage=${pageBean.nextPage}&&belong=<%=menu_user.getWorkplace()%>">下一页&nbsp;</a></td>
				<td> <a href="<%=request.getContextPath()%>/splitPage.do?currentPage=${pageBean.totalPage}&&belong=<%=menu_user.getWorkplace()%>">尾页&nbsp;</a></td>
			    <td>共有${requestScope.pageBean.totalPage}页&nbsp;</td>
				<td>当前是第${requestScope.pageBean.currentPage}页&nbsp;</td>
			    <td>转到 <input type="text" size="1"  id="pageNum"/> 页&nbsp;</td>
		    </tr>
		</table>
	</div>
</body>
</html>