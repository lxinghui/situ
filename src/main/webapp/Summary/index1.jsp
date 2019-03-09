<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/list_head.jsp" ></c:import>
<script>

function fresh(){
	location.href="summarys/index1";
}
function returnobject(o){
	}

	function openedit(activity_id){
		layer_show("总结详情","summarys/edit1?activity_id="+activity_id,600,350);
	}
	
</script>

</head>


<body>
   <span class="printtitle"></span>
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th width="5%">学生状况</th> 
        <th width="5%">课程状况</th>
        <th width="5%">市场状况</th> 
        <th width="5%">学校状况</th>
        <th width="12%">总结</th>
        <th width="12%">建议</th>
        <th width="7%">备注</th>
        <th width="5%">操作</th>
        </tr>
        </thead>    
        <tbody>
      
 <tr>
      
       
          <td>${info.sstatus_name}</td>
           <td>${info.tstatus_name}</td>
            <td>${info.cstatus_name}</td>
             <td>${info.xstatus_name}</td>
              <td class="bigtext">${info.summary}</td>
               <td class="bigtext">${info.proposal}</td>
                <td class="bigtext">${info.comments}</td>
       
        <td><a href="javascript:openedit(${info.activity_id});" class="tablelink" >修改</a> </td>
        </tr>  
  
        </tbody>
    </table>
    
    
    



<c:import url="/Model/list_footer.jsp" ></c:import>

