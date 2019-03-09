<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp"></c:import>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>>">
<head>

<script type="text/javascript" src="js/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/situ.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>
<script>
var ids = "${requestScope.ids}";
var gname = "${requestScope.gname}";
var gpath = "${requestScope.gpath}";
var gproject = "${requestScope.gproject}";
var gcomments = "${requestScope.gcomments}";
function getid(){
	var aid;
	var str;
	var data = [];
	//$(".inpt").each(function() {
	//		 aid = $(this).attr("myid");
	//		 data.push(aid);		
	//});
	if(ids!=""){
		data=ids.split(",");
	}
	$(".chk").each(function() {
		if ($(this).prop("checked")) {
			 aid = $(this).attr("myid");
			 data.push(aid);
		}
	});
	str = data.join(",");
	return str;
}
function fresh(){
	layer_show("学生表","users/show",600,450);
}
  function addstudent(){
	  layer_show("用户信息", "users/add1", 823, 534);
  }
  function save(){
	  //ajax 接收 ids 传给 group
	  var ids = getid(); 
	  var ss = "${requestScope.cmd}";
	  if(ss!=""){
		  parent.fresh(ids);
	  }else{
	  parent.fresh1(ids,gname,gpath,gcomments,gproject);
       }
	  var index = parent.layer.getFrameIndex(window.name);	
	  parent.layer.close(index);
	// layer.iframeSrc(index-1,'groups/add1?ids='+ids);
	  }
</script>

</head>


<body style="min-width: 460px;">
<table class="tablelist" style="width:460px;">
		<thead>
			<tr>
			    <th width="10px;"></th>
				<th width="50px">姓名</th>	
				<th width="50px">类型</th>
			</tr>
		</thead>
<tbody>
			<c:forEach items="${requestScope.list}" var="row">
				<tr>
				<c:if test="${requestScope.gcmd!='g_update'}">
				<c:if test="${row.activity_id==0}">
					<td><input class="chk" type="checkbox" myid="${row.id}"></td>
					<td>${row.name}</td>
					<td>${row.type_Name}</td>
				</c:if>	
				<c:if test="${row.activity_id!=0}">
				
				</c:if>	
				</c:if>
					<c:if test="${requestScope.gcmd=='g_update'}">
				<c:if test="${row.gstatus==0}">
					<td><input class="chk" type="checkbox" myid="${row.id}"></td>
					<td>${row.name}</td>
					<td>${row.type_Name}</td>
				</c:if>	
				<c:if test="${row.gstatus!=0}">					
				</c:if>
				</c:if>
				</tr>			
			</c:forEach>
</tbody>
</table>
<div class="inputbtpanel">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="save();"
						>保存</button>
				</div>
