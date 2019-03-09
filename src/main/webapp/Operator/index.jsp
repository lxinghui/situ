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
<script>
	var p = ${requestScope.search.page};
	function fresh() {
		location.href = "operators/index1?pageno=" + p;
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
		show("operators/add1", 500, 350);
	}
	function openedit1(id) {
		show("operators/edit1?id=" + id, 500, 350);
	}
	function returnobject(o) {

	}
	function openwin() {
		layer_show("信息", "operators/add1", 500, 350);
	}

	function openedit(id) {
		layer_show("信息", "operators/edit1?id=" + id, 500, 350);
	}
</script>

</head>


<body>
	<span class="printtitle"></span>

	<form action="operators/index1" method="post">
		<div class="searchview">
			<label class="searchtext"><b>名称：</b></label> <input type="text" class="inputinput"
				name="name" placeholder="请输入昵称.." />
			<button class="seachbt" type="submit">查询</button>
			<button class="seachbt" onclick="openwin1();" type="button">新增</button>
		</div>
	</form>

	<table class="tablelist">
		<thead>
			<tr>
				<th>名称</th>
				<th>姓名</th>
				<th>电话</th>
				<th>类型</th>
				<th>权限</th>
				<th>状态</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
		</thead>

		<tbody>


			<c:forEach items="${requestScope.list}" var="row">
				<tr>
					<td>${row.niki}</td>
					<td>${row.name}</td>
					<td>${row.tel}</td>
					<td>${row.type_Name}</td>
					<td>${row.power_Name}</td>
					<td>${row.status_Name}</td>
					<td>${row.comments}</td>
					<td><a href="javascript:openedit(${row.id});"
						class="tablelink">修改</a></td>
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
			<li class="paginItem"><a href="operators/index1?pageno=${1}">首页</a></li>
			<li class="paginItem"><a
				href="operators/index1?pageno=${requestScope.search.prev}">上一页</a></li>
			<li class="paginItem"><a
				href="operators/index1?pageno=${requestScope.search.next}">下一页</a></li>
			<li class="paginItem"><a
				href="operators/index1?pageno=${requestScope.search.last_pageno}">末页</a></li>
		</ul>
	</div>
	<c:import url="/Model/list_footer.jsp"></c:import>