<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>

<script>
var p=${requestScope.search.page};
var select=${requestScope.select};
var txt=${requestScope.txt};

function fresh(){
location.href="summarys/index?pageno="+p;
}
function returnobject(o){
	
	}
function opensummary(activity_id){
	layer_show("总结信息","summarys/edit1?activity_id="+activity_id,600,350);
	}
	
function opencp(id){
	layer_show("测评信息","evaluations/index1?activity_id="+id,620,400);
	}
	
	$(function(){
		$(".sselect").on("change",function(){
			$(".sinput").css("display","none").prop("disabled","disabled");
			$($(".sinput")[$(".sselect").val()]).css("display","inline").removeAttr("disabled");
		});
		
		$(".sselect").val(select);
		$(".sinput").css("display","none").prop("disabled","disabled");
		$($(".sinput")[select]).css("display","inline").removeAttr("disabled").val(txt);
		
	});
	
</script>
</head>
<body>
   <span class="printtitle"></span>
     
     <form action="summarys/index1" method="post">
     
       <div class="searchview">
        <select class="searchtext sselect  inputinput" name="select">
        <option value="0">活动查询</option>
 		<option value="1">指导教师查询</option>
       </select>
       
         	<select name="txt" class="sinput inputinput" style="height:30px">
				<c:forEach items="${requestScope.alist}" var="r" >
				<c:if test="${requestScope.info.createdate!=r.createdate}">
					<option value="${r.id}">${r.name}</option>
				</c:if>
					<c:if test="${requestScope.info.createdate==r.createdate}">
					<option selected="selected" value="${r.id}">${r.name}</option>
				</c:if>
			</c:forEach>
			</select> 
      	<select name="txt" class="sinput inputinput" style="height:30px;display: none;">
				<c:forEach items="${requestScope.olist}" var="r" >
				<c:if test="${requestScope.info.operator_id!=r.id}">
					<option value="${r.id}">${r.name}</option>
				</c:if>
					<c:if test="${requestScope.info.operator_id==r.id}">
					<option selected="selected" value="${r.id}">${r.name}</option>
				</c:if>
			</c:forEach>
			</select> 
        <button class="seachbt" type="submit">查询</button>
       
       </div>
       
        </form>
        
    <table class="tablelist">
    	<thead>
    	<tr>
        <th width="10%">活动名称</th>
        <th width="7%">指导教师</th>
         <th width="6%">学生状况</th> 
        <th width="6%">课程状况</th>
        <th width="6%">市场状况</th> 
          <th width="6%">学校状况</th>
          <th width="12%">总结</th>
          <th width="12%">建议</th>
          <th width="7%"></th>
        </tr>
        </thead>
        
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="r" >
 <tr>
        <td>${r.a_name}</td>
        <td>${r.o_name}</td>
        <td>${r.sstatus_name}</td>
        <td>${r.tstatus_name}</td>
        <td>${r.cstatus_name}</td>
        <td>${r.xstatus_name}</td>
        <td class="bigtext">${r.summary}</td>
        <td class="bigtext">${r.proposal}</td>
        
        
       
        <td>
        <a href="javascript:opencp(${r.activity_id});" class="tablelink" >测评</a>  </td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    


<c:import url="/Model/list_footer.jsp" ></c:import>

