<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script>
var txt=${requestScope.txt};
function fresh(){
	var id=$(".sinput").val();
location.href="colleges/index1?txt="+id;
}
function returnobject(o){
	
	}
	
	
	
function openwin(){
	var id=$(".sinput").val();

	layer_show("学院信息","colleges/add1?school_id="+id,350,180);
	}
	
	
	function openedit(id){
	layer_show("学院信息","colleges/edit?id="+id,350,180);
	}
	
	$(function(){
		$(".sinput").val(txt);	
		
	});
	
</script>

</head>


<body style="min-width:600px;">
   <span class="printtitle"></span>
     
     <form action="colleges/index1" method="post">
     
       <div class="searchview">
       <label class="searchtext"><b>学校名称：</b></label>
      
        	<select name="txt" class="sinput inputinput" style="height:30px;">
				<c:forEach items="${requestScope.slist}" var="r" >
				<c:if test="${requestScope.info.school_id!=r.id}">
					<option value="${r.id}">${r.name}</option>
				</c:if>
				
			</c:forEach>
			</select> 
      
        <button class="seachbt" type="submit">查询</button>
         <button class="seachbt" onclick="openwin();" type="button">新增</button>
       </div>
       
        </form>
        
    <table style="width:600px;" class="tablelist">
    	<thead>
    	<tr>
        <th width="20%">学院名称</th>
        <th width="20%">学校名称</th>
        <th width="12%">操作</th>     
        </tr>
        </thead>
        
        <tbody>
     
       
        <c:forEach items="${requestScope.list}" var="r" >
 <tr>
        <td>${r.name}</td>
        <td>${r.school_name}</td>
        <td><a href="javascript:openedit(${r.id});" class="tablelink" >修改</a></td>
        </tr>  
  </c:forEach>
       
       
        </tbody>
    </table>
    
    
    



<c:import url="/Model/list_footer.jsp" ></c:import>

