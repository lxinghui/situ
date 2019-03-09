<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<c:import url="/Model/list_head.jsp" ></c:import>
<base href="<%=basePath%>>">
<head>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/situ.js"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<script>
var activity_id = ${requestScope.activity_id};
$(function(){
	$(".selectall").on("click", function() {
		if ($(this).prop("checked")) { //全选
			$(".chk").prop("checked", "checked"); //checked = "checked"
		} else {
			$(".chk").prop("checked", "");
		}
	});
});
function getid(){
	var aid;
	var str;
	var data = [];
	$(".chk").each(function() {
		if ($(this).prop("checked")) {
			 aid = $(this).attr("myid");
			 data.push(aid);
		}
	});
	str = data.join(",");
	return str;
}
	function fresh(activity_id) {
		location.href = "evaluations/index1?activity_id=" + activity_id;
	}

	function openwin(id) {
		ids = getid();
		if(ids==""||ids==null){
			alert("请先选择");
		}else{
		layer_show("测评信息", "evaluations/b_add?a_id="+activity_id+"&&ids=" + ids, 550, 280);
		}
	}
	
	function openedit(id) {
		layer_show("测评信息", "evaluations/add1?id=" + id, 550, 280);
	}
</script>
<style type="text/css">
.comment {
	text-overflow: ellipsis;
	width: 150px;
	overflow: hidden;
	white-space: nowrap;
}
</style>
</head>

<body style="min-width:600px;">
<div style="margin-top:10px;margin-left:10px;">
		<c:if test="${requestScope.a_id==null}">	<button class="seachbt" type="button" onclick="openwin();">批量打分</button></c:if>
	 </div>
	<table class="layui-table">
		<thead>
			<tr>
                <th><input type="checkbox" class="selectall"></th>
				<th width="20%">学生</th>
				<th>分数</th>
				<th width="20%">评语</th>
				<th width="20%">备注</th>
				 <c:if test="${sessionScope.power==3}">
				<th width="14%">操作</th>
				</c:if>
				 <c:if test="${sessionScope.power==4}">
				<th width="14%">操作</th>
				</c:if>
			</tr>
		</thead>

		<tbody>


			<c:forEach items="${requestScope.elist}" var="r">
				<tr>
                    <td><input class="chk" type="checkbox" myid="${r.id}"></td>
					<td>${r.u_name}</td>
					<td>${r.point}</td>
					<td class="bigtext"">${r.status_name}</td>
					<td class="comment bigtext">${r.comments}</td>

					<td> <c:if test="${sessionScope.power==3}"> <a
						href="javascript:openedit(${r.id});" class="tablelink">打分</a></c:if>
						 <c:if test="${sessionScope.power==4}"> <a
						href="javascript:openedit(${r.id});" class="tablelink">打分</a></c:if>
				</tr>
			</c:forEach>


		</tbody>
	</table>

	<c:import url="/Model/list_footer.jsp"></c:import>