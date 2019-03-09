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

</head>


<body style="min-width:600px">
	<span class="printtitle"></span>
	<c:if test="${requestScope.list=='空空如也'}">
	   ${requestScope.list}
	</c:if>
	<c:if test="${requestScope.list!='空空如也'}">
	<table class="layui-table" style="width:600px;">
		<thead>
			<tr>
				<th>昵称</th>
				<th>姓名</th>
				<th>性别</th>
				<th>电话</th>
				<th>qq</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${requestScope.list}" var="row">
				<tr>
					<td class="bigtext">${row.niki}</td>
					<td>${row.name}</td>
					<td>${row.sex_Name}</td>
					<td class="bigtext">${row.tel}</td>
					<td class="bigtext">${row.qq}</td>	
				</tr>
			</c:forEach>
		</tbody>
	</table>
    </c:if>
	<c:import url="/Model/list_footer.jsp"></c:import>