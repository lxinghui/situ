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

function openwin1(id) {
		layer_show("学生回馈表", "feedbacks/edit1?id="+id, 600, 400);
	}
 
function fresh() {
	var userid ="${user.id}";
	//location.href = "Questionnaire/seach?studentid="+studentid + "&classid=" + classid;
	location.href = "feedbacks/studentindex?user_id="+userid;
	}
	function getstudent(o){
	getstudentlist(o,$("[name=studentid]"),$(".myseach"));	
}

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
     <form action="feedbacks/studentindex" method="post">
     <div class="searchview printhide">
     
    <label class="searchtext">班级:</label>
				<b1 class="input">${user.classinfo}</b1>
	 <label class="searchtext">学生:</label>
				<b1 class="input">${user.name}</b1>
    
         
    

<label class="searchtext">日期:
</label>



<select name="date" class="searchinput inputselect_long">
	
		  	<c:forEach items="${requestScope.datelist}" var="r" varStatus="v">
					<c:if test="${r.date!=requestScope.date}">
						<option class="op" value="${r.date}">${r.date}</option>
					</c:if>
					<c:if test="${r.date==requestScope.date}">
						<option selected="selected" class="op" value="${r.date}">${r.date}</option>
					</c:if>

				</c:forEach>

</select>


   
     	
     	
     	
     	<button class="seachbt myseach" type="submit">查询</button>  
     	
     	
     	
        </div> 
     </form>
   <table class="tablelist">
    	<thead>
    	<tr>     
        <th width="14%">名称</th>
        <th width="25%">日期</th>  
        <th width="40%">讲师备注</th>        
        <th width="12%" class="printhide">操作</th>
        </tr>
        </thead>        
        <tbody>
        <c:forEach items="${requestScope.flist}" var="row" varStatus='var'>
        <c:if test="${(var.index+1)%2!=0}">
        <tr style="background-color:#fee;">   
        </c:if>   
          <c:if test="${(var.index+1)%2==0}">
				<tr  class="odd">
			</c:if>     
        <td>讲师状况反馈表</td>
         <td>${row.date}</td>
        <td></td>
        
        <td class="printhide">
        
        
        
        <a href="javascript:openwin1(${row.id});" class="tablelink">回答</a>
        
        
        
        
        </td>
       
        </tr>  
       </c:forEach>
     
       
        </tbody>
    </table>
	<c:import url="/Model/list_footer.jsp"></c:import>