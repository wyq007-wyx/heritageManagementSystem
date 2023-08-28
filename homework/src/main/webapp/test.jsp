<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="res/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
$(function(){
	$("#pageNum").change(function(){
	    var val = $(this).val();
	    val = $.trim(val);
	
	    //1. 校验 val 是否为数字 1, 2, 而不是 a12, b
	    var flag = false;
	    var reg = /^\d+$/g;
	    var pageNo = 0;
	
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
	    var href = "<%=request.getContextPath() %>/splitPage.do?currentPage=" + pageNo + "&" + $(":hidden").serialize();
	    window.location.href = href;
	});
})
</script>
</head>
<body>

<form action="splitPage.do" method="post">
	<input type="hidden" name="currentPage" value=1>
	<input type="submit"  value="显示">
</form>


	<% 
				String s_path = request.getContextPath();
				String s_basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+s_path;
				String s_url=null;
	%>
	<div style="display:flex;">
    <c:forEach items="${requestScope.list}" var="list" varStatus="s">
    	<%--增强for循环，循环遍历分页的list的数据--%>
    	
       		<div>
            <img style="width:200px;height:100px;"src="${s_url}/homework${list.image_url}">
            <br>
            ${list.samplename}
            <br>
            ${list.material}
            <br>
            </div>
    </c:forEach>
    </div>




		<table>
		    <tr>
		    	<td> <a href="<%=request.getContextPath()%>/splitPage.do?currentPage=1">首页</a></td>
		    	<td> <a href="<%=request.getContextPath()%>/splitPage.do?currentPage=${pageBean.prevPage}">上一页</a></td>
		    	<c:forEach begin="${pageBean.currentPage-3>0?pageBean.currentPage-3:1 }" end="${pageBean.currentPage+3>pageBean.totalPage?pageBean.totalPage:pageBean.currentPage+3 }" step="1" var="i">

<%-- 		        <c:forEach items="${requestScope.pages}" var="pages" varStatus="s"> --%>
		    
		        	<td>
<%-- 		            	<button type="submit" name="currentPage" value="${i}"> --%>
<%-- 		            		${i} --%>
<!-- 		            	</button> -->
						<a  href="<%=request.getContextPath()%>/splitPage.do?currentPage=${i}" >${i}</a>
		            </td>
		        </c:forEach>
		        <td> <a href="<%=request.getContextPath()%>/splitPage.do?currentPage=${pageBean.nextPage}">下一页</a></td>
		        <td> <a href="<%=request.getContextPath()%>/splitPage.do?currentPage=${pageBean.totalPage}">尾页</a></td>
<!-- 		        <td><input type="button" value=">>"></td> -->
		        <td>共有${requestScope.pageBean.totalPage}页</td>
		        <td>当前是第${requestScope.pageBean.currentPage}页</td>
		        <td>转到 <input type="text" size="1"  id="pageNum"/> 页</td>
		    </tr>
		</table>


	
</body>
</html>