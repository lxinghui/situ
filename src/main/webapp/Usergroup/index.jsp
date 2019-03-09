<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/Model/list_head.jsp"></c:import>
<head>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script>
	var pageno = ${requestScope.search.page};
	var txt = ${requestScope.txt};
	$(function() {
		$(".sinput").val(txt); //servlet回来的select
	});
	function fresh() {
		location.href = "groups/index1?pageno=" + pageno;
	}
	function returnobject(o) {

	}
	function mark(id) {
		layer_show("打分", "groups/mark?id=" + id, 920, 500);
	}
	function openwin() {
		var a_id = $(".sinput").val();
		layer_show("活动分组", "groups/add1?a_id=" + a_id, 600, 400);
	}
	function openuser(id) {
		layer_show("成员详情", "groups/showusers?id=" + id, 600, 400);
	}
	function openedit(id) {
		
		layer_show("分组编辑", "groups/edit1?id=" + id, 600, 400);
	}
</script>

</head>

<body>
	<span class="printtitle"></span>
	<div class="searchview">
		<form action="groups/index1" method="post">
			<select name="txt" class="inputselect sinput" style="height: 30px;">
				<c:forEach items="${requestScope.activitylist}" var="r"
					varStatus="v">
					<option value="${r.id}">${r.name}</option>
				</c:forEach>
			</select>
			<button class="seachbt" type="submit">查询</button>
			<button class="seachbt" type="button" onclick="openwin();">新增</button>
		</form>
	</div>

	<table class="tablelist" class="table-layout:fixed;">
		<thead>
			<tr>
				<th>实训名称</th>
				<th>小组成员</th>
				<th>项目</th>
				<th>分数一</th>
				<th>分数二</th>
				<th>分数三</th>
				<th>分数四</th>
				<th>分数五</th>
				<th>分数六</th>
				<th>分数七</th>
				<th>分数八</th>
				<th>分数九</th>
				<th>分数十</th>
				<th>上传目录</th>
				<th width="10%">操作</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${requestScope.list}" var="row" varStatus="v">
				<tr>
					<td class="bigtext">${row.a_name}</td>
					<td class="bigtext"><c:forEach
							items="${requestScope.ulist[row.id]}" var="r">
        ${r.name}
        </c:forEach></td>
					<td class="bigtext">${row.project}</td>
					<td>${row.point1}</td>
					<td>${row.point2}</td>
					<td>${row.point3}</td>
					<td>${row.point4}</td>
					<td>${row.point5}</td>
					<td>${row.point6}</td>
					<td>${row.point7}</td>
					<td>${row.point8}</td>
					<td>${row.point9}</td>
					<td>${row.point10}</td>
					<td class="bigtext">${row.path}</td>

					<td><a href="javascript:openedit(${row.id});">修改</a> <a
						href="javascript:openuser(${row.id});">成员</a> <a
						href="javascript:mark(${row.id});">打分</a></td>

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
			<li class="paginItem"><a href="groups/index1?pageno=${1}">首页</a>
			</li>
			<li class="paginItem"><a
				href="groups/index1?pageno=${requestScope.search.prev}">上一页</a></li>
			<li class="paginItem"><a
				href="groups/index1?pageno=${requestScope.search.next}">下一页</a></li>
			<li class="paginItem"><a
				href="groups/index1?pageno=${requestScope.search.last_pageno}">末页</a>
			</li>
		</ul>
	</div>
	<c:import url="/Model/list_footer.jsp"></c:import>