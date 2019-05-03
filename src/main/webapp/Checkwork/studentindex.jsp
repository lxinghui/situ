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


     <span class="printtitle print" style="display: block; font-size: 20px; text-align: center; font-weight: bold;"><div style="font-size:20px;text-align:center;font-weight:bold;padding-bottom:10px;">&nbsp;&nbsp;个人考勤信息</div><div style="text-align:left;"><span style="font-size:16px;font-weight:bold;padding-right:20px;">班级:${user.classinfo}</span><span style="font-size:16px;font-weight:bold;padding-right:20px;padding-top:0px;">学生:${user.name}</span><span style="font-size:16px;font-weight:bold;padding-right:20px;">周次:
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
    	<thead class="print">
    	<tr>
        <th width="12%">日期</th>
        <th width="10%">早晨</th>
        <th width="10%">下午</th>
        <th width="10%">晚自习</th>
        <th width="58%">备注</th>
        </tr>
        </thead>
               
        <tbody>
      
         <c:forEach items="${requestScope.clist}" var="row" varStatus='var'>
              <c:if test="${(var.index+1)%2!=0}">
				<tr class="print">
			</c:if>
			  <c:if test="${(var.index+1)%2==0}">
				<tr  class="odd print">
			</c:if>
					<td>${row.date}</td>
					<td>${row.check1_Name}</td>
					<td>${row.check2_Name}</td>
					<td>${row.check3_Name}</td>
				    <td>${row.comments}</td>
				</tr>
			</c:forEach>  
     
        </tbody>
    </table>	

	<c:import url="/Model/list_footer.jsp"></c:import>