<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/staff/menu.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>借阅统计</title>
<script src="${ pageContext.request.contextPath }/res/js/echarts.min.js"></script> 
</head>
<body>
		<%response.setHeader("cache-control","public"); %>
		<div align="center">
        <h3>按年月查询借出情况</h3>
        	<div align="center"style=" margin-left:10%; display:flex;position:relative;">
        		
		        <form  style="margin-right:1%;"action="${request.getContextPath()}/homework/borrowStatistic.do" method="post">
			        选择查询的年份:<select id="year" name="year"></select>年
			        <input type="hidden" name="workplace" value=<%=menu_user.getWorkplace() %>> 
			        <input type="submit" style="font-size:5px;"class="btn btn-primary"value="查询">
		        </form>
		         <form  style="margin-right:1%;" action="${request.getContextPath()}/homework/allborrowStatistic.do" method="post">
			        <input type="hidden" name="workplace" value=<%=menu_user.getWorkplace() %>> 
			        <input type="submit"  style="font-size:5px;"class="btn btn-primary" value="查询全部">
		        </form>
		        <div><input type="button" style="marin-right:20px;font-size:5px;" class="btn btn-primary" id="btn" value="显示柱状图"></div>
		     </div>
    	<script>
    		var year=document.getElementById("year");
       		for (var y = 1990;y <2500;y++) {
                year.add(new Option(y,y));
            }
    	</script>
    	
		</div>
	<div margin="center" id="line" style=" margin-left:10%; width:1300px;height:400px;"></div>  
    <script type="text/javascript">  
        // 基于准备好的dom，初始化echarts实例  
        var myChart = echarts.init(document.getElementById('line'));  
        // 指定图表的配置项和数据
        var x_data=[];
        var y_data=[];
        var title;
        <% if((String) request.getAttribute("type")!=null){
        		System.out.println(request.getAttribute("year"));
        		String type=(String) request.getAttribute("type");
        		if(type.equals("years")){
        %>
        			title='标本年借阅量折线图';
        			
        <%
        		}else if(type.equals("months")){
         %>
         			title='${requestScope.year}'+'年标本月借阅量折线图';
         <%
        
        		}else{
        %>
        			title='${requestScope.year}'+'年'+'${requestScope.month}'+'月标本日借阅量折线图';
        <%
        			
        		}
        %>
        	
        <% 
        	}
        %>
        <% 
        	List<String> x_data=(List<String>)request.getAttribute("x_data");
        	List<Integer> y_data=(List<Integer>)request.getAttribute("y_data");
        	
        	if(x_data!=null){
        		for(int i=0;i<x_data.size();i++){
        	
        %>
        		x_data.push('<%=x_data.get(i)%>');
        		y_data.push(<%=y_data.get(i)%>);
        <%
        		
        		}
        	}
        %>
       option = {  
            title: {  
                text: title,
            },  
            tooltip: {  
                trigger: 'axis'  
            },  
            legend: {  
            	show:true,
                //data:['不同年份借阅标本总数']  
            },  
            grid: {  
                left: '3%',  
                right: '4%',  
                bottom: '3%',  
                containLabel: true  
            },  
            toolbox: {  
                feature: {  
                    saveAsImage: {}  
                }  
            },  
            xAxis: {  
                type: 'category',  
                boundaryGap: false,  
                data:x_data
            },  
            yAxis: {  
                type: 'value'  
            },  
            series: [  
                {  
                    name:'借阅次数',  
                    type:'line',  
                    stack: '总量',  
                    data:y_data
                        
                },  
            ]  
        };  
  
        // 使用刚指定的配置项和数据显示图表。  
        myChart.setOption(option);  
    </script>
    
    <div margin="center" id="pillar" style=" margin-left:10%; width:1300px;height:600px;display:none;" ></div>  
    <script type="text/javascript">  
        // 基于准备好的dom，初始化echarts实例  
        var myChart2 = echarts.init(document.getElementById('pillar'));  
        var x_data=[];
        var y_data=[];
        var title;
        <% if((String) request.getAttribute("type")!=null){
        		String type=(String) request.getAttribute("type");
        		if(type.equals("years")){
        %>
        			title='标本年借阅量折线图';
        			
        <%
        		}else if(type.equals("months")){
         %>
         			title='${requestScope.year}'+'年标本月借阅量折线图';
         <%
        
        		}else{
        %>
        			title='${requestScope.year}'+'年'+'${requestScope.month}'+'月标本日借阅量折线图';
        <%
        			
        		}
        %>
        	
        <% 
        	}
        %>
        <% 
        	 x_data=(List<String>)request.getAttribute("x_data");
        	 y_data=(List<Integer>)request.getAttribute("y_data");
        	
        	if(x_data!=null){
        		for(int i=0;i<x_data.size();i++){
        	
        %>
        		x_data.push('<%=x_data.get(i)%>');
        		y_data.push(<%=y_data.get(i)%>);
        <%
        		
        		}
        	}
        %>
        // 指定图表的配置项和数据  
        option = {  
            color: ['#3398DB'],  
            title: {  
                text: title,  
            },  
            tooltip: {  
                trigger: 'axis',  
                axisPointer: {  
                    type: 'shadow'  
                }  
            }, 
            toolbox: {  
                feature: {  
                    saveAsImage: {}  
                }  
            },  
            legend: {
            	show: true,
            },  
            xAxis: {  
                type: 'category',
                data: x_data
            },  
            yAxis: {  
                type: 'value',
               
            },  
            series: [  
                {  
                	name:'借阅次数', 
                    type: 'bar',  
                    stack: '总量',
                    barWidth : 30,
                    showBackground: true,
                    data:y_data
                },  
            ]
        };  
  
        // 使用刚指定的配置项和数据显示图表。  
        myChart2.setOption(option);  
    </script> 
	<script>
			function my(id){
				return document.getElementById(id);
			}
			//第一种方法
			/*my("btn").onclick=function(){
				my("dv").style.display="none";
			}
			my("btn1").onclick=function(){
				my("dv").style.display="block";
			}*/
			//第二种方法
			my("btn").onclick=function(){
				if (this.value =="显示折线图") {
					my("line").style.display="block";
					my("pillar").style.display="none";
					this.value="显示柱状图";
				} else if(this.value =="显示柱状图"){
					my("pillar").style.display="block";
					my("line").style.display="none";
					this.value="显示折线图";
				}
			}
		</script>
</body>
</html>