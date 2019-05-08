<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/Model/list_head.jsp"></c:import>
<head>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script>
	var pageno = ${requestScope.search.page}
	var txt = ${requestScope.txt};
	var userid = ${sessionScope.id};
	var a_id = "${requestScope.a_id}";
	$(function() {
		if (a_id != "") {
			$(".sinput").val(a_id);
		} else {
			$(".sinput").val(txt); //servlet回来的select
		}
	});
	function fresh() {
		location.href = "times/index1?pageno=" + pageno;
	}
	function returnobject(o) {

	}

	function openCalendar(){
	location.href = "times/cal";
	}
	
	function openwin() {
		var a_id = $(".sinput").val();
		layer_show("实训时间", "times/add1?a_id=" + a_id,600, 400);
	}
	function openedit(id) {
		layer_show("时间编辑", "times/edit1?id=" + id, 600, 400);
	}

	function opencheckwork(activity_id, date) {
		layer_show("当天考勤", "checkwork/index1?activity_id=" + activity_id
				+ "&&date=" + date, 920, 500);
	}

	function openfeedback(id, date) {
		layer_show("当天反馈", "feedbacks/index1?activity_id=" + id+ "&&date=" + date,920, 500);
	}
	function openstudent_feedback(id, date) {
		layer_show("当天反馈", "feedbacks/edit1?date=" + date,670,
				500);
	}
	function openstudent_checkwork(id, date) {
		layer_show("当天考勤", "checkwork/studentindex?user_id="+userid, 920, 500);
	}
	function openreport(id, date) {
		layer_show("当天日报", "report/index1?activity_id=" + id + "&&date=" + date, 670,
				500);
	}

	function openmarket(id, date) {
		layer_show("市场调研", "market/index1?activity_id=" + id + "&&date=" + date, 670,
				500);
	}
</script>

</head>

<body>
	<span class="printtitle"></span>
	<div class="searchview">
		<form action="times/index1" method="post">
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
				<th>日期</th>
				<th width="20%">时间信息</th>
				<th>地点信息</th>
				<th>执行人</th>
				<th>状态</th>
				<th>备注</th>
				<c:if test="${requestScope.a_id==null}">
					<th width="24%">操作</th>
				</c:if>
				<c:if test="${requestScope.a_id!=null}">
					<th width="24%">操作</th>
				</c:if>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${requestScope.list}" var="row">
				<tr>
					<td class="bigtext">${row.a_name}</td>
					<td class="bigtext">${row.date}</td>
					<td class="bigtext">上午${row.time1}~${row.time2},下午${row.time3}~${row.time4},晚上${row.time5}~${row.time6}</td>
					<td class="bigtext">${row.roominfo}</td>
					<td>${row.o_name}</td>
					<td>${row.status_Name}</td>
					<td class="bigtext">${row.comments}</td>
					<td><c:if test="${sessionScope.power==3}"><a
						href="javascript:openfeedback(${row.activity_id},'${row.date}');">反馈</a>
						</c:if>
						<c:if test="${sessionScope.power==4}"><a
						href="javascript:openfeedback(${row.activity_id},'${row.date}');">反馈</a>
						</c:if>
			            <c:if test="${sessionScope.power==1}"><a
						href="javascript:openstudent_feedback(${row.activity_id},'${row.date}');">反馈</a>
						</c:if>
						<c:if test="${sessionScope.power==2}"><a
						href="javascript:openstudent_feedback(${row.activity_id},'${row.date}');">反馈</a>
						</c:if>
						<c:if test="${sessionScope.power==3}">
						<a href="javascript:openmarket(${row.activity_id},'${row.date}');">市场</a>
						</c:if>
						<c:if test="${sessionScope.power==4}">
						<a href="javascript:openmarket(${row.activity_id},'${row.date}');">市场</a>
						</c:if>
						<c:if test="${sessionScope.power==3}">
						<a href="javascript:openedit(${row.id});">修改</a>
						</c:if>
						<c:if test="${sessionScope.power==4}">
						<a href="javascript:openedit(${row.id});">修改</a>
						</c:if> 
						<c:if test="${sessionScope.power==3||sessionScope.power==4}">
						 <a href="javascript:opencheckwork(${row.activity_id},'${row.date}');">考勤</a>
						 </c:if>
						 <c:if test="${sessionScope.power==1||sessionScope.power==2}">
						 <a href="javascript:openstudent_checkwork(${row.activity_id},'${row.date}');">考勤</a>
						 </c:if>
						<c:if test="${sessionScope.power==3}">
						<a href="javascript:openreport(${row.activity_id},'${row.date}');">日报</a>
						</c:if>
						<c:if test="${sessionScope.power==4}">
						<a href="javascript:openreport(${row.activity_id},'${row.date}');">日报</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<c:import url="/Model/list_footer.jsp"></c:import>