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
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>
<script>
function getid(){
	var aid;
	var str;
	var data = [];
	//$(".inpt").each(function() {
	//		 aid = $(this).attr("myid");
	//		 data.push(aid);		
	//});
	$(".chk").each(function() {
		if ($(this).prop("checked")) {
			 aid = $(this).attr("myid");
			 data.push(aid);
		}
	});
	str = data.join(",");
	return str;
}

function getname(){
	var aname;
	var str;
	var data = [];
	//$(".inpt").each(function() {
	//		 aid = $(this).attr("myid");
	//		 data.push(aid);		
	//});
	$(".chk").each(function() {
		if ($(this).prop("checked")) {
			 aname = $(this).attr("myname");
			 data.push(aname);
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
	  var names=getname();
	  parent.updateIds(ids,names);
	  var index = parent.layer.getFrameIndex(window.name);	
	  parent.layer.close(index);
	// layer.ifra1meSrc(index-1,'groups/add1?ids='+ids);
	  }
</script>

</head>


<body>
	<span class="printtitle"></span>

	<form action="users/show" method="post">
		<div class="searchview">
			<label class="searchtext"><b>名称：</b></label> <input type="text"
				name="name" placeholder="请输入昵称.." />
			<button class="seachbt" type="submit">查询</button>
			<button class="seachbt" type="button" onclick="addstudent();">新增</button>
		</div>
	</form>

	

<div style="width:'400px';height:'300px'">
			<c:forEach items="${requestScope.list}" var="row">
				<div style="width:10%;float:left">
				
				<c:if test="${row.gstatus==0}">
					<input class="chk" type="checkbox" myid="${row.id}" myname="${row.name}">${row.name}
				</c:if>	
				<c:if test="${row.gstatus!=0}">
					${row.name}<input class="inpt" type="hidden" myid="${row.id}">
				</c:if>	
				</div>
			</c:forEach>
         


</div>

<div  style="float:left;margin-top:15px;">
					<button class="seachbt1" type="button" onclick="layer_close();"
						>取消</button>
					<button class="seachbt1" type="button" onclick="save();"
						>保存</button>
				</div>
	<c:import url="/Model/list_footer.jsp"></c:import>