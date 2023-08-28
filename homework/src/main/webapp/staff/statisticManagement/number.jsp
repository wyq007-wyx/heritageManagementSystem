<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/staff/menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>统计分析管理</title>
<script src="${ pageContext.request.contextPath }/res/js/echarts.min.js"></script>
</head>
<body>
	<div align="center"><h3>数量管理</h3></div>
	<%
		ApplicationContext appCon=new
		ClassPathXmlApplicationContext("applicationContext.xml");
		SampleService sampleService=(SampleService) appCon.getBean("sampleService");
		List<Sample> sampleList=sampleService.getSampleList();
		List<Sample> localSampleList=sampleService.SelectByWorkplace(menu_user.getWorkplace());//单位总标本数量
		int in_workplace_number=0;
		for(int i=0;i<localSampleList.size();i++){
			if(localSampleList.get(i).getBorrow_state()==1){
				in_workplace_number++;
			}
		}
// 		InstitutionService institutionService=(InstitutionService) appCon.getBean("institutionService");
// 		List<Institution> institutionList=institutionService.getInstitutionList();
// 		Map<String,Integer> map=new HashMap<String,Integer>();
// 		for(Institution is:institutionList){
// 			map.put(is.getName(),sampleService.SelectByWorkplace(is.getName()).size());
// 		}
	%>
	<div align="center">
		<div align="center" style="width:20%;">
			<table class="table table-hover table-bordered">
				<tr>
					<td>单位名称</td>
					<td><%=menu_user.getWorkplace()%></td>
				</tr>
				<tr>
					<td>本单位总标本数:</td>
					<td><%=localSampleList.size() %></td>
				</tr>
				<tr>
					<td>库存总标本数:</td>
					<td><%=in_workplace_number %></td>
				</tr>
				<tr>
					<td>借出标本数</td>
					<td><%=localSampleList.size()-in_workplace_number %></td>
				</tr>
			</table>
			
			<input type="button" class="btn btn-success"value="隐藏饼图" id="btn"/>
		</div>
		<!--<input type="button" value="显示饼图" id="btn1"/>-->
		<script>
			function my(id){
				return document.getElementById(id);
			}
			my("btn").onclick=function(){
				if (this.value =="隐藏饼图") {
					my("main").style.display="none";
					this.value="显示饼图";
				} else if(this.value =="显示饼图"){
					my("main").style.display="block";
					this.value="隐藏饼图";
				}
			}
		</script>
		<div id="main" style="width:800px;height:400px; margin:auto;" align="center"></div>  
		    <script type="text/javascript">  
		        // 基于准备好的dom，初始化echarts实例  
		        var myChart = echarts.init(document.getElementById('main')); 
				var data = [{name:'在库标本数量',value:<%=in_workplace_number%>},{name:'借出标本数量',value:<%=localSampleList.size()-in_workplace_number%>}]
<%-- 				<%for (Map.Entry<String, Integer> entry : map.entrySet()) {%> --%>
					   
// 					    var data_ = {}
<%-- 						data_.value = <%=entry.getValue()%> --%>
<%-- 						data_.name = "<%=entry.getKey()%>" --%>
// 						data.push(data_)
<%-- 				<%}%> --%>
				console.log(data);
					
				
		        // 指定图表的配置项和数据 
		       option = {
		    	  color:['#45C2E0', '#C1EBDD', '#FFC851','#5A5476','#1869A0','#FF9393'],
				  title: {
				    text: '标本数量统计表',
				    subtext: '单位样本数量占比图',
				    left: 'center'
				  },
				  tooltip: {
				    trigger: 'item',
				    formatter: '{a} <br/>{b} : {c} ({d}%)'
				  },
				  legend: {
				    orient: 'vertical',
				    left: 'left'
				  },
				  series: [
				    {
				      name: 'Access From',
				      type: 'pie',
				      radius: '50%',
				      data:data,
				      emphasis: {
				        itemStyle: {
				          shadowBlur: 10,
				          shadowOffsetX: 0,
				          shadowColor: 'rgba(0, 0, 0, 0.5)'
				        }
				      }
				    }
				  ]
				};
		       // 使用刚指定的配置项和数据显示图表。  
		       myChart.setOption(option);  
		    </script>  
		
	</div>
	
	
</body>
</html>