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
<head>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script type="text/javascript" src="layui/layui.all.js"></script>
<script type="text/javascript" src="js/mylayer.js"></script>

<script>
	var p = ${requestScope.search.page};
	function fresh() {
		location.href = "users/index1?pageno=" + p;
	}
	function show(url, w, h) {
		layer.open({
			type : 2,
			area : [ w + 'px', h + 'px' ],
			fixed : false, //不固定
			maxmin : true,
			content : url,
		});
	}
	function openwin1() {
		show("users/add1", 823, 534);
	}
	function openedit1(id) {
		show("users/edit1?id=" + id, 823, 534);
	}
	function returnobject(o) {

	}
	function openwin() {
		layer_show("用户信息", "users/add1", 630, 390);
	}

	function openedit(id) {
		layer_show("用户信息", "users/edit1?id=" + id, 630, 390);
	}
	function showdetails(id){
		layer_show("用户详情","users/details?id="+id,400,280);
	}
</script>

</head>


<body>
	<span class="printtitle"></span>

	<form action="users/index1" method="post">
		<div class="searchview">
			<label class="searchtext"><b>名称：</b></label> <input type="text"
				name="name" placeholder="请输入昵称.." />
			<button class="seachbt" type="submit">查询</button>
			
		</div>
	</form>

	<table class="tablelist">
		<thead>
			<tr>
				<th>昵称</th>
				<th>姓名</th>
				<th>性别</th>
				<th>类型</th>
				<th>电话</th>
				<th>qq</th>
				<th>班级信息</th>
				<th>未来意向</th>
				<th>关注程度</th>
				<th>状态等级</th>
				<th>账户状态</th>
			
			</tr>
		</thead>

		<tbody>


			<c:forEach items="${requestScope.list}" var="row">
				<tr>
					<td class="bigtext">${row.niki}</td>
					<td>${row.name}</td>
					<td>${row.sex_Name}</td>
					<td>${row.type_Name}</td>
					<td class="bigtext">${row.tel}</td>
					<td class="bigtext">${row.qq}</td>
					<td>${row.classinfo}</td>
					<td>${row.ylevel_Name}</td>
					<td>${row.glevel_Name}</td>
					<td>${row.slevel_Name}</td>
					<td>${row.status_Name}</td>
					
				</tr>
			</c:forEach>


		</tbody>
	</table>





	<div class="pagin">
		<div class="message">
			共<i class="blue">${requestScope.search.size}</i>条记录，共${requestScope.search.last_pageno}页，当前显示第&nbsp;
			<i class="blue">${requestScope.search.page}&nbsp;</i>页
		</div>
		<ul class="paginList">
			<li class="paginItem"><a href="users/index1?pageno=${1}">首页</a></li>
			<li class="paginItem"><a
				href="users/index1?pageno=${requestScope.search.prev}">上一页</a></li>
			<li class="paginItem"><a
				href="users/index1?pageno=${requestScope.search.next}">下一页</a></li>
			<li class="paginItem"><a
				href="users/index1?pageno=${requestScope.search.last_pageno}">末页</a></li>
		</ul>
	</div>
	<c:import url="/Model/list_footer.jsp"></c:import>