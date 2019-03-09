<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>>">
<head>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
</head>
<body>
	<table class="layui-table">
		<thead>
			<tr>
				<th>设备</th>
				<th>有/无</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${facility}" var="row" varStatus="v">
				
					<tr>
						<td>${row}</td>
						
						<c:if test="${info.option_status[v.index]=='1'}">
						
							<td><i class="fa fa-check"></i></td>
						</c:if>
						<c:if test="${info.option_status[v.index]=='0'}">
							<td><i class="fa fa-close"></i></td>
						</c:if>
					</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
