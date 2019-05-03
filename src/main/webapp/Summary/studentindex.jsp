 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp"></c:import>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>>">
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.PrintArea.js"></script>
<script>
$(document).ready(function(){ 
    $(".headprint").click(function(){ 
        $(".print").printArea();
    }); 
});
</script>

</head>


<body style="min-width:920px;">


     <span class="printtitle print" style="display: block; font-size: 20px; text-align: center; font-weight: bold;"><div style="font-size:20px;text-align:center;font-weight:bold;padding-bottom:10px;">&nbsp;&nbsp;个人考勤信息</div><div style="text-align:left;"><span style="font-size:16px;font-weight:bold;padding-right:20px;">班级:${user.classinfo}</span><span style="font-size:16px;font-weight:bold;padding-right:20px;">学生:${user.name}</span><span style="font-size:16px;font-weight:bold;padding-right:20px;">周次:
第一周  18-07-16至18-07-22</span></div></span>
     <div class="headview printhide">    	
    	<label class="headtitle">活动:</label>    	
        <label class="headtext">${activity.name}</label> 
        <label class="headline">|</label> 
        <label class="headtitle">课程:</label>    	
        <label class="headtext">${activity.courseinfo}</label> 
        <label class="headline">|</label> 
        <label class="headtitle">辅导员:</label>    	
        <label class="headtext">${activity.i_name}</label>   
        <label class="headline">|</label>    
        <label class="headtitle">学生名称:</label>
        <label class="headtext">${user.name}</label>
        <label class="headline">|</label> 
        <label class="headtitle">学生电话:</label>
        <label class="headtext">${user.tel}</label>
        <div class="headprint">打印本页</div>
</div>
     <form action="CheckOnWork/details" method="post">
     <div class="searchview printhide">
     
    <label class="searchtext">班级:</label>
				<b1 class="input">${user.classinfo}</b1>
	 <label class="searchtext">学生:</label>
				<b1 class="input">${user.name}</b1>
    
         
    

<label class="searchtext">周次:
</label>



<select name="month" class="searchinput inputselect_long">
	
		  
			<option selected="selected" value="1">第一周  18-07-16至18-07-22</option>
		
		
	
		
		
			<option value="2">第二周  18-07-23至18-07-29</option>
		
	
		
		
			<option value="3">第三周  18-07-30至18-08-05</option>
		

	
</select>


   
     	
     	
     	
     	<button class="seachbt myseach" type="submit">查询</button>  
     	
     	
     	
        </div> 
     </form>
   <table class="tablelist">
    	<thead>
    	<tr>     
        <th width="8%">周次</th>
        <th width="14%">名称</th>
       <th width="25%">日期区间</th>  
        <th width="40%">讲师备注</th>        
        <th width="12%" class="printhide">操作</th>
        </tr>
        </thead>
        
        <tbody>
         
            
         
        <tr style="background-color:#fee;">
        
         
         
        <td>7月份</td>
        
        
        
        <td>讲师状况反馈表</td>
        
         <td>自2018年07月01日至2018年07月31日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(14572);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr class="odd">
        
         
         
        <td>第0周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年07月09日至2018年07月15日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(13824);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr>
        
         
         
        <td>第1周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年07月16日至2018年07月22日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr class="odd">
        
         
         
        <td>第2周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年07月23日至2018年07月29日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr>
        
         
         
        <td>第3周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年07月30日至2018年08月05日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        
        
        
        </td>
       
        </tr>  
       
            
         
        <tr style="background-color:#fee;" class="odd">
        
         
         
        <td>8月份</td>
        
        
        
        <td>讲师状况反馈表</td>
        
         <td>自2018年08月01日至2018年08月31日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(15891);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr>
        
         
         
        <td>第4周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年08月06日至2018年08月12日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(15023);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr class="odd">
        
         
         
        <td>第5周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年08月13日至2018年08月19日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr>
        
         
         
        <td>第6周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年08月20日至2018年08月26日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(15860);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr class="odd">
        
         
         
        <td>第7周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年08月27日至2018年09月02日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(16137);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
         
        <tr style="background-color:#fee;">
        
         
         
        <td>9月份</td>
        
        
        
        <td>讲师状况反馈表</td>
        
         <td>自2018年09月01日至2018年09月30日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(17344);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr class="odd">
        
         
         
        <td>第8周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年09月03日至2018年09月09日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(16469);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr>
        
         
         
        <td>第9周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年09月10日至2018年09月16日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(16640);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr class="odd">
        
         
         
        <td>第11周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年09月24日至2018年09月30日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        
        
        
        </td>
       
        </tr>  
       
            
         
        <tr style="background-color:#fee;">
        
         
         
        <td>10月份</td>
        
        
        
        <td>讲师状况反馈表</td>
        
         <td>自2018年10月01日至2018年10月31日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(18401);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr class="odd">
        
         
         
        <td>第13周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年10月08日至2018年10月14日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(17585);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
            
        <tr>
        
         
         
        <td>第14周</td>
        
         
        
        <td>学生状况反馈表</td>
        
        
         <td>自2018年10月15日至2018年10月21日</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(17814);" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       
        </tbody>
    </table>
	<c:import url="/Model/list_footer.jsp"></c:import>