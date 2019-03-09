<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/Model/form_head.jsp" ></c:import>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="laydate/laydate.js"></script>
 <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<style type="text/css">
body {
	font: 18px "宋体";
	text-align: center;
}

.viewlist input{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist select{
	height: 30px;
	border: #bbb solid 1px;
}
.viewlist label{
	height: 30px;
}

a:link {
	color: #00F;
	text-decoration: none;
}

a:visited {
	color: #00F;
	text-decoration: none;
}

a:hover {
	color: #c00;
	text-decoration: underline;
}

ul {
	list-style: none;
}

.main {
	clear: both;
	padding: 8px;
	text-align: center;
}



.menu0 {
	width: 600px;
}

.menu0 li {
	display: block;
	float: left;
	padding: 4px 0;
	height:30px;
	line-height:30px;
	width: 150px;
	text-align: center;
	cursor: pointer;
	background: #FFFFff;
}

.menu0 li.hover {
	background: #54f2e4;
}
.viewlist input{
	height: 30px;
}
.viewlist select{
	height: 30px;
}
.viewlist label{
	height: 30px;
}

#main0 ul {
	display: none;
}

#main0 ul.block {
	display: block;
}
.inputtext{
  float:left;
}
.input{
position:absolute;
left:10px;
font-size:15px;
font-weight:bold;
font-size:15px;
}
.info{
position:absolute;
left:75px;
font-weight:bold;
font-size:15px;
font:"微软雅黑";
}

.edit{
 float:left;
}
</style>

<script>


	function setTab(m, n) {
		var tli = document.getElementById("menu" + m)
				.getElementsByTagName("li");
		var mli = document.getElementById("main" + m)
				.getElementsByTagName("ul");
		for (i = 0; i < tli.length; i++) {

			tli[i].className = i == n ? "hover" : "";

			mli[i].style.display = i == n ? "block" : "none";
		}
	}

	  
</script>
</head>

<body style="min-width:200px;">
		<form class="f1">
				<ul class="menu0" id="menu0">
					<li onclick="setTab(0,0)" class="hover">活动详情</li>
					<li onclick="setTab(0,1)">参与成员</li>
					<li onclick="setTab(0,2)">时间安排</li>
				</ul>
				
				<div class="main" id="main0">
					<ul class="block">
						<li>
					
            <p><span class="input">学校：</span><div class="info">${requestScope.ainfo.school_name}</div></p><br><br>
            <p><span class="input">学院：</span><div class="info">${requestScope.ainfo.college_name}</div></p><br><br>
            <p><span class="input">计划信息：</span><div class="info">${requestScope.ainfo.planinfo}</div></p><br><br>
            <p><span class="input">备注：</span><div class="info">${requestScope.ainfo.comments}</div></p>

					</li>
					</ul>
				<ul>
					<li>
					<table class="tablelist">
		<thead>
			<tr>
				<th>昵称</th>
				<th>姓名</th>
				<th>性别</th>
				<th>电话</th>
				<th>qq</th>
				<th>班级信息</th>
				<th>未来意向</th>
				<th>关注程度</th>
				<th>状态等级</th>
			</tr>
		</thead>

		<tbody>


			<c:forEach items="${requestScope.userlist}" var="row">
				<tr>
					<td class="bigtext">${row.niki}</td>
					<td>${row.name}</td>
					<td>${row.sex_Name}</td>
					<td class="bigtext">${row.tel}</td>
					<td class="bigtext">${row.qq}</td>
					<td>${row.classinfo}</td>
					<td>${row.ylevel_Name}</td>
					<td>${row.glevel_Name}</td>
					<td>${row.slevel_Name}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
					</li>
				</ul>
				<ul>
					<li>
		 <table class="tablelist" class="table-layout:fixed;">
    	<thead>
    	<tr>
        <th>日期</th>
        <th>时间1</th>
        <th>时间2</th>
        <th>时间3</th>
        <th>时间4</th>
        <th>时间5</th>
        <th>时间6</th>
        <th>地点信息</th>
        <th>执行人</th>
        <th>状态</th>
        <th>备注</th>
        <th>操作</th>
        </tr>
        </thead>   
        <tbody>
        <c:forEach items="${requestScope.tiemlist}" var="row" >
        <tr>
        <td class="bigtext">${row.a_name}</td>
        <td class="bigtext">${row.date}</td>
        <td class="bigtext">${row.time1}</td>
        <td class="bigtext">${row.time2}</td>
        <td class="bigtext">${row.time3}</td>
        <td class="bigtext">${row.time4}</td>
        <td class="bigtext">${row.time5}</td>
        <td class="bigtext">${row.time6}</td>
        <td class="bigtext">${row.roominfo}</td>
        <td>${row.o_name}</td>
        <td>${row.status_Name}</td>
        <td>${row.comments}</td>
        </tr>  
        </c:forEach>
        </tbody>
    </table>
					</li>
				</ul>
			</div>
		
	</form>

  <c:import url="/Model/form_footer.jsp" ></c:import>
