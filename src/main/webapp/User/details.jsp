<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/Model/form_head.jsp" ></c:import>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
<script  type="text/javascript"   src="js/H-ui.admin.js"></script>
 <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<body style="min-width:100px;">

		<table>
		<tr><td>学校:</td><td>${requestScope.info.school_Name}</td></tr>
		<tr><td>学院:</td><td>${requestScope.info.college_Name}</td></tr>
		<tr><td>相关信息:</td><td>${requestScope.info.info}</td></tr>
		<tr><td>创建时间:</td><td>${requestScope.info.createdate}</td></tr>
		<tr><td>添加人:</td><td>${requestScope.info.operator_Name}</td></tr>
		<tr><td>备注:</td><td>${requestScope.info.comments}</td></tr>
		</table>
  <c:import url="/Model/form_footer.jsp" ></c:import>